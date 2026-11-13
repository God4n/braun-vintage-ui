# Braun Vintage — Guía de estilo de diseño

> Sistema visual inspirado en el diseño industrial de Braun (Dieter Rams, Dieter Lubs, década de 1960–80): radios, calculadoras y relojes tratados como **paneles de instrumentos**. Esta guía define los principios, la paleta, la tipografía y los componentes web, tomando como referencia la implementación de `http://localhost:4000/` (Pentester Live Console).

---

## 1. Principios

Los diez principios del buen diseño de Rams se traducen en reglas concretas para la interfaz:

| Principio | Regla aplicada en pantalla |
|---|---|
| **Lo menos posible** | Sin gradientes decorativos, sin sombras en elementos estáticos, sin ilustraciones. Cada línea separa algo. |
| **Honesto** | Un control parece un control: borde de 1px, cursor de mano, estado visible. Nada simula profundidad que no tiene. |
| **Útil y comprensible** | Etiquetas cortas en minúscula, números grandes y tabulares, unidades en gris. |
| **Discreto** | El 95% de la pantalla es neutro (papel, blanco, grafito). El color aparece solo para comunicar estado. |
| **Duradero** | Geometría ortogonal, esquinas rectas, una sola familia tipográfica. Nada que dependa de una moda. |
| **Riguroso hasta el último detalle** | Ritmo de espaciado constante, alineación a la línea base, números con `tabular-nums`. |

### El acento naranja es una luz piloto
En los aparatos Braun el naranja (o verde) marca **lo que está encendido** — el botón de power, la aguja del dial, la tecla “=”. En la interfaz pasa lo mismo:

- `--signal` = **vivo / activo / acción principal**. Nunca decoración.
- Si todo es naranja, nada lo es: como regla, **un solo elemento primario naranja por vista** (más indicadores de estado pequeños).

### Vocabulario de instrumento
Los componentes se nombran y se diseñan como piezas de un aparato: *faceplate* (frontal), *lamp* (piloto), *readout* (lectura numérica), *meter* (vúmetro), *scale/ticks* (graduación), *channel* (canal), *ledger* (libro de registros), *drawer* (cajón), *switch* (interruptor).

---

## 2. Paleta base

Los mismos tokens sirven para ambos modos; solo cambian los valores.

### 2.1 Modo claro

| Token | Valor | Uso |
|---|---|---|
| `--paper` | `#F0EFEB` | Fondo general (blanco cálido, como la carcasa de un SK 4) |
| `--panel` | `#FFFFFF` | Tarjetas / paneles |
| `--inset` | `#E6E5E0` | Fondos hundidos (evidencia, código, hover de filas) |
| `--line` | `#D5D4CF` | Bordes suaves, separadores internos |
| `--rule` | `#92918D` | Bordes fuertes, contorno de módulos |
| `--ink` | `#292929` | Texto principal |
| `--steel` | `#92918D` | Texto secundario, etiquetas |
| `--signal` | `#F36B32` | Acento naranja |
| `--signal-soft` | `#F9D9CA` | Fondo suave del acento, halo de pilotos |
| `--on-signal` | `#2A1608` | Texto sobre el acento |
| `--ok` | `#46857A` | Estados positivos (confirmado, idle, terminado) |

### 2.2 Modo oscuro

| Token | Valor |
|---|---|
| `--paper` | `#292929` |
| `--panel` | `#323130` |
| `--inset` | `#3A3937` |
| `--line` | `#3E3D3B` |
| `--rule` | `#605F5B` |
| `--ink` | `#F0EFEB` |
| `--steel` | `#A3A29D` |
| `--signal` | `#F36B32` (igual) |
| `--signal-soft` | `#5A3A2A` |
| `--on-signal` | `#2A1608` (igual) |
| `--ok` | `#6FB3A4` |

> El modo oscuro no es un negativo: el grafito `#292929` es el mismo color que la tinta del modo claro, y el panel sube un escalón (`#323130`) en lugar de bajar. Las superficies se aclaran a medida que se acercan al usuario.

