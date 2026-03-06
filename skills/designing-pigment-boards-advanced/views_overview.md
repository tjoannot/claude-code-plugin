# Views Overview

## What Are Views?

Views are configurations that specify how to display data from Blocks (Metrics, Lists, or Tables) on Boards. A View defines not just _what_ data to show, but _how_ it should be displayed, filtered, sorted, and organized.

Think of a View as a "lens" through which users see Block data. The same Block can have multiple Views, each showing the data in a different way for different purposes.

---

## Views vs. Blocks

### Blocks Contain Data

- **Metrics**: Calculate and store multidimensional data
- **Lists**: Store dimension items or transaction records
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

### 1. **Source Block**

The Block (Metric, List, or Table) that provides the data.

### 2. **Display Mode**

How the data is visualized:

- Grid (table view)
- Chart (Bar, Line, Pie, Waterfall, etc.)
- KPI (Key Performance Indicator)
- List (for Lists)

### 3. **Breakdowns (Pivots)**

Dimensions used to organize data:

- **Rows**: Dimensions displayed as rows
- **Columns**: Dimensions displayed as columns
- **Pages**: Dimensions used as page selectors

### 4. **Filters**

Conditions that restrict which data is shown:

- **By Items**: Filter to specific dimension items
- **By Value**: Filter based on metric values

### 5. **Sorting**

How data is ordered:

- By metric value (ascending/descending)
- By property (alphabetical)
- By dimension item

### 6. **Calculations**

Additional computations:

- Growth percentages
- Ratios between items or metrics
- Differences and variances

---

## View Lifecycle

### 1. **Creation**

Views are created when:

- Adding a View widget to a Board
- Configuring how to display a Block
- Defining display preferences

### 2. **Configuration**

Views are configured with:

- Display mode selection
- Dimension breakdowns
- Filter settings
- Sorting preferences
- Calculation definitions

### 3. **Usage**

Views are used by:

- View widgets on Boards
- Multiple widgets can use the same View
- Views can be shared across Boards

### 4. **Modification**

Views can be updated:

- Change display mode
- Adjust filters
- Modify sorting
- Update breakdowns

### 5. **Deletion**

Views are removed when:

- View widget is deleted from Board
- View is no longer needed
- Block is deleted (cascading)

---

## View Types by Block Type

### Views on Lists

Lists only support:

- **List View**: Display list items and properties

### Views on Metrics

Metrics support all display modes:

- **Grid**: Multidimensional table view
- **Charts**: Bar, Line, Pie, Waterfall, etc.
- **KPI**: Single value or aggregated display
- **Spreadheet**: Complex breakdowns

### Views on Tables

Tables support all display modes:

- **Grid**: Multi-metric comparison table
- **Charts**: Compare multiple metrics
- **KPI**: Display table metrics as KPIs
- **Spreadheet**: Complex breakdowns

---

## View Configuration Elements

### Display Mode

Determines the visual representation:

- Grid for detailed data
- Charts for trends and comparisons
- KPI for key metrics
- See [Views Display Modes](./views_display_modes.md) for details

### Breakdowns (Pivots)

Organize data by dimensions:

- Rows: Vertical organization
- Columns: Horizontal organization
- Pages: Filtering dimensions
- See [Views Configuration](./views_configuration.md) for details

### Filters

Restrict visible data:

- By Items: Select specific dimension items
- By Value: Filter based on metric values
- Operators: =, >, <, >=, <=, top, bottom, contains
- See [Views Configuration](./views_configuration.md) for details

### Sorting

Order data display:

- By Metric Value: Sort by calculated values
- By Property: Sort by dimension properties
- Ascending/Descending: Sort direction
- See [Views Configuration](./views_configuration.md) for details

### Calculations

Additional computations:

- Growth: Percentage change
- Ratio: Division between items/metrics
- Difference: Subtraction between items/metrics
- Variance: Deviation from baseline
- See [Views Configuration](./views_configuration.md) for details

---

