#import "libs/template.typ": *
#show: thmrules

#show: project.with(
  title: "Homological Algebra",
  authors: (
    "Notes by Yuhang Wei",
    "Lectures by Kobi Kremnitzer",
    "Partly Based on Previous Notes by Sebastian Monnet"
  ), 
  date: "October 24, 2023",
)

#outline(indent: true)
#pagebreak()
#include "ha/0-module.typ"
#pagebreak()
#include "ha/1-cat.typ"
#pagebreak()
#include "ha/2-ab.typ"
#pagebreak()
#include "ha/3-tp.typ"
#pagebreak()
#include "ha/4-enough.typ"
#pagebreak()
#include "ha/5-cc.typ"
#pagebreak()
#include "ha/6-df.typ"
#pagebreak()
#include "ha/7-balance.typ"
#pagebreak()
#include "ha/8-ext.typ"
#pagebreak()
#include "ha/9-tor.typ"
#pagebreak()
#include "ha/a-kc.typ"
#pagebreak()
#include "ha/b-ext1.typ"
#pagebreak()
#include "ha/c-gc.typ"
#pagebreak()

#bibliography("bib.yml", style: "chicago-author-date")