### 2.3 Jerarquía de superficies

```
paper   ── fondo de la página
 └─ panel  ── módulo, tarjeta, drawer          (borde --rule)
     └─ inset ── bloque hundido: código, evidencia, fila en hover
```

Regla: **nunca** apilar dos paneles del mismo color sin un borde entre ellos.

---

## 3. Paleta extendida (colores de contraste)

Para usos específicos — severidades, gráficos, etiquetas de categoría, alertas — se añade una paleta inspirada en los colores funcionales de Braun (teclas de la calculadora ET 66, diales del T 1000, los relojes AB). Son colores **terrosos y apagados**, nunca saturados al estilo neón.

### 3.1 Colores semánticos (estado y severidad)

| Token | Claro | Oscuro | Uso |
|---|---|---|---|
| `--sev-critical` | `#BE3A2B` | `#D85A49` | Error, crítico, acción destructiva |
| `--sev-high` | `#F36B32` | `#F36B32` | Alto (comparte el naranja de señal) |
| `--sev-medium` | `#D99A3C` | `#E0A94E` | Advertencia, detenido, interrumpido |
| `--sev-low` | `#5E8A86` | `#6FA39E` | Bajo, informativo con peso |
| `--sev-info` | `#92918D` | `#A3A29D` | Informativo neutro |
| `--ok` | `#46857A` | `#6FB3A4` | Éxito, confirmado, en reposo |

La rampa crítico → alto → medio → bajo va **de cálido a frío**, para que sea legible incluso sin la etiqueta de texto.

### 3.2 Colores de categoría (gráficos, etiquetas, datos)

| Token | Claro | Oscuro | Referencia | Uso sugerido |
|---|---|---|---|---|
| `--c-blue` | `#2F5D8A` | `#7BA3CC` | Azul de escala de radio | Enlaces secundarios, series de datos, “info” enfático |
| `--c-yellow` | `#E8B629` | `#EBC550` | Tecla amarilla ET 66 | Resaltado, marcador, “pendiente” (solo como fondo/relleno en claro) |
| `--c-green` | `#4F7F3A` | `#8DB476` | Botón “=” verde | Series positivas, “en línea” |
| `--c-brown` | `#6B4F3A` | `#B8977A` | Teclas marrones ET 66 | Agrupaciones neutras, archivos, histórico |
| `--c-teal` | `#5E8A86` | `#6FA39E` | (= `--sev-low`) | Series secundarias |

Orden recomendado para series de gráficos: **ink → signal → blue → green → yellow → brown → teal**. Con más de 6 series, agrupar en “otros”.

### 3.3 Variantes para texto (accesibilidad)

Medido con WCAG 2.x. Varios colores base **no alcanzan 4.5:1 como texto pequeño en modo claro**:

| Color | sobre `--paper` claro | sobre `--panel` claro | sobre `--paper` oscuro |
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
| `--on-signal` sobre `--signal` | — | — | 5.7 ✅ |
| `--ink` sobre `--c-yellow` | — | — | 7.7 ✅ |

Por eso, en modo claro se definen **variantes de texto** para cuando el color tiene que leerse como letra (no como relleno, borde o punto):

| Token | Claro | Oscuro | Contraste claro |
|---|---|---|---|
| `--steel-text` | `#6E6D69` | `#A3A29D` | 4.5 / 5.2 |
| `--signal-text` | `#B8481A` | `#F36B32` | 4.6 / 5.3 |
| `--ok-text` | `#3E6E6A` | `#6FB3A4` | 5.0 / 5.8 |
| `--medium-text` | `#7A5A00` | `#E0A94E` | 5.6 / 6.4 |

Reglas:
- `--steel` sirve para etiquetas de 11px **solo si** son complementarias (la información existe también en otro lado). Para texto que hay que leer, usar `--steel-text`.
- El naranja como texto (enlaces, contadores) va con `--signal-text` en claro.
- Amarillo **nunca** como texto en claro: úsalo como relleno con `--ink` encima.
- El color nunca es el único portador de significado: siempre va con etiqueta, glifo o posición.

