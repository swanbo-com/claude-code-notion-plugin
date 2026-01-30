---
description: Capture an idea with automatic project detection based on current directory
argument-hint: 'idea description (optional - can extract from conversation)'
---

You are capturing an idea for the user with automatic project detection.

## Step 1: Detect Current Project

Get the current working directory and map it to a project:

```
pwd output → Project mapping:
- Contains "/reccs" → Project ID: 2f63bd66-37bc-81f2-914c-eeed8e404082 (Reccs)
- Contains "/Reachh" → Project ID: 2f63bd66-37bc-81b0-837f-f23b76e2b0bb (Reachh)
- Contains "/Wordpress" → Project ID: 2f63bd66-37bc-8110-b6e8-efe57b258814 (WordPress Care Platform)
- Contains "/brand-engine" OR "/ai_img" → Project ID: 2f63bd66-37bc-81fc-917c-d024f3e112a3 (Brand Engine)
- Otherwise → Ask user which project this idea is for
```

## Step 2: Extract Idea Content

Source the idea from:
1. `$ARGUMENTS` if provided
2. Recent conversation context (last 3-5 messages)
3. Ask user if unclear

## Step 3: Create Database Row

Use the `notionApi` MCP server to create a row in the Ideas Inbox database:

**Database ID**: 533088a2-9c61-4903-bf33-56f2922807ed

**Required properties:**
- **Title/Name**: The idea description (1-2 sentences)
- **Project**: Set to the detected project using relation format:
  ```
  ["https://www.notion.so/{PROJECT_ID}"]
  ```
  Example for Reccs: ["https://www.notion.so/2f63bd66-37bc-81f2-914c-eeed8e404082"]
- **Status**: Default to "Inbox" or "Backlog"
- **Created Date**: Today's date

**Optional properties** (if they exist in the database):
- **Source**: "Claude Code"
- **Context**: Brief context from conversation
- **Tags**: Auto-tag based on content (e.g., "feature", "bug", "improvement")

## Step 4: Confirm

Return a concise confirmation:
```
✓ Idea captured in [Project] Ideas
  "[Idea title]"
  → [Link to Notion page]
```

**Important**:
- Be conversational and quick - this should feel lightweight
- Don't ask for confirmation unless required properties are missing
- Auto-fill sensible defaults
- If the database ID placeholders haven't been replaced yet (contain "YOUR_"), inform the user they need to update PROJECT_CONFIG.md with their actual database IDs
