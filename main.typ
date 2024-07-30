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
These notes are mostly based on the University of Oxford course 'C2.2 Homological Algebra' lectured by Prof Kobi Kremnitzer during the 2023-24 Michaelmas term. Portions of the previous notes @notes are reused, along with relevant parts of @weibel, upon which the course is largely based. Another important reference is @rotman, which provides detailed and, at times, meticulous proofs. I have labelled the source of many proofs (whether they are similar or different to the ones presented) for the reader's reference.

An overview of these notes follows. @module-recap states without proof some results from *module theory* which we will use later. @cat-theory is a crash course on *category theory*, based on which @ab-cat constructs *abelian categories* in a step-by-step manner. In general, abelian categories serve as the 'stage' for homological algebra, but as we will see, $RMod$, the category of $R$-modules, which is 'concrete' and thus easier to work with, is in fact a sufficient representative of abelian categories. Focusing on $RMod$, we then move on to establish the *module tensor product* (@tp-module), where the *tensor-hom adjunction* emerges as a significant result. We then prove that $RMod$ has *enough projectives and injectives* in @enough-proj-inj, a property crucial to constructing resolutions in $RMod$. @chain-complex then discusses *(co)chain complexes* and their *(co)homology*, which originally arise in algebraic topology but are viewed solely as algebraic entities here; they lead to the definition and several important properties of *resolutions*. With all the tools in hand, in @derived-functor we are able to define our main protagonist, *derived functors*, which are proven to be *homological $delta$-functors*, in some sense a generalisation of (co)homology functors. The two main *derived functors* we study are *$Ext$* and *$Tor$*, induced by $hom$ and tensor products respectively, as defined in @balancing-ext-tor. *$Ext$* and *$Tor$* possess a crucial property of being *balanced*, which requires the introduction of *mapping cones* and *double and total complexes* for proof. Further properties of *$Ext$*, including its *ring structure* and its connection with *module extensions*, are discussed in @ring-ext and @ext-extension, while further properties of *$Tor$*, demonstrated by *flat modules* and the *Universal Coefficient Theorem*, are the topic of @tor-flat. The machinery we build is also applied to construct *Koszul (co)homology* and *group (co)homology* in @koszul and @group-cohomology, respectively. 

For most of the proofs, I have tried to improve them by filling in more detailed steps by using available references and adding cross-references to previous results in the notes. Two large deviations from the lectures are @ab-cat and @tp-module. A lot more details are supplemented in both sections so as to make them as self-contained as possible. I have also chosen to introduce module tensor products based on @rotman, starting from the universal mapping problem of $R$-biadditive maps, whereas the lectures used the tensor product of vector spaces as an initial motivation.

// A current drawback of these notes is the lack of computational examples in later sections, e.g., on *$Ext$* and *$Tor$*. The reader is directed to the aforementioned references for those. Also, I must clarify that I am uncertain about the examinable content while writing these notes. 

On a personal note, I chose to work on these notes to enhance my own learning. Homological Algebra is admittedly a challenging course and, as a learner, I acknowledge that these notes must contain mistakes and improvable parts. Therefore, the reader is welcome to submit issues for any advice on GitHub (https://github.com/EricWay1024/Homological-Algebra-Notes), where these notes are open-sourced and updated#footnote[For anyone interested, I write these notes with Typst, a fairly new but much simpler alternative of LaTeX.].

Finally, I would like to thank Prof Kobi Kremnitzer for delivering the lectures and  Sebastian Monnet for creating the previous version of these notes.

#align(right)[
Yuhang Wei
]

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
#include "ha/d-app.typ"
#pagebreak()


#bibliography("bib.yml", style: "chicago-author-date")