#import "theorem.typ": *

#let bd(term) = [ $bold(#term)$]
#let veck = [$bold("Vec")_k$]
#let homk = [$op("Hom")_k$]

#let hom = [$op("Hom")$]
#let Hom = [$op("Hom")$]
#let Hom(c) = [$op("Hom")_cal(#c)$]
#let End = [$op("End")$]
#let End(c) = [$op("End")_cal(#c)$]
#let tp = [$times.circle$]
#let ds = [$plus.circle$]
#let iso = [$tilde.eq$]
#let bij = [$attach(->, t: tilde)$]
#let tpk = [$times.circle_k$]
#let tpr = [$times.circle_R$]
#let cA = [$cal(A)$]
#let cB = [$cal(B)$]
#let cC = [$cal(C)$]
#let cD = [$cal(D)$]
#let ob = [$"ob"$]
#let Set = [$bd("Set")$]
#let Cat = [$bd("Cat")$]
#let RMod = [$R hyph bd("Mod")$]
#let ModR = [$bd("Mod") hyph R$]
#let homr = [$op("Hom")_RMod$]
#let endr = [$op("End")_RMod$]
#let Mod = [$bd("Mod")$]
#let Ab = [$bd("Ab")$]
#let Grp = [$bd("Grp")$]
#let Top = [$bd("Top")$]
#let Id = [$op("Id")$]

#let colim = [$op("colim")$]
#let coim = [$op("coim")$]
#let Eq = [$op("Eq")$]
#let Fun = [$op("Fun")$]
#let Coeq = [$op("Coeq")$]
#let coker = [$op("coker")$]
#let ses(A, B, C) = [$0 -> #A -> #B -> #C -> 0$]
#let rgt(A) = [$attach(->, t: #A)$]
#let over = [$\/$]

#let lrm = [left $R$-module]
#let rrm = [right $R$-module]
#let lrms = [left $R$-modules]
#let rrms = [right $R$-modules]

#let theorem = thmbox(
  "theorem",
  "Theorem",
  fill: rgb("#e8e8f8"),
)

#let lemma = thmbox(
  "theorem",
  "Lemma",
  fill: rgb("#e8e8f8"),
)

#let proposition = thmbox(
  "theorem",
  "Proposition",
  fill: rgb("#e8e8f8"),
)

#let definition = thmbox(
  "theorem",
  "Definition",
  fill: rgb("#e8f8e8"),
)

#let example = thmbox(
  "theorem",
  "Example",
  stroke: rgb("#ffaaaa") + 1pt,
)

#let remark = thmbox(
  "theorem",
  "Remark",
  // stroke: rgb("#aaaaff") + 1pt,
)

#let note = thmbox(
  "theorem",
  "Note",
  // stroke: rgb("#aaffaa") + 1pt,
)

#let corollary = thmbox(
  "theorem",
  "Corollary",
  fill: rgb("#e8e8f8"),
)


#let proof(term) = block(width: 100%)[_Proof._ #term #h(1fr) $qed$]
