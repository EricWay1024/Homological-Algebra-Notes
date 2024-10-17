#import "@preview/ctheorems:1.1.2": *
#let thmboxparams = (
  breakable: true,
  separator: [#h(0em).#h(0.2em)],
  padding: (top: 0.75em, bottom: 0.5em),
  inset: 0em,
)

#let thmboxparams2 = (
  bodyfmt: emph,
)

#let theorem = thmbox(
  "theorem",
  "Theorem",
  ..thmboxparams,
  ..thmboxparams2,
)

#let lemma = thmbox(
  "theorem",
  "Lemma",
  ..thmboxparams,
  ..thmboxparams2,
)

#let proposition = thmbox(
  "theorem",
  "Proposition",
  ..thmboxparams,
  ..thmboxparams2,
)

#let definition = thmbox(
  "theorem",
  "Definition",
  ..thmboxparams,
)

#let example = thmbox(
  "theorem",
  "Example",
  breakable: true,
  separator: [#h(0em).#h(0.2em)],
  inset: 0em,
)

#let remark = thmplain(
  "theorem",
  "Remark",
  breakable: true,
  inset: 0em,
  separator: [#h(0em).#h(0.2em)],
)

#let note = thmplain(
  "theorem",
  "Note",
  breakable: true,
  separator: [#h(0em).#h(0.2em)],
  inset: 0em,
)

#let notation = thmplain(
  "theorem",
  "Notation",
  breakable: true,
  separator: [#h(0em).#h(0.2em)],
  inset: 0em,
)

#let corollary = thmbox(
  "theorem",
  "Corollary",
  ..thmboxparams,
  ..thmboxparams2,
)
