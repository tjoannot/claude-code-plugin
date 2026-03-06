# Widget Types

Widgets are the building blocks of Boards in Pigment. Each widget displays a specific type of content and can be configured to meet your dashboard needs.

---

## Widget Overview

### Widget Properties

All widgets share common properties:

- **Type**: The widget type (View, Text, Spacer, ActionButton, Image)
- **Position**: X and Y coordinates on the Board grid
- **Size**: Width (columns) and Height (rows)
- **Configuration**: Type-specific settings

### Widget Categories

Widgets fall into two main categories:

1. **Data Widgets**: Display data from Blocks (Metrics, Lists, Tables)
   - View widgets (Grid, Chart, KPI, List views)

2. **Content Widgets**: Provide structure, context, or functionality
   - Text widgets
   - Spacer widgets
   - ActionButton widgets
   - Image widgets

---

## View Widgets

View widgets display data from Metrics, Lists, or Tables. They are the primary way to visualize data on Boards.

### View Widget Types

View widgets can display data in different modes:

- **Grid**: Table view showing data in rows and columns
- **Chart**: Visual charts (Bar, Line, Pie, Waterfall, etc.)
- **KPI**: Key Performance Indicator display
- **List**: Display of List items (Dimension Lists or Transaction Lists)

### CRITICAL Display Type Rules

**IMPORTANT: The display type MUST match the underlying view type:**

- **Widgets on views on List blocks** → MUST use the **List** display type
- **Widgets on views on Metric blocks** → MUST NOT use the List display type (use Table, Chart, KPI, or Spreadsheet instead)
- **Widgets on views on Table blocks** → MUST NOT use the List display type (use Table, Chart, KPI, or Spreadsheet instead)

**Violating these rules will result in incorrect widget behavior.**

### Configuration

View widgets require:

- **Source Block**: The Metric, List, or Table to display
- **View Configuration**: Display mode, filters, sorting, breakdowns, calculations
- **Position and Size**: X, Y, width, height

### Sizing Guidelines

- **KPI widgets**: `width=3` or `width=6`, `height=6-10`
- **Chart widgets**: `width=6` or `width=12`, `height=8-12`
- **Grid widgets**: `width=12`, `height=10-15`
- **List widgets**: `width=12`, `height=8-12`

### When to Use

- Displaying data from Metrics, Lists, or Tables
- Creating visualizations (charts, KPIs)
- Showing detailed data in tables
- Comparing data across dimensions

### See Also

- [Views Overview](./views_overview.md) - Understanding views
- [Views Display Modes](./views_display_modes.md) - Available visualization types
- [Views Configuration](./views_configuration.md) - Configuring filters, sorting, etc.

---

## Text Widgets

Text widgets add titles, descriptions, instructions, and context to Boards. They help users understand what they're looking at and guide them through the Board.

### Text Widget Layouts

Text widgets support two layout styles:

#### Regular Layout

- Standard text formatting
- Used for titles, descriptions, explanatory text
- Flows naturally with Board content
- No background box

#### Box Layout

- Text displayed in a boxed container
- Used for metrics, lists, tables, KPIs, charts (when describing them)
- Stands out from other content
- Provides visual separation

### Configuration

Text widgets require:

- **Content**: Rich text content (can include formatting)
- **Layout**: Regular or Box layout
- **Position and Size**: X, Y, width, height

### Text Formatting

Text widgets support rich text formatting:

- **Font Sizes**: Normal, H3, H2, H1
- **Text Styles**: Bold, italic, underline
- **Structure**: Paragraphs, lists
- **Formatting**: Colors, alignment

### Standard Sizes

**Board-Level Text:**

- Board title: `width=12`, `height=3` (H1 or H2)
- Board description: `width=12`, `height=2-3` (Normal or H3)
- Section title: `width=12`, `height=2` (H2 or H3)
- Section subtitle: `width=12`, `height=2` (H3 or Normal)

**Content Descriptions:**

- Grid/Table description: `width=12`, `height=6-10` (Box layout)
- KPI description: `width=3` or `width=6`, `height=6-10` (Box layout)
- Chart description: `width=6` or `width=12`, `height=6-10` (Box layout)

### Usage Guidelines

**Use Regular Layout for:**

- Titles and headings
- Descriptions and explanatory text
- Instructions and guidance
- Contextual information

**Use Box Layout for:**

- Describing Metrics, Lists, Tables
- Specifying KPIs
- Describing Charts
- Highlighting important information

### Content Best Practices

- **Be concise**: Keep text brief and focused
- **Use clear language**: Avoid jargon when possible
- **Provide context**: Explain what users are seeing
- **Use formatting**: Leverage headings and styles for hierarchy
- **One widget per concept**: Don't mix unrelated content

### When to Use

- Adding Board titles and descriptions
- Creating section headers
- Providing instructions or context
- Describing what Views should display
- Adding commentary or insights

---

## Spacer Widgets

Spacer widgets create visual separation between sections and content on Boards. They help organize content and improve readability.

### Spacer Types

#### Spacer

- Creates blank space between widgets
- Used for subtle separation
- Maintains visual rhythm

#### Divider

- Creates a visible dividing line
- Used between major sections
- Provides clear visual separation

### Configuration

Spacer widgets require:

- **Mode**: Spacer or Divider
- **Position and Size**: X, Y, width, height

