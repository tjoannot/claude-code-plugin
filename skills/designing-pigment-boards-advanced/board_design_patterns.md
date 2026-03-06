# Board Design Patterns

This document provides comprehensive Board design patterns for common business use cases. These patterns are **references to adapt**, not templates to copy blindly. Each pattern includes purpose, audience, structure, widget layout, and view specifications.

---

## Pattern 1: P&L Overview Board

### Purpose

Provide a high-level view of company performance and help finance teams analyze revenue, cost, and margin trends.

### Audience

- Finance executives
- CFO and finance leadership
- Financial analysts
- Business unit leaders

### Structure

**Board Title:**

- Text widget: "P&L Overview"
- Description: "Provide a high-level view of company performance and help finance teams analyze revenue, cost, and margin trends."
- Size: `width=12`, `height=3`

**Section 1: Topline Summary**

- Section title: "**Topline Summary**"
- Subtitle: "Quickly assess overall performance at a glance"
- Widgets:
  - KPI: Revenue metric per Region and Business Unit (`width=3`, `height=8`)
  - KPI: Gross Margin % metric per Region and Business Unit (`width=3`, `height=8`)
  - KPI: EBITDA metric per Region and Business Unit (`width=3`, `height=8`)
  - KPI: Net Income metric per Region and Business Unit (`width=3`, `height=8`)
- Divider

**Section 2: Revenue Breakdown**

- Section title: "**Revenue Breakdown**"
- Subtitle: "Identify high- and low-performing segments"
- Widgets:
  - Bar Chart: Revenue by Product Line or Region (`width=12`, `height=10`)
- Divider

**Section 3: Cost Structure**

- Section title: "**Cost Structure**"
- Subtitle: "Compare expense composition and trends"
- Widgets:
  - Stacked Bar Chart: OpEx metric per categories (R&D, Marketing, G&A) (`width=12`, `height=10`)
- Divider

**Section 4: Variance Analysis**

- Section title: "**Variance Analysis**"
- Subtitle: "Highlight deviations and detect drivers of variance"
- Widgets:
  - Grid: Revenue and Cost with Actuals vs. Forecast vs. Budget (`width=12`, `height=12`)
- Divider

**Section 5: Financial Trends**

- Section title: "**Financial Trends**"
- Subtitle: "Visualize seasonality or growth momentum"
- Widgets:
  - Line Chart: Revenue and Expenses by Month (`width=12`, `height=10`)
- Divider

**Section 6: Commentary & Insights**

- Section title: "**Commentary & Insights**"
- Subtitle: "Add finance commentary and explain anomalies"
- Widgets:
  - Text widget for commentary (`width=12`, `height=6`)

### View Specifications

**Topline KPIs:**

- Display Mode: KPI
- Filters: Current period, Baseline scenario
- Breakdowns: Region, Business Unit (optional)

**Revenue Breakdown:**

- Display Mode: Bar Chart
- Breakdowns: Product Line or Region (rows)
- Filters: Current period, Baseline scenario
- Sorting: By Revenue (descending)

**Cost Structure:**

- Display Mode: Stacked Bar Chart
- Breakdowns: Department (bars), Expense Category (stack)
- Filters: Current period, Baseline scenario

**Variance Analysis:**

- Display Mode: Grid
- Breakdowns: Account (rows), Scenario (columns)
- Filters: Current period
- Calculations: Variance (Actual - Budget)

**Financial Trends:**

- Display Mode: Line Chart
- Breakdowns: Month (columns), Metric (lines)
- Filters: Baseline scenario
- Sorting: By Month (ascending)

### Variations

- Add regional breakdowns
- Include forecast scenarios
- Add year-over-year comparisons
- Include margin analysis

---

## Pattern 2: Headcount Planning Board

### Purpose

Provide a high-level view of workforce evolution, hiring progress, and people-related costs to support HR and Finance planning.

### Audience

- HR leadership
- Finance planning teams
- Department managers
- HR business partners

### Structure

**Board Title:**

