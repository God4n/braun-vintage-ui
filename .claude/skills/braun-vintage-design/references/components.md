# Web components — Braun Vintage

Reference: the interface of the original console (`http://localhost:4000/`). Each component lists its structure, states and key CSS. Class names such as `.wcard`, `.ledger` or `.setup` come from that console; the generalised, domain-neutral versions (`.card`, `.form-panel`, `.item`, …) are in the `braun-ui/` gallery, which also holds the 66 shadcn/ui components and the knob, dial, fader and gauge instruments. Where the two differ (for example Steps, section 16), the gallery is the newer one.

### 1. Faceplate (header / front panel)
A fixed top bar, like the front of a device.

- `position: sticky; top: 0; background: var(--panel); border-bottom: 1px solid var(--rule);`
- Row 1 (`.mission`): **wordmark** (700, 16px) · **model** (11px, `--steel`, separated by a `--line` left border) · on the right, **connection status** and buttons.
- Row 2 (`.controls`): view tabs, separated by `border-top: 1px solid var(--line)`, scrolling horizontally with no scrollbar.

```
┌──────────────────────────────────────────────────────────────┐
│ WORDMARK │ model-x             ● connected   [◐] [▣ user]    │
├──────────┬────────────┬──────────┬──────────┬────────────────┤
│ ■ View   │ □ Findings 12 │ □ Graph │ □ Timeline │             │
└──────────┴────────────┴──────────┴──────────┴────────────────┘
```

### 2. Lamp (status pilot light)
A 9px circle. The only round element besides nodes.

| State | Style |
|---|---|
| Off | `background: var(--steel)` |
| Live | `background: var(--signal); box-shadow: 0 0 0 3px var(--signal-soft);` + `glow` animation |
| Finished | `background: var(--ok)` |
| Paused | `background: var(--sev-medium)` |

Always paired with text (`.status`, 11.5px, `--steel`).

### 3. Control tabs (`.ctrl`)
- Transparent background, `border-right: 1px solid var(--line)`, padding `9px 15px`, 12.5px/500, colour `--steel`.
- 8px square indicator (`.ind`) with a `--line` border.
- **Selected** (`aria-selected="true"`): `--ink` text, `--paper` background (it “sinks” into the page), indicator filled with `--signal`.
- Optional counter `.n` in `tabular-nums`.

### 4. Sub-tabs (`.subtab`)
Settings variant: container with a `--rule` border; the active one carries `box-shadow: inset 0 -2px 0 var(--signal)` (inner orange underline) and its icon in `--signal`.

### 5. Rail (workspace sidebar)
- Grid `248px | 1fr`; at ≤820px it becomes a horizontally scrolling row.
- **Item `.ws`**: `--line` border, transparent **3px left border**, `--panel` background, padding `10px 11px`.
  - Name 12.5px/600 with ellipsis; meta 10.5px `--steel`.
  - Badge `.ws-badge`: orange rectangle with `--on-signal`, `tabular-nums`.
  - Hover: `--rule` border. Active (`.on`): `--signal` left border, `--inset` background.
- **New** (`.ws-new`): **dashed** `--rule` border; hover → border and text `--signal`.

> Pattern: **dashed line = create action / gap to fill.**

### 6. Module (`.module`) — the base container
```
┌─ border 1px --rule ────────────────────────┐
│ h2 12px/600                     count  ↗   │  header: padding 12px 16px, border-bottom --line
├────────────────────────────────────────────┤
│ content                                     │
└────────────────────────────────────────────┘
```
- `background: var(--panel); border: 1px solid var(--rule);`
- Inner lists have `max-height: 62vh; overflow-y: auto` and a 10px scrollbar with a `--line` thumb.
- Variants with the same skeleton: `.cfg-sec`, `.spec`, `.meter`, `.method`, `.ledger`.

### 7. Cover (view header)
Presentation panel for an item.
- Title 19px; type as an outlined chip (`.ctype`); reference in `--steel` mono.
- State on the right (`.cstate`): `--ok` when idle, `--sev-medium` when stopped.
- Scope row (`.cscope`) separated by `border-top: 1px solid var(--line)`, holding chips.
- Actions on the right (`.cover-actions`).

### 8. Readout cluster (numeric readouts)
The most “Braun” piece: a row of readings like an amplifier's displays.

- Container `.cluster`: `grid-template-columns: repeat(auto-fit, minmax(148px, 1fr))`, `--rule` border.
- Each `.readout`: `--line` vertical separator (except the first), padding `15px 18px 13px`.
  - Label `.rl` 11px `--steel`.
  - Value `.rv` **36px/600**, `tabular-nums`, `line-height: 1`; unit `small` 12px `--steel`.
  - **Scale** `.scale`: 7px of vertical ticks every 7px
    `repeating-linear-gradient(90deg, var(--line) 0 1px, transparent 1px 7px)`.
