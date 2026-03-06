# Board Structure and Layout

## Board Structure

Every Board should follow a consistent structure that guides users through the information logically and clearly.

### Standard Board Structure

1. **Board Title**
   - Clear, descriptive name
   - Positioned at the top (width=12, height=3)
   - Uses H1 or H2 text formatting

2. **Board Description**
   - Optional subtitle or description
   - Provides context and purpose
   - Positioned below title (width=12, height=2-3)

3. **Logical Sections**
   Each section contains:
   - Section title (width=12, height=2)
   - Optional subtitle (width=12, height=2)
   - Relevant widgets (View, Text, etc.)
   - Divider at the end (except the last section)

### Section Organization Rules

- **Do not number section titles** - Use descriptive names instead
- **Use titles and subtitles for context** - Not recommendations or instructions
- **Keep descriptions concise** - One to two sentences maximum
- **Group related widgets** - Each section should have a clear theme
- **Order sections logically** - Most important information first

---

## 12-Column Grid System

Pigment Boards use a strict 12-column grid system for organizing widgets. This grid ensures consistent layouts and visual alignment.

### Grid Fundamentals

The grid divides the Board width into 12 equal columns:

- Column positions: 0 through 11 (or 1 through 12, depending on coordinate system)
- Widgets can span 1 to 12 columns
- Total width per row must equal exactly 12 columns

### Coordinate System

Each widget has a position defined by:

- **X coordinate**: Column position (0-11 or 1-12)
- **Y coordinate**: Row position (starts at 0 or 1)
- **Width**: Number of columns the widget spans (1-12)
- **Height**: Number of rows the widget spans (variable)

### Layout Rules

**Critical rules that must always be followed:**

1. **Total width per row ≤ 12 columns**
   - Sum of all widget widths in the same row must not exceed 12
   - Example: Three widgets of width 4 = 12 columns ✓

2. **X-coordinates in same row must sum to ≤ 12**
   - Widgets cannot overlap
   - Example: Widget at x=0, width=6; Widget at x=6, width=6 = 12 columns ✓

3. **Y-coordinates must be sequential**
   - `y_next = y_previous + height_previous`
   - No gaps between rows
   - Example: Widget at y=0, height=3; Next widget at y=3 ✓

4. **Section titles span full width**
   - Section titles: `width=12`
   - Ensures visual consistency

5. **Maximum 4 widgets per row**
   - Prevents overcrowding
   - Maintains readability
   - Example: Four widgets of width 3 = 12 columns ✓

6. **Maintain vertical alignment**
   - Align widgets in columns when possible
   - Reuse consistent X positions across rows
   - Creates visual rhythm and predictability

### Layout Width Options

**Fixed-Width Layout (Recommended)**

- Board has a fixed maximum width
- Content is centered on larger screens
- Provides consistent viewing experience
- Easier to design and maintain

**Full-Width Layout**

- Board expands to fill available screen width
- Useful for wide tables or multiple columns
- Can be harder to read on very wide screens
- Use sparingly for specific use cases

**Recommendation**: Prefer **fixed-width layout** for most Boards to ensure consistent user experience and easier design.

---

## Widget Positioning Guidelines

### Standard Widget Positions

Use consistent X positions across rows to create visual alignment:

**Common Layout Patterns:**

- **Single column**: `x=0, width=12` (full width)
- **Two columns**: `x=0, width=6` and `x=6, width=6`
- **Three columns**: `x=0, width=4`, `x=4, width=4`, `x=8, width=4`
- **Four columns**: `x=0, width=3`, `x=3, width=3`, `x=6, width=3`, `x=9, width=3`
- **Asymmetric**: `x=0, width=8` (main content) and `x=8, width=4` (sidebar)

### Y-Coordinate Calculation

Calculate Y positions sequentially:

```
y_0 = 0 (or starting Y position)
y_1 = y_0 + height_0
y_2 = y_1 + height_1
y_3 = y_2 + height_2
...
```

**Example:**

- Title widget: `y=0, height=3` → ends at y=3
- Description widget: `y=3, height=2` → ends at y=5
- Section title: `y=5, height=2` → ends at y=7
- Content widget: `y=7, height=6` → ends at y=13

---

## Widget Sizing Standards

Use consistent sizing to create visual rhythm and predictability.

### Standard Sizes

**Board-Level Elements:**

- Board title: `width=12`, `height=3`
- Board description: `width=12`, `height=2-3`
- Section title: `width=12`, `height=2`
- Section subtitle: `width=12`, `height=2`
- Divider: `width=12`, `height=1`

