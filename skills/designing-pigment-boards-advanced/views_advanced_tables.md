# Advanced Views for Tables

## Overview

Tables in Pigment enable sophisticated view configurations that go beyond basic metric views. This guide covers advanced view patterns specifically for Tables, including pivot configurations, calculations across metrics, Sheet View, and best practices for table-specific views.

**Note:** This guide focuses on views for Tables. For basic view concepts, see [views_overview.md](./views_overview.md). For general view configuration, see [views_configuration.md](./views_configuration.md).

## Tables and Views

### Tables Enable Multiple Metrics

Unlike views on individual Metrics, views on Tables can display multiple metrics simultaneously:

- **Multiple Metrics:** Up to 500 metrics per table
- **Metric Organization:** Metrics can be placed in Rows, Columns, or Pages
- **Cross-Metric Calculations:** Calculations across metrics (ratios, differences, growth)
- **Complex Pivots:** Sophisticated pivot configurations with metrics and dimensions

### View Configuration for Tables

Tables support all standard view configurations plus table-specific features:

- **Pivot Configuration:** Organize metrics and dimensions across Rows, Columns, Pages
- **Show Values As:** Calculations across metrics and dimensions
- **Sheet View:** Spreadsheet-style view with cell-level formatting
- **Filters and Sorting:** Standard filtering and sorting capabilities

## Pivot Configuration for Tables

### Overview

Pivot configuration for Tables allows you to organize both **Metrics** and **Dimensions** across Rows, Columns, and Pages. This enables sophisticated analytical views.

### Pivot Structure for Tables

Tables have a special "Metrics" section in the Configure Data panel:

**Rows:**

- Dimensions displayed as rows
- Metrics can also be placed in rows
- Primary organization axis

**Columns:**

- Dimensions displayed as columns
- Metrics can also be placed in columns
- Secondary organization axis (often time)

**Pages:**

- Dimensions used as page selectors
- Metrics can also be placed in pages
- Filtering mechanism

**Metrics Section:**

- Controls where metrics appear (Rows, Columns, or Pages)
- Allows reordering metrics via drag & drop
- Enables metric organization independent of dimensions

### Pivot Patterns for Tables

#### Pattern 1: Metrics in Columns, Dimensions in Rows

**Structure:**

- Rows: Product, Region (dimensions)
- Columns: Revenue, COGS, Gross Profit (metrics), Month (dimension)

**Use Case:** Compare multiple metrics across products and regions over time.

**Example:**

```
                Revenue    COGS    Gross Profit
                Jan  Feb  Jan  Feb  Jan  Feb
Product A, North  100  110  60   65   40   45
Product A, South  120  130  70   75   50   55
Product B, North  80   90   50   55   30   35
```

#### Pattern 2: Metrics in Rows, Dimensions in Columns

**Structure:**

- Rows: Revenue, COGS, Gross Profit (metrics)
- Columns: Product, Month (dimensions)

**Use Case:** Compare products over time for each metric separately.

**Example:**

```
                Product A      Product B
                Jan  Feb      Jan  Feb
Revenue         100  110      80   90
COGS            60   65       50   55
Gross Profit    40   45       30   35
```

#### Pattern 3: Metrics in Pages

**Structure:**

- Rows: Product (dimension)
- Columns: Month (dimension)
- Pages: Revenue, COGS, Gross Profit (metrics)

**Use Case:** Focus on one metric at a time, switching between metrics via page selector.

**Best Practice:** Use Pages when you want to focus on one metric at a time or when you have many metrics.

### Dimension Limits

**Important Limits:**

- **Pages:** Up to 30 dimensions/metrics
- **Columns or Rows:** Up to 20 dimensions/metrics combined
- **Total Metrics:** Up to 500 metrics per table

**Best Practice:**

- Move less critical dimensions/metrics to Pages
- Limit Columns and Rows to essential dimensions/metrics
- Use Pages to manage complexity

### Pivot Best Practices for Tables

1. **Organize Metrics Logically:** Group related metrics together
2. **Use Pages for Many Metrics:** When you have 5+ metrics, consider Pages
3. **Time on Columns:** Place time dimensions on columns for trend analysis
4. **Limit Complexity:** Keep Rows and Columns focused (max 20 combined)
5. **Reorder Metrics:** Use drag & drop to organize metrics logically

## Show Values As Calculations

### Overview

"Show Values As" enables calculations across metrics and dimensions, displaying values in relation to others (percentages, differences, year-over-year comparisons).

### Calculation Types

