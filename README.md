# Pigment Plugin for Claude Code

Build, model, and manage [Pigment](https://www.pigment.com) business planning applications directly from Claude Code.

## What's Included

### MCP Server

The plugin connects to the Pigment MCP server, giving Claude access to **80+ tools** across all Pigment domains:

| Domain | Tools |
|--------|-------|
| **Applications** | List, create, rename, delete applications, find default scenario, get performance insights |
| **Metrics** | List, get, create, duplicate, delete metrics, get formula groups, get dependencies |
| **Lists (Dimensions)** | List, get, create lists, add properties, add rows, set values, create sublists |
| **Formulas** | Get, create formulas on metrics and list properties |
| **Boards** | List, get, create, update, delete, duplicate boards, update board blocks |
| **Views** | List, get, create views, change pivots, filters, sorts, value fields |
| **Calendars** | List, get, create calendars, add/remove time dimensions, change fiscal year |
| **Tables** | List, get, create, update, duplicate tables |
| **Sequences** | List, get, create, update, delete, duplicate sequences |
| **Scenarios** | List, create scenarios, get settings |
| **Inputs** | Batch input single/multiple metrics, delete inputs |
| **Slices** | List, get, create slices |
| **Variables** | List, get, create, update variables |
| **Security** | List access rights, list permissions, get snapshot usage |
| **Audit Trail** | Get application change history |
| **AI Forecast** | Prepare, create, copy, delete forecasts |
| **Data Import** | Import CSV to dimensions |

### Skills

Eight specialized skills provide deep domain knowledge — the same skills that power Pigment's internal AI modeler agent:

| Skill | Files | Description |
|-------|-------|-------------|
| **Modeling Pigment Applications** | 16 files | Core concepts, architecture, dimensions, metrics, naming conventions, governance rules, access rights, auditing, application cleaning, Test & Deploy safety |
| **Writing Pigment Formulas** | 16 files | Proprietary formula language — syntax, modifiers (BY, ADD, REMOVE, SELECT, FILTER), all function references (logical, numeric, time/date, lookup, text, finance, security), performance patterns |
| **Optimizing Pigment Performance** | 9 files | Profiler usage, scope propagation, sparsity management, formula optimization, iterative calculation tuning, access rights performance, troubleshooting workflows |
| **Designing Pigment Boards** | 7 files | Dashboard design, 12-column grid, widget sizing, board design rules, view selection, page configuration |
| **Designing Pigment Boards (Advanced)** | 11 files | Complete board and view reference — structure/layout, widget types, display modes, chart types, advanced tables, design patterns, best practices |
| **Creating and Editing Pigment Views** | 1 file | View configuration, pivot fields, filters, sorting, draft + merge workflow |
| **Integrating Pigment Data** | 3 files | CSV import, dimension vs transaction list decisions, semantic column matching, cross-app imports |
| **Solving Specific Use Cases** | 8 files | FP&A (Nexus pattern, OPEX planning), Workforce Planning (layered metrics, cards, changelog), Sales, Supply Chain, Financial Consolidation |

### Commands

Quick-access slash commands for common workflows:

| Command | Description |
|---------|-------------|
| `/model` | Design or modify a Pigment application model |
| `/formula` | Write a Pigment formula |
| `/optimize` | Diagnose and fix performance issues |
| `/import-data` | Import data into Pigment |
| `/build-board` | Design and create a dashboard |
| `/audit` | Audit an application for issues |

## Installation

### From Claude Code

```
/plugin install pigment
```

### From Source (development)

```
/plugin marketplace add ./pigment-claude-plugin
/plugin install pigment@pigment-claude-plugin
```

## Authentication

The Pigment MCP server uses OAuth for authentication. When you first use a Pigment tool, Claude Code will prompt you to authenticate with your Pigment account.

## Examples

### Model a Revenue Planning App

```
/model Create a revenue planning application with dimensions for Product, Region, and Time.
Include metrics for Revenue, Cost of Goods Sold, and Gross Margin.
```

### Write a Formula

```
/formula Calculate year-to-date revenue that resets at fiscal year boundaries
```

### Build a Dashboard

```
/build-board Create an executive KPI dashboard showing Revenue, Margin %, and Headcount
trends by quarter with scenario comparison
```

### Import Data

```
/import-data Import a CSV file with employee data including Name, Department,
Start Date, Salary, and Location
```

## Plugin Structure

```
pigment-claude-plugin/
├── .claude-plugin/
│   └── plugin.json          # Plugin manifest
├── .mcp.json                # MCP server configuration
├── commands/                 # Slash commands
│   ├── audit.md
│   ├── build-board.md
│   ├── formula.md
│   ├── import-data.md
│   ├── model.md
│   └── optimize.md
├── skills/                   # AI skills (72 files across 8 skill directories)
│   ├── modeling-pigment-applications/    # 16 files
│   ├── writing-pigment-formulas/         # 16 files
│   ├── optimizing-pigment-performance/   # 9 files
│   ├── designing-pigment-boards/         # 7 files
│   ├── designing-pigment-boards-advanced/ # 11 files
│   ├── creating-and-editing-pigment-views/ # 1 file
│   ├── integrating-pigment-data/         # 3 files
│   └── solving-specific-use-cases/       # 8 files
└── README.md
```

## Learn More

- [Pigment Documentation](https://docs.pigment.com)
- [Pigment Website](https://www.pigment.com)
- [Claude Code Plugins](https://code.claude.com/docs/en/plugins)