## View Best Practices

### 1. **Choose Appropriate Display Mode**

- Grid for detailed data analysis
- Charts for trends and comparisons
- KPI for key metrics
- Match mode to user needs

### 2. **Use Meaningful Breakdowns**

- Select relevant dimensions
- Don't overload with too many dimensions
- Consider user's analysis needs

### 3. **Apply Useful Filters**

- Filter to relevant time periods
- Focus on important segments
- Don't over-filter (may hide insights)

### 4. **Sort for Clarity**

- Sort by importance or value
- Use sorting to highlight key items
- Consider user's analysis goals

### 5. **Add Calculations When Helpful**

- Growth percentages for trends
- Ratios for comparisons
- Differences for variance analysis

### 6. **Name Views Clearly**

- Use descriptive names
- Indicate purpose or audience
- Include key filters or breakdowns in name

---

## Common View Patterns

### Executive Summary View

- **Display Mode**: KPI or Chart
- **Breakdowns**: High-level dimensions (Region, Product Line)
- **Filters**: Current period, Baseline scenario
- **Sorting**: By value (descending)
- **Calculations**: Growth vs. previous period

### Detailed Analysis View

- **Display Mode**: Grid
- **Breakdowns**: Multiple dimensions (rows and columns)
- **Filters**: Specific time period, selected items
- **Sorting**: By metric value (descending)
- **Calculations**: Variance vs. budget

### Trend Analysis View

- **Display Mode**: Line Chart
- **Breakdowns**: Time dimension (columns), Category (rows)
- **Filters**: Specific scenarios or items
- **Sorting**: By time (ascending)
- **Calculations**: Growth rate

### Comparison View

- **Display Mode**: Bar Chart or Grid
- **Breakdowns**: Comparison dimension (columns)
- **Filters**: Specific time period
- **Sorting**: By value (descending)
- **Calculations**: Ratio or difference

---

## View Performance Considerations

### Dimension Count

- More dimensions = more data points
- Limit breakdown dimensions for performance
- Use page selectors for additional dimensions

### Filter Efficiency

- Filters reduce data volume
- Apply filters early in configuration
- Use efficient filter operators

### Calculation Complexity

- Complex calculations may slow rendering
- Use calculations judiciously
- Consider pre-calculating in Metrics when possible

### Data Volume

- Large datasets may require pagination
- Consider filtering to reduce volume
- Use appropriate display modes for large datasets

---

## View Reusability

### Sharing Views Across Boards

- Views can be reused on multiple Boards
- Update View once, affects all Boards using it
- Promotes consistency across dashboards

### View Variations

- Create multiple Views of the same Block
- Each View serves different purposes
- Example: Summary View vs. Detail View

### View Templates

- Standardize View configurations
- Create templates for common patterns
- Ensure consistency across applications

---

## View Configuration Workflow

### Step 1: Select Source Block

Choose the Metric, List, or Table to display.

### Step 2: Choose Display Mode

Select appropriate visualization type based on:

- Data type
- User needs
- Analysis purpose

### Step 3: Configure Breakdowns

Select dimensions for:

- Rows (vertical organization)
- Columns (horizontal organization)
- Pages (filtering)

### Step 4: Apply Filters

Set filters to:

- Focus on relevant data
- Reduce data volume
- Highlight specific segments

### Step 5: Configure Sorting

Set sorting to:

- Order by importance
- Highlight key items
- Support analysis flow

### Step 6: Add Calculations (Optional)

Add calculations for:

- Growth analysis
- Comparisons
- Variance analysis

### Step 7: Test and Refine

- Test View with real data
- Verify filters and sorting work correctly
- Refine based on user feedback

---

## See Also

- [Views Display Modes](./views_display_modes.md) - Available visualization types
- [Views Configuration](./views_configuration.md) - Detailed configuration guide
- [Views Best Practices](./views_best_practices.md) - Design guidelines
- [Widget Types](./widgets_types.md) - Using Views in widgets