#### % of Parent Totals

Calculates percentage of a parent total (by column, row, or specific dimension).

**Configuration:**

- Type: % of Parent Totals
- Direction: By Column, By Row, or By Dimension
- Dimension: Specific dimension for calculation (optional)

**Example:**

- Revenue % of Total: Each product's revenue as % of total revenue
- Revenue % of Parent: Each product's revenue as % of its category total

**Use Cases:**

- Contribution analysis
- Share of total
- Composition analysis

#### Difference

Calculates difference between values (period-over-period, item-to-item).

**Configuration:**

- Type: Difference
- Reference: Previous Item, Next Item, or Specific Item
- Dimension: Dimension for comparison

**Example:**

- Month-over-Month: Current month - Previous month
- Year-over-Year: Current year - Previous year
- Product Comparison: Product A - Product B

**Use Cases:**

- Period-over-period changes
- Variance analysis
- Comparative analysis

#### Growth

Calculates growth percentage between values.

**Configuration:**

- Type: Growth %
- Reference: Previous Item, Next Item, or Specific Item
- Dimension: Dimension for comparison

**Example:**

- MoM Growth: ((Current Month - Previous Month) / Previous Month) \* 100
- YoY Growth: ((Current Year - Previous Year) / Previous Year) \* 100

**Use Cases:**

- Growth analysis
- Trend identification
- Performance tracking

### Show Values As for Tables

**Cross-Metric Calculations:**

- Calculate ratios between metrics (e.g., Gross Profit / Revenue)
- Calculate differences between metrics (e.g., Actual - Budget)
- Calculate growth across metrics

**Example:**

- Margin %: Gross Profit / Revenue (as %)
- Variance: Actual - Budget
- Variance %: (Actual - Budget) / Budget

**Best Practice:** Use Show Values As to create derived metrics without creating new metric blocks.

### Combining Calculations

You can combine multiple "Show Values As" calculations:

**Example:**

- Revenue with Growth % (MoM)
- Revenue with % of Total
- Revenue with Difference (vs. Budget)

**Configuration:**

- Add multiple calculations in the Calculations tab
- Reorder calculations as needed
- Combine with Calculated Items if needed

## Sheet View

### Overview

Sheet View is a spreadsheet-style mode for Tables (and Metrics) that combines Pivot, Filters, Sorts, and adds cell-level formatting and formulas.

### Sheet View Features

**Spreadsheet-Style Interface:**

- Cell-level editing
- Formula support
- Formatting options
- Freeze panes
- Gridline toggles

**Combined Functionality:**

- Pivot configuration
- Filters and sorting
- Calculations
- Cell-level formulas

**Context Areas:**

- Add context or side calculations outside the pivot area
- Preserved for Members with permission
- Useful for annotations and side calculations

### Sheet View Menu

**Toolbar:**

- Formatting options
- Formula bar
- Cell editing

**Formula:**

- Cell-level formulas
- Reference other cells
- Calculations

**Data:**

- Import/export
- Refresh
- Data management

**View:**

- Display options
- Freeze panes
- Gridlines
- Zoom

### Sheet View Use Cases

**Advanced Analysis:**

- Complex calculations across metrics
- Cell-level formulas
- Side calculations and annotations

**Data Entry:**

- Direct cell editing
- Bulk data entry
- Formula-based inputs

**Reporting:**

- Formatted reports
- Custom layouts
- Professional presentation

### Sheet View Best Practices

1. **Use for Advanced Analysis:** When you need cell-level control
2. **Preserve Context:** Use context areas for annotations
3. **Freeze Panes:** Freeze headers for easier navigation
4. **Format Consistently:** Use consistent formatting across sheets
5. **Document Formulas:** Document complex formulas for team members

## Table-Specific View Patterns

### Pattern 1: Financial Statement View

**Table:** P&L Metrics
**Structure:**

- Rows: Revenue, COGS, Gross Profit, Operating Expenses, Operating Income, Net Income (metrics)
- Columns: Month (dimension)
- Pages: Scenario, Product (dimensions)

**Show Values As:**

- Margin %: Gross Profit / Revenue
- Operating Margin %: Operating Income / Revenue
- Net Margin %: Net Income / Revenue

**Use Case:** Financial statement presentation with margin calculations.

### Pattern 2: KPI Dashboard View

**Table:** Sales KPIs
**Structure:**

- Rows: Product (dimension)
- Columns: Revenue, Units Sold, Average Price, Growth Rate (metrics), Month (dimension)
- Pages: Region (dimension)

