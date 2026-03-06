---
name: creating-and-editing-pigment-views
description: Always use this skill when creating or editing Views, or needing to pick a View.
---

## CRITICAL RULES
- Never edit a View directly. Always create a draft first and merge it back to the original View once the user confirms the changes.
- When editing a View in the context of a widget on a Board, you MUST use the **draft + override workflow** to allow safe, user-specific preview before committing changes that affect all users. You can find the workflow in [editing_view_widgets.md](../designing-pigment-boards/editing_view_widgets.md).

## What Are Views?

Views are configurations that specify how to display data from Blocks (Metrics, Lists, or Tables). A View defines not just _what_ data to show, but _how_ it should be displayed, filtered, sorted, and organized.

Think of a View as a "lens" through which users see Block data. The same Block can have multiple Views, each showing the data in a different way for different purposes.

---

## Creating vs. Editing a View

- When you decide you need a View, first decide if you can reuse an existing View or if you need to create one:
- Must read: [relevant_views.md](../designing-pigment-boards/relevant_views.md)
- MUST check first if an existing View can be used before creating one using `get_block_views` tool.

## Views vs. Blocks

### Blocks Contain Data

- **Metrics**: Calculate and store multidimensional data
- **Lists**: Store Dimension items or transaction records
- **Tables**: Group related Metrics for comparison

### Views Display Data

- **Views** configure how Blocks are displayed
- A View references a specific Block (Metric, List, or Table)
- Multiple Views can display the same Block differently
- Views are used by View widgets on Boards

### Key Distinction

- **Blocks** define _how data is calculated_ (formulas, structure)
- **Views** define _how data is displayed_ (visualization, filters, sorting)

---

## View Components

A View consists of several configurable components:

### 1. **Underlying Block**

The Block (Metric, List, or Table) that provides the data.

### 2. **Value Fields**

**CRITICAL REQUIREMENT**: There must be at least one value field in the View configuration.

Value fields determine what data is displayed in the View cells. The requirements depend on the Block type:

- **Metric Block**: Value field is the Metric itself - at least one must be selected
- **Table Block**: Value fields are the Metrics within the Table - at least one must be selected
- **List Block**: Value fields are the List properties - at least one must be selected

**Configuration options:**

- **`displayed`**: Controls whether the value is visible in the View (set to `true` to show)
- **Formatting**: Can specify number format, decimal places, currency, etc.
- **Order**: Multiple values can be displayed in a specific sequence

**Example:** For a Table containing "Revenue", "Cost", and "Profit" Metrics, you could display only "Revenue" and "Profit" by setting those value fields to `displayed: true`.

### 3. **Pivots**

Dimensions used to organize data:

- **Rows**: Dimensions displayed as rows
- **Columns**: Dimensions displayed as columns
- **Pages**: Dimensions used as page selectors to filter on specific items (inclusion only)

#### **Pivot Field Types**

Pivot fields can have different types (kinds) depending on their configuration:

1. **Dimension Pivot**: A simple pivot on a Dimension
   - Has `dimensionId` only
   - Displays modalities directly from that Dimension

2. **Grouping Pivot**: Groups data by following List Properties to a target Dimension
   - Has both `dimensionId` AND `listPropertyPath`
   - Allows hierarchical grouping (e.g., Month → Quarter → Year)

3. **Scenario Pivot**: Special pivot for scenarios
   - Has no `dimensionId` (null)
   - Used for scenario selection

4. **Joined Pivot**: Uses a mapping Metric to join data
   - Has `dimensionId` and `mappingMetricId`

5. **Slice Pivot**: Uses a slice configuration
   - Has `dimensionId` and `sliceConfigurationId`

#### **How List Properties Work in Pivots (Grouping)**

When you add a **List Property path** to a pivot field, it transforms from a simple Dimension pivot into a **Grouping pivot**. This allows you to aggregate data along Dimension hierarchies.

**Example Hierarchy:**

- You have a Metric defined on Dimension **Month**
- **Quarter** is a Dimension Property of List Month
- **Year** is a Dimension Property of List Quarter

**To group by Year:**

```json
{
  "dimensionId": "<Month's GUID>",
  "listPropertyPath": ["quarter", "_year"]
}
```

**What happens:**

1. Starts at the **source Dimension** (Month)
2. Follows the List Property path: Month → Quarter → Year
3. Groups data by the **target Dimension** (Year)
4. Displays aggregated values at the Year level

**Important notes:**

- **ListPropertyPath contains technical names** of Dimension properties (NOT display names)
- Each step navigates one level in the Dimension hierarchy
- The source Dimension must exist and be valid for the View's underlying Block
- The List Property path must be valid (each Property must exist on the respective Dimensions)

