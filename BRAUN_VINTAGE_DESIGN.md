# Braun Vintage — Design style guide

> A visual system inspired by the industrial design of Braun (Dieter Rams, Dieter Lubs, 1960s–80s): radios, calculators and clocks treated as **instrument panels**. This guide defines the principles, palette, typography and web components, taking the implementation at `http://localhost:4000/` (Pentester Live Console) as its reference.

---

## 1. Principles

Rams's ten principles of good design translate into concrete rules for the interface:

| Principle | Rule applied on screen |
|---|---|
| **As little design as possible** | No decorative gradients, no shadows on static elements, no illustrations. Every line separates something. |
| **Honest** | A control looks like a control: 1px border, hand cursor, visible state. Nothing fakes depth it does not have. |
| **Useful and understandable** | Short lowercase labels, large tabular numbers, units in grey. |
| **Unobtrusive** | 95% of the screen is neutral (paper, white, graphite). Colour appears only to communicate state. |
| **Long-lasting** | Orthogonal geometry, square corners, a single type family. Nothing that depends on a trend. |
| **Thorough down to the last detail** | Constant spacing rhythm, baseline alignment, numbers with `tabular-nums`. |

### The orange accent is a pilot light
On Braun devices orange (or green) marks **what is switched on**: the power button, the dial needle, the “=” key. The interface works the same way:

- `--signal` = **live / active / main action**. Never decoration.
- If everything is orange, nothing is: as a rule, **one orange primary element per view** (plus small status indicators).

### Instrument vocabulary
Components are named and designed like parts of a device: *faceplate* (front panel), *lamp* (pilot light), *readout* (numeric reading), *meter* (VU meter), *scale/ticks* (graduation), *channel*, *ledger* (record book), *drawer*, *switch*.

---

## 2. Base palette

The same tokens serve both modes; only the values change.

### 2.1 Light mode

| Token | Value | Use |
|---|---|---|
| `--paper` | `#F0EFEB` | Page background (warm white, like the casing of an SK 4) |
| `--panel` | `#FFFFFF` | Cards / panels |
| `--inset` | `#E6E5E0` | Sunken areas (evidence, code, row hover) |
| `--line` | `#D5D4CF` | Soft borders, inner separators |
| `--rule` | `#92918D` | Strong borders, module outlines |
| `--ink` | `#292929` | Main text |
| `--steel` | `#92918D` | Secondary text, labels |
| `--signal` | `#F36B32` | Orange accent |
| `--signal-soft` | `#F9D9CA` | Soft accent ground, lamp halo |
| `--on-signal` | `#2A1608` | Text on the accent |
| `--ok` | `#46857A` | Positive states (confirmed, idle, finished) |

### 2.2 Dark mode

| Token | Value |
|---|---|
| `--paper` | `#292929` |
| `--panel` | `#323130` |
| `--inset` | `#3A3937` |
| `--line` | `#3E3D3B` |
| `--rule` | `#605F5B` |
| `--ink` | `#F0EFEB` |
| `--steel` | `#A3A29D` |
| `--signal` | `#F36B32` (same) |
| `--signal-soft` | `#5A3A2A` |
| `--on-signal` | `#2A1608` (same) |
| `--ok` | `#6FB3A4` |

> Dark mode is not a negative: the graphite `#292929` is the same colour as light mode's ink, and the panel steps up (`#323130`) instead of down. Surfaces get lighter as they come closer to the user.

### 2.3 Surface hierarchy

```
paper   ── page background
 └─ panel  ── module, card, drawer          (--rule border)
     └─ inset ── sunken block: code, evidence, row on hover
```

Rule: **never** stack two panels of the same colour without a border between them.

---

## 3. Extended palette (contrast colours)

For specific uses — severities, charts, category labels, alerts — a palette inspired by Braun's functional colours is added (the keys of the ET 66 calculator, the dials of the T 1000, the AB clocks). They are **earthy, muted colours**, never saturated neon.

### 3.1 Semantic colours (status and severity)