**Content Widgets:**

**Text Widgets describing visualizations:**

- Grid/Table description: `width=12`, `height=6-10`
- KPI description: `width=3` or `width=6`, `height=6-10`
- Chart description: `width=6` or `width=12`, `height=6-10`

**View Widgets:**

- KPI widgets: `width=3` or `width=6`, `height=6-10`
- Chart widgets: `width=6` or `width=12`, `height=8-12`
- Grid widgets: `width=12`, `height=10-15`
- List widgets: `width=12`, `height=8-12`

### Sizing Guidelines

**Height Considerations:**

- Taller widgets (height=10-15) for grids and detailed tables
- Medium widgets (height=6-10) for charts and KPIs
- Shorter widgets (height=2-3) for titles and descriptions

**Width Considerations:**

- Full width (12) for grids, tables, and section titles
- Half width (6) for charts when showing two side-by-side
- Quarter width (3) for KPIs when showing four in a row
- Custom widths for asymmetric layouts

---

## Layout Patterns

### Pattern 1: Executive Dashboard

```
Row 0: Title (width=12, height=3)
Row 3: Description (width=12, height=2)
Row 5: Section Title (width=12, height=2)
Row 7: KPI (width=3), KPI (width=3), KPI (width=3), KPI (width=3)
Row 13: Divider (width=12, height=1)
Row 14: Section Title (width=12, height=2)
Row 16: Chart (width=12, height=10)
...
```

### Pattern 2: Two-Column Layout

```
Row 0: Title (width=12, height=3)
Row 3: Description (width=12, height=2)
Row 5: Section Title (width=12, height=2)
Row 7: Chart (width=6, height=10), Chart (width=6, height=10)
Row 17: Divider (width=12, height=1)
Row 18: Section Title (width=12, height=2)
Row 20: Grid (width=12, height=12)
...
```

### Pattern 3: Asymmetric Layout

```
Row 0: Title (width=12, height=3)
Row 3: Description (width=12, height=2)
Row 5: Section Title (width=12, height=2)
Row 7: Main Content (width=8, height=12), Sidebar (width=4, height=12)
...
```

---

## Visual Alignment

### Vertical Alignment

- Align widgets in the same column across multiple rows
- Use consistent X positions for similar widget types
- Example: All KPI widgets start at x=0, x=3, x=6, x=9

### Horizontal Alignment

- Ensure widgets in the same row align properly
- Use consistent heights for widgets in the same row when possible
- Example: All KPIs in a row have the same height

### Spacing

- Use dividers (height=1) to create visual separation between sections
- Allow adequate spacing between sections (2-3 rows)
- Don't overcrowd rows - maximum 4 widgets per row

---

## Common Layout Mistakes

### ❌ Overlapping Widgets

**Problem**: Widgets positioned at overlapping X coordinates
**Solution**: Ensure X positions + widths don't exceed 12 or overlap

### ❌ Row Width Exceeds 12

**Problem**: Sum of widget widths in a row > 12
**Solution**: Reduce widget widths or move widgets to next row

### ❌ Gaps in Y Coordinates

**Problem**: Y positions not sequential (e.g., y=0, y=5, y=10)
**Solution**: Calculate Y positions sequentially based on previous widget's height

### ❌ Inconsistent Alignment

**Problem**: Widgets don't align vertically across rows
**Solution**: Reuse consistent X positions for similar widget types

### ❌ Too Many Widgets Per Row

**Problem**: More than 4 widgets in a single row
**Solution**: Reduce to maximum 4 widgets or increase widget widths

---

## Layout Best Practices

1. **Plan before building**: Sketch the layout before creating widgets
2. **Start with structure**: Add titles and sections first, then content
3. **Use consistent patterns**: Reuse successful layout patterns across Boards
4. **Test on different screens**: Ensure layout works on various screen sizes
5. **Maintain visual rhythm**: Consistent spacing and alignment
6. **Group related content**: Keep related widgets in the same section
7. **Prioritize important content**: Place critical information at the top
8. **Use dividers sparingly**: Only between major sections

---

## See Also

- [Boards Overview](./boards_overview.md) - Introduction to Boards
- [Widget Types](./widgets_types.md) - Widget configuration and sizing
- [Board Design Patterns](./board_design_patterns.md) - Complete Board examples
- [Board Best Practices](./board_best_practices.md) - Design principles