### 3.4 Bloque CSS completo

```css
:root {
  /* base */
  --paper: #F0EFEB; --panel: #FFFFFF; --inset: #E6E5E0; --line: #D5D4CF; --rule: #92918D;
  --ink: #292929; --steel: #92918D; --signal: #F36B32; --signal-soft: #F9D9CA; --on-signal: #2A1608; --ok: #46857A;
  /* severidad */
  --sev-critical: #BE3A2B; --sev-high: #F36B32; --sev-medium: #D99A3C; --sev-low: #5E8A86; --sev-info: #92918D;
  /* categoría */
  --c-blue: #2F5D8A; --c-yellow: #E8B629; --c-green: #4F7F3A; --c-brown: #6B4F3A; --c-teal: #5E8A86;
  /* texto accesible */
  --steel-text: #6E6D69; --signal-text: #B8481A; --ok-text: #3E6E6A; --medium-text: #7A5A00;
  /* tipografía */
  --sans: "Archivo", system-ui, -apple-system, sans-serif;
  --mono: ui-monospace, "SF Mono", Menlo, monospace;
  color-scheme: light;
}

/* oscuro explícito */
:root[data-theme="dark"] {
  --paper: #292929; --panel: #323130; --inset: #3A3937; --line: #3E3D3B; --rule: #605F5B;
  --ink: #F0EFEB; --steel: #A3A29D; --signal: #F36B32; --signal-soft: #5A3A2A; --on-signal: #2A1608; --ok: #6FB3A4;
  --sev-critical: #D85A49; --sev-high: #F36B32; --sev-medium: #E0A94E; --sev-low: #6FA39E; --sev-info: #A3A29D;
  --c-blue: #7BA3CC; --c-yellow: #EBC550; --c-green: #8DB476; --c-brown: #B8977A; --c-teal: #6FA39E;
  --steel-text: #A3A29D; --signal-text: #F36B32; --ok-text: #6FB3A4; --medium-text: #E0A94E;
  color-scheme: dark;
}

/* oscuro por preferencia del sistema (salvo que se fuerce claro) */
@media (prefers-color-scheme: dark) {
  :root:not([data-theme="light"]) { /* mismos valores que [data-theme="dark"] */ }
}
```

### 3.5 Mezclas derivadas
En lugar de crear más tokens, los tintes se derivan con `color-mix`:

```css
/* fondo seleccionado sutil */      background: color-mix(in srgb, var(--signal) 8%, var(--panel));
/* fondo de estado (pill activa) */ background: color-mix(in srgb, var(--sc) 10%, var(--panel));
/* borde de estado */               border-color: color-mix(in srgb, var(--sc) 45%, var(--line));
/* halo de piloto */                box-shadow: 0 0 0 4px color-mix(in srgb, var(--signal) 22%, transparent);
```

`--sc` es una variable local que cada componente recibe con el color de su severidad/estado (`style="--sc: var(--sev-critical)"`).

---

## 4. Tipografía

| Rol | Familia | Tamaño | Peso | Notas |
|---|---|---|---|---|
| Wordmark | Archivo | 16–17px | 700 | `letter-spacing: .3px` |
| Título de página | Archivo | 20–21px | 600 | |
| Título de tarjeta / drawer | Archivo | 15–18px | 600 | `line-height: 1.3` |
| Encabezado de módulo | Archivo | 12–13px | 600 | Pequeño: el borde ya delimita |
| Cuerpo | Archivo | 13px | 400 | `line-height: 1.5` |
| Lectura larga | Archivo | 12.5–13.5px | 400 | `line-height: 1.6`, `max-width: 60–80ch` |
| Etiqueta | Archivo | 11–11.5px | 500–600 | `--steel` |
| Rótulo de sección | Archivo | 11px | 600 | MAYÚSCULAS, `letter-spacing: .3–.4px` |
| Lectura numérica | Archivo | 36px | 600 | `letter-spacing: -.5px`, `tabular-nums`, `line-height: 1` |
| Datos técnicos | Mono del sistema | 10.5–12px | 400 | URLs, IDs, rutas, tiempos, ejes |