| Token | Light | Dark | Use |
|---|---|---|---|
| `--sev-critical` | `#BE3A2B` | `#D85A49` | Error, critical, destructive action |
| `--sev-high` | `#F36B32` | `#F36B32` | High (shares the signal orange) |
| `--sev-medium` | `#D99A3C` | `#E0A94E` | Warning, paused, interrupted |
| `--sev-low` | `#5E8A86` | `#6FA39E` | Low, weighty information |
| `--sev-info` | `#92918D` | `#A3A29D` | Neutral information |
| `--ok` | `#46857A` | `#6FB3A4` | Success, confirmed, idle |

The critical → high → medium → low ramp runs **from warm to cool**, so it stays legible even without the text label.

### 3.2 Category colours (charts, labels, data)

| Token | Light | Dark | Reference | Suggested use |
|---|---|---|---|---|
| `--c-blue` | `#2F5D8A` | `#7BA3CC` | Radio dial scale blue | Secondary links, data series, emphatic “info” |
| `--c-yellow` | `#E8B629` | `#EBC550` | Yellow ET 66 key | Highlight, marker, “pending” (fill only in light mode) |
| `--c-green` | `#4F7F3A` | `#8DB476` | Green “=” key | Positive series, “online” |
| `--c-brown` | `#6B4F3A` | `#B8977A` | Brown ET 66 keys | Neutral groups, files, history |
| `--c-teal` | `#5E8A86` | `#6FA39E` | (= `--sev-low`) | Secondary series |

Recommended series order for charts: **ink → signal → blue → green → yellow → brown → teal**. With more than 6 series, group the rest as “other”.

### 3.3 Text variants (accessibility)

Measured against WCAG 2.x. Several base colours **fall short of 4.5:1 as small text in light mode**:

| Colour | on light `--paper` | on light `--panel` | on dark `--paper` |
|---|---|---|---|
| `--ink` | 12.6 ✅ | 14.6 ✅ | 12.6 ✅ |
| `--steel` | **2.7 ⚠️** | **3.2 ⚠️** | 5.7 ✅ |
| `--signal` | **2.6 ⚠️** | **3.0 ⚠️** | 4.8 ✅ |
| `--ok` | 3.7 ⚠️ | 4.3 ⚠️ | 6.0 ✅ |
| `--sev-critical` | 4.8 ✅ | 5.5 ✅ | 3.8 ⚠️ |
| `--sev-medium` | **2.1 ⚠️** | **2.4 ⚠️** | 6.9 ✅ |
| `--c-blue` | 6.0 ✅ | 6.9 ✅ | 5.5 ✅ |
| `--c-yellow` | **1.6 ❌** | **1.9 ❌** | 8.8 ✅ |
| `--c-green` | 4.1 ⚠️ | 4.7 ✅ | 6.2 ✅ |
| `--c-brown` | 6.5 ✅ | 7.5 ✅ | 5.4 ✅ |
| `--on-signal` on `--signal` | — | — | 5.7 ✅ |
| `--ink` on `--c-yellow` | — | — | 7.7 ✅ |

That is why, in light mode, **text variants** are defined for when a colour has to be read as lettering (not as a fill, border or dot):

| Token | Light | Dark | Light contrast |
|---|---|---|---|
| `--steel-text` | `#6E6D69` | `#A3A29D` | 4.5 / 5.2 |
| `--signal-text` | `#B8481A` | `#F36B32` | 4.6 / 5.3 |
| `--ok-text` | `#3E6E6A` | `#6FB3A4` | 5.0 / 5.8 |
| `--medium-text` | `#7A5A00` | `#E0A94E` | 5.6 / 6.4 |

Rules:
- `--steel` is fine for 11px labels **only if** they are complementary (the information also exists elsewhere). For text that has to be read, use `--steel-text`.
- Orange as text (links, counters) uses `--signal-text` in light mode.
- Yellow is **never** text in light mode: use it as a fill with `--ink` on top.
- Colour is never the only carrier of meaning: it always comes with a label, glyph or position.

### 3.4 Full CSS block

