---
name: braun-vintage-design
description: Braun Vintage design system (Dieter Rams style, instrument-panel look) for web interfaces. Use it when creating, editing or reviewing any UI, page, component, CSS, chart or artifact in a Braun / vintage / functionalist style, or when the colour tokens (--paper, --signal, etc.), the typography or the components of this system are requested.
---

# Braun Vintage — Design system

Braun industrial design (Dieter Rams, Dieter Lubs, 1960–80) applied to web interfaces: every screen is an **instrument panel**. Neutral, orthogonal, honest; colour only communicates state.

**Before designing or laying out a component, read `references/components.md`.** It holds the full specification (structure, states and CSS) of the 25 original components: faceplate, lamp, tabs, rail, module, cover, readout, meter, channel, ledger, filters, buttons, chips, forms, switch, steps, drawer, chat, cards, graph/timeline, menu, toasts/banners, empty states, sign-in and tables.

**Ready-to-copy examples:** `braun-ui/` (at the project root) is the component gallery: all 66 shadcn/ui components plus 11 instruments of its own (`knob`, `dial`, `fader`, `gauge`, `level`, `readout`, `meter`, `lamp`, `scale`, `steps`, `faceplate`). The sources are `braun-ui/src/*.html`, and `braun-ui/build.sh` joins them into `braun-ui/index.html`. Each component is one contiguous block: CSS in `<style data-css="NAME">`, example HTML in `<section data-view="NAME">` → `.dx-stage`, and JS (if it needs any) in `<script data-js="NAME">`. Names are shadcn's in kebab-case (`button`, `data-table`, `dropdown-menu`, `input-otp`…; the sidebar is `sidebar-nav`). Search with grep for `data-css="NAME"` in `braun-ui/src/` and read only that block. `data-needs` lists the other components whose CSS the example uses, and `data-js` the shared scripts (`range` drives knobs, dials, faders and sliders; `popover` and `dialog` open menus and modals). `dx-*` classes belong to the documentation site, not to the system. After editing a source file, run `braun-ui/build.sh`. The site is written in English; Spanish lives in `data-es` attributes (prose) and in `window.DX_ES` in `braun-ui/src/80-es.html` (example text), so keep both in sync when adding content.

**Knobs and scales are the motif of the system:** every continuous value is read against a row of ticks (repeating gradients, no images) and, where it fits, set with a knob. Use `scale` for the ticks and `knob` / `dial` / `gauge` before reaching for a generic control.

---

## 1. Principles

| Principle | Rule on screen |
|---|---|
| As little as possible | No decorative gradients, no shadows on static elements, no illustrations. Every line separates something. |
| Honest | A control looks like a control: 1px border, hand cursor, visible state. Nothing fakes depth. |
| Understandable | Short labels, large tabular numbers, units in grey. |
| Unobtrusive | ~95% of the screen is neutral (paper, white, graphite). |
| Long-lasting | Orthogonal geometry, square corners, a single type family. |
| Thorough | Constant spacing rhythm, baseline alignment, `tabular-nums`. |

**Orange is a pilot light.** `--signal` = live / active / main action; never decoration. One orange primary element per view (plus small status indicators).

**Instrument vocabulary:** faceplate, lamp (pilot light), readout (numeric reading), meter (VU meter), scale / ticks (graduation), channel, ledger (record list), drawer, switch.

**Recurring patterns:**
- **Dashed** line = create / gap to fill.
- A **2–5px coloured side border** (left or top) = state of the element.
- A **selected** element sinks: `--paper` or `--inset` background inside a white panel.
- Badges are **outlined**, not filled. Solid fill only for the primary button and orange counters.

---

## 2. Base palette

The same tokens serve both modes; only the values change.

| Token | Light | Dark | Use |
|---|---|---|---|
| `--paper` | `#F0EFEB` | `#292929` | Page background |
| `--panel` | `#FFFFFF` | `#323130` | Cards / panels |
| `--inset` | `#E6E5E0` | `#3A3937` | Sunken areas (evidence, code, hover) |
| `--line` | `#D5D4CF` | `#3E3D3B` | Soft borders, inner separators |
| `--rule` | `#92918D` | `#605F5B` | Strong borders, module outlines |
| `--ink` | `#292929` | `#F0EFEB` | Main text |
| `--steel` | `#92918D` | `#A3A29D` | Secondary text, labels |
| `--signal` | `#F36B32` | `#F36B32` | Orange accent |
| `--signal-soft` | `#F9D9CA` | `#5A3A2A` | Soft accent ground, lamp halo |
| `--on-signal` | `#2A1608` | `#2A1608` | Text on the accent |
| `--ok` | `#46857A` | `#6FB3A4` | Positive (confirmed, idle, finished) |

Dark mode is not a negative: surfaces get **lighter** as they come closer to the user (paper → panel → inset).

**Surface hierarchy:**
```
paper   ── page background
 └─ panel  ── module, card, drawer          (--rule border)
     └─ inset ── code, evidence, row on hover
```
Never stack two surfaces of the same colour without a border between them.

---

## 3. Extended palette