Reglas:
- **Una sola familia sans** (Archivo, grotesca de la tradición Akzidenz/Helvetica que usaba Braun). Mono solo para datos de máquina.
- Todos los números que cambian o se comparan llevan `font-variant-numeric: tabular-nums`.
- Mayúsculas solo en rótulos diminutos y en etiquetas de severidad. Títulos en tipo oración.
- `-webkit-font-smoothing: antialiased` en `body`.

---

## 5. Forma, espacio y movimiento

### 5.1 Geometría
- **Esquinas rectas (`border-radius: 0`)** en todo: botones, inputs, tarjetas, badges, avatares.
- **Únicas excepciones circulares**: pilotos (`.lamp`), nodos de pasos (`.step .sl`) y nodos de grafo — como los LEDs y perillas reales.
- Bordes de **1px**. Acentos de estado de **2–3px** solo en un lado (izquierdo o superior).

### 5.2 Escala de espacio
Base de ~2px, valores habituales: `4 · 6 · 8 · 10 · 12 · 14 · 16 · 18 · 20 · 24 · 28`.

| Uso | Valor |
|---|---|
| Separación entre módulos | 18px |
| Padding de módulo | 12–16px (header) / 14–18px (cuerpo) |
| Padding de formulario grande | 26px 28px |
| Gap entre ítems de lista | 6–9px |
| Gutter de página | `max(20px, env(safe-area-inset-*))` |
| Ancho máximo | 1340px (app), 920px (configuración), 740px (formularios) |

### 5.3 Sombras
Planas por defecto. Sombra solo en lo que **flota** sobre el resto:
- Toast: `0 4px 16px rgba(0,0,0,.12)`
- Menú desplegable: `0 12px 30px rgba(0,0,0,.14)`

### 5.4 Movimiento
- Curva estándar: `cubic-bezier(.2,.7,.2,1)` (arranque rápido, frenado suave, como un dial).
- Duraciones: 120ms (hover), 150ms (switch), 200–240ms (drawer/scrim), 450ms (barras de medidor).
- Animaciones continuas solo para lo vivo: `glow` 2.6s en pilotos, `lampPulse` 1.6s en el paso activo, cursor `blink` 1.1s.
- Todo se apaga con `@media (prefers-reduced-motion: reduce)`.

### 5.5 Foco
```css
:focus-visible { outline: 2px solid var(--signal); outline-offset: 1px; }
input:focus, select:focus, textarea:focus { outline: none; border-color: var(--signal); }
```

---

## 6. Componentes web

Referencia: la interfaz de `http://localhost:4000/`. Cada componente indica estructura, estados y CSS clave.

### 6.1 Faceplate (cabecera / frontal)
Barra superior fija, como el frontal de un aparato.

- `position: sticky; top: 0; background: var(--panel); border-bottom: 1px solid var(--rule);`
- Fila 1 (`.mission`): **wordmark** (700, 16px) · **modelo** (11px, `--steel`, separado por borde izquierdo `--line`) · a la derecha, **estado de conexión** y botones.
- Fila 2 (`.controls`): pestañas de vista, separadas por `border-top: 1px solid var(--line)`, con scroll horizontal sin barra.

```
┌──────────────────────────────────────────────────────────────┐
│ WORDMARK │ modelo-x            ● conectado   [◐] [▣ usuario] │
├──────────┬────────────┬──────────┬──────────┬────────────────┤
│ ■ Vista  │ □ Hallazgos 12 │ □ Grafo │ □ Línea │               │
└──────────┴────────────┴──────────┴──────────┴────────────────┘
```

### 6.2 Lamp (piloto de estado)
Círculo de 9px. El único elemento redondo junto a los nodos.

| Estado | Estilo |
|---|---|
| Apagado | `background: var(--steel)` |
| Vivo | `background: var(--signal); box-shadow: 0 0 0 3px var(--signal-soft);` + animación `glow` |
| Terminado | `background: var(--ok)` |
| Detenido | `background: var(--sev-medium)` |

