# Views Best Practices

This document provides best practices for configuring Views in Pigment. Follow these guidelines to create Views that are effective, performant, and user-friendly.

---

## Display Mode Selection

### Choose the Right Display Mode

**Match display mode to purpose:**

**Grid** - When you need:

- Detailed data analysis
- Data entry capabilities
- Multiple metrics comparison
- Exact values important

**Bar Chart** - When you need:

- Category comparisons
- Ranking visualizations
- Single dimension breakdown
- Clear visual comparisons

**Stacked Bar** - When you need:

- Composition analysis
- Parts of a whole
- Multiple categories per bar
- Proportion comparisons

**Line Chart** - When you need:

- Trend analysis over time
- Time series data
- Pattern identification
- Multiple series comparison

**Pie Chart** - When you need:

- Proportion visualization
- Parts of a whole
- Single dimension (3-7 categories)
- Percentage focus

**Waterfall Contribution** - When you need:

- Contribution breakdowns
- Additive analysis
- Explaining totals
- Variance components

**Waterfall Variation** - When you need:

- Period comparisons
- Scenario comparisons
- Change analysis
- Variance explanations

**KPI** - When you need:

- Single key metric
- Executive summary
- High-level monitoring
- Focused display

### Display Mode Selection Guidelines

1. **Consider the data**: What type of data are you displaying?
2. **Consider the purpose**: What analysis are you supporting?
3. **Consider the audience**: Who will use this view?
4. **Consider the dimensions**: How many dimensions do you have?
5. **Consider the time**: Is time a key dimension?

---

## Filter Design Best Practices

### Filter Strategy

**Use filters to focus:**

- Filter to relevant time periods
- Focus on important segments
- Reduce data volume
- Highlight key insights

**Don't over-filter:**

- Avoid hiding important insights
- Don't filter too aggressively
- Maintain useful data range
- Consider user needs

### Time Filtering

**Always filter to relevant periods:**

- Current period for operational views
- Fiscal year for annual views
- Rolling periods for trends
- Specific periods for analysis

**Time filter examples:**

- `Month.Year = FY 25`
- `Month >= Current Month - 3`
- `Quarter = Q4`
- `Year = Current Year`

### Value Filtering

**Use value filters strategically:**

- Top/bottom N for rankings
- Threshold filters for significance
- Range filters for analysis
- Comparison filters for variance

**Value filter examples:**

- `Revenue top 10`
- `Margin % > 0.15`
- `Headcount >= 50`
- `Cost < Budget`

### Filter Best Practices

1. **Filter early**: Apply filters in view configuration
2. **Filter appropriately**: Don't over or under-filter
3. **Use page selectors**: For optional filtering dimensions
4. **Document filters**: Make filters clear to users
5. **Test filters**: Ensure filters work as expected

---

## Sorting Strategies

### Sort by Importance

**Sort by metric value:**

- High to low for performance metrics
- Low to high for cost metrics
- Descending for rankings
- Ascending for chronological

**Sort by property:**

- Alphabetical for standard ordering
- Code-based for organizational order
- Custom properties for business logic

### Sorting Guidelines

1. **Sort by value**: For performance analysis
2. **Sort alphabetically**: For standard organization
3. **Use descending**: Typically for metrics
4. **Multiple sorts**: Use secondary sorts for ties
5. **Consider users**: Sort in a way that makes sense

### Common Sorting Patterns

**Performance analysis:**

- Sort by Revenue (descending)
- Sort by Margin % (descending)
- Sort by Growth % (descending)

**Organizational:**

- Sort by Department (alphabetical)
- Sort by Product (alphabetical)
- Sort by Region (alphabetical)

**Chronological:**

- Sort by Month (ascending)
- Sort by Quarter (ascending)
- Sort by Year (ascending)

---

## Calculation Best Practices

### When to Add Calculations

**Add calculations for:**

- Growth analysis (period-over-period)
- Comparisons (ratios, differences)
- Variance analysis (actual vs budget)
- Performance metrics (margins, rates)

**Don't add calculations for:**

- Redundant computations
- Overly complex calculations
- Calculations better in Metrics
- Unnecessary complexity

### Calculation Types

**Growth %:**

- Period-over-period growth
- Year-over-year growth
- Item-to-item comparisons
- Trend analysis

**Ratios:**

- Actual vs Budget ratios
- Item comparisons
- Performance ratios
- Efficiency metrics

**Differences:**

- Variance amounts
- Period changes
- Budget variances
- Target gaps

### Calculation Guidelines

1. **Use for insights**: Add calculations that provide value
2. **Keep simple**: Avoid overly complex calculations
3. **Label clearly**: Ensure calculations are clearly labeled
4. **Consider performance**: Complex calculations may slow views
5. **Pre-calculate when possible**: Use Metrics for complex calculations

---

## Breakdown (Pivot) Best Practices

### Dimension Selection

**Choose relevant dimensions:**

- Most important dimension on rows
- Time dimensions on columns
- Less critical dimensions on pages
- Limit total dimensions

**Dimension guidelines:**

- 1-2 dimensions on rows
- 1 dimension on columns (often time)
- 1-2 dimensions on pages
- Total: 3-5 dimensions maximum