Earthy, muted colours (the keys of the ET 66, the dials of the T 1000, the AB clocks). Never saturated.

### Semantic (status and severity)
| Token | Light | Dark | Use |
|---|---|---|---|
| `--sev-critical` | `#BE3A2B` | `#D85A49` | Error, critical, destructive |
| `--sev-high` | `#F36B32` | `#F36B32` | High (= signal) |
| `--sev-medium` | `#D99A3C` | `#E0A94E` | Warning, paused, interrupted |
| `--sev-low` | `#5E8A86` | `#6FA39E` | Low |
| `--sev-info` | `#92918D` | `#A3A29D` | Neutral information |

The ramp runs from warm to cool so it can be read without a label.

### Category (charts, labels, data)
| Token | Light | Dark | Reference | Use |
|---|---|---|---|---|
| `--c-blue` | `#2F5D8A` | `#7BA3CC` | Radio dial scale | Series, secondary links |
| `--c-yellow` | `#E8B629` | `#EBC550` | Yellow ET 66 key | Highlight, pending (fill only in light) |
| `--c-green` | `#4F7F3A` | `#8DB476` | “=” key | Positive series, online |
| `--c-brown` | `#6B4F3A` | `#B8977A` | Brown ET 66 keys | Neutral groups, history |
| `--c-teal` | `#5E8A86` | `#6FA39E` | = sev-low | Secondary series |

Series order: **ink → signal → blue → green → yellow → brown → teal**. More than 6 → group the rest as “other”.

### Accessible text (WCAG ≥ 4.5:1)
In light mode `--steel` (2.7:1), `--signal` (2.6:1), `--ok` (3.7:1), `--sev-medium` (2.1:1) and `--c-yellow` (1.6:1) **do not work as small text**. For lettering use:

| Token | Light | Dark |
|---|---|---|
| `--steel-text` | `#6E6D69` | `#A3A29D` |
| `--signal-text` | `#B8481A` | `#F36B32` |
| `--ok-text` | `#3E6E6A` | `#6FB3A4` |
| `--medium-text` | `#7A5A00` | `#E0A94E` |

- The base colours remain valid for fills, borders, dots and stripes.
- Yellow is never text in light mode: use it as a fill with `--ink` on top (7.7:1).
- `--on-signal` on `--signal`: 5.7:1 ✅. In dark mode `--sev-critical` as text is 3.8:1: use it at ≥14px/600 or as a border.
- Colour is never the only carrier of meaning: always pair it with text, a glyph or position.

### Derived mixes (instead of creating tokens)
```css
background: color-mix(in srgb, var(--signal) 8%, var(--panel));   /* subtle selection */
background: color-mix(in srgb, var(--sc) 10%, var(--panel));       /* active pill */
border-color: color-mix(in srgb, var(--sc) 45%, var(--line));      /* status border */
box-shadow: 0 0 0 4px color-mix(in srgb, var(--signal) 22%, transparent); /* halo */
```
`--sc` is a local variable holding the component's status colour: `style="--sc: var(--sev-critical)"`.

### CSS block
```css
:root {
  --paper: #F0EFEB; --panel: #FFFFFF; --inset: #E6E5E0; --line: #D5D4CF; --rule: #92918D;
  --ink: #292929; --steel: #92918D; --signal: #F36B32; --signal-soft: #F9D9CA; --on-signal: #2A1608; --ok: #46857A;
  --sev-critical: #BE3A2B; --sev-high: #F36B32; --sev-medium: #D99A3C; --sev-low: #5E8A86; --sev-info: #92918D;
  --c-blue: #2F5D8A; --c-yellow: #E8B629; --c-green: #4F7F3A; --c-brown: #6B4F3A; --c-teal: #5E8A86;
  --steel-text: #6E6D69; --signal-text: #B8481A; --ok-text: #3E6E6A; --medium-text: #7A5A00;
  --sans: "Archivo", system-ui, -apple-system, sans-serif;
  --mono: ui-monospace, "SF Mono", Menlo, monospace;
  color-scheme: light;
}
:root[data-theme="dark"] {
  --paper: #292929; --panel: #323130; --inset: #3A3937; --line: #3E3D3B; --rule: #605F5B;
  --ink: #F0EFEB; --steel: #A3A29D; --signal: #F36B32; --signal-soft: #5A3A2A; --on-signal: #2A1608; --ok: #6FB3A4;
  --sev-critical: #D85A49; --sev-high: #F36B32; --sev-medium: #E0A94E; --sev-low: #6FA39E; --sev-info: #A3A29D;
  --c-blue: #7BA3CC; --c-yellow: #EBC550; --c-green: #8DB476; --c-brown: #B8977A; --c-teal: #6FA39E;
  --steel-text: #A3A29D; --signal-text: #F36B32; --ok-text: #6FB3A4; --medium-text: #E0A94E;
  color-scheme: dark;
}
@media (prefers-color-scheme: dark) {
  :root:not([data-theme="light"]) { /* repeat the values of [data-theme="dark"] */ }
}
body { background: var(--paper); color: var(--ink); font-family: var(--sans); font-size: 13px; line-height: 1.5; -webkit-font-smoothing: antialiased; }
html { scrollbar-gutter: stable; }
```
Font: `https://fonts.googleapis.com/css2?family=Archivo:wght@400;500;600;700&display=swap`

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
| Numeric readout | Archivo | 36px | 600 | `letter-spacing: -.5px`, `line-height: 1` |
| Technical data | Mono | 10.5–12px | 400 | URLs, IDs, paths, times, axes |

