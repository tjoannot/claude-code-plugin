# Pigment features and modeler agent tool coverage

This document lists important Pigment features and whether they are covered by the modeler agent’s tools (as exposed via the workspace API). When coverage is **No** or **Partial**, the agent should direct the user to the Pigment UI or document the limitation instead of attempting the action via tools.

**How to use:** Before performing an action, check whether the corresponding feature is available in the tools. If not, inform the user and suggest the UI or a workaround (e.g. [Safe modeling](./modeling_safe_modeling.md) for copy-first workflows).

---

## Coverage summary

| Feature | In agent tools | Notes |
| ------- | ----------------- | ----- |
| **Metrics** | | |
| List, Get, Create, Duplicate, Delete | Yes | duplicate_metrics, create_metric, delete_metric, etc. |
| Move into folder | No | API: metric/MoveIntoFolder, BatchMoveIntoFolder. Agent cannot move a block into a folder after creation; user must do it in UI or create in correct folder from the start. |
| Rename, Change description | No | API: metric/Rename, ChangeDescription. Use naming at creation; rename in UI if needed. |
| Display name (blocks, lists, properties) | No | Display names are set in the UI; not exposed in agent tools. |
| Manual override (enable/disable, update override) | Partial | Agent has BatchInput, DeleteInputs. API has UpdateOverride, CanSafelyDisableOverride — not exposed. Enable/disable override and override lifecycle: UI. |
| **Lists (dimensions / transaction lists)** | | |
| List, Get, Create, Add property, Add rows, Set inputted value(s) | Yes | create_list, add_list_property, add_list_rows, set_list_inputted_value(s). |
| Duplicate list | No | API: list/DuplicateList. Agent has no duplicate_list; user must duplicate in UI or recreate. |
| Delete list | No | API: list/Remove. Agent has no delete_list. |
| Update / Remove list property | No | API: property/Update, property/Remove. Agent can only add properties; edits and removal: UI. |
| **Subsets (sublists)** | | |
| Create synchronized subset | Yes | create_sublist (sublist/CreateSublistFrom). |
| Update subset filter, Delete subset | No | Subset management beyond create (e.g. edit filter, delete) not exposed; use UI. When full tooling is available, same design guidance applies. |
| Subset design and when to use | N/A | See [modeling_subsets.md](./modeling_subsets.md) for decision checklist, data-loss warnings, and safe patterns (STORE/CALC, store on parent, remap). Use this before proposing or creating a subset. |
| **Formulas** | | |
| Get formula, Create formula on list, Create formula on metric | Yes | get_formula, create_formula_on_list, create_formula_on_metric. |
| Update formula (edit existing formula content) | No | No “update formula” tool; agent can only create new formulas. Changing an existing formula: create a new formula or use safe modeling (duplicate metric / new property). |
| Remove formula on metric | No | API: formula/RemoveOnMetricViaFormulaGroup. Not exposed; use UI. |
| **Calendars** | | |
| List, Get, Create, Add/Remove time dimension, Fiscal year, Expand, Actual vs Forecast | Yes | list_calendars, create_calendar, add_time_dimension, remove_time_dimension, change_fiscal_year, expand_calendar, enable_actual_vs_forecast. |
| Advanced calendar options | Partial | Some advanced or region-specific settings may exist only in UI. |
| **Variables (application)** | No | Application variables are not covered by the agent for the moment; create and manage them in the UI. |
| **Access rights** | | |
| List access rights | Yes | list_access_rights. |
| Add / Update / Remove access right metrics, Apply rules | No | API: accessrights/AddAccessRightMetric, UpdateAccessRightMetric, RemoveAccessRightMetric, etc. Configuration of AR metrics and Apply/Ignore rules: UI. See [modeling_access_rights.md](./modeling_access_rights.md). |
| **Permissions (roles, boards)** | | |
| List permissions | Yes | list_permissions. |
| Create / Update permissions (roles, board permissions) | No | Permission configuration: UI. |
| **Boards** | | |
| List, Get, Create, Update, Duplicate, Delete, Update blocks | Yes | duplicate_board exists. Boards have no undo — for changes to existing boards, prefer copy-first workflow; see [Safe modeling](./modeling_safe_modeling.md). |
| **Views** | Yes | List, Get, Create, Change value fields, pivot, filter, sort, Rename, Delete. |
| **Tables** | Yes | List, Get, Create, Update, Duplicate. |
| **Scenarios** | Partial | list_scenarios, create_scenario, get_scenario_settings. Full scenario configuration may be in UI. |
| **Sequences** | Yes | List, Get, Create, Update, Delete, Duplicate, FindSome. |
| **Automations** | No | No automation endpoints exposed. Create and manage automations in the UI. |
| **Mapped dimensions (in formulas)** | Yes (via formulas) | Mappings are expressed in formulas (e.g. [BY: Mapping_Metric]). No separate “mapped dimension” object in tools; create mapping metrics and use them in formulas. |
| **Test & Deploy** | N/A | No specific T&D tools; safe modeling and formula rules (see [modeling_principles.md](./modeling_principles.md) sections 4 and 9) apply. |
| **Restore block** | N/A | Restored blocks land in a system folder (e.g. “Restored blocks”); cleanup is via audit/cleaning workflow, not a dedicated tool. |
| **Library (share block)** | Partial | Sharing and library flow are largely in UI; Push/Pull metrics are created and managed as normal metrics with naming conventions. |

---

## Where this document is referenced

- **Modeling workflow:** When the user asks for an action that is not (or only partly) in the tools, the agent should check this document and either propose a workaround (e.g. Safe modeling, create in correct folder) or direct the user to the Pigment UI.
- **Safe modeling:** [modeling_safe_modeling.md](./modeling_safe_modeling.md) — copy-first patterns for metrics, properties, dimensions, and boards.
- **SKILL.md:** Referenced in “When to use this skill” or Critical Notes so the agent knows to consult it for tool coverage.
