# Views Configuration

Views can be configured with filters, sorting, calculations, breakdowns, and pivot settings to customize how data is displayed and analyzed.

---

## Configuration Overview

View configuration includes:

1. **Breakdowns (Pivots)**: Dimensions for organizing data
2. **Filters**: Conditions that restrict visible data
3. **Sorting**: Order in which data is displayed
4. **Calculations**: Additional computations on data
5. **Page Selectors**: Dimensions used for filtering

---

## Breakdowns (Pivots)

Breakdowns determine how dimensions are used to organize data in the view.

### Pivot Structure

Views use a pivot structure with three types of dimensions:

#### Rows

Dimensions displayed as rows in the view:

- Primary organization axis
- Vertical organization
- Typically the main breakdown dimension
- Example: Products, Departments, Regions

#### Columns

Dimensions displayed as columns in the view:

- Secondary organization axis
- Horizontal organization
- Often time dimensions
- Example: Months, Quarters, Years

#### Pages

Dimensions used as page selectors:

- Filtering dimensions
- Users select items to filter view
- Reduces visible data
- Example: Scenarios, Regions, Years

### Breakdown Configuration

**Single Dimension Breakdown:**

- One dimension on rows
- Simple organization
- Example: Revenue by Product (Product on rows)

**Multiple Dimension Breakdown:**

- Multiple dimensions on rows and/or columns
- Complex organization
- Example: Revenue by Product and Region (Product on rows, Region on columns)

**Time-Based Breakdown:**

- Time dimension on columns
- Trend analysis
- Example: Revenue by Month (Product on rows, Month on columns)

### Best Practices

- **Limit dimensions**: Too many dimensions can clutter the view
- **Use pages**: Move less critical dimensions to pages
- **Logical organization**: Place most important dimension on rows
- **Time on columns**: Use time dimensions as columns for trends

### Using Dimension-Type Properties in Views

One of Pigment's most powerful features is the ability to pivot and group by dimension-type properties **without adding them to the metric structure**. This enables flexible reporting across hierarchies while maintaining optimal performance.

#### What are Dimension-Type Properties?

Dimension-type properties create hierarchies and relationships between dimensions. For example:

- **Product** dimension has a "Category" property (dimension-type) referencing the **Product Category** dimension
- **Employee** dimension has a "Department" property (dimension-type) referencing the **Department** dimension
- **Store** dimension has a "Region" property (dimension-type) referencing the **Region** dimension

#### How to Use Properties in Views

You can add dimension-type properties to rows, columns, or pages just like regular dimensions:

**Example 1: Revenue Metric Structure**

- Metric structure: `Product × Month` (only 2 dimensions)
- Product has "Category" property (dimension-type)
- Product Category has "Line" property (dimension-type)

**In Views - Multiple Reporting Levels:**

**Product-Level Detail:**

- Rows: Product
- Columns: Month
- Result: Shows revenue for each individual product

**Category-Level Summary:**

- Rows: Product.Category
- Columns: Month
- Result: Shows revenue aggregated by category (no metric structure change needed)

**Product Line Summary:**

- Rows: Product.Category.Line
- Columns: Month
- Result: Shows revenue aggregated by product line (navigating 2 levels up the hierarchy)

**Mixed Hierarchy View:**

- Rows: Product.Category, Product (nested)
- Columns: Month
- Result: Shows categories with products nested underneath

#### Syntax for Property References

**Single-Level Property:**

```
Dimension.Property
```

Example: `Product.Category`, `Employee.Department`, `Store.Region`

**Multi-Level Property Chain:**

```
Dimension.Property.Property
```

Example: `Product.Category.Line`, `Employee.Department.Division`

**In Filters:**

```
Dimension.Property = [Item1, Item2]
```

Example: `Product.Category = [Electronics, Appliances]`

**In Sorting:**

- Sort by: `Product.Category` (alphabetical)
- Sort by: Revenue at `Product.Category` level (descending)

#### Benefits of Property-Based Pivoting

**1. Flexibility Without Restructuring:**

- Switch between detail and summary views instantly
- No need to add dimensions to metric structure
- Users can explore hierarchies dynamically

**2. Performance Optimization:**

- Metrics remain sparse with fewer dimensions
- Calculations run faster with simpler structures
- Storage requirements stay minimal

**3. Simplified Maintenance:**

- Hierarchy changes don't require metric restructuring
- Add new hierarchy levels without impacting existing metrics
- Easier to audit and understand

#### Common Use Cases

**Organizational Hierarchies:**

- Employee → Department → Division
- Cost Center → Business Unit → Company
- Store → Region → Country

**Product Hierarchies:**

- SKU → Product → Category → Line
- Item → Family → Group
- Part → Assembly → System

