# Views Display Modes

Display modes determine how data is visualized in Views. Each display mode is optimized for different types of analysis and data presentation.

---

## Display Mode Overview

### Available Display Modes

1. **Grid** - Table view for detailed data
2. **Bar** - Bar chart for comparisons
3. **Stacked** - Stacked bar chart for composition
4. **Line** - Line chart for trends
5. **Pie** - Pie chart for proportions
6. **Waterfall Contribution** - Waterfall chart for contributions
7. **Waterfall Variation** - Waterfall chart for changes
8. **KPI** - Key Performance Indicator display
9. **Chart** - Generic chart (auto-selected)
10. **Default** - System default selection

---

## Grid Display Mode

### Description

Grid display mode shows data in a table format with rows and columns. It's the most detailed view, showing all data points in a structured table.

### Visual Characteristics

- Rows represent one set of dimensions
- Columns represent another set of dimensions
- Cells show metric values
- Supports multiple metrics side-by-side
- Can display all dimension combinations

### When to Use

- **Detailed analysis**: When users need to see all data points
- **Data entry**: When users need to input or edit values
- **Comparison**: When comparing multiple metrics side-by-side
- **Export**: When data needs to be exported or copied
- **Precision**: When exact values are important

### Best For

- Financial statements
- Budget vs. Actual comparisons
- Detailed operational data
- Multi-metric comparisons
- Data that requires precision

### Dimension Configuration

- **Rows**: Primary breakdown dimensions
- **Columns**: Secondary breakdown dimensions
- **Pages**: Additional filtering dimensions
- **Multiple dimensions**: Supports many dimensions

### Limitations

- Can become cluttered with many dimensions
- Less effective for trend visualization
- Requires scrolling for large datasets

### Example Use Cases

- P&L statement with months as columns, accounts as rows
- Headcount by department (rows) and month (columns)
- Sales by product (rows) and region (columns)

---

## Bar Chart Display Mode

### Description

Bar charts display data as horizontal or vertical bars, making it easy to compare values across categories.

### Visual Characteristics

- Bars represent metric values
- Categories on one axis (rows or columns)
- Values on the other axis
- Easy to compare values visually
- Supports single or multiple metrics

### When to Use

- **Comparisons**: Comparing values across categories
- **Rankings**: Showing top/bottom performers
- **Single dimension**: One primary breakdown dimension
- **Clear differences**: When differences need to be obvious
- **Categorical data**: Non-time-based comparisons

### Best For

- Revenue by product line
- Headcount by department
- Sales by region
- Performance comparisons
- Ranking visualizations

### Dimension Configuration

- **Rows or Columns**: One primary dimension
- **Optional second dimension**: For grouped bars
- **Time dimensions**: Can use time, but Line is better for trends

### Limitations

- Less effective for trends over time
- Can be cluttered with many categories
- Not ideal for proportions (use Pie)

### Example Use Cases

- Revenue by Product Line
- Headcount by Department
- Sales by Sales Rep
- Budget vs. Actual by Region

---

## Stacked Bar Chart Display Mode

### Description

Stacked bar charts show composition by stacking segments within bars. Each segment represents a portion of the total.

### Visual Characteristics

- Bars divided into segments
- Each segment represents a category
- Total bar height shows total value
- Segments show composition
- Color-coded segments

### When to Use

- **Composition**: Showing parts of a whole
- **Multiple categories**: Breaking down totals by category
- **Comparison**: Comparing totals and compositions
- **Hierarchical data**: Showing breakdowns within totals
- **Proportions**: Understanding relative sizes

### Best For

- Revenue by product category (stacked by product)
- Expenses by department (stacked by expense type)
- Headcount by location (stacked by role)
- Sales by region (stacked by product)

### Dimension Configuration

- **Bars**: Primary dimension (e.g., Region)
- **Stack segments**: Secondary dimension (e.g., Product)
- **Optional third dimension**: For grouped stacked bars

### Limitations

- Harder to compare individual segments
- Less effective for many segments
- Not ideal for trends (use Line)

### Example Use Cases

- OpEx by Department (stacked by expense category)
- Revenue by Region (stacked by Product Line)
- Headcount by Location (stacked by Department)

---

## Line Chart Display Mode

### Description

Line charts connect data points with lines, making trends and changes over time easy to see.

### Visual Characteristics

- Lines connect data points
- X-axis typically represents time
- Y-axis represents metric values
- Multiple lines for multiple series
- Shows trends and patterns

### When to Use

- **Trends**: Showing changes over time
- **Time series**: Data with time dimension
- **Patterns**: Identifying seasonal patterns
- **Forecasts**: Comparing actuals vs. forecasts
- **Multiple series**: Comparing multiple metrics over time

### Best For

- Revenue trends by month
- Headcount evolution over time
- Expense trends
- Forecast vs. Actual comparisons
- Seasonal analysis

