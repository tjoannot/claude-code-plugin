# Editing View Widgets

When a user wants to modify a View Widget on a Board, use the **draft + override workflow** to allow safe, user-specific preview before committing changes that affect all users.

**Key concept**: This workflow creates a temporary draft that only the current user can see, allowing them to review and confirm changes before making them permanent.

---

## Overview

### Why Use the Draft + Override Workflow?

**Safety**: Changes are previewed before affecting other users
**Flexibility**: Users can review changes in the actual Board UI
**Reversibility**: Easy to abandon changes without impacting the original widget

### When to Use This Workflow

- User wants to modify an existing View Widget's configuration
- User wants to change the pivot structure, formatting, or filters on a widget
- User wants to preview changes before committing them to the Board

---

## The Edit Workflow

### Step 1: Create a Draft View

Create an editable copy of the current View displayed in the widget.

### Step 2: Edit the Draft View

Make all necessary modifications to the draft View.
**Best practice**: Make all edits before asking for confirmation to minimize back-and-forth.

### Step 3: Update the Board View Widget Overrides

Make the widget display the draft View for the current user only.
**Important**: Only one override can exist per user + board + widget. Creating a new override automatically replaces any existing one.

### Step 4: Ask for User Confirmation

Present the changes to the user and explain the two confirmation methods.
They can either:

1. Confirm in the chat to apply changes for all users
2. Review the changes in the Board UI and confirm directly there

---

**Remember**: The override is the preview mechanism. Always use it to let users see changes before committing.
