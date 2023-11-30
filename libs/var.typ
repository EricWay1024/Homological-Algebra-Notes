#import "theorem.typ": *
#import "commute.typ": node, arr, commutative-diagram


#let textwidth = 100%;
#let img(path, width: textwidth) = {
  align(center, image("../imgs/cat/" + path + ".jpg", width: width))
}

#let bd(term) = [ $bold(#term)$]
#let veck = [$bold("Vect")_k$]
#let homk = [$op("Hom")_k$]

#let hom = [$op("Hom")$]
#let Hom(c) = [$op("Hom")_cal(#c)$]
#let end = [$op("End")$]
#let End(c) = [$op("End")_cal(#c)$]
#let tp = [$times.circle$]
#let ds = [$plus.circle$]
#let iso = [$tilde.equiv$]
#let bij = [$attach(->, t: tilde)$]
#let tpk = [$times.circle_k$]
#let tpr = [$times.circle_R$]
#let tpzg = [$times.circle_(ZZ G)$]
#let cA = [$cal(A)$]
#let cB = [$cal(B)$]
#let cC = [$cal(C)$]
#let cD = [$cal(D)$]
#let ob = [$"ob"$]
#let Set = [$bd("Set")$]
#let Cat = [$bd("Cat")$]
#let RMod = [$R$-$bd("Mod")$]
#let GMod = [$G$-$bd("Mod")$]
#let ZGMod = [$ZZ G$-$bd("Mod")$]
#let ZMod = [$ZZ$-$bd("Mod")$]
#let SMod = [$S$-$bd("Mod")$]
#let ModR = [$bd("Mod")$-$R$]
#let homr = [$op("Hom")_R$]
#let homg = [$op("Hom")_G$]
#let endr = [$op("End")_RMod$]
#let Mod = [$bd("Mod")$]
#let Ab = [$bd("Ab")$]
#let Grp = [$bd("Grp")$]
#let Top = [$bd("Top")$]
#let Id = [$op("Id")$]

#let colim = [$op("colim")$]
#let coim = [$op("coim")$]
#let Coim = [$op("Coim")$]
#let IM = [$op("Im")$]
#let Eq = [$op("eq")$]
#let EQ = [$op("Eq")$]
#let Fun = [$op("Fun")$]
#let Coeq = [$op("coeq")$]
#let COeq = [$op("Coeq")$]
#let coker = [$op("coker")$]
#let Coker = [$op("Coker")$]
#let Ker = [$op("Ker")$]
#let ses(A, B, C, f: "", g: "") = [$0 -> #A ->^#f #B ->^#g #C -> 0$]
#let rgt(A) = [$attach(->, t: #A)$]
#let lft(A) = [$attach(<-, t: #A)$]
#let over = [$\/$]

#let lrm = [left $R$-module]
#let rrm = [right $R$-module]
#let lrms = [left $R$-modules]
#let rrms = [right $R$-modules]

#let oo = [$compose$]

#let mapsto = [$|->$]
#let prshv = [$"Psh"$]
#let Psh = [$"Psh"$]
#let cx = [$circle.filled.small$]
#let Ccx = [$C_cx$]
#let Dcx = [$D_cx$]
#let Cco = [$C^cx$]
#let Dco = [$D^cx$]

#let Ch = [$"Ch"$]

#let sest = [short exact sequence]
#let lest = [long exact sequence]
#let sess = [short exact sequences]
#let less = [long exact sequences]
#let iff = [if and only if]
#let Ext = [$"Ext"$]
#let Tor = [$"Tor"$]
#let cone = [$"cone"$]
#let cyl = [$"cyl"$]
#let Tot = [$"Tot"$]

#let triv = [$"triv"$]
#let fJ = [$frak(J)$]
#let endlec(n) = [_This is the end of lecture #n._]
#let TODO = text(blue)[TODO]
#let theorem = thmbox(
  "theorem",
  "Theorem",
  fill: rgb("#e8e8f8"),
  breakable: true,
)

#let lemma = thmbox(
  "theorem",
  "Lemma",
  fill: rgb("#e8e8f8"),
  breakable: true,

)

#let proposition = thmbox(
  "theorem",
  "Proposition",
  fill: rgb("#e8e8f8"),
  breakable: true,

)

#let definition = thmbox(
  "theorem",
  "Definition",
  fill: rgb("#e8f8e8"),
  breakable: true,

)

#let example = thmbox(
  "theorem",
  "Example",
  stroke: rgb("#ffaaaa") + 1pt,
  breakable: true,

)

#let remark = thmbox(
  "theorem",
  "Remark",
  // stroke: rgb("#aaaaff") + 1pt,
  breakable: true,

)

#let notation = thmbox(
  "theorem",
  "Notation",
  // stroke: rgb("#aaaaff") + 1pt,
  breakable: true,

)

#let note = thmbox(
  "theorem",
  "Note",
  // stroke: rgb("#aaffaa") + 1pt,
  breakable: true,

)

#let corollary = thmbox(
  "theorem",
  "Corollary",
  fill: rgb("#e8e8f8"),
  breakable: true,

)

#let fw(doc) = box(width: 100%)[#doc]

#let proof(title: "Proof", term) = block(width: 100%, breakable: true)[_#title._ #term #h(1fr) $qed$]