```css
:root {
  /* base */
  --paper: #F0EFEB; --panel: #FFFFFF; --inset: #E6E5E0; --line: #D5D4CF; --rule: #92918D;
  --ink: #292929; --steel: #92918D; --signal: #F36B32; --signal-soft: #F9D9CA; --on-signal: #2A1608; --ok: #46857A;
  /* severity */
  --sev-critical: #BE3A2B; --sev-high: #F36B32; --sev-medium: #D99A3C; --sev-low: #5E8A86; --sev-info: #92918D;
  /* category */
  --c-blue: #2F5D8A; --c-yellow: #E8B629; --c-green: #4F7F3A; --c-brown: #6B4F3A; --c-teal: #5E8A86;
  /* accessible text */
  --steel-text: #6E6D69; --signal-text: #B8481A; --ok-text: #3E6E6A; --medium-text: #7A5A00;
  /* typography */
  --sans: "Archivo", system-ui, -apple-system, sans-serif;
  --mono: ui-monospace, "SF Mono", Menlo, monospace;
  color-scheme: light;
}

/* explicit dark */
:root[data-theme="dark"] {
  --paper: #292929; --panel: #323130; --inset: #3A3937; --line: #3E3D3B; --rule: #605F5B;
  --ink: #F0EFEB; --steel: #A3A29D; --signal: #F36B32; --signal-soft: #5A3A2A; --on-signal: #2A1608; --ok: #6FB3A4;
  --sev-critical: #D85A49; --sev-high: #F36B32; --sev-medium: #E0A94E; --sev-low: #6FA39E; --sev-info: #A3A29D;
  --c-blue: #7BA3CC; --c-yellow: #EBC550; --c-green: #8DB476; --c-brown: #B8977A; --c-teal: #6FA39E;
  --steel-text: #A3A29D; --signal-text: #F36B32; --ok-text: #6FB3A4; --medium-text: #E0A94E;
  color-scheme: dark;
}

/* dark by system preference (unless light is forced) */
@media (prefers-color-scheme: dark) {
  :root:not([data-theme="light"]) { /* same values as [data-theme="dark"] */ }
}
```

### 3.5 Derived mixes
Instead of creating more tokens, tints are derived with `color-mix`:

```css
/* subtle selected background */    background: color-mix(in srgb, var(--signal) 8%, var(--panel));
/* status background (active pill) */ background: color-mix(in srgb, var(--sc) 10%, var(--panel));
/* status border */                 border-color: color-mix(in srgb, var(--sc) 45%, var(--line));
/* lamp halo */                     box-shadow: 0 0 0 4px color-mix(in srgb, var(--signal) 22%, transparent);
```

`--sc` is a local variable that each component receives with its severity/status colour (`style="--sc: var(--sev-critical)"`).

---

## 4. Typography

| Role | Family | Size | Weight | Notes |
|---|---|---|---|---|
| Wordmark | Archivo | 16–17px | 700 | `letter-spacing: .3px` |
| Page title | Archivo | 20–21px | 600 | |
| Card / drawer title | Archivo | 15–18px | 600 | `line-height: 1.3` |
| Module header | Archivo | 12–13px | 600 | Small: the border already frames it |
| Body | Archivo | 13px | 400 | `line-height: 1.5` |
| Long read | Archivo | 12.5–13.5px | 400 | `line-height: 1.6`, `max-width: 60–80ch` |
| Label | Archivo | 11–11.5px | 500–600 | `--steel` |
| Section label | Archivo | 11px | 600 | UPPERCASE, `letter-spacing: .3–.4px` |
| Numeric readout | Archivo | 36px | 600 | `letter-spacing: -.5px`, `tabular-nums`, `line-height: 1` |
| Technical data | System mono | 10.5–12px | 400 | URLs, IDs, paths, times, axes |

Rules:
- **A single sans family** (Archivo, a grotesque in the Akzidenz/Helvetica tradition Braun used). Mono only for machine data.
- Every number that changes or gets compared takes `font-variant-numeric: tabular-nums`.
- Uppercase only in tiny labels and severity tags. Titles in sentence case.
- `-webkit-font-smoothing: antialiased` on `body`.

---

## 5. Shape, space and motion

### 5.1 Geometry
- **Square corners (`border-radius: 0`)** everywhere: buttons, inputs, cards, badges, avatars.
- **The only round exceptions**: lamps (`.lamp`), step nodes (`.step .sl`) and graph nodes — like real LEDs and knobs.
- **1px** borders. Status accents of **2–3px** on one side only (left or top).