- Text widget: "Workforce Overview"
- Description: "Provide a high-level view of workforce evolution, hiring progress, and people-related costs to support HR and Finance planning."
- Size: `width=12`, `height=3`

**Section 1: Topline Summary**

- Section title: "Topline Summary"
- Subtitle: "Goal: Quickly assess overall workforce status at a glance"
- Widgets:
  - KPI: Total Headcount per Department and Location (`width=3`, `height=8`)
  - KPI: Planned Hires per Department and Location (`width=3`, `height=8`)
  - KPI: Attrition Rate % per Department and Location (`width=3`, `height=8`)
  - KPI: Average Cost per FTE per Department and Location (`width=3`, `height=8`)
- Divider

**Section 2: Hiring Pipeline**

- Section title: "Hiring Pipeline"
- Subtitle: "Monitor recruitment progress and bottlenecks"
- Widgets:
  - Grid: Hiring Stages (Open → Interviewing → Hired) by Department (`width=12`, `height=10`)
- Divider

**Section 3: Current vs Planned Headcount**

- Section title: "Current vs Planned Headcount"
- Subtitle: "Identify staffing gaps or surpluses"
- Widgets:
  - Bar Chart: Actual vs Target Headcount per Department (`width=12`, `height=10`)
- Divider

**Section 4: Cost Projection**

- Section title: "Cost Projection"
- Subtitle: "Understand the financial impact of workforce growth"
- Widgets:
  - Line Chart: Total Salary Expense by month by Scenario (`width=12`, `height=10`)
- Divider

**Section 5: Department Details**

- Section title: "Department Details"
- Subtitle: "Provide granular insights for HRBPs and Finance"
- Widgets:
  - Grid: FTE Count and Total Cost by Department or Function (`width=12`, `height=12`)
- Divider

**Section 6: Commentary & Insights**

- Section title: "Commentary & Insights"
- Subtitle: "Explain hiring delays, cost variances, and workforce risks"
- Widgets:
  - Text widget for commentary (`width=12`, `height=6`)

### View Specifications

**Topline KPIs:**

- Display Mode: KPI
- Filters: Current period, All departments/locations
- Aggregation: Sum across dimensions

**Hiring Pipeline:**

- Display Mode: Grid
- Breakdowns: Department (rows), Hiring Stage (columns)
- Filters: Current period
- Sorting: By Department (alphabetical)

**Current vs Planned:**

- Display Mode: Bar Chart
- Breakdowns: Department (rows), Type (Actual/Target) (columns)
- Filters: Current period
- Sorting: By Department (alphabetical)

**Cost Projection:**

- Display Mode: Line Chart
- Breakdowns: Month (columns), Scenario (lines)
- Filters: All departments
- Sorting: By Month (ascending)

**Department Details:**

- Display Mode: Grid
- Breakdowns: Department (rows), Metric (columns)
- Filters: Current period
- Sorting: By Department (alphabetical)

### Variations

- Add location breakdowns
- Include role-level details
- Add hiring velocity metrics
- Include cost per hire analysis

---

## Pattern 3: Sales Forecast Board

### Purpose

Provide visibility into pipeline health, forecast accuracy, and quota attainment to support Sales Ops and leadership decision-making.

### Audience

- Sales leadership
- Sales operations
- Sales managers
- Executive leadership

### Structure

**Board Title:**

- Text widget: "Sales Performance & Pipeline Overview"
- Description: "Provide visibility into pipeline health, forecast accuracy, and quota attainment to support Sales Ops and leadership decision-making."
- Size: `width=12`, `height=3`

**Section 1: Topline Summary**

- Section title: "Topline Summary"
- Subtitle: "Goal: Quickly assess sales performance against targets"
- Widgets:
  - KPI: Booked Revenue per Segment and Region (`width=3`, `height=8`)
  - KPI: Quota Attainment % per Segment and Region (`width=3`, `height=8`)
  - KPI: Pipeline Coverage Ratio per Segment and Region (`width=3`, `height=8`)
  - KPI: Average Deal Size per Segment and Region (`width=3`, `height=8`)
