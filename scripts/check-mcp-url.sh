#!/usr/bin/env bash
set -euo pipefail

MCP_FILE="${CLAUDE_PLUGIN_ROOT}/.mcp.json"

if [ ! -f "$MCP_FILE" ]; then
  echo "⚠️ Pigment MCP configuration file not found. To connect, paste your MCP Endpoint URL from Pigment (Settings > Integrations > MCP)."
  exit 0
fi

if grep -q '{your-mcp-id}' "$MCP_FILE"; then
  cat <<'MSG'
⚠️ Pigment plugin is installed but not yet connected to a workspace.

To connect, find your MCP Endpoint URL in Pigment under **Settings > Integrations > MCP**, then paste it here:

  Set my Pigment MCP URL to https://pigment.app/api/mcp/public/<your-id>
MSG
fi
