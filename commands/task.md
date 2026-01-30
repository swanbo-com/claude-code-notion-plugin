---
description: Create a task with automatic project detection based on current directory
argument-hint: 'task description; optional: due date, priority, status'
---

You are creating a task for the user with automatic project detection.

## Step 1: Detect Current Project

Get the current working directory and map it to a project:

```
pwd output → Project mapping:
- Contains "/reccs" → Project ID: 2f63bd66-37bc-81f2-914c-eeed8e404082 (Reccs)
- Contains "/Reachh" → Project ID: 2f63bd66-37bc-81b0-837f-f23b76e2b0bb (Reachh)
- Contains "/Wordpress" → Project ID: 2f63bd66-37bc-8110-b6e8-efe57b258814 (WordPress Care Platform)
- Contains "/brand-engine" OR "/ai_img" → Project ID: 2f63bd66-37bc-81fc-917c-d024f3e112a3 (Brand Engine)
- Otherwise → Ask user which project this task is for
```

## Step 2: Parse Task Details

From `$ARGUMENTS` or conversation, extract:
- **Task title** (required): Clear, actionable description
- **Due date** (optional): Parse natural language (e.g., "tomorrow", "next week", "Jan 15")
- **Priority** (optional): High/Medium/Low
- **Status** (optional): Default to "Todo" or "Backlog"
- **Assignee** (optional): Default to user if property exists

## Step 3: Create Database Row

Use the `notionApi` MCP server to create a task row:

**Database ID**: 7f56a5c5-40b2-4712-baa1-8b03184a6ec8

**Required properties:**
- **Title/Name**: Task description
- **Project**: Set to the detected project using relation format:
  ```
  ["https://www.notion.so/{PROJECT_ID}"]
  ```
  Example for Reccs: ["https://www.notion.so/2f63bd66-37bc-81f2-914c-eeed8e404082"]
- **Status**: Default to "Todo"

**Optional properties:**
- **Due Date**: Parsed date if provided
- **Priority**: Parsed priority or default to "Medium"
- **Created Date**: Today
- **Source**: "Claude Code"
- **Tags**: Auto-tag based on task type (e.g., "bug", "feature", "refactor")

## Step 4: Confirm

Return a concise confirmation:
```
✓ Task created in [Project] Tasks
  "[Task title]"
  Due: [Date] | Priority: [Priority]
  → [Link to Notion page]
```

**Important**:
- Be fast and conversational
- Auto-fill sensible defaults
- Only ask for clarification if task title is unclear
- If database ID placeholders haven't been replaced, inform user to update PROJECT_CONFIG.md