Siempre acompañado de texto (`.status`, 11.5px, `--steel`).

### 6.3 Pestañas de control (`.ctrl`)
- Fondo transparente, `border-right: 1px solid var(--line)`, padding `9px 15px`, 12.5px/500, color `--steel`.
- Indicador cuadrado de 8px (`.ind`) con borde `--line`.
- **Seleccionada** (`aria-selected="true"`): texto `--ink`, fondo `--paper` (se “hunde” en la página), indicador relleno `--signal`.
- Contador opcional `.n` en `tabular-nums`.

### 6.4 Sub-pestañas (`.subtab`)
Variante para configuración: contenedor con borde `--rule`; la activa lleva `box-shadow: inset 0 -2px 0 var(--signal)` (subrayado naranja interno) e icono en `--signal`.

### 6.5 Rail (barra lateral de espacios de trabajo)
- Grid `248px | 1fr`; en ≤820px pasa a una fila horizontal desplazable.
- **Item `.ws`**: borde `--line`, **borde izquierdo de 3px** transparente, fondo `--panel`, padding `10px 11px`.
  - Nombre 12.5px/600 con elipsis; meta 10.5px `--steel`.
  - Badge `.ws-badge`: rectángulo naranja con `--on-signal`, `tabular-nums`.
  - Hover: borde `--rule`. Activo (`.on`): borde izquierdo `--signal`, fondo `--inset`.
- **Nuevo** (`.ws-new`): borde **discontinuo** `--rule`; hover → borde y texto `--signal`.

> Patrón: **línea discontinua = acción de crear / vacío por llenar.**

### 6.6 Módulo (`.module`) — contenedor base
```
┌─ border 1px --rule ────────────────────────┐
│ h2 12px/600                     count  ↗   │  header: padding 12px 16px, border-bottom --line
├────────────────────────────────────────────┤
│ contenido                                   │
└────────────────────────────────────────────┘
```
- `background: var(--panel); border: 1px solid var(--rule);`
- Las listas internas tienen `max-height: 62vh; overflow-y: auto` y scrollbar de 10px con thumb `--line`.
- Variantes con el mismo esqueleto: `.cfg-sec`, `.spec`, `.meter`, `.method`, `.ledger`.

### 6.7 Cover (cabecera de vista)
Panel de presentación de un elemento.
- Título 19px; tipo como chip con borde (`.ctype`); referencia en mono `--steel`.
- Estado a la derecha (`.cstate`): `--ok` si está en reposo, `--sev-medium` si detenido.
- Fila de alcance (`.cscope`) separada por `border-top: 1px solid var(--line)`, con chips.
- Acciones a la derecha (`.cover-actions`).

### 6.8 Readout cluster (lecturas numéricas)
La pieza más “Braun”: una fila de lecturas como los displays de un amplificador.

- Contenedor `.cluster`: `grid-template-columns: repeat(auto-fit, minmax(148px, 1fr))`, borde `--rule`.
- Cada `.readout`: separador vertical `--line` (menos el primero), padding `15px 18px 13px`.
  - Etiqueta `.rl` 11px `--steel`.
  - Valor `.rv` **36px/600**, `tabular-nums`, `line-height: 1`; unidad `small` 12px `--steel`.
  - **Escala** `.scale`: 7px de marcas verticales cada 7px
    `repeating-linear-gradient(90deg, var(--line) 0 1px, transparent 1px 7px)`.
- Variante `.alive`: valor y marcas en `--signal`.

```
┌────────────┬────────────┬────────────┬────────────┐
│ agentes    │ hallazgos  │ críticos   │ duración   │
│ 4  activos │ 27         │ 3          │ 12 min     │
│ ||||||||||| │ |||||||||| │ |||||||||| │ |||||||||| │
└────────────┴────────────┴────────────┴────────────┘
```