- Divider

**Section 2: Forecast by Segment**

- Section title: "Forecast by Segment"
- Subtitle: "Identify over- and under-performing territories"
- Widgets:
  - Grid: Targets vs Forecast vs Actuals by Territory and Sales Rep (`width=12`, `height=12`)
- Divider

**Section 3: Pipeline Funnel**

- Section title: "Pipeline Funnel"
- Subtitle: "Analyze conversion rates and identify bottlenecks"
- Widgets:
  - Bar Chart: Pipeline Stages (Prospect → Qualified → Proposal → Closed Won) (`width=12`, `height=10`)
- Divider

**Section 4: Revenue Trends**

- Section title: "Revenue Trends"
- Subtitle: "Visualize growth momentum and seasonality"
- Widgets:
  - Line Chart: Booked Revenue and Pipeline Value by Month (`width=12`, `height=10`)
- Divider

**Section 5: Scenario Comparison**

- Section title: "Scenario Comparison"
- Subtitle: "Compare forecast confidence levels"
- Widgets:
  - Bar Chart: Commit vs Best Case vs Stretch by Timeframe or Segment (`width=12`, `height=10`)
- Divider

**Section 6: Top Opportunities**

- Section title: "Top Opportunities"
- Subtitle: "Focus on strategic and high-impact deals"
- Widgets:
  - Grid: Top 20 Opportunities with Deal Name, Owner, Stage, Amount, Expected Close Date (`width=12`, `height=12`)
- Divider

**Section 7: Commentary & Insights**

- Section title: "Commentary & Insights"
- Subtitle: "Explain forecast changes, risks, and upside opportunities"
- Widgets:
  - Text widget for commentary (`width=12`, `height=6`)

### View Specifications

**Topline KPIs:**

- Display Mode: KPI
- Filters: Current period, All segments/regions
- Aggregation: Sum across dimensions

**Forecast by Segment:**

- Display Mode: Grid
- Breakdowns: Territory (rows), Sales Rep (rows), Scenario (columns)
- Filters: Current period
- Sorting: By Forecast (descending)

**Pipeline Funnel:**

- Display Mode: Bar Chart
- Breakdowns: Pipeline Stage (rows)
- Filters: Current period
- Sorting: By Stage order

**Revenue Trends:**

- Display Mode: Line Chart
- Breakdowns: Month (columns), Metric (lines)
- Filters: All segments
- Sorting: By Month (ascending)

**Scenario Comparison:**

- Display Mode: Bar Chart
- Breakdowns: Scenario (bars), Segment (optional grouping)
- Filters: Current period
- Sorting: By Scenario order

**Top Opportunities:**

- Display Mode: Grid
- Breakdowns: Opportunity (rows)
- Filters: Top 20 by Amount, Current period
- Sorting: By Amount (descending)

### Variations

- Add product-level breakdowns
- Include win/loss analysis
- Add sales rep performance
- Include customer segmentation

---

## Pattern 4: Cash Flow Management Board

### Purpose

Monitor cash position, cash flow trends, and liquidity to support treasury and finance decision-making.

### Audience

- CFO and finance leadership
- Treasury teams
- Finance controllers
- Executive leadership

### Structure

**Board Title:**

- Text widget: "Cash Flow Management"
- Description: "Monitor cash position, cash flow trends, and liquidity to support treasury and finance decision-making."
- Size: `width=12`, `height=3`

**Section 1: Cash Position Summary**

- Section title: "Cash Position Summary"
- Subtitle: "Current cash status and key liquidity metrics"
- Widgets:
  - KPI: Opening Cash Balance (`width=3`, `height=8`)
  - KPI: Closing Cash Balance (`width=3`, `height=8`)
  - KPI: Net Cash Flow (`width=3`, `height=8`)
  - KPI: Days Cash on Hand (`width=3`, `height=8`)
- Divider

**Section 2: Cash Flow Statement**

