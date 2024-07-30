#import "@preview/commute:0.2.0": node, arr, commutative-diagram

#let color_style = "./color.typ"
#let link_color = rgb(0, 0, 255)
#if color_style == "./bw.typ" {
  link_color = rgb(0, 0, 0)
}


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
#let tpz = [$times.circle_ZZ$]
#let tpzg = [$times.circle_(ZZ G)$]
#let cA = [$cal(A)$]
#let cB = [$cal(B)$]
#let cC = [$cal(C)$]
#let cD = [$cal(D)$]
#let ob = [$"ob"$]
#let Set = [$bd("Set")$]
#let Cat = [$bd("Cat")$]
#let RMod = [$R$-$bd("Mod")$]
#let kMod = [$k$-$bd("Mod")$]
#let GMod = [$G$-$bd("Mod")$]
#let ZGMod = [$ZZ G$-$bd("Mod")$]
#let ZMod = [$ZZ$-$bd("Mod")$]
#let SMod = [$S$-$bd("Mod")$]
#let ModR = [$bd("Mod")$-$R$]
#let ModS = [$bd("Mod")$-$S$]
#let homr = [$op("Hom")_R$]
#let homg = [$op("Hom")_G$]
#let endr = [$op("End")_R$]
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
#let Der = [$"Der"$]
#let PDer = [$"PDer"$]

// #let endlec(n) = [_This is the end of lecture #n._]
#let endlec(n) = []
#let TODO = text(blue)[TODO]


#let fw(doc) = box(width: 100%)[#doc]

#let proof(title: "Proof", term) = block(width: 100%, breakable: true)[_#title._ #term #h(1fr) $qed$]

#let project(title: "", authors: (), date: none, body) = {
  // Set the document's basic properties.
  set document(author: authors, title: title)
  set page(numbering: "1", number-align: center)
  set text(font: "Linux Libertine", lang: "en")

  // Title row.
  align(center)[
    #block(text(weight: 700, 1.75em, title))
    #v(1em, weak: true)
    #date
  ]

  // Author information.
  pad(
    top: 0.5em,
    bottom: 0.5em,
    x: 2em,
    grid(
      columns: (1fr,) * calc.min(3, authors.len()),
      gutter: 1em,
      ..authors.map(author => align(center, author)),
    ),
  )

  // Main body.
  set par(justify: true)
  set heading(numbering: "1.1.")
  set enum(numbering: "(1)")
  show ref: set text(link_color)
  show link: set text(link_color)
  body
}

#import color_style : *