### 5.2 Spacing scale
Base of ~2px, usual values: `4 · 6 · 8 · 10 · 12 · 14 · 16 · 18 · 20 · 24 · 28`.

| Use | Value |
|---|---|
| Between modules | 18px |
| Module padding | 12–16px (header) / 14–18px (body) |
| Large form padding | 26px 28px |
| Gap between list items | 6–9px |
| Page gutter | `max(20px, env(safe-area-inset-*))` |
| Max width | 1340px (app), 920px (settings), 740px (forms) |

### 5.3 Shadows
Flat by default. Shadow only on what **floats** above the rest:
- Toast: `0 4px 16px rgba(0,0,0,.12)`
- Dropdown menu: `0 12px 30px rgba(0,0,0,.14)`

### 5.4 Motion
- Standard curve: `cubic-bezier(.2,.7,.2,1)` (quick start, soft stop, like a dial).
- Durations: 120ms (hover), 150ms (switch), 200–240ms (drawer/scrim), 450ms (meter bars).
- Continuous animation only for what is live: `glow` 2.6s on lamps, `lampPulse` 1.6s on the active step, `blink` 1.1s cursor.
- Everything is switched off with `@media (prefers-reduced-motion: reduce)`.

### 5.5 Focus
```css
:focus-visible { outline: 2px solid var(--signal); outline-offset: 1px; }
input:focus, select:focus, textarea:focus { outline: none; border-color: var(--signal); }
```

---

## 6. Web components

Reference: the interface at `http://localhost:4000/`. Each component lists its structure, states and key CSS.

### 6.1 Faceplate (header / front panel)
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

### 6.2 Lamp (status pilot light)
A 9px circle. The only round element besides nodes.

| State | Style |
|---|---|
| Off | `background: var(--steel)` |
| Live | `background: var(--signal); box-shadow: 0 0 0 3px var(--signal-soft);` + `glow` animation |
| Finished | `background: var(--ok)` |
| Paused | `background: var(--sev-medium)` |

Always paired with text (`.status`, 11.5px, `--steel`).

### 6.3 Control tabs (`.ctrl`)
- Transparent background, `border-right: 1px solid var(--line)`, padding `9px 15px`, 12.5px/500, colour `--steel`.
- 8px square indicator (`.ind`) with a `--line` border.
- **Selected** (`aria-selected="true"`): `--ink` text, `--paper` background (it “sinks” into the page), indicator filled with `--signal`.
- Optional counter `.n` in `tabular-nums`.

### 6.4 Sub-tabs (`.subtab`)
Settings variant: container with a `--rule` border; the active one carries `box-shadow: inset 0 -2px 0 var(--signal)` (inner orange underline) and its icon in `--signal`.

### 6.5 Rail (workspace sidebar)
- Grid `248px | 1fr`; at ≤820px it becomes a horizontally scrolling row.
- **Item `.ws`**: `--line` border, transparent **3px left border**, `--panel` background, padding `10px 11px`.
  - Name 12.5px/600 with ellipsis; meta 10.5px `--steel`.
  - Badge `.ws-badge`: orange rectangle with `--on-signal`, `tabular-nums`.
  - Hover: `--rule` border. Active (`.on`): `--signal` left border, `--inset` background.
- **New** (`.ws-new`): **dashed** `--rule` border; hover → border and text `--signal`.

> Pattern: **dashed line = create action / gap to fill.**

### 6.6 Module (`.module`) — the base container
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

### 6.7 Cover (view header)
Presentation panel for an item.
- Title 19px; type as an outlined chip (`.ctype`); reference in `--steel` mono.
- State on the right (`.cstate`): `--ok` when idle, `--sev-medium` when stopped.
- Scope row (`.cscope`) separated by `border-top: 1px solid var(--line)`, holding chips.
- Actions on the right (`.cover-actions`).

### 6.8 Readout cluster (numeric readouts)
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

### 6.9 Meter (distribution VU meter)
- Header: 12px `h3` + total on the right.
- **Ticks** of 6px every 10px above the bar.
- Bar `.meter-bar`: 16px tall, `--inset` background, segments separated by `gap: 1px`, severity colours, `flex-grow .45s` transition.
- Legend: 10px squares + `--steel` label + value in `--ink` 600.