- Section title: "Cash Flow Statement"
- Subtitle: "Operating, investing, and financing activities"
- Widgets:
  - Waterfall Chart: Cash Flow Breakdown (Operating, Investing, Financing) (`width=12`, `height=10`)
- Divider

**Section 3: Cash Flow Trends**

- Section title: "Cash Flow Trends"
- Subtitle: "Historical trends and forecast projections"
- Widgets:
  - Line Chart: Cash Flow by Month (Actual vs Forecast) (`width=12`, `height=10`)
- Divider

**Section 4: Cash Flow by Source**

- Section title: "Cash Flow by Source"
- Subtitle: "Breakdown of cash inflows and outflows"
- Widgets:
  - Stacked Bar Chart: Cash Inflows and Outflows by Category (`width=12`, `height=10`)
- Divider

**Section 5: Detailed Cash Flow**

- Section title: "Detailed Cash Flow"
- Subtitle: "Granular view of cash movements"
- Widgets:
  - Grid: Cash Flow by Category and Month (`width=12`, `height=12`)
- Divider

**Section 6: Commentary & Insights**

- Section title: "Commentary & Insights"
- Subtitle: "Explain cash flow drivers and liquidity risks"
- Widgets:
  - Text widget for commentary (`width=12`, `height=6`)

### View Specifications

**Cash Position KPIs:**

- Display Mode: KPI
- Filters: Current period, Baseline scenario
- Aggregation: Latest period values

**Cash Flow Statement:**

- Display Mode: Waterfall Contribution
- Breakdowns: Cash Flow Category (bars)
- Filters: Current period, Baseline scenario
- Sorting: By Category order

**Cash Flow Trends:**

- Display Mode: Line Chart
- Breakdowns: Month (columns), Scenario (lines)
- Filters: Baseline scenario
- Sorting: By Month (ascending)

**Cash Flow by Source:**

- Display Mode: Stacked Bar Chart
- Breakdowns: Month (bars), Category (stack)
- Filters: Current period, Baseline scenario
- Sorting: By Month (ascending)

**Detailed Cash Flow:**

- Display Mode: Grid
- Breakdowns: Category (rows), Month (columns)
- Filters: Baseline scenario
- Sorting: By Category (alphabetical)

### Variations

- Add regional cash flow
- Include currency breakdowns
- Add working capital analysis
- Include debt service coverage

---

## Pattern 5: Budget vs Actual Analysis Board

### Purpose

Compare budgeted vs actual performance to identify variances and support budget management.

### Audience

- Finance controllers
- Budget managers
- Department heads
- Executive leadership

### Structure

**Board Title:**

- Text widget: "Budget vs Actual Analysis"
- Description: "Compare budgeted vs actual performance to identify variances and support budget management."
- Size: `width=12`, `height=3`

**Section 1: Budget Performance Summary**

- Section title: "Budget Performance Summary"
- Subtitle: "High-level budget vs actual comparison"
- Widgets:
  - KPI: Total Budget (`width=3`, `height=8`)
  - KPI: Total Actual (`width=3`, `height=8`)
  - KPI: Variance Amount (`width=3`, `height=8`)
  - KPI: Variance % (`width=3`, `height=8`)
- Divider

**Section 2: Variance by Category**

- Section title: "Variance by Category"
- Subtitle: "Identify categories with significant variances"
- Widgets:
  - Bar Chart: Budget vs Actual by Category (`width=12`, `height=10`)
- Divider

**Section 3: Variance Analysis**

- Section title: "Variance Analysis"
- Subtitle: "Detailed budget vs actual comparison"
- Widgets:
  - Grid: Budget, Actual, Variance by Category and Month (`width=12`, `height=12`)
- Divider

**Section 4: Variance Trends**

- Section title: "Variance Trends"
- Subtitle: "Track variance evolution over time"
- Widgets:
  - Line Chart: Variance by Month (`width=12`, `height=10`)
- Divider

**Section 5: Top Variances**