### Dimension Configuration

- **X-axis (Columns)**: Time dimension (Month, Quarter, Year)
- **Y-axis**: Metric values
- **Lines (Rows)**: Categories to compare
- **Multiple metrics**: Multiple lines for comparison

### Limitations

- Requires time dimension for best results
- Less effective for categorical comparisons
- Can be cluttered with many series

### Example Use Cases

- Revenue by Month (line per Product)
- Headcount by Month (line per Department)
- Expenses by Quarter (line per Expense Type)
- Forecast vs. Actual by Month

---

## Pie Chart Display Mode

### Description

Pie charts show proportions by dividing a circle into segments. Each segment represents a portion of the total.

### Visual Characteristics

- Circle divided into segments
- Each segment represents a category
- Segment size shows proportion
- Color-coded segments
- Percentages often displayed

### When to Use

- **Proportions**: Showing parts of a whole
- **Single dimension**: One breakdown dimension
- **Percentages**: When percentages are important
- **Composition**: Understanding composition
- **Simple breakdowns**: Few categories (3-7 ideal)

### Best For

- Revenue by Product (proportions)
- Headcount by Department (proportions)
- Expenses by Category (proportions)
- Market share by Region

### Dimension Configuration

- **Segments**: Single dimension breakdown
- **Values**: Metric values
- **Optional filter**: Filter to specific time period

### Limitations

- Best with 3-7 categories
- Hard to compare similar-sized segments
- Not ideal for many categories
- Less effective for trends

### Example Use Cases

- Revenue Share by Product Line
- Headcount Distribution by Department
- Expense Breakdown by Category
- Market Share by Region

---

## Waterfall Contribution Display Mode

### Description

Waterfall charts show how a starting value is affected by a series of positive or negative changes, ending at a final value.

### Visual Characteristics

- Starting value bar
- Intermediate change bars (positive/negative)
- Final value bar
- Shows cumulative effect
- Visual flow from start to end

### When to Use

- **Contributions**: Showing contributions to a total
- **Breakdowns**: Breaking down a total into components
- **Additive changes**: Positive and negative contributions
- **Explaining totals**: Showing how total is reached
- **Variance analysis**: Explaining differences

### Best For

- Revenue breakdown (Base + Product contributions)
- Profit breakdown (Revenue - Costs)
- Headcount changes (Starting + Hires - Attrition)
- Budget variance (Budget + Variances = Actual)

### Dimension Configuration

- **Bars**: Items contributing to total
- **Order**: Typically sorted by contribution size
- **Values**: Positive and negative contributions

### Limitations

- Requires additive logic
- Less effective for non-additive data
- Can be complex with many items

### Example Use Cases

- Revenue Contribution by Product
- Profit Breakdown (Revenue - Costs)
- Headcount Changes (Starting + Hires - Attrition)

---

## Waterfall Variation Display Mode

### Description

Waterfall variation charts show changes between two points in time or two scenarios, highlighting what changed and by how much.

### Visual Characteristics

- Starting value bar
- Change bars showing increases/decreases
- Ending value bar
- Shows net change
- Compares two states

### When to Use

- **Comparisons**: Comparing two time periods
- **Scenarios**: Comparing scenarios (Actual vs. Forecast)
- **Changes**: Showing what changed
- **Variance**: Explaining differences
- **Year-over-year**: Comparing periods

### Best For

- Actual vs. Forecast comparison
- Year-over-year changes
- Scenario comparisons
- Period-to-period changes
- Variance analysis

### Dimension Configuration

- **Comparison**: Two items or scenarios
- **Changes**: Items showing changes
- **Values**: Changes between comparison points

### Limitations

- Requires two comparison points
- Less effective for single-period analysis
- Can be complex with many changes

### Example Use Cases

- Actual vs. Forecast Variance
- Year-over-Year Changes
- Scenario Comparison (Baseline vs. Upside)
- Period-to-Period Changes

---

## KPI Display Mode

### Description

KPI (Key Performance Indicator) display mode shows a single aggregated value, often with context like change indicators or comparisons.

### Visual Characteristics

- Large number display
- Metric name and description
- Optional change indicators
- Optional comparisons
- Clean, focused display

### When to Use

- **Key metrics**: Displaying critical metrics
- **Executive dashboards**: High-level KPIs
- **Summary views**: Top-level summaries
- **Monitoring**: Tracking important metrics
- **Focus**: When single value is most important

### Best For

- Total Revenue
- Headcount
- EBITDA
- Net Income
- Key ratios and percentages

### Dimension Configuration

- **Aggregation**: Typically aggregated across dimensions
- **Optional breakdown**: Can show by dimension with selectors
- **Filters**: Applied to focus on specific segments

### Limitations