### Row Configuration

**Rows for primary breakdown:**

- Most important dimension
- Categories to compare
- Items to analyze
- Primary organization axis

**Row best practices:**

- Limit to 1-2 dimensions
- Use for main breakdown
- Consider item count
- Sort appropriately

### Column Configuration

**Columns for secondary breakdown:**

- Time dimensions (Month, Quarter, Year)
- Comparison dimensions
- Secondary organization
- Horizontal axis

**Column best practices:**

- Use time for trends
- Limit to 1 dimension typically
- Consider column count
- Use for comparisons

### Page Configuration

**Pages for filtering:**

- Optional filtering dimensions
- Dimensions with many items
- Less critical dimensions
- User-selectable filters

**Page best practices:**

- Move less critical dimensions to pages
- Use for dimensions with many items
- Limit to 1-2 page dimensions
- Set sensible defaults

### Breakdown Guidelines

1. **Limit dimensions**: Don't overload with dimensions
2. **Logical organization**: Organize dimensions logically
3. **Use pages**: Move less critical dimensions to pages
4. **Consider performance**: More dimensions = more data
5. **Test breakdowns**: Ensure breakdowns work well together

---

## Performance Optimization

### Data Volume Management

**Reduce data volume:**

- Apply filters early
- Limit dimension breakdowns
- Use aggregations
- Filter to relevant periods

**Data volume tips:**

- Filter before breakdown
- Limit breakdown dimensions
- Use page selectors
- Consider data size

### Dimension Optimization

**Optimize dimensions:**

- Limit breakdown dimensions
- Use page selectors
- Avoid excessive dimensions
- Consider aggregation levels

**Dimension guidelines:**

- 3-5 dimensions maximum
- Use pages for optional dimensions
- Aggregate when possible
- Test dimension combinations

### Calculation Optimization

**Optimize calculations:**

- Use simple calculations
- Pre-calculate in Metrics when possible
- Limit calculation complexity
- Consider performance impact

**Calculation tips:**

- Keep calculations simple
- Use Metrics for complex calculations
- Limit calculation count
- Test calculation performance

### View Configuration Optimization

**Optimize view configuration:**

- Efficient filters
- Appropriate sorting
- Reasonable breakdowns
- Simple calculations

**Configuration tips:**

- Apply filters efficiently
- Use appropriate sorting
- Limit breakdown complexity
- Test view performance

---

## View Naming Best Practices

### Clear, Descriptive Names

**Use descriptive names:**

- Include key filters
- Indicate breakdowns
- Specify display mode
- Include purpose

**Naming examples:**

- "Revenue by Product - FY 25"
- "Headcount by Department - Current"
- "Budget vs Actual - Q4"
- "Top 10 Products by Revenue"

### Naming Guidelines

1. **Be specific**: Include key information
2. **Include filters**: Mention important filters
3. **Indicate breakdowns**: Note key dimensions
4. **Keep concise**: Don't make names too long
5. **Be consistent**: Use consistent naming patterns

---

## View Organization Best Practices

### Logical Grouping

**Group related views:**

- Similar breakdowns together
- Related metrics together
- Consistent filters
- Logical organization

### View Variations

**Create view variations:**

- Summary vs detail views
- Different time periods
- Different breakdowns
- Different scenarios

**Variation examples:**

- "Revenue Summary - FY 25"
- "Revenue Detail - FY 25"
- "Revenue by Product - FY 25"
- "Revenue by Region - FY 25"

---

## Common Mistakes to Avoid

### ❌ Wrong Display Mode

**Problem**: Using inappropriate display mode
**Solution**: Match display mode to purpose and data

### ❌ Over-filtering

**Problem**: Too many filters hide insights
**Solution**: Balance filtering, don't over-restrict

### ❌ Too Many Dimensions

**Problem**: Excessive dimensions clutter view
**Solution**: Limit dimensions, use page selectors

### ❌ Poor Sorting

**Problem**: Data not sorted meaningfully
**Solution**: Sort by importance or value

### ❌ Missing Filters

**Problem**: Showing irrelevant or excessive data
**Solution**: Apply appropriate filters

### ❌ Complex Calculations

**Problem**: Overly complex calculations slow views
**Solution**: Keep calculations simple, use Metrics when needed

### ❌ Inconsistent Naming

**Problem**: Confusing or inconsistent view names
**Solution**: Use clear, consistent naming

### ❌ Performance Issues

**Problem**: Slow loading, poor performance
**Solution**: Optimize data volume, limit dimensions, use filters

---

## View Configuration Checklist

Before finalizing a view, verify:

- [ ] Display mode matches purpose
- [ ] Filters are appropriate
- [ ] Sorting is meaningful
- [ ] Breakdowns are logical
- [ ] Dimensions are limited
- [ ] Calculations are useful
- [ ] View name is clear
- [ ] Performance is acceptable
- [ ] View serves its purpose
- [ ] Configuration is optimized

---

## See Also

- [Views Overview](./views_overview.md) - Understanding views
- [Views Display Modes](./views_display_modes.md) - Display mode guide
- [Views Configuration](./views_configuration.md) - Configuration details
- [Board Best Practices](./board_best_practices.md) - Board design guidelines
