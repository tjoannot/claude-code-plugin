# Pigment Plugin for Claude Code

This plugin connects [Claude Code](https://code.claude.com) to [Pigment](https://www.pigment.com) via the **Model Context Protocol (MCP)**, giving your AI assistant direct access to your Pigment workspace. Query live business data, build and modify planning models, write formulas, design dashboards, and more — all from your editor.

## Installation

### 1. Install the plugin

In Claude Code, type `/plugin`, go to the **Discover** tab, search for **Pigment**, and install it.

### 2. Connect to your Pigment workspace

Find your **MCP Endpoint URL** in your Pigment workspace under **Settings > Integrations > MCP**. It looks like:

```
https://pigment.app/api/mcp/public/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
```

Then tell Claude Code:

> Set my Pigment MCP URL to `https://pigment.app/api/mcp/public/<your-id>`

Claude will update the `.mcp.json` configuration for you. You'll be prompted to **authenticate with your Pigment credentials** via OAuth on first use.

### Prerequisites

- MCP must be enabled in your Pigment workspace (**Settings > Integrations > MCP**)
- AI Search must be activated on the Metrics you want to query via natural language

## What's Included

### MCP Server

The plugin connects to Pigment's hosted MCP server using your workspace's unique endpoint URL. Authentication is handled via OAuth 2.1.

### Skills (8)

Skills are domain knowledge files that teach the AI assistant how to work with Pigment effectively. They are automatically loaded when relevant to your task.

| Skill | Description |
|-------|-------------|
| **modeling-pigment-applications** | Core modeling concepts, architecture, dimensions, metrics, tables, calendars, subsets, access rights, auditing, cleaning |
| **writing-pigment-formulas** | Pigment's proprietary formula language — syntax, modifiers, functions, validation workflow, performance patterns |
| **optimizing-pigment-performance** | Profiling, scoping, sparsity management, iterative calculations, access rights performance |
| **solving-specific-use-cases** | Domain-specific patterns for FP&A, Workforce Planning, OPEX, Supply Chain, Financial Consolidation |
| **integrating-pigment-data** | CSV import workflow, column mapping, dimension vs. transaction list decisions |
| **designing-pigment-boards** | Board structure, widget sizing, layout rules, page organization |
| **designing-pigment-boards-advanced** | Advanced dashboard patterns, widget types, view configuration, display modes |
| **creating-and-editing-pigment-views** | View creation, draft/override workflow, pivots, filters, sorting |

Each skill uses a **progressive disclosure** pattern: the main SKILL.md provides an overview and routes to detailed supporting documents that the AI reads on demand.

### Tools

The MCP server exposes the following tools on the public gateway.

#### Applications

| Tool | Description |
|------|-------------|
| `get_applications` | List all applications the user can access |
| `ask_application_expert_about_user_application` | Ask a Pigment Expert about the user's application structure and data |

#### Metrics — Query

| Tool | Description |
|------|-------------|
| `get_ai_metrics` | List AI-enabled metrics in an application |
| `get_metric_description` | Get metric structure — dimensions, data type, scenarios |
| `query_data` | Query data from a metric using natural language |

#### Metrics — CRUD

| Tool | Description |
|------|-------------|
| `get_all_metrics` | List all metrics in an application |
| `get_metric` | Get detailed information about a metric |
| `find_metric` | Find a metric by name |
| `create_metric` | Create a new metric |
| `delete_metric` | Delete a metric |
| `update_metric_name` | Rename a metric |
| `update_metric_description` | Update metric description |
| `update_metric_type` | Change metric data type |
| `update_metric_dimensions` | Add, remove, or reorder dimensions on a metric |
| `update_metric_default_aggregators` | Set default aggregation methods |
| `set_metric_input` | Set input values for a metric |
| `move_metrics` | Move metrics to another folder |
| `copy_formula_as_user_inputs` | Copy formula results as user inputs |

#### Lists (Dimensions)

| Tool | Description |
|------|-------------|
| `get_all_lists` | List all lists in an application |
| `get_list` | Get detailed information about a list |
| `find_list` | Find a list by name |
| `get_list_items` | Get items from a list with property values |
| `create_list` | Create a new list |
| `delete_list` | Delete a list |
| `update_list_name` | Rename a list |
| `update_list_description` | Update list description |
| `update_list_folder` | Move a list to another folder |
| `add_list_items` | Add items to a list |
| `delete_list_items` | Delete items from a list |
| `edit_list_item_history_properties` | Edit list item history properties |

#### List Properties

| Tool | Description |
|------|-------------|
| `create_list_property` | Add a property to a list |
| `delete_list_property` | Remove a property from a list |
| `update_list_property_name` | Rename a list property |
| `update_list_property_type` | Change list property data type |
| `update_list_property_uniqueness` | Change uniqueness constraint |
| `update_list_property_input_data` | Set raw input data on a list property |

#### Formulas

| Tool | Description |
|------|-------------|
| `create_or_update_formula` | Create or update a formula on a metric |
| `update_list_property_formula` | Create or update a formula on a list property |
| `get_metric_formula_details` | Get formula details for a metric |
| `get_list_property_formula_details` | Get formula details for a list property |
| `validate_formula` | Validate a formula expression |

#### Folders

| Tool | Description |
|------|-------------|
| `get_all_folders` | List all folders in an application |
| `get_folder` | Get folder details |
| `create_folder` | Create a folder |
| `update_folder_name` | Rename a folder |
| `delete_folder` | Delete a folder |

#### Calendars

| Tool | Description |
|------|-------------|
| `calendar_get` | Get calendar configuration |
| `calendar_create` | Create a Gregorian calendar |
| `calendar_expand` | Expand or shrink calendar date range |
| `calendar_add_time_dimension` | Add a time dimension to a calendar |
| `calendar_remove_time_dimension` | Remove a time dimension from a calendar |

#### Tables

| Tool | Description |
|------|-------------|
| `get_all_tables` | List all tables in an application |
| `get_table` | Get detailed table information |
| `create_table` | Create a table with default view |
| `update_table` | Update table properties |
| `delete_table` | Delete a table |

#### Boards

| Tool | Description |
|------|-------------|
| `get_all_boards` | List all boards in an application |
| `get_board` | Get detailed board information |
| `create_board` | Create a board (dashboard) |
| `update_board` | Update board configuration |
| `update_board_widgets` | Update board widgets |

#### Views

| Tool | Description |
|------|-------------|
| `get_view` | Get detailed view information |
| `get_block_views` | Get views for a block |
| `create_view` | Create a new view |
| `update_view` | Update a view |
| `create_draft_view` | Create a draft view for safe editing |
| `merge_draft_view` | Merge a draft view back |

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

## Usage Examples

### Query business data

- "Show me Revenue by product for the last 6 months"
- "What's driving Marketing's Opex variance this month?"
- "Compare actual vs. budget for EMEA revenue"

### Build and modify models

- "Create a new dimension called Regions with items EMEA, AMER, APAC"
- "Add a Revenue metric with dimensions Product and Month"
- "Write a formula for Gross Margin = Revenue - COGS"

### Design dashboards

- "Create a board with Revenue and Headcount metrics side by side"
- "Add a chart view showing Revenue trend by quarter"
- "Set up a pivot table with Product on rows and Month on columns"

### Explore your workspace

- "List all my Pigment Applications"
- "Show me metrics available in the Financial Planning app"
- "Describe the structure of the Revenue Metric"

### Manage data

- "Set the Q1 budget for Marketing to 500K"

## Directory Structure

```
claude-code-plugin/
├── .claude-plugin/
│   └── plugin.json              # Plugin manifest
├── .mcp.json                    # MCP server configuration
├── logo.svg                     # Plugin logo
├── README.md                    # This file
├── commands/                    # Slash commands
│   ├── audit.md
│   ├── build-board.md
│   ├── formula.md
│   ├── import-data.md
│   ├── model.md
│   └── optimize.md
└── skills/
    ├── modeling-pigment-applications/  # Core modeling knowledge
    ├── writing-pigment-formulas/      # Formula language reference
    ├── optimizing-pigment-performance/ # Performance optimization
    ├── solving-specific-use-cases/    # Domain-specific patterns
    ├── integrating-pigment-data/      # Data import workflows
    ├── designing-pigment-boards/      # Dashboard design
    ├── designing-pigment-boards-advanced/ # Advanced dashboard patterns
    └── creating-and-editing-pigment-views/ # View configuration
```

## About

A Claude Code plugin that provides access to Pigment workspaces, enabling AI assistants to analyze, model, forecast, report on, and plan business performance.
