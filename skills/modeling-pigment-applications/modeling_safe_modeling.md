# Safe Modeling

This document describes how to reduce the risk of breaking an application when making structural or high-impact changes. The core idea: **avoid destructive or in-place changes when the change is risky**; use a **copy-first** approach when appropriate so the user can validate before replacing the original.

## When to use copy-first vs acting directly

**Prefer copy-first** when:

- The change is **structural** or **high-impact**: rewriting a formula, changing a metric's dimensions, changing a list property's formula in a significant way.
- The block is **heavily used** (many dependencies, boards, or other formulas reference it).
- The user asks to **"test"**, **"try"**, or **"experiment"** with a change.
- The request is **broad or ambiguous** (e.g. "improve this formula", "refactor this metric") and the result is uncertain.

**Act directly** when:

- The change is **small and low-risk**: typo fix, minor formula tweak, renaming, or the user explicitly asks to **"change it in place"** or **"update the existing one"**.
- The user has clearly asked for a direct change and accepted the risk.

When in doubt, **offer the user the choice**: "I can apply this change directly to [block], or first create a copy (e.g. [block] test) so you can compare. Which do you prefer?"

---

## Metrics: duplicate before changing the formula

The agent has a **duplicate_metrics** tool. Use it when you need to change a metric's formula in a structural or risky way.

**Workflow:**

1. Duplicate the metric (e.g. name the copy `OriginalName test` or `OriginalName_test`). If that name is already taken, increment (e.g. `OriginalName test 2`, `OriginalName_test_3`).
2. Apply the new formula (or structure change) to the **copy** only; leave the original unchanged.
3. Tell the user they can compare both; once they are satisfied, they can replace the original (e.g. by copying the formula back to the original and deleting the copy, or by updating references to point to the new metric and archiving the old one).

**Other pattern:** To test a **structural change** that involves a dimension (e.g. switching a metric to another dimension): duplicate the **dimension** first, then duplicate the **metric** and change its structure to use the copied dimension. That way the original dimension and metric stay untouched until the user validates.

---

## List properties: create a new property to test a formula

Pigment does not have a "copy property" feature. To test a **significant change** to a list property's formula without touching the original:

1. **Create a new property** on the same list, same type, with a name that makes the purpose clear (e.g. suffix ` test` or `_test`). If the name is already taken, increment (e.g. `PropertyName test 2`, `PropertyName_test_3`).
2. Set the **new formula** on this new property; leave the original property's formula unchanged.
3. Once the user has validated the result, they can rename, replace, or remove the original in the UI if they wish.

Use this for **large or uncertain** formula changes on properties. For small, low-risk edits, you can propose changing the existing property directly if the user agrees.

---

## Boards: no undo — ask copy or direct; if copy, reapply then clean up

Boards have **no undo**. When the user asks to change an **existing** board:

1. **Ask:** "Do you want the change applied directly to this board, or should I duplicate the board first so you can review the change on the copy?"
2. If the user chooses **copy first**:
   - Duplicate the board (e.g. name it `BoardName test`).
   - Apply the requested changes to the **copy** only.
   - Once the user has **validated** the copy:
     - Reapply the **same changes** to the **original** board.
     - Compare that the original now matches the validated copy; adjust if needed.
     - Delete the copied board.

If the user chooses to change the original directly, proceed on the original and remind them there is no undo.

---

## Summary

| Situation | Recommended approach |
| --------- | -------------------- |
| Structural or risky **metric** formula change | Use **duplicate_metrics**, change the copy, user validates then replace or archive. |
| Structural change involving a **dimension** | Duplicate dimension, duplicate metric, point metric to copied dimension; validate then consolidate. |
| Significant **list property** formula change | Create a **new property** (e.g. suffix ` test`), put new formula there; user validates then decides. |
| Change to an **existing board** | **Ask** copy first or direct; if copy first → change copy → user validates → reapply on original → compare → delete copy. |
| Small, low-risk change or user asks direct | Act directly on the existing block. |

For features that are not (or only partly) available in the agent's tools, see [Pigment features and agent tool coverage](./modeling_pigment_features_and_agent_tools.md).