**Geographic Hierarchies:**

- Store → City → Region → Country
- Location → Territory → Zone
- Office → District → Area

**Time Hierarchies (Built-in):**

- Day → Week → Month → Quarter → Year
- These work automatically with calendar dimensions

#### Example: Sales Analysis Across Hierarchy Levels

**Metric:** Sales Revenue
**Structure:** `Product × Store × Month`
**Properties:**

- Product has "Category" property
- Store has "Region" property

**View 1 - Detailed Analysis:**

- Rows: Product, Store
- Columns: Month
- Shows: Product-level sales by store

**View 2 - Category by Region:**

- Rows: Product.Category, Store.Region
- Columns: Month
- Shows: Category-level sales by region (aggregated automatically)

**View 3 - Category Detail with Regional Filter:**

- Rows: Product.Category, Product (nested)
- Columns: Month
- Filter: Store.Region = [North, South]
- Shows: Categories and products for selected regions only

#### Best Practices for Property-Based Views

**1. Design Metrics with Properties in Mind:**

- Keep metric structure minimal (base dimensions only)
- Create dimension-type properties for all hierarchical relationships
- Document hierarchy structure for users

**2. Use Properties for Reporting Flexibility:**

- Add properties to rows/columns for different aggregation levels
- Use property filters to focus on specific hierarchy segments
- Combine properties from multiple dimensions for cross-hierarchy analysis

**3. Name Properties Clearly:**

- Use descriptive names (e.g., "Category" not "Cat", "Department" not "Dept")
- Maintain consistent naming across dimensions
- Document what each property represents

**4. Leverage Multi-Level Hierarchies:**

- Chain properties for deep hierarchies: `Dimension.Property.Property`
- Test that aggregations work correctly at each level
- Ensure data quality in property mappings

**5. Combine with Filters and Sorting:**

- Filter by properties: `Product.Category = Electronics`
- Sort by properties: Sort by `Product.Category` alphabetically
- Use property-based calculations: Growth % by Category

#### Limitations and Considerations

**Property Requirements:**

- Properties must be dimension-type (not Text, Number, etc.)
- Properties must reference valid dimensions
- Property mappings should be complete (avoid blanks)

**Aggregation Behavior:**

- Pigment automatically aggregates using the metric's default aggregator (usually SUM)
- For non-additive metrics (ratios, percentages), use "Show Value As" feature
- Ensure aggregation logic makes sense at each hierarchy level

**Performance Considerations:**

- Property-based views are generally fast
- Very deep hierarchies (4+ levels) may have slight performance impact
- Large dimensions with many properties still perform well

#### Troubleshooting

**Issue: Property doesn't appear in view configuration**

- Check that property is dimension-type (not Text/Number)
- Verify property references a valid dimension
- Ensure dimension is in metric structure

**Issue: Aggregated values seem incorrect**

- Check metric's default aggregator setting
- Verify property mappings are complete
- For ratios/percentages, use "Show Value As" instead of direct aggregation

**Issue: Blank values in property-based view**

- Check for items with blank property values
- Verify all dimension items have property mappings
- Use filters to exclude blanks if needed

---

## Filters

Filters restrict which data is displayed in the view by applying conditions.

### Filter Types

#### Filter by Items

Filters to specific dimension items:

**Syntax:**

```
Dimension = [Item1, Item2, Item3, ...]
```

**Examples:**

- `Month.Year = FY 25`
- `Region = [North, South, East, West]`
- `Scenario = Baseline`
- `Product = [Product A, Product B]`

**Use Cases:**

- Filtering to specific time periods
- Selecting specific regions or products
- Focusing on particular scenarios
- Limiting to relevant items

#### Filter by Value

Filters based on metric values:

**Syntax:**

```
Metric Operator Value
```

**Operators:**

- `=` (equals)
- `>` (greater than)
- `<` (less than)
- `>=` (greater than or equal)
- `<=` (less than or equal)
- `top` (top N items)
- `bottom` (bottom N items)
- `contains` (text contains)

**Examples:**

- `Revenue > 100000`
- `Headcount >= 50`
- `Margin % < 0.1`
- `Revenue top 10` (top 10 by Revenue)
- `Cost bottom 5` (bottom 5 by Cost)

**Use Cases:**

- Filtering high/low performers
- Focusing on significant values
- Top/bottom N analysis
- Threshold-based filtering

### Filter Operators

#### Comparison Operators

**Equals (=)**

- Exact match
- Example: `Region = North`

**Greater Than (>)**

- Values above threshold
- Example: `Revenue > 1000000`

**Less Than (<)**

- Values below threshold
- Example: `Cost < 50000`

**Greater Than or Equal (>=)**