**Show Values As:**

- Growth Rate: YoY growth calculation
- Average Price: Revenue / Units Sold

**Use Case:** KPI dashboard with multiple metrics and growth analysis.

### Pattern 3: Budget vs Actual View

**Table:** Budget vs Actual
**Structure:**

- Rows: Product (dimension)
- Columns: Budget, Actual, Variance, Variance % (metrics), Month (dimension)
- Pages: Scenario (dimension)

**Show Values As:**

- Variance: Actual - Budget
- Variance %: (Actual - Budget) / Budget

**Use Case:** Budget variance analysis with multiple comparison metrics.

### Pattern 4: Comparative Analysis View

**Table:** Scenario Comparison
**Structure:**

- Rows: Product (dimension)
- Columns: Base Case, Upside, Downside (metrics), Quarter (dimension)
- Pages: Region (dimension)

**Show Values As:**

- Difference: Upside - Base Case
- Difference: Downside - Base Case

**Use Case:** Scenario comparison with variance calculations.

## Dimension Limits and Performance

### Dimension Limits

**Hard Limits:**

- **Pages:** Up to 30 dimensions/metrics
- **Columns or Rows:** Up to 20 dimensions/metrics combined
- **Total Metrics:** Up to 500 metrics per table

**Best Practice:**

- Stay well below limits for better performance
- Use Pages to manage complexity
- Limit Rows and Columns to essential items

### Performance Optimization

**For Large Tables:**

1. **Use Filters:** Filter to relevant data subsets
2. **Limit Dimensions:** Reduce dimensions in Rows/Columns
3. **Use Pages:** Move dimensions to Pages
4. **Consider Consolidation:** Use consolidation for very large tables
5. **Optimize Metrics:** Ensure metrics are optimized (sparsity, formulas)

**Performance Tips:**

- Filter early (use Pages for filtering)
- Limit visible data (use filters)
- Optimize metric formulas
- Consider view complexity vs. performance

## Best Practices

### 1. Organize Metrics Logically

Group related metrics together:

- Financial metrics together
- KPI metrics together
- Comparative metrics together

### 2. Use Appropriate Pivot Structure

Choose pivot structure based on analysis needs:

- **Metrics in Columns:** Compare metrics across items
- **Metrics in Rows:** Compare items for each metric
- **Metrics in Pages:** Focus on one metric at a time

### 3. Leverage Show Values As

Use Show Values As for calculations:

- Avoid creating intermediate metrics
- Create derived metrics in views
- Enable flexible analysis

### 4. Consider Sheet View

Use Sheet View for advanced needs:

- Cell-level formulas
- Complex calculations
- Custom formatting
- Side calculations

### 5. Manage Complexity

Keep views focused:

- Limit dimensions in Rows/Columns
- Use Pages for filtering
- Filter to relevant data
- Optimize for performance

### 6. Document View Purpose

Document why views are configured this way:

- Explain business logic
- Describe analysis use cases
- Note calculation methods

## Common Patterns Summary

| Pattern             | Structure                         | Use Case             |
| ------------------- | --------------------------------- | -------------------- |
| Financial Statement | Metrics in Rows, Time in Columns  | P&L presentation     |
| KPI Dashboard       | Metrics in Columns, Items in Rows | KPI comparison       |
| Budget vs Actual    | Comparison metrics in Columns     | Variance analysis    |
| Scenario Comparison | Scenarios as metrics in Columns   | Scenario analysis    |
| Metric Focus        | Metrics in Pages                  | One metric at a time |

## Troubleshooting

### Metrics Not Appearing

- Check that metrics are added to the table
- Verify metric visibility settings
- Ensure metrics have compatible dimensions

### Pivot Not Working

- Check dimension limits (30 in Pages, 20 in Columns/Rows)
- Verify dimensions are available
- Ensure proper pivot configuration

### Calculations Not Showing

- Verify Show Values As is configured
- Check calculation settings
- Ensure proper dimension selection

### Performance Issues

- Reduce dimensions in Rows/Columns
- Use filters to limit data
- Move dimensions to Pages
- Optimize underlying metrics

## See Also

- [views_overview.md](./views_overview.md) - Basic view concepts
- [views_configuration.md](./views_configuration.md) - General view configuration
- [views_display_modes.md](./views_display_modes.md) - Display mode options
- [views_best_practices.md](./views_best_practices.md) - View best practices
- `modeling-pigment-applications/modeling_fundamentals.md` - Tables as a block type