**Configuration:**

```json
{
  "dimensionId": "8f301e67-dda4-4276-bc1b-4db418b8b3ff",
  "listPropertyPath": ["quarter", "_year"]
}
```

This creates a row/column that shows data grouped by Year, even though the underlying Metric is defined on Month.

**Usage in Pages:**

Grouping pivots can also be used in **Pages**.
Selecting a value on the Grouping Page filters base items (e.g., Months) whose property chain matches the selected target (e.g., Year = FY 2024 → only Months with `_year` = FY 2024).

### 4. **Filters**

Conditions that restrict which data is shown. There are several types of filters:

**CRITICAL REQUIREMENT**: The `pivotFieldId` in filters MUST reference a pivot from the **rows or columns** arrays, NOT from the pages array.

#### **PivotField Filters (By Items)**

Used to exclude Dimension items based on which modalities are present in a pivot.

**Note**: To filter on specific items (inclusion), prefer using **Pages** instead. Use PivotField Filters only when you need to exclude items or apply complex filtering logic.

**Configuration:**

```json
{
  "type": "PivotField",
  "pivotFieldFilteringOption": {
    "pivotFieldId": "<pivot-field-id>", // MUST be from rows or columns, NOT pages!
    "compareOperator": "IsIn",
    "modalityIds": ["<modality-id1>", "<modality-id2>"],
    "variableIds": []
  }
}
```

#### **ValueField Filters (By Value)**

Filter rows/columns based on Metric values (e.g., "show only products where Revenue > 1000").

**CRITICAL REQUIREMENT**: When there are pivots on the **opposite axis** from the filtered pivot, you **MUST provide projections** for each of those pivots.

**Why projections are needed:**

- When filtering rows by value, but columns exist, you need to specify WHICH column value to use for comparison
- Example: If filtering "Product" rows by "Revenue > 1000" and "Month" is in columns, you must specify which month (e.g., "January 2024") to use for the comparison
- Without valid projections, the filter will be silently removed during View creation

**Configuration:**

```json
{
  "type": "ValueField",
  "valueFieldFilteringOption": {
    "pivotFieldId": "<pivot-field-id-being-filtered>", // Must be innermost pivot on its axis
    "valueFieldId": "<value-field-id>",
    "compareOperator": "Gt",
    "values": ["1000"],
    "variableIds": [],
    "projections": [
      // REQUIRED if opposite axis has pivots
      {
        "pivotFieldId": "<opposite-axis-pivot-id>",
        "modalityId": "<modality-id>" // Which modality to use for comparison
      }
    ]
  }
}
```

**Example scenario:**

- Rows: Product Dimension
- Columns: Month Dimension
- Want to filter: "Show only products where Quantity Sold > 100"
- You MUST specify which month to use for comparison (e.g., the first month modality)

#### **PivotListProperty Filters**

Filter based on List Property values.

**Configuration:**

```json
{
  "type": "PivotListProperty",
  "pivotListPropertyFilteringOption": {
    "pivotFieldId": "<pivot-field-id>", // MUST be from rows or columns, NOT pages!
    "listPropertyPath": ["propertyName"],
    "compareOperator": "Eq",
    "values": ["value"],
    "variableIds": []
  }
}
```

**Example - Filtering by Product Name:**

If you want to filter to show only "Choco Bites" product:

1. Ensure the Product Dimension appears in **rows or columns** (not just pages)
2. Use the pivotFieldId from that row/column pivot (e.g., from the columns array)
3. Use the Property name (typically `"_name_XXXXXX"` where XXXXXX is a suffix)

```json
{
  "type": "PivotListProperty",
  "pivotListPropertyFilteringOption": {
    "pivotFieldId": "da327057-0d83-4ef4-9ec6-ba3934f6ce5f", // From columns array
    "listPropertyPath": ["_name_D81JNJ"],
    "compareOperator": "Eq",
    "values": ["Choco Bites"],
    "variableIds": []
  }
}
```

### 5. **Sorting**

Sorting options define how data is ordered in a View. Multiple sorting options can be applied, with the first option having the highest priority.

#### **Types of Sorting**

There are two types of sorting options:

##### **1. Sort by Property (ByProperty)**

Sorts data based on a Property value of a Dimension (e.g., sort by Name, Code, or any other Dimension Property).

**When to use:**

- Sorting List items alphabetically by name
- Sorting by a Dimension Property like "Code" or "Category"
- Ordering data by manual Dimension order (when `propertyTechnicalName` is null)