- Values at or above threshold
- Example: `Headcount >= 100`

**Less Than or Equal (<=)**

- Values at or below threshold
- Example: `Margin % <= 0.15`

#### Ranking Operators

**Top N**

- Top N items by metric value
- Example: `Revenue top 10` (top 10 products by revenue)

**Bottom N**

- Bottom N items by metric value
- Example: `Cost bottom 5` (bottom 5 departments by cost)

#### Text Operators

**Contains**

- Text contains substring
- Example: `Product Name contains "Premium"`

### Filter Combinations

Filters can be combined with logical operators:

**AND Logic:**

- All conditions must be true
- Example: `Region = North AND Revenue > 100000`

**OR Logic:**

- Any condition can be true
- Example: `Region = [North, South] OR Revenue > 1000000`

**Complex Combinations:**

- Mix AND and OR logic
- Use parentheses for grouping
- Example: `(Region = North OR Region = South) AND Revenue > 100000`

### Filter Best Practices

1. **Use filters to focus**: Filter to relevant data
2. **Don't over-filter**: Avoid hiding important insights
3. **Time filters**: Always filter to relevant time periods
4. **Value filters**: Use for threshold-based analysis
5. **Top/Bottom**: Use for ranking analysis
6. **Combine filters**: Use multiple filters for precision

---

## Sorting

Sorting determines the order in which data is displayed.

### Sorting Types

#### Sort by Metric Value

Sorts by the calculated metric value:

**Configuration:**

- Metric: Which metric to sort by
- Order: Ascending or Descending
- Dimension: Which dimension to sort

**Examples:**

- Sort Revenue by Product (descending)
- Sort Headcount by Department (ascending)
- Sort Margin % by Region (descending)

**Use Cases:**

- Ranking items by performance
- Highlighting top/bottom performers
- Organizing by importance
- Value-based ordering

#### Sort by Property

Sorts by a dimension property:

**Configuration:**

- Property: Which property to sort by
- Order: Ascending or Descending
- Dimension: Which dimension to sort

**Examples:**

- Sort Products by Name (alphabetical)
- Sort Departments by Code (ascending)
- Sort Regions by Priority (descending)

**Use Cases:**

- Alphabetical ordering
- Code-based ordering
- Custom property ordering
- Standard organizational order

### Sort Order

#### Ascending

- Low to high
- A to Z
- Smallest to largest

#### Descending

- High to low
- Z to A
- Largest to smallest

### Multiple Sorting

Views can have multiple sort criteria:

**Primary Sort:**

- First sorting criterion
- Main ordering

**Secondary Sort:**

- Second sorting criterion
- Breaks ties in primary sort

**Example:**

- Primary: Sort by Revenue (descending)
- Secondary: Sort by Product Name (ascending)
- Result: Products sorted by revenue, then alphabetically within same revenue

### Sorting Best Practices

1. **Sort by importance**: Sort by metric value for performance analysis
2. **Use descending**: Typically sort high to low for metrics
3. **Alphabetical when needed**: Use property sort for standard ordering
4. **Multiple sorts**: Use secondary sorts to break ties
5. **Consider users**: Sort in a way that makes sense to users

---

## Calculations

Calculations add additional computations to views, such as growth percentages, ratios, and differences.

### Calculation Types

#### Growth

Calculates percentage change between two items or periods:

**Configuration:**

- Item A: Starting point (e.g., Previous Month)
- Item B: Ending point (e.g., Current Month)
- Operator: Growth percentage
- Dimension: Dimension for comparison

**Examples:**

- Growth %: Current Month vs. Previous Month
- Growth %: FY 25 vs. FY 24
- Growth %: Product A vs. Product B

**Formula:**

```
Growth % = ((Item B - Item A) / Item A) * 100
```

**Use Cases:**

- Period-over-period growth
- Year-over-year growth
- Item-to-item comparisons
- Trend analysis

#### Ratio

Calculates ratio between two items or metrics:

**Configuration:**

- Item A: Numerator
- Item B: Denominator
- Operator: Ratio
- Dimension: Dimension for comparison

**Examples:**

- Ratio: Revenue A / Revenue B
- Ratio: Actual / Budget
- Ratio: Product A / Product B

**Use Cases:**

- Comparing items
- Actual vs. Budget ratios
- Relative comparisons
- Performance ratios

#### Difference

Calculates difference between two items or metrics:

**Configuration:**

- Item A: Starting point
- Item B: Ending point
- Operator: Difference
- Dimension: Dimension for comparison

**Examples:**

- Difference: Current Month - Previous Month
- Difference: Actual - Budget
- Difference: Product A - Product B

**Use Cases:**

- Variance analysis
- Period-over-period changes
- Budget vs. Actual differences
- Item comparisons