- `.alive` variant: value and ticks in `--signal`.

```
┌────────────┬────────────┬────────────┬────────────┐
│ agents     │ findings   │ critical   │ duration   │
│ 4  active  │ 27         │ 3          │ 12 min     │
│ ||||||||||| │ |||||||||| │ |||||||||| │ |||||||||| │
└────────────┴────────────┴────────────┴────────────┘
```

### 9. Meter (distribution VU meter)
- Header: 12px `h3` + total on the right.
- **Ticks** of 6px every 10px above the bar.
- Bar `.meter-bar`: 16px tall, `--inset` background, segments separated by `gap: 1px`, severity colours, `flex-grow .45s` transition.
- Legend: 10px squares + `--steel` label + value in `--ink` 600.

### 10. Channel (process / agent row)
A row with a **4px colour flag** on the left (`grid-template-columns: 4px 1fr`).

| State | Flag |
|---|---|
| running | `--signal` + a blinking `▍` cursor after the action |
| done | `--ink` |
| blocked / error | `--signal` |
| queued | `--line` |
| cancelled | diagonal `--steel` stripes + `opacity: .7` |

Body: kind (600) · depth (mini outlined badge) · target (mono, ellipsis) · state on the right. Second line: last action in mono.

### 11. Ledger / Record (list of findings)
- `.ledger` container with a `--rule` border.
- Each `.record`: `grid-template-columns: 5px 1fr`; the `.sv-flag` stripe takes `--sc`.
- Top row: **severity tag** `.sv-tag` (10.5px/600, UPPERCASE, `--sc` text and border, no fill) · mono category · mono target aligned right.
- Title 15px/600, `max-width: 64ch`.
- Hover: `--inset` background.
- Affected assets as `code` on `--inset`.

### 12. Filters (`.filters`) and segmented control (`.segctl`)
- **Filters**: a strip with a `--rule` border, buttons separated by `--line`, a 10px colour square + counter. Active: `--ink` text, `--paper` background.
- **Segmented control**: 30px tall; active is **inverted** (`background: var(--ink); color: var(--paper)`) — like a pressed key.

### 13. Buttons

| Class | Background | Border | Text | Hover |
|---|---|---|---|---|
| `.btn` (secondary) | `--panel` | `--line` | `--ink` | `--rule` border |
| `.btn-primary` | `--signal` | `--signal` | `--on-signal`, 600 | `filter: brightness(1.06)` |
| `.btn-danger` | `--panel` | critical at 40% | `--sev-critical` | critical fill, white text |
| `.btn-ghost` | transparent | transparent | `--steel` | `--ink` text, `--line` border |
| `.btn-icon` | — | — | — | 32×32, padding 0 |
| `:disabled` | — | — | — | `opacity: .45; cursor: not-allowed` |

Base: `font-size: 12.5px; font-weight: 500; line-height: 1; padding: 8px 13px; gap: 7px;` with a 15px icon.
Form primary buttons (`.start`, `.cfg-save`): 13px/600, padding `10–11px 22–24px`; disabled ones switch to `--inset` + `--steel`.
Separator between groups: `.btn-sep` (1×22px, `--line`).

### 14. Chips and badges

| Component | Style |
|---|---|
| `.chip` | 11.5px, padding `1px 7px`, `--line` border, no fill |
| `.chip.ex` (excluded) | `--steel` text, struck through in `--signal` |
| `.ctype` | 11px `--steel`, `--line` border, padding `2px 9px` |
| `.who` / `.ai` | 10.5px, `line-height: 1`, padding `3px 6px`, `--line` border |
| `.ai-confirmed` | `--ok` text, ok border at 45% |
| `.ai-unverified` | `--sev-medium` text, border at 45% |
| `.ai-suspect` | `--sev-critical` text, border at 45% |
| `.who.claude` | orange text and border (AI agent) |
| `.statpill[aria-pressed]` | `--sc` text, 45% border, 10% fill |

Rule: badges are **outlined**, not filled. Solid fill is reserved for the rail's orange counter and the primary button.

### 15. Forms
- Container `.setup`: panel with a `--rule` border, padding `26px 28px 24px`, `gap: 18px`, max width 740px.
- `.fsec` sections separated by `border-top: --line`, with an UPPERCASE 11px label.
- `label` 11.5px/600 above the field; `.hint` 11px `--steel` below.
- **Input / select / textarea**: `--paper` background (sunken relative to the panel), `--line` border, padding `9px 11px`, 13px. Textarea in 12px mono. Focus: `--signal` border, no outline.
- 2-column grid (`.grid2`) collapsing to 1 at ≤580px.

