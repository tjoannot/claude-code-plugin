---
name: pigment-tool-routing
description: Always use this skill before calling any Pigment MCP tool. Classifies user intent into Data Analyst or Modeler mode and determines which tools to use.
---

# Pigment MCP — Intent Classification

Before calling any Pigment tool, classify the user's request:

| Mode | Trigger | Examples |
|------|---------|---------|
| **Data Analyst** | User wants to **query, explore, or analyze** existing data | "What were Q4 sales by region?", "Show me headcount trends", "Compare budget vs actual" |
| **Modeler** | User wants to **create, modify, or configure** application objects | "Create a revenue metric", "Add a Region dimension", "Write a formula for margin", "Build a board" |

If ambiguous, default to **Data Analyst** — it is read-only and safe.

## Data Analyst mode

Use only: `get_applications`, `get_ai_metrics`, `get_metric_description`, `query_data`.

## Modeler mode

Use the full set of tools. Consult the relevant skills before acting.

## General

- Always start with `get_applications` to obtain application IDs.
- Never fabricate IDs — always retrieve them from tool responses.