- Shows single value (aggregated)
- Less detail than other modes
- Requires aggregation logic

### Example Use Cases

- Total Revenue KPI
- Headcount KPI
- EBITDA Margin %
- Net Income KPI

---

## Chart Display Mode

### Description

Chart is a generic display mode that automatically selects an appropriate chart type based on the data structure and dimensions.

### Visual Characteristics

- Auto-selected chart type
- Adapts to data structure
- May change based on dimensions
- Flexible visualization

### When to Use

- **Flexibility**: When chart type can vary
- **Auto-selection**: When system should choose
- **Dynamic views**: Views that adapt to data
- **General purpose**: When specific type isn't critical

### Best For

- Flexible dashboards
- Views that adapt to data
- General-purpose visualizations
- When chart type is secondary

### Dimension Configuration

- **Adaptive**: Adapts to available dimensions
- **Flexible**: Works with various configurations

### Limitations

- Less control over exact visualization
- May not match specific needs
- Less predictable than specific modes

---

## Default Display Mode

### Description

Default display mode uses the system's default selection, typically based on the Block's default view configuration.

### Visual Characteristics

- Uses Block's default view
- May vary by Block type
- Standard system behavior

### When to Use

- **Standard display**: When default is acceptable
- **Quick setup**: When specific mode isn't needed
- **Block defaults**: When Block has preferred view
- **Initial setup**: Starting point for configuration

### Best For

- Initial Board setup
- When default is appropriate
- Standard use cases
- Quick prototyping

### Dimension Configuration

- **Block-dependent**: Uses Block's default configuration
- **Standard**: Typical default settings

---

## Display Mode Selection Guide

### Choose Grid When:

- Detailed data analysis needed
- Data entry required
- Multiple metrics to compare
- Exact values important
- Export needed

### Choose Bar When:

- Comparing categories
- Ranking items
- Single dimension breakdown
- Clear visual comparisons
- Non-time comparisons

### Choose Stacked Bar When:

- Showing composition
- Multiple categories per bar
- Parts of a whole
- Hierarchical breakdowns
- Proportion comparisons

### Choose Line When:

- Showing trends over time
- Time series data
- Pattern identification
- Forecast comparisons
- Multiple series over time

### Choose Pie When:

- Showing proportions
- Parts of a whole
- Single dimension (3-7 categories)
- Percentage focus
- Simple composition

### Choose Waterfall Contribution When:

- Showing contributions to total
- Additive breakdowns
- Explaining totals
- Variance components
- Cumulative effects

### Choose Waterfall Variation When:

- Comparing two periods/scenarios
- Showing changes
- Year-over-year analysis
- Scenario comparisons
- Variance explanations

### Choose KPI When:

- Single key metric
- Executive summary
- High-level monitoring
- Focused display
- Summary views

### Choose Chart When:

- Flexible visualization needed
- Auto-selection acceptable
- General-purpose view
- Adaptive display

### Choose Default When:

- Standard display acceptable
- Quick setup needed
- Block default appropriate
- Initial configuration

---

## Display Mode Compatibility

### By Block Type

| Display Mode           | Metric | List | Table |
| ---------------------- | ------ | ---- | ----- |
| Grid                   | ✅     | ✅   | ✅    |
| Bar                    | ✅     | ⚠️   | ✅    |
| Stacked                | ✅     | ⚠️   | ✅    |
| Line                   | ✅     | ❌   | ✅    |
| Pie                    | ✅     | ⚠️   | ✅    |
| Waterfall Contribution | ✅     | ❌   | ✅    |
| Waterfall Variation    | ✅     | ❌   | ✅    |
| KPI                    | ✅     | ⚠️   | ✅    |
| Chart                  | ✅     | ⚠️   | ✅    |
| Default                | ✅     | ✅   | ✅    |

✅ = Fully supported  
⚠️ = Limited support  
❌ = Not supported

### By Data Type

- **Numeric data**: All display modes supported
- **Time dimensions**: Line charts ideal
- **Categorical data**: Bar, Pie, Stacked ideal
- **Multiple metrics**: Grid, Charts ideal

---

## Display Mode Best Practices

1. **Match mode to purpose**: Choose mode that best serves the analysis goal
2. **Consider audience**: Executive vs. operational needs
3. **Use appropriate dimensions**: Match dimensions to display mode
4. **Limit categories**: Avoid overcrowding (especially Pie charts)
5. **Use time for trends**: Line charts for time series
6. **Stack for composition**: Stacked bars for breakdowns
7. **Grid for detail**: Grids for detailed analysis
8. **KPI for focus**: KPIs for key metrics

---

## See Also

- [Views Overview](./views_overview.md) - Understanding views
- [Views Configuration](./views_configuration.md) - Configuring views
- [Views Best Practices](./views_best_practices.md) - Design guidelines