- Section title: "Top Variances"
- Subtitle: "Largest budget variances requiring attention"
- Widgets:
  - Grid: Top 10 Variances by Category (`width=12`, `height=10`)
- Divider

**Section 6: Commentary & Insights**

- Section title: "Commentary & Insights"
- Subtitle: "Explain variances and budget performance"
- Widgets:
  - Text widget for commentary (`width=12`, `height=6`)

### View Specifications

**Budget Performance KPIs:**

- Display Mode: KPI
- Filters: Current period, Budget scenario, Actual scenario
- Calculations: Variance (Actual - Budget), Variance % ((Actual - Budget) / Budget \* 100)

**Variance by Category:**

- Display Mode: Bar Chart
- Breakdowns: Category (rows), Type (Budget/Actual) (columns)
- Filters: Current period
- Sorting: By Category (alphabetical)

**Variance Analysis:**

- Display Mode: Grid
- Breakdowns: Category (rows), Month (columns)
- Filters: Budget scenario, Actual scenario
- Calculations: Variance (Actual - Budget)
- Sorting: By Category (alphabetical)

**Variance Trends:**

- Display Mode: Line Chart
- Breakdowns: Month (columns), Category (lines)
- Filters: Budget scenario, Actual scenario
- Calculations: Variance (Actual - Budget)
- Sorting: By Month (ascending)

**Top Variances:**

- Display Mode: Grid
- Breakdowns: Category (rows)
- Filters: Top 10 by Variance Amount
- Sorting: By Variance (descending)

### Variations

- Add department-level breakdowns
- Include forecast vs budget
- Add year-to-date analysis
- Include percentage of budget analysis

---

## Pattern 6: Scenario Planning Board

### Purpose

Compare multiple scenarios to support strategic planning and decision-making.

### Audience

- Strategic planning teams
- Executive leadership
- Finance planning teams
- Business unit leaders

### Structure

**Board Title:**

- Text widget: "Scenario Planning"
- Description: "Compare multiple scenarios to support strategic planning and decision-making."
- Size: `width=12`, `height=3`

**Section 1: Scenario Comparison Summary**

- Section title: "Scenario Comparison Summary"
- Subtitle: "Key metrics across scenarios"
- Widgets:
  - KPI: Baseline Revenue (`width=3`, `height=8`)
  - KPI: Upside Revenue (`width=3`, `height=8`)
  - KPI: Downside Revenue (`width=3`, `height=8`)
  - KPI: Scenario Range (`width=3`, `height=8`)
- Divider

**Section 2: Scenario Comparison**

- Section title: "Scenario Comparison"
- Subtitle: "Compare scenarios side-by-side"
- Widgets:
  - Bar Chart: Key Metrics by Scenario (`width=12`, `height=10`)
- Divider

**Section 3: Scenario Trends**

- Section title: "Scenario Trends"
- Subtitle: "Projected trends across scenarios"
- Widgets:
  - Line Chart: Revenue by Month by Scenario (`width=12`, `height=10`)
- Divider

**Section 4: Scenario Variance**

- Section title: "Scenario Variance"
- Subtitle: "Differences between scenarios"
- Widgets:
  - Waterfall Variation: Baseline vs Upside vs Downside (`width=12`, `height=10`)
- Divider

**Section 5: Detailed Scenario Analysis**

- Section title: "Detailed Scenario Analysis"
- Subtitle: "Granular scenario comparison"
- Widgets:
  - Grid: Metrics by Scenario and Category (`width=12`, `height=12`)
- Divider

**Section 6: Commentary & Insights**

- Section title: "Commentary & Insights"
- Subtitle: "Explain scenario assumptions and implications"
- Widgets:
  - Text widget for commentary (`width=12`, `height=6`)

### View Specifications

**Scenario Comparison KPIs:**

- Display Mode: KPI
- Filters: Current period, Specific scenarios
- Aggregation: Sum across dimensions

**Scenario Comparison:**

- Display Mode: Bar Chart
- Breakdowns: Scenario (bars), Metric (grouping)
- Filters: Current period
- Sorting: By Scenario order

