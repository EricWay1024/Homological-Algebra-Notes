#import "@preview/ctheorems:1.1.2": *

#let theorem = thmbox(
  "theorem",
  "Theorem",
  fill: rgb("#e8e8f8"),
  breakable: true,
  separator: [#h(0em).#h(0.2em)],
)

#let lemma = thmbox(
  "theorem",
  "Lemma",
  fill: rgb("#e8e8f8"),
  breakable: true,
  separator: [#h(0em).#h(0.2em)],

)

#let proposition = thmbox(
  "theorem",
  "Proposition",
  fill: rgb("#e8e8f8"),
  breakable: true,
  separator: [#h(0em).#h(0.2em)],
)

#let definition = thmbox(
  "theorem",
  "Definition",
  fill: rgb("#e8f8e8"),
  breakable: true,
  separator: [#h(0em).#h(0.2em)],
)

#let example = thmbox(
  "theorem",
  "Example",
  stroke: rgb("#ffaaaa") + 1pt,
  breakable: true,
  separator: [#h(0em).#h(0.2em)],

)

#let remark = thmplain(
  "theorem",
  "Remark",
  // stroke: rgb("#aaaaff") + 1pt,
  breakable: true,
  separator: [#h(0em).#h(0.2em)],
)

#let notation = thmplain(
  "theorem",
  "Notation",
  // stroke: rgb("#aaaaff") + 1pt,
  breakable: true,
  separator: [#h(0em).#h(0.2em)],
)

#let note = thmplain(
  "theorem",
  "Note",
  // stroke: rgb("#aaffaa") + 1pt,
  breakable: true,
  separator: [#h(0em).#h(0.2em)],
)

#let corollary = thmbox(
  "theorem",
  "Corollary",
  fill: rgb("#e8e8f8"),
  breakable: true,
  separator: [#h(0em).#h(0.2em)],
)