- One sans only (Archivo); mono only for machine data.
- Numbers that change or get compared: `font-variant-numeric: tabular-nums`.
- Uppercase only in tiny labels and severity tags. Titles in sentence case.

---

## 5. Shape, space and motion

**Geometry**
- `border-radius: 0` everywhere (buttons, inputs, cards, badges, avatars, switch).
- Round only: knobs, lamps, step nodes and graph nodes.
- 1px borders; status accents of 2–3px on one side only (4–5px as a row stripe).

**Space** — scale `4 · 6 · 8 · 10 · 12 · 14 · 16 · 18 · 20 · 24 · 28`
| Use | Value |
|---|---|
| Between modules | 18px |
| Module header / body | 12px 16px / 14–18px |
| Large form | 26px 28px |
| Between list items | 6–9px |
| Gutter | `max(20px, env(safe-area-inset-*))` |
| Max width | 1340px app · 920px settings · 740px forms |

**Shadows** — flat by default; only what floats:
- Toast: `0 4px 16px rgba(0,0,0,.12)`
- Menu: `0 12px 30px rgba(0,0,0,.14)`
- Scrim: `rgba(20,20,20,.4)`

**Motion**
- Curve: `cubic-bezier(.2,.7,.2,1)`.
- 120ms hover · 150ms switch · 200–240ms drawer/scrim · 450ms bars.
- Continuous only on what is live: `glow` 2.6s (opacity 1→.5), `lampPulse` 1.6s (halo), `blink` 1.1s (`▍` cursor).
- Everything off under `@media (prefers-reduced-motion: reduce)`.

**Focus**
```css
:focus-visible { outline: 2px solid var(--signal); outline-offset: 1px; }
input:focus, select:focus, textarea:focus { outline: none; border-color: var(--signal); }
```

---

## 6. Components

Full specification in **`references/components.md`**. Summary of the most used:

- **Module**: `background: var(--panel); border: 1px solid var(--rule);` header `padding: 12px 16px; border-bottom: 1px solid var(--line);` with a 12px/600 h2 and a counter on the right.
- **Button**: 12.5px/500, `padding: 8px 13px`, `--line` border, `--panel` background. Primary: `--signal` background, `--on-signal` text, 600. Danger: critical text, fills on hover. Ghost: no border, `--steel`. Disabled: `opacity: .45`.
- **Input**: `--paper` background, `--line` border, `padding: 9px 11px`, 13px; focus → `--signal` border.
- **Lamp**: 9px circle; live = `--signal` + `box-shadow: 0 0 0 3px var(--signal-soft)` + glow; finished `--ok`; paused `--sev-medium`; off `--steel`.
- **Readout**: 36px/600 tabular value + tick scale `repeating-linear-gradient(90deg, var(--line) 0 1px, transparent 1px 7px)`; `.alive` in orange.
- **Selected tab**: `--ink` text, `--paper` background, 8px square `--signal` indicator (or `box-shadow: inset 0 -2px 0 var(--signal)`).
- **Row with state**: `grid-template-columns: 4px 1fr` (or 5px) with the stripe coloured by `--sc`.
- **Chip/badge**: 10.5–11.5px, `--line` border, no fill; status variants with `--sc` text and a 45% border.
- **Toast/banner**: bordered panel + 3px left border in the status colour.

---

## 7. Iconography
- Linear, 15px (13px in menus), `stroke: currentColor`, no fill.
- Colour `--steel`; `--signal` only when the container is active.
- Glyphs allowed as icons: `✓ ▸ ▾ → ▍ ●`.

## 8. Responsive
| Breakpoint | Change |
|---|---|
| ≤ 860px | Process steps go vertical |
| ≤ 820px | Rail moves to the top as a horizontal row; graph to one column |
| ≤ 760px | 2-column grids → 1 |
| ≤ 720px | Button separators hidden |
| ≤ 640px | Search goes full width |
| ≤ 580px | Forms to one column |

Respect `env(safe-area-inset-*)` in the header, gutters and toasts. No horizontal scroll at 375px.

---

## 9. Final checklist

- [ ] `--paper` background, `--panel` containers with a `--rule` border.
- [ ] At most one orange primary action per view; orange means something live or active.
- [ ] Square corners (except knobs, lamps and nodes).
- [ ] Numbers with `tabular-nums`; technical data in mono, everything else in Archivo.
- [ ] State communicated with colour **and** text/glyph.
- [ ] Small text in light mode uses `--steel-text` / `--signal-text` when it has to be read.
- [ ] Dark mode works by changing tokens only, with no extra selectors.
- [ ] Animations disabled under `prefers-reduced-motion`.
- [ ] No horizontal scroll at 375px.