**Scenario Trends:**

- Display Mode: Line Chart
- Breakdowns: Month (columns), Scenario (lines)
- Filters: All categories
- Sorting: By Month (ascending)

**Scenario Variance:**

- Display Mode: Waterfall Variation
- Breakdowns: Scenario comparison
- Filters: Current period
- Calculations: Variance between scenarios

**Detailed Scenario Analysis:**

- Display Mode: Grid
- Breakdowns: Category (rows), Scenario (columns)
- Filters: Current period
- Sorting: By Category (alphabetical)

### Variations

- Add sensitivity analysis
- Include probability-weighted scenarios
- Add what-if analysis
- Include scenario impact on KPIs

---

## Pattern 7: Executive Summary Board

### Purpose

Provide executives with a high-level overview of key business metrics and performance indicators.

### Audience

- C-level executives
- Board of directors
- Executive leadership team
- Senior management

### Structure

**Board Title:**

- Text widget: "Executive Summary"
- Description: "High-level overview of key business metrics and performance indicators."
- Size: `width=12`, `height=3`

**Section 1: Key Performance Indicators**

- Section title: "Key Performance Indicators"
- Subtitle: "Critical business metrics at a glance"
- Widgets:
  - KPI: Total Revenue (`width=3`, `height=8`)
  - KPI: EBITDA (`width=3`, `height=8`)
  - KPI: Net Income (`width=3`, `height=8`)
  - KPI: Headcount (`width=3`, `height=8`)
- Divider

**Section 2: Performance Trends**

- Section title: "Performance Trends"
- Subtitle: "Key metrics over time"
- Widgets:
  - Line Chart: Revenue, EBITDA, Net Income by Month (`width=12`, `height=10`)
- Divider

**Section 3: Performance by Segment**

- Section title: "Performance by Segment"
- Subtitle: "Revenue and profitability by business segment"
- Widgets:
  - Bar Chart: Revenue by Segment (`width=6`, `height=10`)
  - Bar Chart: EBITDA Margin % by Segment (`width=6`, `height=10`)
- Divider

**Section 4: Key Highlights**

- Section title: "Key Highlights"
- Subtitle: "Important updates and insights"
- Widgets:
  - Text widget for highlights (`width=12`, `height=6`)

### View Specifications

**Key Performance KPIs:**

- Display Mode: KPI
- Filters: Current period, Baseline scenario
- Aggregation: Sum across all dimensions

**Performance Trends:**

- Display Mode: Line Chart
- Breakdowns: Month (columns), Metric (lines)
- Filters: Baseline scenario, Last 12 months
- Sorting: By Month (ascending)

**Performance by Segment:**

- Display Mode: Bar Chart
- Breakdowns: Segment (rows)
- Filters: Current period, Baseline scenario
- Sorting: By Revenue (descending)

### Variations

- Add regional breakdowns
- Include forecast vs actual
- Add year-over-year comparisons
- Include strategic initiatives status

---

## Pattern 8: Operational Dashboard Board

### Purpose

Provide operational teams with detailed metrics and data needed for day-to-day decision-making.

### Audience

- Operations managers
- Department heads
- Operational staff
- Team leads

### Structure

**Board Title:**

- Text widget: "Operational Dashboard"
- Description: "Detailed operational metrics and data for day-to-day decision-making."
- Size: `width=12`, `height=3`

**Section 1: Operational KPIs**

- Section title: "Operational KPIs"
- Subtitle: "Key operational metrics"
- Widgets:
  - KPI: Daily Sales (`width=3`, `height=8`)
  - KPI: Order Volume (`width=3`, `height=8`)
  - KPI: Inventory Level (`width=3`, `height=8`)
  - KPI: On-Time Delivery % (`width=3`, `height=8`)
- Divider

**Section 2: Daily Performance**

- Section title: "Daily Performance"
- Subtitle: "Today's performance vs targets"
- Widgets:
  - Grid: Daily Metrics by Category (`width=12`, `height=10`)