### 6.10 Channel (process / agent row)
A row with a **4px colour flag** on the left (`grid-template-columns: 4px 1fr`).

| State | Flag |
|---|---|
| running | `--signal` + a blinking `▍` cursor after the action |
| done | `--ink` |
| blocked / error | `--signal` |
| queued | `--line` |
| cancelled | diagonal `--steel` stripes + `opacity: .7` |

Body: kind (600) · depth (mini outlined badge) · target (mono, ellipsis) · state on the right. Second line: last action in mono.

### 6.11 Ledger / Record (list of findings)
- `.ledger` container with a `--rule` border.
- Each `.record`: `grid-template-columns: 5px 1fr`; the `.sv-flag` stripe takes `--sc`.
- Top row: **severity tag** `.sv-tag` (10.5px/600, UPPERCASE, `--sc` text and border, no fill) · mono category · mono target aligned right.
- Title 15px/600, `max-width: 64ch`.
- Hover: `--inset` background.
- Affected assets as `code` on `--inset`.

### 6.12 Filters (`.filters`) and segmented control (`.segctl`)
- **Filters**: a strip with a `--rule` border, buttons separated by `--line`, a 10px colour square + counter. Active: `--ink` text, `--paper` background.
- **Segmented control**: 30px tall; active is **inverted** (`background: var(--ink); color: var(--paper)`) — like a pressed key.

### 6.13 Buttons

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

### 6.14 Chips and badges

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

### 6.15 Forms
- Container `.setup`: panel with a `--rule` border, padding `26px 28px 24px`, `gap: 18px`, max width 740px.
- `.fsec` sections separated by `border-top: --line`, with an UPPERCASE 11px label.
- `label` 11.5px/600 above the field; `.hint` 11px `--steel` below.
- **Input / select / textarea**: `--paper` background (sunken relative to the panel), `--line` border, padding `9px 11px`, 13px. Textarea in 12px mono. Focus: `--signal` border, no outline.
- 2-column grid (`.grid2`) collapsing to 1 at ≤580px.

**Checkbox (`.auth input`)**: `appearance: none`, 18×18 square, `--rule` border, `--paper` background; checked → `--signal` fill and a `✓` in `--on-signal`.

**Switch (`.switch`)**: 38×22 rectangular, `--inset` background, 16px square `--panel` thumb. On: `--signal` track, thumb shifted 16px. The adjacent label turns `--ok`.

### 6.16 Methodology strip (process steps)
A row of 5 steps joined by a 1px horizontal line.

| State | Node (13px circle) | Line | Text |
|---|---|---|---|
| pending | `--rule` border, panel fill | `--line` | `--steel`, 500 |
| done | `--ink` fill | `--ink` | `--ink` |
| active | `--signal` fill + pulsing halo | — | `--ink` |
| stopped | `--sev-medium` fill | — | — |

At ≤860px it becomes vertical (the line turns vertical on the left).

### 6.17 Drawer (side detail panel)
- Fixed to the right, `width: min(500px, 100%)`, `--panel` background, `--rule` left border.
- Enters with `transform: translateX(100%) → none` in 240ms.
- Scrim: `rgba(20,20,20,.4)`, 200ms fade.
- Header: 12px `--steel` label + 28px square close button.
- Body: 18px title; `.dfield` fields with an UPPERCASE 11px label and a 13px mono value; `.dsec` sections separated by `--line`.
- **Evidence `.ev`**: 11px mono, `--steel` on `--inset`, `pre-wrap`.
- **Chain `.chain`**: 2px `--signal` left border, steps as `--inset` boxes joined by `→`.

### 6.18 Embedded chat (`.fchat`)
- User message: `--inset` background, aligned right, `max-width: 85%`.
- Assistant message: `--panel` background, **3px `--signal` left border**.
- System note: dashed border, `--steel` text.
- Send: solid orange button; disabled → `--inset`.

### 6.19 Workspace card (`.wcard`)
- Grid `repeat(auto-fill, minmax(290px, 1fr))`, gap 16px.
- `--rule` border with a **3px top border** that encodes state: `--line` (idle), `--signal` (running), `--sev-medium` (stopped). Hover: the whole border turns `--ink`.
- Content: type + state with lamp · 16px/600 name · mono reference · scope chips · **mini severity bar** (6px, gap 2px) · counters · footer with a bold figure and the time on the right.
- “New” card: dashed, centred, min. 200px tall.

