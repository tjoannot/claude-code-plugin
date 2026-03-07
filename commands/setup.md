---
description: Connect to your Pigment workspace by setting your MCP endpoint URL
argument-hint: your Pigment MCP URL (find it in Settings > Integrations > MCP)
---

The user wants to connect to their Pigment workspace.

If `$ARGUMENTS` contains a URL (looks like `https://pigment.app/api/mcp/public/...`), use that URL. Otherwise, ask the user:

> To connect, I need your **MCP Endpoint URL**. You can find it in your Pigment workspace under **Settings > Integrations > MCP**. It looks like:
>
> `https://pigment.app/api/mcp/public/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx`
>
> Please paste your URL.

Once you have the URL, update the `.mcp.json` file in the plugin directory to replace the `url` value for the `pigment` MCP server with the user's URL. The file is at `${CLAUDE_PLUGIN_ROOT}/.mcp.json`.

After updating, tell the user to restart Claude Code for the change to take effect, and that they'll be prompted to authenticate with their Pigment credentials via OAuth on first use.