**Checkbox (`.auth input`)**: `appearance: none`, 18×18 square, `--rule` border, `--paper` background; checked → `--signal` fill and a `✓` in `--on-signal`.

**Switch (`.switch`)**: 38×22 rectangular, `--inset` background, 16px square `--panel` thumb. On: `--signal` track, thumb shifted 16px. The adjacent label turns `--ok`.

### 16. Methodology strip (process steps)
> Superseded by the `steps` component in the `braun-ui/` gallery: self-numbering nodes, vertical and scale variants, interactive navigation. The original version is kept here for reference.

A row of 5 steps joined by a 1px horizontal line.

| State | Node (13px circle) | Line | Text |
|---|---|---|---|
| pending | `--rule` border, panel fill | `--line` | `--steel`, 500 |
| done | `--ink` fill | `--ink` | `--ink` |
| active | `--signal` fill + pulsing halo | — | `--ink` |
| stopped | `--sev-medium` fill | — | — |

At ≤860px it becomes vertical (the line turns vertical on the left).

### 17. Drawer (side detail panel)
- Fixed to the right, `width: min(500px, 100%)`, `--panel` background, `--rule` left border.
- Enters with `transform: translateX(100%) → none` in 240ms.
- Scrim: `rgba(20,20,20,.4)`, 200ms fade.
- Header: 12px `--steel` label + 28px square close button.
- Body: 18px title; `.dfield` fields with an UPPERCASE 11px label and a 13px mono value; `.dsec` sections separated by `--line`.
- **Evidence `.ev`**: 11px mono, `--steel` on `--inset`, `pre-wrap`.
- **Chain `.chain`**: 2px `--signal` left border, steps as `--inset` boxes joined by `→`.

### 18. Embedded chat (`.fchat`)
- User message: `--inset` background, aligned right, `max-width: 85%`.
- Assistant message: `--panel` background, **3px `--signal` left border**.
- System note: dashed border, `--steel` text.
- Send: solid orange button; disabled → `--inset`.

### 19. Workspace card (`.wcard`)
- Grid `repeat(auto-fill, minmax(290px, 1fr))`, gap 16px.
- `--rule` border with a **3px top border** that encodes state: `--line` (idle), `--signal` (running), `--sev-medium` (stopped). Hover: the whole border turns `--ink`.
- Content: type + state with lamp · 16px/600 name · mono reference · scope chips · **mini severity bar** (6px, gap 2px) · counters · footer with a bold figure and the time on the right.
- “New” card: dashed, centred, min. 200px tall.

### 20. Graph and timeline
- `.canvas` in a panel with a `--rule` border; a sticky 240px side legend `.spec`.
- Nodes: circle with a `--rule` border; `--ink` fill = completed; `--signal` border = active; dashed orange square = blocked.
- SVG labels: 11px/600 sans `--ink` + 10px mono sub-label `--steel`.
- Timeline: lanes on `--inset`, `--line` grid, 10px mono axes, a dashed (`2 3`) `--signal` **“now” line**, findings as orange diamonds (square rotated 45°), waiting as diagonal stripes.

### 21. User menu
- Trigger `.ubtn`: 32px tall, 24px square avatar (`--ink` with initials in `--paper`).
- Popover: `--rule` border, floating shadow, padding 6px, `min-width: 230px`.
- Items `.mi`: 12.5px, `--steel` icon, `--inset` hover; dangerous in `--sev-critical`; 1px `--line` separator.

### 22. System messages
| Component | Style |
|---|---|
| **Toast** | Bottom right, panel with a `--rule` border + **3px left border** (`--steel` / `--ok` / `--sev-critical`), floating shadow, max 380px |
| **Warning banner** | `--line` border + 3px `--sev-critical` left border, critical icon |
| **Info banner** (`.cfg-banner`) | `--line` border, `--steel` text with `b` in `--ink` |
| **Inline note/alert** | 2px left border (`--line` neutral, `--sev-critical` alert) + 8px padding |

### 23. Empty states
- `.empty-state`: bordered panel, padding `56px 24px`, centred.
- Mark: 26px `--inset` square with a `--line` border (a “hole” in the panel).
- 17px title, 12.5px `--steel` text up to 44ch, primary button below.
- Minimal empty list: centred 12px `--steel` mono text.

### 24. Sign-in screen (`.gate`)
- Full-screen `--paper` background, 380px card with a `--rule` border.
- Brand: 15px orange square + 17px/700 wordmark.
- Error in `--signal` (use `--signal-text` in light mode).
- Secondary option with a dashed border; advanced options in `<details>`.

### 25. Tables and key–value pairs
- `.roles`: 10.5px `--steel` 500 headers, rows separated by `--line`, first column in mono.
- `.kv`: grid `140px 1fr`; `dt` in `--steel`, `dd` in 12px mono with `overflow-wrap: anywhere`.