### 6.20 Graph and timeline
- `.canvas` in a panel with a `--rule` border; a sticky 240px side legend `.spec`.
- Nodes: circle with a `--rule` border; `--ink` fill = completed; `--signal` border = active; dashed orange square = blocked.
- SVG labels: 11px/600 sans `--ink` + 10px mono sub-label `--steel`.
- Timeline: lanes on `--inset`, `--line` grid, 10px mono axes, a dashed (`2 3`) `--signal` **“now” line**, findings as orange diamonds (square rotated 45°), waiting as diagonal stripes.

### 6.21 User menu
- Trigger `.ubtn`: 32px tall, 24px square avatar (`--ink` with initials in `--paper`).
- Popover: `--rule` border, floating shadow, padding 6px, `min-width: 230px`.
- Items `.mi`: 12.5px, `--steel` icon, `--inset` hover; dangerous in `--sev-critical`; 1px `--line` separator.

### 6.22 System messages
| Component | Style |
|---|---|
| **Toast** | Bottom right, panel with a `--rule` border + **3px left border** (`--steel` / `--ok` / `--sev-critical`), floating shadow, max 380px |
| **Warning banner** | `--line` border + 3px `--sev-critical` left border, critical icon |
| **Info banner** (`.cfg-banner`) | `--line` border, `--steel` text with `b` in `--ink` |
| **Inline note/alert** | 2px left border (`--line` neutral, `--sev-critical` alert) + 8px padding |

### 6.23 Empty states
- `.empty-state`: bordered panel, padding `56px 24px`, centred.
- Mark: 26px `--inset` square with a `--line` border (a “hole” in the panel).
- 17px title, 12.5px `--steel` text up to 44ch, primary button below.
- Minimal empty list: centred 12px `--steel` mono text.

### 6.24 Sign-in screen (`.gate`)
- Full-screen `--paper` background, 380px card with a `--rule` border.
- Brand: 15px orange square + 17px/700 wordmark.
- Error in `--signal` (use `--signal-text` in light mode).
- Secondary option with a dashed border; advanced options in `<details>`.

### 6.25 Tables and key–value pairs
- `.roles`: 10.5px `--steel` 500 headers, rows separated by `--line`, first column in mono.
- `.kv`: grid `140px 1fr`; `dt` in `--steel`, `dd` in 12px mono with `overflow-wrap: anywhere`.

---

## 7. Iconography
- Linear stroke, 15px (13px in compact menus), `stroke: currentColor`, no fill.
- Default colour `--steel`; it turns `--signal` only when its container is active.
- Typographic glyphs allowed as functional icons: `✓ ▸ ▾ → ▍ ●`.

---

## 8. Responsive
| Breakpoint | Change |
|---|---|
| ≤ 860px | Process steps go vertical |
| ≤ 820px | Rail moves to the top as a horizontal row; graph to one column; on the home page the rail is hidden |
| ≤ 760px | 2-column grids become 1 |
| ≤ 720px | Button separators hidden |
| ≤ 640px | Search goes full width; settings rows to 2 columns |
| ≤ 580px | Forms to one column |

Always respect `env(safe-area-inset-*)` in the header, gutters and toasts, and use `scrollbar-gutter: stable` on `html`.

---

## 9. Checklist

- [ ] Does the background use `--paper` and containers use `--panel` with a `--rule` border?
- [ ] Is there at most one orange primary action per view?
- [ ] Does orange mean something live/active rather than decorate?
- [ ] Are all corners square (except lamps and nodes)?
- [ ] Do numbers use `tabular-nums`?
- [ ] Is technical data in mono and everything else in Archivo?
- [ ] Is state communicated with colour **and** text/glyph?
- [ ] Does small text in light mode use `--steel-text` / `--signal-text` when it has to be read?
- [ ] Does it work in dark mode by changing only tokens, with no selector changes?
- [ ] Are animations disabled with `prefers-reduced-motion`?
- [ ] Does it look right at 375px wide with no horizontal scroll?