### 6.9 Meter (vúmetro de distribución)
- Cabecera: `h3` 12px + total a la derecha.
- **Ticks** de 6px cada 10px encima de la barra.
- Barra `.meter-bar`: 16px de alto, fondo `--inset`, segmentos separados por `gap: 1px`, colores de severidad, transición `flex-grow .45s`.
- Leyenda: cuadrados de 10px + etiqueta `--steel` + valor en `--ink` 600.

### 6.10 Channel (fila de proceso / agente)
Fila con **bandera de color de 4px** a la izquierda (`grid-template-columns: 4px 1fr`).

| Estado | Bandera |
|---|---|
| running | `--signal` + cursor `▍` parpadeante tras la acción |
| done | `--ink` |
| blocked / error | `--signal` |
| queued | `--line` |
| cancelled | rayado diagonal `--steel` + `opacity: .7` |

Cuerpo: tipo (600) · profundidad (mini badge con borde) · objetivo (mono, elipsis) · estado a la derecha. Segunda línea: última acción en mono.

### 6.11 Ledger / Record (lista de hallazgos)
- Contenedor `.ledger` con borde `--rule`.
- Cada `.record`: `grid-template-columns: 5px 1fr`; la franja `.sv-flag` toma `--sc`.
- Fila superior: **etiqueta de severidad** `.sv-tag` (10.5px/600, MAYÚSCULAS, texto y borde `--sc`, sin relleno) · categoría mono · objetivo mono alineado a la derecha.
- Título 15px/600, `max-width: 64ch`.
- Hover: fondo `--inset`.
- Activos afectados como `code` sobre `--inset`.

### 6.12 Filtros (`.filters`) y control segmentado (`.segctl`)
- **Filtros**: tira con borde `--rule`, botones separados por `--line`, cuadrado de color 10px + contador. Activo: texto `--ink`, fondo `--paper`.
- **Control segmentado**: alto 30px; activo **invertido** (`background: var(--ink); color: var(--paper)`) — como una tecla pulsada.

### 6.13 Botones

| Clase | Fondo | Borde | Texto | Hover |
|---|---|---|---|---|
| `.btn` (secundario) | `--panel` | `--line` | `--ink` | borde `--rule` |
| `.btn-primary` | `--signal` | `--signal` | `--on-signal`, 600 | `filter: brightness(1.06)` |
| `.btn-danger` | `--panel` | crítico al 40% | `--sev-critical` | relleno crítico, texto blanco |
| `.btn-ghost` | transparente | transparente | `--steel` | texto `--ink`, borde `--line` |
| `.btn-icon` | — | — | — | 32×32, padding 0 |
| `:disabled` | — | — | — | `opacity: .45; cursor: not-allowed` |

Base: `font-size: 12.5px; font-weight: 500; line-height: 1; padding: 8px 13px; gap: 7px;` con icono de 15px.
Botones primarios de formulario (`.start`, `.cfg-save`): 13px/600, padding `10–11px 22–24px`; deshabilitados pasan a `--inset` + `--steel`.
Separador entre grupos: `.btn-sep` (1×22px, `--line`).

### 6.14 Chips y badges

| Componente | Estilo |
|---|---|
| `.chip` | 11.5px, padding `1px 7px`, borde `--line`, sin fondo |
| `.chip.ex` (excluido) | texto `--steel`, tachado en `--signal` |
| `.ctype` | 11px `--steel`, borde `--line`, padding `2px 9px` |
| `.who` / `.ai` | 10.5px, `line-height: 1`, padding `3px 6px`, borde `--line` |
| `.ai-confirmed` | texto `--ok`, borde ok al 45% |
| `.ai-unverified` | texto `--sev-medium`, borde al 45% |
| `.ai-suspect` | texto `--sev-critical`, borde al 45% |
| `.who.claude` | texto y borde naranja (agente IA) |
| `.statpill[aria-pressed]` | texto `--sc`, borde 45%, fondo 10% |

Regla: los badges son **contorno**, no relleno. El relleno sólido se reserva para el contador naranja del rail y el botón primario.