#### Variance

Calculates variance from a baseline:

**Configuration:**

- Item A: Actual value
- Item B: Baseline value
- Operator: Variance
- Dimension: Dimension for comparison

**Examples:**

- Variance: Actual - Budget
- Variance: Forecast - Baseline
- Variance: Current - Target

**Use Cases:**

- Budget variance
- Forecast variance
- Target variance
- Performance variance

### Calculation Configuration

**On Dimension:**

- Calculation applies to specific dimension
- Example: Growth % on Month dimension

**Between Items:**

- Compare two items of same dimension
- Example: Growth % between Month items

**Between Metrics:**

- Compare two different metrics
- Example: Ratio between Revenue and Cost

### Calculation Best Practices

1. **Use for insights**: Add calculations that provide value
2. **Growth for trends**: Use growth % for period comparisons
3. **Ratios for comparisons**: Use ratios for relative analysis
4. **Differences for variance**: Use differences for variance analysis
5. **Don't over-calculate**: Too many calculations can clutter
6. **Label clearly**: Ensure calculations are clearly labeled

---

## Page Selectors

Page selectors allow users to filter views by selecting dimension items.

### Page Selector Configuration

**Dimensions on Pages:**

- Dimensions moved to page selectors
- Users select items to filter view
- Reduces visible data
- Improves performance

**Example:**

- Scenario dimension on pages
- User selects "Baseline" scenario
- View shows only Baseline data

### When to Use Page Selectors

- **Many dimension items**: When dimension has many items
- **Optional filtering**: When filtering is optional
- **Performance**: To reduce data volume
- **User control**: When users need filtering control

### Page Selector Best Practices

1. **Move to pages**: Move less critical dimensions to pages
2. **Limit pages**: Don't use too many page dimensions
3. **Default selection**: Set sensible defaults
4. **User-friendly**: Use clear dimension names

---

## Pivot Table Configuration

Pivot tables allow complex breakdowns with multiple dimensions.

### Pivot Structure

**Rows:**

- Primary breakdown dimensions
- Vertical organization
- Can have multiple dimensions

**Columns:**

- Secondary breakdown dimensions
- Horizontal organization
- Often time dimensions

**Pages:**

- Filtering dimensions
- User-selectable filters
- Reduces data volume

**Values:**

- Metrics to display
- Can have multiple metrics
- Supports calculations

### Pivot Configuration Options

**Show Totals:**

- Display row and column totals
- Grand totals
- Sub-totals

**Formatting:**

- Number formatting
- Currency formatting
- Percentage formatting
- Date formatting

**Layout:**

- Compact or outline layout
- Row grouping
- Column grouping

### Pivot Best Practices

1. **Logical organization**: Organize dimensions logically
2. **Limit dimensions**: Don't overload with dimensions
3. **Use pages**: Move less critical dimensions to pages
4. **Format appropriately**: Use appropriate number formats
5. **Show totals**: Include totals for context

---

## Configuration Workflow

### Step 1: Select Source Block

Choose the Metric, List, or Table to display.

### Step 2: Choose Display Mode

Select appropriate visualization type.

### Step 3: Configure Breakdowns

Set dimensions for rows, columns, and pages.

### Step 4: Apply Filters

Set filters to focus on relevant data.

### Step 5: Configure Sorting

Set sorting to order data appropriately.

### Step 6: Add Calculations (Optional)

Add calculations for additional insights.

### Step 7: Configure Page Selectors

Move dimensions to pages if needed.

### Step 8: Test and Refine

Test view with real data and refine as needed.

---

## Configuration Examples

### Example 1: Revenue by Product and Month

**Breakdowns:**

- Rows: Product
- Columns: Month
- Pages: Scenario

**Filters:**

- Scenario = Baseline
- Month.Year = FY 25

**Sorting:**

- Sort by Revenue (descending) on Product

**Display Mode:** Grid

### Example 2: Top 10 Products by Revenue

**Breakdowns:**

- Rows: Product
- Columns: (none)

**Filters:**

- Revenue top 10
- Month = Current Month

**Sorting:**

- Sort by Revenue (descending) on Product

**Display Mode:** Bar Chart

### Example 3: Revenue Growth Trend

**Breakdowns:**

- Rows: Product
- Columns: Month

**Filters:**

- Scenario = Baseline
- Month.Year = FY 25

**Sorting:**

- Sort by Month (ascending)

**Calculations:**

- Growth %: Current Month vs. Previous Month

**Display Mode:** Line Chart

---

## See Also

- [Views Overview](./views_overview.md) - Understanding views
- [Views Display Modes](./views_display_modes.md) - Visualization types
- [Views Best Practices](./views_best_practices.md) - Design guidelines
