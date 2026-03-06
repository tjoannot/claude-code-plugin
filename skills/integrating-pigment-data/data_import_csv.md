# CSV Data Import to Dimensions

## 🚨 CRITICAL RULES

**When creating new lists for CSV import:**

1. **NEVER create ANY list without explicit user confirmation** - Even if the name and type seem obvious
2. **NEVER create dimension-type properties without asking** - Always ask when detecting low-cardinality columns
3. **ALWAYS analyze CSV columns BEFORE creating the list** - You need to know property types first

**Read Pattern 5 and Pattern 6 below for details.**

## Overview

CSV import to dimensions populates dimension items with data from external sources. This operation involves mapping CSV columns to dimension properties based on semantic relationships between the data.

**Key concept:** Each CSV row represents a dimension item, and each CSV column maps to a dimension property.

## When to Use Dimension Imports vs Transaction Lists

Understanding when to import into dimensions versus transaction lists is crucial for proper data modeling.

### Use Dimension Imports When:

- **CSV contains dimension items** (master data, reference data, metadata)
- **Each row represents a business entity** (e.g., one customer, one product, one warehouse)
- **Data is relatively static** (changes infrequently)
- **You need to create or update dimension properties** (attributes of entities)

**Examples:**

- List of customers with their attributes (name, region, segment, credit limit)
- Product catalog with properties (SKU, category, price, supplier)
- Warehouse master data (location, capacity, region, manager)
- Employee directory (name, department, role, hire date)
- Supplier list (name, country, payment terms, contact info)

### Use Transaction Lists When:

- **CSV contains transactional data** (events, movements, interactions)
- **Each row represents a transaction** (e.g., one order, one shipment, one sale)
- **Data changes frequently** (daily, weekly imports)
- **You need to aggregate data** into metrics later

**Examples:**

- Order transactions (order ID, date, customer, product, quantity, amount)
- Inventory movements (movement ID, date, warehouse, product, quantity)
- Sales transactions (transaction ID, date, customer, product, amount)
- Customer interactions (interaction ID, date, customer, channel, outcome)

**Modeling principle:** Import master data into Dimensions, import transactional data into Transaction Lists. Then aggregate transaction lists into Metrics using formulas.

## Core Concepts

### Dimension Target

CSV data must be imported into a specific dimension. The dimension represents the business entity type.

**Key considerations:**

- The target dimension must exist before import
- The dimension's properties define what data can be imported
- Each CSV row typically represents one dimension item
- If properties don't exist, create them first based on CSV column structure

### Column-to-Property Mapping

CSV columns are mapped to dimension properties based on semantic relationships, not just exact name matches.

**Mapping principles:**

- Match by **meaning**, not just by name
- Consider language variations (e.g., "Pays" ↔ "Country", "Produit" ↔ "Product")
- Handle abbreviations (e.g., "Emp" ↔ "Employee", "Dept" ↔ "Department")
- Recognize synonyms (e.g., "Client" ↔ "Customer", "Item" ↔ "Product", "Location" ↔ "Region")

**Example mapping:**

| CSV Column     | Dimension Property | Rationale                 |
| -------------- | ------------------ | ------------------------- |
| product_id     | ID                 | Unique identifier         |
| product_name   | Name               | Entity name               |
| category       | Category           | Categorical property      |
| supplier_code  | Supplier           | Reference to Supplier dim |
| unit_price     | Unit Price         | Numeric property          |
| lead_time_days | Lead Time          | Numeric property          |

**Important:** When a CSV column represents a reference to another dimension (e.g., Supplier, Category, Region), map it to a **Dimension-type property**, not a Text property. This enables proper relationships and hierarchies.

### Selective Mapping

Not all CSV columns need to be mapped. Some columns should be excluded:

**Exclude:**

- Internal system IDs (e.g., `_internal_id`, `sys_generated_key`, `row_id`)
- Audit timestamps (e.g., `created_at`, `last_modified`, `updated_timestamp`)
- Free-text comments or notes (unless needed for business purposes)
- Columns without corresponding dimension properties (unless you plan to create them)

**Include:**