### Standard Sizes

- **Divider**: `width=12`, `height=1`
- **Spacer**: `width=12`, `height=1-2` (or custom as needed)

### Usage Guidelines

**Use Dividers:**

- Between major sections
- After the last widget in a section (except the last section)
- When clear visual separation is needed

**Use Spacers:**

- For subtle spacing adjustments
- Between related widgets
- To maintain visual rhythm

### Best Practices

- Place dividers at the end of sections (except the last section)
- Use consistent spacing throughout the Board
- Don't overuse dividers - they can create visual clutter
- Use spacers for fine-tuning layout

### When to Use

- Separating sections on a Board
- Creating visual breaks between content
- Improving readability and organization
- Maintaining consistent spacing

---

## ActionButton Widgets

ActionButton widgets enable navigation and trigger actions on Boards. They help users navigate between Boards or trigger workflows.

### Action Types

ActionButton widgets can perform different actions:

- **Navigate to Board**: Navigate to another Board in the application
- **External Link**: Open an external URL
- **Trigger Import**: Trigger a data import workflow

### Configuration

ActionButton widgets require:

- **Action Type**: Navigation, External Link, or Import
- **Target**: Board ID, URL, or Import configuration
- **Label**: Button text
- **Layout**: Button style and appearance
- **Position and Size**: X, Y, width, height

### Button Layouts

- **Primary**: Prominent button style
- **Secondary**: Standard button style
- **Text**: Text-only button style

### Sizing Guidelines

- **Standard button**: `width=3-6`, `height=2-3`
- **Wide button**: `width=6-12`, `height=2-3`

### Usage Guidelines

- Use for navigation between related Boards
- Provide clear button labels
- Place buttons where users expect them (top or bottom of sections)
- Don't overuse - too many buttons can be overwhelming

### When to Use

- Creating navigation between Boards
- Linking to external resources
- Triggering data imports
- Guiding users through workflows

---

## Image Widgets

Image widgets display images on Boards, such as logos, diagrams, or illustrations.

### Configuration

Image widgets require:

- **Image URL**: Source of the image
- **Object Fit**: How the image fits in the widget (contain, cover, etc.)
- **Show Border**: Whether to display a border
- **Alt Text**: Alternative text for accessibility
- **Position and Size**: X, Y, width, height

### Image Fit Options

- **Contain**: Image fits within widget, maintaining aspect ratio
- **Cover**: Image fills widget, may be cropped
- **Fill**: Image fills widget, may be stretched

### Sizing Guidelines

- **Logo**: `width=3-6`, `height=2-4`
- **Diagram**: `width=6-12`, `height=6-12`
- **Illustration**: `width=12`, `height=8-12`

### Usage Guidelines

- Use for logos and branding
- Display diagrams or process flows
- Add visual context or illustrations
- Ensure images are appropriately sized
- Include alt text for accessibility

### When to Use

- Adding company logos
- Displaying process diagrams
- Including visual context
- Enhancing Board aesthetics

---

## Widget Selection Guide

### Choose View Widgets When:

- Displaying data from Metrics, Lists, or Tables
- Creating visualizations
- Showing KPIs or metrics
- Presenting detailed data

### Choose Text Widgets When:

- Adding titles or descriptions
- Providing context or instructions
- Describing what Views should display
- Adding commentary

### Choose Spacer Widgets When:

- Separating sections
- Creating visual breaks
- Improving readability
- Maintaining spacing

### Choose ActionButton Widgets When:

- Navigating between Boards
- Linking to external resources
- Triggering workflows
- Guiding user actions

### Choose Image Widgets When:

- Adding logos or branding
- Displaying diagrams
- Including visual context
- Enhancing aesthetics

---

## Widget Configuration Summary

| Widget Type    | Required Config    | Common Sizes         | Primary Use          |
| -------------- | ------------------ | -------------------- | -------------------- |
| View           | Block, View config | 3-12 cols, 6-15 rows | Display data         |
| Text (Regular) | Content, Layout    | 12 cols, 2-3 rows    | Titles, descriptions |
| Text (Box)     | Content, Layout    | 3-12 cols, 6-10 rows | Describe Views       |
| Spacer         | Mode               | 12 cols, 1 row       | Separation           |
| Divider        | Mode               | 12 cols, 1 row       | Section breaks       |
| ActionButton   | Action, Label      | 3-6 cols, 2-3 rows   | Navigation           |
| Image          | URL, Fit           | 3-12 cols, 2-12 rows | Visual content       |

---

## Widget Best Practices

1. **Use appropriate widget types**: Match widget type to content purpose
2. **Maintain consistent sizing**: Use standard sizes for similar widgets
3. **Provide context**: Use text widgets to explain View widgets
4. **Organize logically**: Group related widgets together
5. **Don't overcrowd**: Limit widgets per row and section
6. **Use spacers wisely**: Create separation without clutter
7. **Test layouts**: Ensure widgets work well together
8. **Consider accessibility**: Include alt text, clear labels

---

## See Also

- [Board Structure and Layout](./boards_structure_and_layout.md) - Widget positioning
- [Views Overview](./views_overview.md) - View widget configuration
- [Board Design Patterns](./board_design_patterns.md) - Widget usage examples
- [Board Best Practices](./board_best_practices.md) - Design guidelines