### 6.15 Formularios
- Contenedor `.setup`: panel con borde `--rule`, padding `26px 28px 24px`, `gap: 18px`, ancho máx. 740px.
- Secciones `.fsec` separadas por `border-top: --line`, con rótulo MAYÚSCULAS 11px.
- `label` 11.5px/600 encima del campo; `.hint` 11px `--steel` debajo.
- **Input / select / textarea**: fondo `--paper` (hundido respecto al panel), borde `--line`, padding `9px 11px`, 13px. Textarea en mono 12px. Foco: borde `--signal`, sin outline.
- Rejilla de 2 columnas (`.grid2`) que colapsa a 1 en ≤580px.

**Checkbox (`.auth input`)**: `appearance: none`, 18×18 cuadrado, borde `--rule`, fondo `--paper`; marcado → relleno `--signal` y `✓` en `--on-signal`.

**Switch (`.switch`)**: 38×22 rectangular, fondo `--inset`, perilla cuadrada de 16px `--panel`. Encendido: pista `--signal`, perilla desplazada 16px. Etiqueta contigua cambia a `--ok`.

### 6.16 Methodology strip (pasos de un proceso)
Fila de 5 pasos unidos por una línea horizontal de 1px.

| Estado | Nodo (círculo 13px) | Línea | Texto |
|---|---|---|---|
| pending | borde `--rule`, fondo panel | `--line` | `--steel`, 500 |
| done | relleno `--ink` | `--ink` | `--ink` |
| active | relleno `--signal` + halo pulsante | — | `--ink` |
| stopped | relleno `--sev-medium` | — | — |

En ≤860px se vuelve vertical (la línea pasa a ser vertical a la izquierda).

### 6.17 Drawer (panel lateral de detalle)
- Fijo a la derecha, `width: min(500px, 100%)`, fondo `--panel`, borde izquierdo `--rule`.
- Entra con `transform: translateX(100%) → none` en 240ms.
- Scrim: `rgba(20,20,20,.4)`, fade 200ms.
- Cabecera: rótulo 12px `--steel` + botón de cierre cuadrado 28px.
- Cuerpo: título 18px; campos `.dfield` con rótulo MAYÚSCULAS 11px y valor en mono 13px; secciones `.dsec` separadas por `--line`.
- **Evidencia `.ev`**: mono 11px, `--steel` sobre `--inset`, `pre-wrap`.
- **Cadena `.chain`**: borde izquierdo 2px `--signal`, pasos como cajas `--inset` unidos por `→`.

### 6.18 Chat embebido (`.fchat`)
- Mensaje de usuario: fondo `--inset`, alineado a la derecha, `max-width: 85%`.
- Mensaje del asistente: fondo `--panel`, **borde izquierdo 3px `--signal`**.
- Nota del sistema: borde discontinuo, texto `--steel`.
- Envío: botón naranja sólido; deshabilitado → `--inset`.

### 6.19 Tarjeta de espacio de trabajo (`.wcard`)
- Grid `repeat(auto-fill, minmax(290px, 1fr))`, gap 16px.
- Borde `--rule` con **borde superior de 3px** que codifica estado: `--line` (reposo), `--signal` (en curso), `--sev-medium` (detenido). Hover: todo el borde pasa a `--ink`.
- Contenido: tipo + estado con piloto · nombre 16px/600 · referencia mono · chips de alcance · **mini barra de severidades** (6px, gap 2px) · contadores · pie con cifra en negrita y hora a la derecha.
- Tarjeta “nueva”: discontinua, centrada, mín. 200px de alto.

### 6.20 Grafo y línea de tiempo
- Lienzo `.canvas` en panel con borde `--rule`; leyenda lateral `.spec` sticky de 240px.
- Nodos: círculo con borde `--rule`; relleno `--ink` = completado; borde `--signal` = activo; cuadrado discontinuo naranja = bloqueado.
- Etiquetas SVG: sans 11px/600 `--ink` + sub mono 10px `--steel`.
- Línea de tiempo: carriles sobre `--inset`, rejilla `--line`, ejes mono 10px, **línea de “ahora”** en `--signal` discontinua (`2 3`), hallazgos como rombos naranjas (cuadrado rotado 45°), espera como rayado diagonal.

