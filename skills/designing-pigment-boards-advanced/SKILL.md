---
description: Always use this skill when creating and modifying Pigment dashboards and Boards. This skills describes everything there is to know about dashboarding, views and other data visualization features in Pigment. This includes laying out widgets on the grid system, configuring Views with filters and sorting, choosing display modes and chart types, sizing widgets, organizing Board sections, applying proven design patterns for common business use cases, or translating business questions into visual layouts. This skill includes supporting files in this directory - explore as needed.
---

# How to Use This Skill

**Progressive Disclosure Pattern**: This `SKILL.md` provides an overview. Most details live in supporting files.

**This file alone is often not sufficient**

**Required workflow**:

1. **Read this file first** - Understand available resources and when to use them
2. **Identify relevant topics** - Match your task to any of the supporting documents
3. **Read supporting files** - Use `read_file` or `grep` to access detailed documentation
4. **Explore as needed** - Use `ls`, `grep`, or `glob` to discover additional resources in this directory (some might not be explicitly mentioned in this file)

# Designing Pigment Boards

This skill provides guidance for designing clear, structured dashboards in Pigment.

## When to Use This Skill

- **Create new boards** - Designing dashboards from scratch
- **Layout widgets** - Using the 12-column grid system
- **Configure views** - Setting up filters, sorting, pivot tables
- **Choose visualizations** - Grid, KPI, Chart display modes
- **Size widgets** - Following standard sizing conventions
- **Apply design patterns** - Using proven patterns for common use cases

**Use after modeling is complete and before/during board creation.**

---

## Board Design Workflow

### Step 1: Understand Data Model

- [ ] List all available Blocks (Lists and Metrics)
- [ ] For each Metric, identify its Dimensions
- [ ] Understand relationships

### Step 2: Search for Design Pattern

- [ ] Identify board type (P&L, Headcount, Sales, etc.)
- [ ] Search this SKILL.md for relevant section
- [ ] Check [./board_design_patterns.md](./board_design_patterns.md) for similar use cases
- [ ] Read documentation files listed

### Step 3: Design Board

- [ ] Follow 12-column grid rules
- [ ] Apply standard widget sizes
- [ ] Maintain logical flow and hierarchy

---

## Core Principles

- Boards tell a **story**, not just display data
- Simplicity beats completeness
- Consistency across boards improves usability
- Boards describe _what to display_, not _how it's calculated_

---

## Essential Files

### Start Here

**[./boards_overview.md](./boards_overview.md)** - What are boards and when to use them

**[./boards_structure_and_layout.md](./boards_structure_and_layout.md)** - The 12-column grid system and layout rules

### Critical Layout Rules

- Total width per row ≤ 12 columns
- Y-coordinates must be sequential: `y_next = y_previous + height_previous`
- Section titles must span full width (`width=12`)
- Maximum 4 widgets per row

### Standard Widget Sizes

| Widget Type   | Width   | Height | Notes                 |
| ------------- | ------- | ------ | --------------------- |
| Board title   | 12      | 3      | Top of board          |
| Section title | 12      | 2      | Start of section      |
| Divider       | 12      | 1      | Between sections      |
| Grid/Table    | 12      | 6-10   | Full width            |
| KPI           | 3 or 6  | 6-10   | Quarter or half width |
| Chart         | 6 or 12 | 6-10   | Half or full width    |

---

## Task-Based Routing

### Designing a New Board

**Steps**:

1. Read [./boards_overview.md](./boards_overview.md)
2. Review [./boards_structure_and_layout.md](./boards_structure_and_layout.md)
3. Check [./board_design_patterns.md](./board_design_patterns.md) for similar use cases
4. Follow [./board_best_practices.md](./board_best_practices.md)

### Configuring Widgets

**Steps**:

1. Read [./widgets_types.md](./widgets_types.md)
2. Review sizing in [./boards_structure_and_layout.md](./boards_structure_and_layout.md)
3. Check [./board_best_practices.md](./board_best_practices.md)

### Creating and Configuring Views

**Steps**:

1. Read [./views_overview.md](./views_overview.md)
2. Review [./views_display_modes.md](./views_display_modes.md)
3. Read [./views_configuration.md](./views_configuration.md)
4. For Tables: [./views_advanced_tables.md](./views_advanced_tables.md)
5. Follow [./views_best_practices.md](./views_best_practices.md)

### Choosing Display Modes

**Available modes**:

- **Grid**: Table view for detailed data
- **Bar**: Bar chart for comparisons
- **Stacked**: Stacked bar for composition
- **Line**: Line chart for trends
- **Pie**: Pie chart for proportions
- **Waterfall**: Waterfall for contributions/changes
- **KPI**: Key Performance Indicator display

**Read**: [./views_display_modes.md](./views_display_modes.md)

### Applying Design Patterns

**Available patterns** in [./board_design_patterns.md](./board_design_patterns.md):

1. **P&L Overview** - Financial performance
2. **Headcount Planning** - Workforce analysis
3. **Sales Forecast** - Pipeline management
4. **Cash Flow Management** - Liquidity monitoring
5. **Budget vs Actual** - Variance analysis
6. **Scenario Planning** - Multi-scenario comparison
7. **Executive Summary** - High-level dashboard
8. **Operational Dashboard** - Day-to-day metrics

---

## Documentation Files

### Core Concepts

- [./boards_overview.md](./boards_overview.md) - Introduction to boards
- [./boards_structure_and_layout.md](./boards_structure_and_layout.md) - Grid and layout rules

### Widgets and Views

- [./widgets_types.md](./widgets_types.md) - All widget types
- [./views_overview.md](./views_overview.md) - Understanding views
- [./views_display_modes.md](./views_display_modes.md) - All display modes
- [./views_configuration.md](./views_configuration.md) - Filters, sorting
- [./views_advanced_tables.md](./views_advanced_tables.md) - Advanced table patterns

### Design Patterns

- [./board_design_patterns.md](./board_design_patterns.md) - 8 comprehensive patterns
- [./board_best_practices.md](./board_best_practices.md) - Design principles
- [./views_best_practices.md](./views_best_practices.md) - View guidelines

---

## Quick Reference

### Board Structure Template

1. **Board Title** (`width=12`, `height=3`)
2. **Board Description** (`width=12`, `height=2-3`)
3. **Sections**, each with:
   - Section title (`width=12`, `height=2`)
   - Optional subtitle (`width=12`, `height=2`)
   - Widgets
   - Divider (`width=12`, `height=1`)

### Layout Rules Summary

- Total width per row ≤ 12
- Y-coordinates sequential
- Section titles always `width=12`
- Max 4 widgets per row

### Best Practices Summary

**Board Design**:

- Start with purpose and audience
- Tell a story with logical flow
- Keep it simple and consistent

**Layout**:

- Follow 12-column grid strictly
- Use consistent positioning
- Maintain proper spacing
- Use dividers between sections

**Views**:

- Choose appropriate display modes
- Apply relevant filters
- Sort by importance
- Limit dimensions (3-5 max)

---

## Cross-References

**Before Board Design**:

- **modeling-pigment-applications** - Creating Blocks (Metrics, Lists, Tables)
- **writing-pigment-formulas** - Writing formulas for Metrics

---

## Critical Notes

- **Grid is non-negotiable** - Always follow 12-column grid rules
- **Check patterns first** - Don't reinvent existing patterns
- **Model first, design second** - Ensure data model is complete
- **List blocks before designing** - Know what Metrics/Lists are available
- **Follow standard sizes** - Consistency improves usability
- **Sequential Y-coordinates** - Y must follow: y_next = y_previous + height_previous