- Business identifiers (ID, Code, Name)
- Descriptive properties (Description, Notes if structured)
- Categorical attributes (Category, Type, Status)
- Reference properties (Supplier, Region, Manager - as Dimension-type properties)
- Numeric or date properties relevant to the dimension (Price, Capacity, Start Date)

## Semantic Column Matching

Semantic matching identifies relationships between CSV columns and dimension properties beyond exact name matches.

### Translation Matching

CSV columns in different languages can map to English property names:

| CSV Column (French) | Property (English) |
| ------------------- | ------------------ |
| Pays                | Country            |
| Employé             | Employee           |
| Produit             | Product            |
| Département         | Department         |
| Entrepôt            | Warehouse          |

### Abbreviation Matching

Common abbreviations expand to full property names:

| CSV Column | Property   |
| ---------- | ---------- |
| Emp        | Employee   |
| Dept       | Department |
| Qty        | Quantity   |
| Amt        | Amount     |
| Whse       | Warehouse  |
| Cat        | Category   |

### Synonym Matching

Different terms for the same concept:

| CSV Column | Property  |
| ---------- | --------- |
| Client     | Customer  |
| Item       | Product   |
| Location   | Region    |
| SKU        | Product   |
| Store      | Warehouse |

## Common Patterns

### Pattern 1: User Intent Clarification

**CRITICAL: Always ask for clarification when the user's intent is ambiguous.**

When a user provides CSV data without explicit intent:

- **DO NOT** automatically decide to import based on the filename
- **DO NOT** create dimensions with names derived from the CSV filename without explicit user confirmation
- **ALWAYS** ask clarifying questions if the target dimension is not explicitly specified
- Determine if they want to import or just analyze

**Ambiguous requests that REQUIRE clarification:**

- "Import this CSV" → **ASK:** "Which dimension should I import this data into? Should I create a new dimension or use an existing one?"
- "Here's a CSV" → **ASK:** "Would you like me to analyze this data or import it into a dimension?"
- "Load this data" → **ASK:** "Which dimension should receive this data?"
- "Check this file" → Likely validation, not import

**Clear import requests (no clarification needed):**

- "Import this CSV into Customers" → Target dimension is explicit
- "Load this data into the Product dimension" → Target dimension is explicit
- "Create a new 'Sales' dimension and import this CSV into it" → Intent and target are explicit

**Example of correct behavior:**

User: "Import this CSV" (with file "Sales.csv")

**WRONG:** Automatically create a dimension named "T_Sales" or "Sales" based on the filename

**CORRECT:** "I see you want to import Sales.csv. Should I:

1. Create a new dimension (what should it be named?)
2. Import into an existing dimension (which one?)
   Please clarify so I can proceed correctly."

### Pattern 2: Missing Dimension Information

When the target dimension is unclear:

- **NEVER** automatically infer the dimension name from the CSV filename
- **ALWAYS** ask the user to specify the target dimension explicitly
- Verify dimension exists in the application (if importing to existing dimension)
- If creating a new dimension, ask for explicit confirmation of the dimension name

### Pattern 3: Dimension Has No Properties

When the target dimension exists but has no properties:

- CSV columns cannot be mapped to non-existent properties
- Properties must be created first before import
- Propose creating properties based on CSV column names and data types
- **Important:** Create Dimension-type properties for categorical/reference fields (Supplier, Category, Region), not Text properties
- After properties are created, proceed with the import

### Pattern 4: Property Mismatch

When CSV columns don't match dimension properties:

- Identify which columns can be mapped semantically
- Exclude columns without clear matches
- Inform user of unmapped columns
- Consider if new properties should be created first
- Ensure reference fields (Supplier, Category, etc.) are mapped to Dimension-type properties

### Pattern 5: Detecting Categorical Columns (Dimension-Type Properties)

**Rule**: When you detect columns with repeated values (low cardinality), ask the user if they want to create separate dimensions for those columns.

**This applies to**:

- Importing into a new list (that you will create)
- Importing into an existing list

**Why it matters**:

- Dimension-type properties enable better data relationships and reusability across your application
- If you create a list with Text properties and later realize they should be Dimension-type, you would need to delete and recreate the list with the correct property types
- Analyzing columns BEFORE creating the list ensures you create it correctly the first time