### 6.21 Menú de usuario
- Disparador `.ubtn`: 32px de alto, avatar cuadrado 24px (`--ink` con iniciales en `--paper`).
- Popover: borde `--rule`, sombra flotante, padding 6px, `min-width: 230px`.
- Ítems `.mi`: 12.5px, icono `--steel`, hover `--inset`; peligroso en `--sev-critical`; separador 1px `--line`.

### 6.22 Mensajes de sistema
| Componente | Estilo |
|---|---|
| **Toast** | Abajo a la derecha, panel con borde `--rule` + **borde izquierdo 3px** (`--steel` / `--ok` / `--sev-critical`), sombra flotante, máx. 380px |
| **Banner de aviso** | Borde `--line` + borde izquierdo 3px `--sev-critical`, icono crítico |
| **Banner informativo** (`.cfg-banner`) | Borde `--line`, texto `--steel` con `b` en `--ink` |
| **Nota/alerta en línea** | Borde izquierdo 2px (`--line` neutro, `--sev-critical` alerta) + padding 8px |

### 6.23 Estados vacíos
- `.empty-state`: panel con borde, padding `56px 24px`, centrado.
- Marca: cuadrado 26px `--inset` con borde `--line` (un “hueco” en el panel).
- Título 17px, texto 12.5px `--steel` hasta 44ch, botón primario debajo.
- Vacío mínimo en listas: texto mono 12px `--steel` centrado.

### 6.24 Pantalla de acceso (`.gate`)
- Fondo `--paper` a pantalla completa, tarjeta de 380px con borde `--rule`.
- Marca: cuadrado naranja de 15px + wordmark 17px/700.
- Error en `--signal` (usar `--signal-text` en claro).
- Opción secundaria con borde discontinuo; opciones avanzadas en `<details>`.

### 6.25 Tablas y pares clave-valor
- `.roles`: cabeceras 10.5px `--steel` 500, filas separadas por `--line`, primera columna en mono.
- `.kv`: grid `140px 1fr`; `dt` en `--steel`, `dd` en mono 12px con `overflow-wrap: anywhere`.

---

## 7. Iconografía
- Trazo lineal, 15px (13px en menús compactos), `stroke: currentColor`, sin relleno.
- Color por defecto `--steel`; pasa a `--signal` solo cuando su contenedor está activo.
- Glifos tipográficos permitidos como iconos funcionales: `✓ ▸ ▾ → ▍ ●`.

---

## 8. Responsive
| Punto de corte | Cambio |
|---|---|
| ≤ 860px | Pasos del proceso en vertical |
| ≤ 820px | Rail arriba en horizontal; grafo a una columna; en inicio se oculta el rail |
| ≤ 760px | Grids de 2 columnas pasan a 1 |
| ≤ 720px | Se ocultan separadores de botones |
| ≤ 640px | Búsqueda a ancho completo; filas de configuración a 2 columnas |
| ≤ 580px | Formularios a una columna |

Siempre respetar `env(safe-area-inset-*)` en cabecera, gutters y toasts, y usar `scrollbar-gutter: stable` en `html`.

---

## 9. Lista de verificación

- [ ] ¿El fondo usa `--paper` y los contenedores `--panel` con borde `--rule`?
- [ ] ¿Hay como máximo una acción primaria naranja por vista?
- [ ] ¿El naranja indica algo vivo/activo y no decora?
- [ ] ¿Todas las esquinas son rectas (excepto pilotos y nodos)?
- [ ] ¿Los números usan `tabular-nums`?
- [ ] ¿Los datos técnicos están en mono y el resto en Archivo?
- [ ] ¿El estado se comunica con color **y** con texto/glifo?
- [ ] ¿El texto pequeño en claro usa `--steel-text` / `--signal-text` cuando debe leerse?
- [ ] ¿Funciona en modo oscuro sin cambiar ningún selector, solo tokens?
- [ ] ¿Las animaciones se desactivan con `prefers-reduced-motion`?
- [ ] ¿Se ve bien a 375px de ancho sin scroll horizontal?