**Configuration:**

```python
PydanticSortingOption(
    order=Order.Asc,  # or Order.Desc
    type=SortingOptionType.ByProperty,
    by_property_sorting_option=PydanticByPropertySortingOption(
        pivot_field_id="<pivot-field-id>",  # The pivot field to sort
        property_technical_name="name",      # Property to sort by (or None for manual order)
    ),
)
```

**Example use cases:**

- Sort products alphabetically by product name
- Sort employees by employee code
- Sort departments by a custom "Priority" Property

##### **2. Sort by Metric Value (ByMetricValue)**

Sorts data based on Metric values (e.g., sort products by their revenue).

**When to use:**

- Sorting by calculated values (revenue, cost, profit, etc.)
- Ranking items by performance Metrics
- Ordering data by aggregated values

**Configuration:**

```python
PydanticSortingOption(
    order=Order.Desc,  # or Order.Asc
    type=SortingOptionType.ByMetricValue,
    by_metric_value_sorting_option=PydanticByMetricValueSortingOption(
        pivot_field_id="<pivot-field-id>",      # The pivot whose modalities are sorted
        value_field_id="<value-field-id>",      # The metric to sort by
        projections=[                            # Define which modality to use for sorting
            PydanticSingleModalityProjection(
                pivot_field_id="<other-pivot-field-id>",
                modality_id="<modality-id>",     # Can be None for null modality
            )
        ],
        subtotal_pivot_field_ids=None,          # Optional: for sorting on subtotals
    ),
)
```

**Important notes about projections:**

- **Projections** specify which specific modality to use when sorting by Metric values
- All pivot fields on the **opposite axis** must be either projected or included in subtotals
- For example, if sorting rows by a Metric, all column pivot fields must be projected
- Each projection selects a specific modality (or null modality) for a pivot field

**Example use cases:**

- Sort products by total revenue (descending)
- Sort regions by sales performance
- Rank employees by their productivity Metrics

#### **Multiple Sorting Options**

You can apply multiple sorting options to a View. They are applied in order, with the first option having the highest priority.

**Example:**

```python
sorts=[
    # Primary sort: by category (ascending)
    PydanticSortingOption(
        order=Order.Asc,
        type=SortingOptionType.ByProperty,
        by_property_sorting_option=PydanticByPropertySortingOption(
            pivot_field_id=category_pivot_id,
            property_technical_name="name",
        ),
    ),
    # Secondary sort: by revenue (descending)
    PydanticSortingOption(
        order=Order.Desc,
        type=SortingOptionType.ByMetricValue,
        by_metric_value_sorting_option=PydanticByMetricValueSortingOption(
            pivot_field_id=product_pivot_id,
            value_field_id=revenue_value_field_id,
            projections=[...],
        ),
    ),
]
```

This would first sort by category name (A-Z), then within each category, sort products by revenue (highest to lowest).

#### **Common Sorting Patterns**

1. **Alphabetical sorting of List items:**
   - Use `ByProperty` with `property_technical_name="name"`
   - Order: `Asc` for A-Z, `Desc` for Z-A

2. **Top N analysis (e.g., top 10 products by revenue):**
   - Use `ByMetricValue` with `order=Order.Desc`
   - Combine with filters to limit to top N items

3. **Time-based sorting:**
   - Use `ByProperty` with the time Dimension's natural order
   - Set `property_technical_name=None` to use manual/natural order

4. **Multi-level sorting:**
   - Apply multiple sorting options in priority order
   - First sort establishes primary grouping, subsequent sorts refine within groups

---

## View Creation Approach

View creation and modification uses an **incremental approach**: it creates a basic View first, then configures it step-by-step through multiple operations until it matches the user's request.

## View Design Process

### Step 1: Understand the User's Request

Analyze what the user wants to visualize:

**Questions to ask yourself:**

1. What data should be shown? (which Metric, List, or Table?)
2. How should it be broken down? (which Dimensions?)
3. What's the primary analysis axis? (rows vs columns)
4. What Pages/Filters are needed? (scenario, time period, region?)

### Step 2: Choose the Values

Multiple possibilities depending on the Block type:

- **Underlying Block is a Metric**: The value is the Metric itself. At least one value is needed.
- **Underlying Block is a Table**: The values are the Metrics of the Table. At least one value is needed.
- **Underlying Block is a List** : The values are the properties of the List. At least one value is needed.

### Step 3: Design the Pivot Structure

1. **Pages**:
   - Use for Dimensions the user wants to filter on
   - Typically: Scenario, high-level geography, versions
   - Note: You only define which Dimensions are Pages, not their specific values
   - Example Dimensions: `Scenario`, `Year`, `Region` (not the actual values like "Actuals" or "2024")

