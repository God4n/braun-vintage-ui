<div align="center">

# Braun Vintage UI

**Web components built like an instrument panel.**

Plain HTML and CSS, inspired by the industrial design of Braun in the 1960s–80s (Dieter Rams, Dieter Lubs):
neutral surfaces, square corners, knobs, graduated scales, and an orange that only lights up when something is live.

[![HTML + CSS](https://img.shields.io/badge/stack-HTML%20%2B%20CSS-F36B32?style=flat-square)](#getting-started)
[![No build step](https://img.shields.io/badge/runtime-zero%20dependencies-292929?style=flat-square)](#getting-started)
[![Light & dark](https://img.shields.io/badge/themes-light%20%2B%20dark-92918D?style=flat-square)](#theming)
[![EN / ES](https://img.shields.io/badge/docs-EN%20%2F%20ES-46857A?style=flat-square)](#documentation)

<img src="docs/img/overview.png" alt="Braun Vintage UI gallery, light mode" width="900">

</div>

---

## What is this?

A design system with three parts:

| | |
|---|---|
| **Component gallery** (`braun-ui/`) | A single-file site with every component running live, plus the HTML / CSS / JS to copy. |
| **Style guide** (`BRAUN_VINTAGE_DESIGN.md`) | Principles, palette, typography, spacing and the spec of each component. Also in Spanish. |
| **Claude skill** (`.claude/skills/braun-vintage-design`) | The same system packaged as a skill, so Claude builds new UI in this style. |

The gallery covers **all 66 shadcn/ui components** re-drawn in this language, plus **11 instruments of its own**:
`knob`, `dial`, `fader`, `gauge`, `level`, `readout`, `meter`, `lamp`, `scale`, `steps` and `faceplate`.

## Screenshots

### Instruments

Every continuous value is read against a row of ticks (drawn with repeating gradients, no images) and set with a knob where it fits.

<img src="docs/img/knob.png" alt="Knob component page" width="900">

### Dark mode

Same tokens, different values. Follows the system preference or the toggle in the header.

<img src="docs/img/overview-dark.png" alt="Gallery in dark mode" width="900">

### Components

<table>
<tr>
<td width="50%"><img src="docs/img/button.png" alt="Button"></td>
<td width="50%"><img src="docs/img/data-table.png" alt="Data table"></td>
</tr>
<tr>
<td align="center"><sub>Buttons — one orange primary per view</sub></td>
<td align="center"><sub>Data table</sub></td>
</tr>
</table>

<img src="docs/img/card.png" alt="Card, dark mode" width="900">

## Design principles

Rams's ten principles, turned into concrete rules for the screen:

- **As little design as possible.** No decorative gradients, no shadows on static elements, no illustrations. Every line separates something.
- **Honest.** A control looks like a control: 1 px border, visible state. Nothing fakes depth it does not have.
- **Understandable.** Short labels, large tabular numbers, units in grey.
- **Unobtrusive.** About 95% of the screen is neutral. Colour only communicates state.
- **Long-lasting.** Orthogonal geometry, square corners, one type family.

> **Orange is a pilot light.** `--signal` means live, active or the main action. Never decoration. As a rule: one orange primary element per view.

## Getting started

No package, no bundler. Three steps:

1. **Tokens.** Copy the colour tokens block (see *Color tokens* in the gallery) into your stylesheet. It covers light and dark.
2. **Type.** Load [Archivo](https://fonts.google.com/specimen/Archivo) (400, 500, 600, 700). Monospace is the system one.
3. **Component.** Open a component page in the gallery and copy its CSS and HTML. Components that need behaviour have a JS tab.

```css
:root {
  --paper: #F0EFEB;  --panel: #FFFFFF;  --inset: #E6E5E0;
  --line:  #D5D4CF;  --rule:  #92918D;
  --ink:   #292929;  --steel: #92918D;
  --signal: #F36B32; --ok: #46857A;
}
```

### Run the gallery locally

```sh
open braun-ui/index.html
```

That is the whole setup. The page loads Archivo from Google Fonts; everything else is inline.

### Edit the gallery

`braun-ui/index.html` is generated. Edit the files in `braun-ui/src/` and rebuild:

```sh
sh braun-ui/build.sh
```

Each component is one contiguous block, so you can search for it directly:

| In `src/*.html` | Contains |
|---|---|
| `<style data-css="NAME">` | CSS of the component |
| `<section data-view="NAME">` | Its page, with the example markup inside `.dx-stage` |
| `<script data-js="NAME">` | The small behaviour it needs, if any |

Class names starting with `dx-` belong to the documentation site, not to the design system.

## Theming

Light and dark share the same token names. Dark mode follows `prefers-color-scheme` and can be forced with `data-theme`:

```html
<html data-theme="dark">
```

## Documentation

- [`BRAUN_VINTAGE_DESIGN.md`](BRAUN_VINTAGE_DESIGN.md): full style guide in English
- [`BRAUN_VINTAGE_DESIGN_es.md`](BRAUN_VINTAGE_DESIGN_es.md): guía de estilo completa en español
- The gallery itself is bilingual: use the **EN / ES** switch in the header.

## Repository layout

```
.
├── braun-ui/
│   ├── index.html        # generated single-file gallery
│   ├── build.sh          # joins src/*.html into index.html
│   └── src/              # one file per group of components
├── docs/img/             # README screenshots
├── .claude/skills/       # braun-vintage-design skill for Claude
├── BRAUN_VINTAGE_DESIGN.md
└── BRAUN_VINTAGE_DESIGN_es.md
```

## Credits

Visual language after the work of Dieter Rams and Dieter Lubs at Braun. This is an independent homage and is not affiliated with Braun.