- Divider

**Section 3: Performance Trends**

- Section title: "Performance Trends"
- Subtitle: "Operational trends over time"
- Widgets:
  - Line Chart: Key Metrics by Day (`width=12`, `height=10`)
- Divider

**Section 4: Detailed Operations Data**

- Section title: "Detailed Operations Data"
- Subtitle: "Granular operational information"
- Widgets:
  - Grid: Detailed Operations Data by Category and Day (`width=12`, `height=12`)
- Divider

**Section 5: Alerts and Issues**

- Section title: "Alerts and Issues"
- Subtitle: "Items requiring attention"
- Widgets:
  - Grid: Alerts and Issues (`width=12`, `height=10`)
- Divider

**Section 6: Commentary & Notes**

- Section title: "Commentary & Notes"
- Subtitle: "Operational notes and updates"
- Widgets:
  - Text widget for notes (`width=12`, `height=6`)

### View Specifications

**Operational KPIs:**

- Display Mode: KPI
- Filters: Current day/period
- Aggregation: Latest values or sums

**Daily Performance:**

- Display Mode: Grid
- Breakdowns: Category (rows), Metric (columns)
- Filters: Current day
- Sorting: By Category (alphabetical)

**Performance Trends:**

- Display Mode: Line Chart
- Breakdowns: Day (columns), Metric (lines)
- Filters: Last 30 days
- Sorting: By Day (ascending)

**Detailed Operations Data:**

- Display Mode: Grid
- Breakdowns: Category (rows), Day (columns)
- Filters: Last 7 days
- Sorting: By Category (alphabetical)

**Alerts and Issues:**

- Display Mode: Grid
- Breakdowns: Alert (rows)
- Filters: Active alerts only
- Sorting: By Priority (descending)

### Variations

- Add shift-level breakdowns
- Include quality metrics
- Add resource utilization
- Include capacity planning

---

## Pattern Selection Guide

### Choose P&L Overview When:

- Need financial performance overview
- Analyzing revenue, costs, margins
- Comparing actuals vs forecasts
- Executive financial reporting

### Choose Headcount Planning When:

- Managing workforce planning
- Tracking hiring and attrition
- Analyzing people costs
- HR and finance collaboration

### Choose Sales Forecast When:

- Managing sales pipeline
- Tracking quota attainment
- Analyzing forecast accuracy
- Sales operations management

### Choose Cash Flow Management When:

- Monitoring cash position
- Analyzing liquidity
- Treasury management
- Cash flow planning

### Choose Budget vs Actual When:

- Comparing budget to actuals
- Identifying variances
- Budget management
- Financial control

### Choose Scenario Planning When:

- Comparing multiple scenarios
- Strategic planning
- What-if analysis
- Decision support

### Choose Executive Summary When:

- Executive reporting
- High-level overview
- Board presentations
- Strategic metrics

### Choose Operational Dashboard When:

- Day-to-day operations
- Detailed operational metrics
- Operational decision-making
- Team performance tracking

---

## Pattern Customization

### Adapting Patterns

1. **Modify structure**: Adjust sections to match your needs
2. **Change widgets**: Replace widgets with relevant ones
3. **Adjust filters**: Set appropriate filters for your data
4. **Customize views**: Configure views for your metrics
5. **Add sections**: Include additional sections as needed
6. **Remove sections**: Remove irrelevant sections

### Common Customizations

- **Add regional breakdowns**: Include geography dimensions
- **Include scenarios**: Add scenario comparisons
- **Add time periods**: Include multiple time ranges
- **Include comparisons**: Add year-over-year or period comparisons
- **Add details**: Include detailed breakdown sections

---

## See Also

- [Board Structure and Layout](./boards_structure_and_layout.md) - Layout guidelines
- [Widget Types](./widgets_types.md) - Widget configuration
- [Views Display Modes](./views_display_modes.md) - Visualization types
- [Board Best Practices](./board_best_practices.md) - Design principles