2. **Rows**:
   - Use for the primary breakdown Dimension
   - Typically: Products, departments, employees, accounts
   - Users read top-to-bottom for comparisons
   - Example Dimensions: `Product Line`, `Department`

3. **Columns**:
   - Use for the secondary breakdown, often time
   - Typically: Months, quarters, years, scenarios for comparison
   - Users read left-to-right for trends
   - Example Dimensions: `Month`, `Quarter`

## Troubleshooting

### View Creation Fails at Step 2 (Pivot Fields)

**Symptoms:**

- Error: "Dimension ID not found"
- Error: "Invalid pivot field configuration"
- Pivot field is silently removed during View creation

**Solutions:**

1. Verify Dimension IDs exist in the application
2. Check that Dimension is actually a Dimension of the underlying Metric/List
3. Ensure pivot field kind matches (Dimension vs Scenario)
4. For Grouping pivots with `listPropertyPath`:
   - Verify the source Dimension exists in the List cache
   - Check that each Property in the path exists on the respective Dimensions
   - Ensure the List Property path uses **technical names** (not display names)
   - Verify the Dimension is part of the allowed Dimensions (determined by Metrics in valueFields)

### Filters Are Being Removed (Silently Sanitized)

**Symptoms:**

- Filter was provided in the create_view call but is missing from the created View
- Filter appears to be ignored during view creation
- No error message, but the filter just doesn't appear

**Root Cause:**
The filter failed validation during view sanitization and was removed. This happens when:

1. **Wrong pivotFieldId source (MOST COMMON)**: The `pivotFieldId` in the filter references a pivot from the **pages array** instead of from rows/columns.
   - **Why it fails**: Filters are only validated against `DimensionalPivotFields`, which only includes pivots from rows and columns
   - **How to fix**: Always use a pivotFieldId from the rows or columns arrays, never from pages
   - **Example**: If filtering on Product Dimension, ensure Product is in rows or columns, then use that pivot's ID

2. **Missing projections for ValueField filters**: If filtering on a pivot in one axis (e.g., rows) and there are pivots on the opposite axis (e.g., columns), you MUST provide projections for each opposite-axis pivot.

3. **Invalid pivot reference**: The `pivotFieldId` doesn't reference the innermost pivot on its axis.

4. **Invalid value field reference**: The `valueFieldId` doesn't exist in the View's value fields.

5. **Invalid comparison operator**: The operator doesn't match the Metric type (e.g., using "Contains" on a numeric Metric).

6. **Invalid List Property path**: For PivotListProperty filters, the Property path doesn't exist on the Dimension.

**Solutions:**

1. **CRITICAL: Always use pivotFieldId from rows or columns, NEVER from pages**:
   - Check that the Dimension you want to filter on appears in rows or columns
   - If it only appears in pages, you need to add it to rows or columns first
   - Use the pivotFieldId from that row/column entry

2. **Always provide projections for ValueField filters** when the opposite axis has pivots:

   ```json
   "projections": [
     {
       "pivotFieldId": "<column-pivot-id>",
       "modalityId": "<first-modality-of-that-dimension>"
     }
   ]
   ```

3. Use the GetBlockViews tool to inspect an existing similar view to see how filters are structured

4. Verify all IDs refer to an existing pivot and the pivots exist in rows/columns (not pages!)

### View Shows No Data

**Symptoms:**

- View created but displays empty

**Solutions:**

1. Check filters - may be filtering out all data
2. Verify underlying Metric/List has data
3. Check `show_empty_rows` and `show_empty_columns` settings
4. Ensure value fields are set to `displayed: true`

### Performance Issues

**Symptoms:**

- View takes a long time to load
- Browser becomes unresponsive

**Solutions:**

1. Add more aggressive filters to reduce data volume
2. Reduce number of breakdowns
3. Set `show_empty_rows: false` and `show_empty_columns: false`
4. Use pages with `single_modality: true` to limit data

## Summary Checklist

Before creating a View, ensure:

- [ ] **Purpose is clear**: You understand what analysis the user needs
- [ ] **Values specified**: At least one Metric or List Property
- [ ] **Pivots organized**: Rows (primary), Columns (secondary), Pages (filters)
- [ ] **Filters defined**: Even if empty, explicitly state the filter config
- [ ] **Sorting configured**: If the user requests specific ordering, add appropriate sorting options
- [ ] **Name is descriptive**: Clear what the View shows
- [ ] **Description added**: Explains the purpose
