#import "libs/template.typ": *
#show: thmrules

#show: project.with(
  title: "Homological Algebra",
  authors: (
    "Notes by Yuhang Wei",
    "Lectures by Kobi Kremnitzer",
    "Partially Based on Previous Notes by Sebastian Monnet"
  ), 
  // date: "October 24, 2023",
  date: datetime.today().display("[day padding:none] [month repr:long] [year]"),
)

#outline(indent: true)
#pagebreak()
#heading(numbering: none)[Preface]

These notes are mostly based on the University of Oxford course "C2.2 Homological Algebra" lectured by Kobi Kremnitzer during the 2023-24 Michaelmas term. Some proportions of the previous notes @notes are reused, as well as relevant parts of @weibel, which the course is largely based upon. Another important reference is @rotman, which provides detailed (and sometimes fussy) proofs. I have labelled the source of many proofs (whether they are similar or different to the ones presented) for the reader's reference. 

For most of the proofs, I have tried improve them by filling in more detailed steps using available references as well as adding cross-references to previous results. 
Two large deviations from the lectures are the sections on abelian categories and on module tensor products. A lot more details are supplemented in both sections so as to make them as self-contained as possible. I have also chosen to introduce module tensor products based on @rotman, starting from the universal mapping problem of $R$-biadditive maps, whereas the lectures used the tensor product of vector spaces as an initial motivation. 

A current drawback of these notes is the lack of computational examples in later sections, e.g. on $Ext$ and $Tor$. The reader is directed to the aforementioned references for those. Also, I feel the need to claim that I have no idea what is examinable when writing these notes, so please do not assume any correlation between the appearance of anything in these notes and in the exams.  

On a personal note, I decided to work on these notes primarily because I thought this is the best way for me to learn. This means, on the one hand, that I have added a lot of details to the otherwise potentially terse and hard-to-understand proofs so that as a learner, I can help myself follow what is going on. On the other, I am bound to make many mistakes and the discussions may lack depths or appear naive. Therefore, the reader is welcome to submit issues for any advice on GitHub (https://github.com/EricWay1024/Homological-Algebra-Notes), where these notes are open-sourced#footnote[Also, for anyone interested, I write these notes with Typst instead of LaTeX.].

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