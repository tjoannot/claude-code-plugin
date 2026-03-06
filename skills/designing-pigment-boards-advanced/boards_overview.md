# Boards Overview

## What Are Boards?

Boards in Pigment are customizable dashboards that visualize and share data from your application. They serve as the primary interface for users to interact with Metrics, Lists, and Tables through various visualizations including grids, charts, KPIs, and text widgets.

A Board is a canvas where you arrange widgets to tell a data-driven story. Each Board can contain multiple widgets that display different views of your data, organized into logical sections that guide users through insights and analysis.

---

## Purpose of Boards

Boards serve several key purposes in Pigment:

### 1. **Data Visualization**

Boards transform raw data into visual insights. They display Metrics, Lists, and Tables through various visualization types (grids, charts, KPIs) that make patterns, trends, and anomalies immediately apparent.

### 2. **Decision Support**

Well-designed Boards provide executives and operational teams with the information they need to make informed decisions quickly. They highlight key performance indicators, variances, and trends.

### 3. **Collaboration and Sharing**

Boards are shareable dashboards that enable teams to collaborate around data. Multiple users can view the same Board, ensuring everyone works with consistent information.

### 4. **Reporting and Presentation**

Boards serve as presentation-ready reports. They can be used in meetings, shared with stakeholders, or embedded in presentations without requiring additional formatting.

### 5. **Workflow Guidance**

Boards can guide users through planning workflows by organizing data entry, review, and approval processes in a logical sequence.

---

## When to Use Boards

Use Boards when you need to:

- **Display data visually** from Metrics, Lists, or Tables
- **Create executive dashboards** for high-level performance monitoring
- **Build operational dashboards** for day-to-day decision making
- **Present planning workflows** that guide users through multi-step processes
- **Share insights** with stakeholders who need consistent views of data
- **Compare scenarios** or versions side-by-side
- **Analyze trends** over time or across dimensions
- **Monitor KPIs** and key business metrics

---

## Board Components

A Board consists of several key components:

### 1. **Board Metadata**

- **Name**: Descriptive title that clearly identifies the Board's purpose
- **Description**: Optional subtitle or description providing context
- **Icon**: Visual identifier for quick recognition
- **Icon Color**: Color scheme for visual organization
- **Folder**: Organizational location within the application

### 2. **Widgets**

Widgets are the building blocks of Boards. Each widget displays a specific type of content:

- **View Widgets**: Display data from Metrics, Lists, or Tables (Grid, Chart, KPI, List views)
- **Text Widgets**: Provide titles, descriptions, instructions, or context
- **Spacer Widgets**: Create visual separation (spacers or dividers)
- **ActionButton Widgets**: Enable navigation or trigger actions
- **Image Widgets**: Display logos, diagrams, or other images

### 3. **Views**

Views define how data is displayed within View widgets. A view specifies:

- Which Metric, List, or Table to display
- Display mode (Grid, Bar Chart, Line Chart, KPI, etc.)
- Dimensions for breakdown (rows and columns)
- Filters to apply
- Sorting configuration
- Calculations (growth, ratios, differences)

### 4. **Layout Structure**

Boards use a 12-column grid system for organizing widgets:

- Widgets are positioned using X (column) and Y (row) coordinates
- Each row can contain up to 12 columns of widgets
- Widgets can span multiple columns
- Sections organize related widgets together

---

## Board Types

While Boards are flexible, common patterns emerge:

### **Executive Dashboards**

High-level overviews designed for C-level executives. Focus on KPIs, trends, and key metrics. Minimal detail, maximum clarity.

### **Operational Dashboards**

Day-to-day tools for operational teams. Include detailed grids, charts, and actionable data. Support daily decision-making.

### **Planning Boards**

Guide users through planning workflows. Organize data entry, review, and approval processes. Often include instructions and context.

### **Analysis Boards**

Deep-dive analysis tools. Multiple views of the same data, various breakdowns, and detailed comparisons. Support investigation and root cause analysis.

### **Reporting Boards**

Presentation-ready reports. Clean layouts, clear sections, and narrative flow. Designed for sharing with stakeholders.

---

## Board Design Philosophy

Effective Board design follows these principles:

### **Storytelling**

Boards should tell a story, not just display data. Structure widgets in a logical flow that guides users from high-level insights to detailed analysis.

### **Hierarchy**

Use visual hierarchy to emphasize important information. Place critical KPIs at the top, supporting details below.

### **Consistency**

Maintain consistent layouts, sizing, and styling across Boards. This improves usability and builds user trust.

### **Simplicity**

Avoid clutter. Each widget should serve a purpose. Simpler Boards are more effective than complex ones.

### **Context**

Provide context through titles, descriptions, and text widgets. Help users understand what they're looking at and why it matters.

---

## Board Lifecycle

### 1. **Design Phase**

- Identify the Board's purpose and audience
- Determine which Blocks (Metrics, Lists, Tables) to display
- Plan the structure and widget layout
- Define view specifications

### 2. **Creation Phase**

- Create the Board with appropriate metadata
- Add widgets in the planned layout
- Configure views for each View widget
- Add text widgets for context and instructions

### 3. **Refinement Phase**

- Test the Board with end users
- Gather feedback on usability and clarity
- Adjust layout and content based on feedback
- Optimize for performance

### 4. **Maintenance Phase**

- Keep Boards updated as underlying data models evolve
- Refresh content and views as needed
- Monitor usage and effectiveness
- Archive or retire outdated Boards

---

## Relationship to Other Pigment Concepts

### **Boards vs. Blocks**

- **Blocks** (Metrics, Lists, Tables) contain and calculate data
- **Boards** display Blocks through Views
- Multiple Boards can display the same Block
- Boards describe _what_ to display, Blocks define _how_ data is calculated

### **Boards vs. Views**

- **Views** are configurations that specify how to display a Block
- **Boards** contain widgets that use Views
- A View can be reused across multiple Boards
- Views define display mode, filters, sorting, and breakdowns

### **Boards vs. Sequences**

- **Sequences** organize multiple Boards into a navigation flow
- **Boards** are individual dashboards
- Sequences provide guided workflows through related Boards

---

## Best Practices Summary

1. **Start with purpose**: Clearly define what the Board should accomplish
2. **Know your audience**: Design for the specific users who will use the Board
3. **Follow structure**: Use consistent Board structure (title, description, sections)
4. **Use the grid**: Leverage the 12-column grid system for clean layouts
5. **Tell a story**: Organize widgets to guide users through insights
6. **Provide context**: Use text widgets to explain what users are seeing
7. **Keep it simple**: Avoid unnecessary complexity
8. **Be consistent**: Follow established patterns across Boards
9. **Test and iterate**: Gather feedback and refine based on usage

---

## See Also

- [Board Structure and Layout](./boards_structure_and_layout.md) - Detailed layout rules and grid system
- [Widget Types](./widgets_types.md) - Comprehensive widget documentation
- [Views Overview](./views_overview.md) - Understanding views and their configuration
- [Board Design Patterns](./board_design_patterns.md) - Proven patterns for common use cases
- [Board Best Practices](./board_best_practices.md) - Design principles and guidelines