**Recognition criteria**:

Indicators that a column should be a **Dimension-type property**:

- **Low cardinality**: The column contains repeated values (e.g., 10 rows but only 3-4 unique values)
- **Categorical nature**: Values represent categories, entities, or references (e.g., "France", "Germany", "Laptop", "Mouse")
- **Business entity**: Values represent business entities that could have their own properties later (e.g., Country, Product, Supplier, Category)
- **Reusability**: The same values might be used across multiple lists

Indicators that a column should be a **primitive type** (Text, Number, Date):

- **High cardinality**: Most values are unique (e.g., dates, amounts, IDs, descriptions)
- **Numeric/Date nature**: Values are numbers or dates (e.g., "2024-01-01", "100.50")
- **Descriptive text**: Values are free-form text (e.g., "This is a description")

**What to ask**:

When you detect low-cardinality columns, STOP and ask:

```
"I analyzed your CSV and detected that the columns 'Country' and 'Product' contain repeated values.
These could be modeled as separate dimensions for better data relationships.

Should I:
1. Create separate dimensions for 'Country' and 'Product' (recommended for reusability)
2. Treat them as simple Text properties

Please confirm your choice."
```

**Example** (importing into a new list):

```
User: "Import this CSV into a new 'Sales' transaction list"
CSV columns: Date, Amount, Country, Product
CSV preview: Country has "France", "France", "Germany", "Italy" (4 unique in 10 rows)

→ Detect: Country and Product have low cardinality
→ Ask: "Should I create separate dimensions for Country and Product?"
→ Wait for user confirmation
→ Then create the list with the appropriate property types
```

**Key principles**:

- NEVER create dimension-type properties without explicit user confirmation
- ALWAYS ask when you detect low-cardinality columns
- Create referenced dimensions BEFORE creating the target list

### Pattern 6: Creating New Lists for CSV Import

**Rule**: When creating a new list (dimension or transaction list) to import CSV data, always ask for confirmation before creating.

**Why it matters**:

- You need to know which columns are Dimension-type properties BEFORE creating the list
- Creating a list with wrong property types requires deleting and recreating it
- The user should explicitly approve the list structure before you create it

**What to ask**:

1. **List name** (if not specified by user):
   - If user said "Import into a new 'Sales' list" → Use "Sales" (name is specified)
   - If user said "Import this CSV" → Ask "What should I name the list?"

2. **List type** (if not specified by user):
   - If user said "new 'Sales' transaction list" → Use transaction list (type is specified)
   - If user said "new 'Sales' list" → Ask "Should this be a dimension or transaction list?"

3. **Confirmation** (ALWAYS required, even if name and type are specified):
   - Show the list name, type, and properties (including any Dimension-type properties from Pattern 5)
   - Wait for user approval before creating

**Important**: Before creating the list, analyze the CSV for categorical columns (Pattern 5). You need to know which columns should be Dimension-type properties so you can create the list with the correct property types from the start.

**Key principles**:

- NEVER create a list automatically without user confirmation
- NEVER decide the list type automatically (even if it seems obvious)
- NEVER infer the list name from the CSV filename without asking
- ALWAYS analyze CSV for categorical columns (Pattern 5) BEFORE creating the list
- Ask only for what's missing (if name is specified, don't ask for it; if type is specified, don't ask for it)
- ALWAYS ask for final confirmation showing the complete list structure

## Related Concepts

**Dimensions**: Business entity lists (see [Application Modeling: Core Concepts](../modeling-pigment-applications/modeling_fundamentals.md))

**Properties**: Attributes of dimension items, including Dimension-type properties for hierarchies (see [Application Modeling: Core Concepts](../modeling-pigment-applications/modeling_fundamentals.md))

**Transaction Lists**: For transactional/granular data instead of dimension items (see [Application Modeling: Core Concepts](../modeling-pigment-applications/modeling_fundamentals.md))

**Data Loading Strategy**: General principles for importing data (see [Application Modeling: Modeling Principles](../modeling-pigment-applications/modeling_principles.md) Section 5)
