#import "../libs/template.typ": *

= Chain Complexes
<chain-complex>

== Definitions

Let $cA$ be an abelian category. 

#definition[
  A *chain complex* $Ccx$ in $cA$ is a family ${C_n}_(n in ZZ)$ of objects in $cA$ with morphisms $d_n : C_n -> C_(n-1)$ such that $d_n oo d_(n-1) = 0$, where $d_n$ are called *differentials*. 
  The *$n$-cycles* of $Ccx$ are defined as $  Z_n (C) := Ker d_n $ and 
  the *$n$-boundaries* are defined as $ B_n (C) := IM d_(n+1) $
 
  Since  $d_n oo d_(n-1) = 0$, we have $ B_n (C) arrow.hook Z_n (C) arrow.hook C_n $ (as subobjects) for all $n$.

  The *$n$-th homology* is defined as $ H_n (C) := Coker(B_n (C) arrow.hook Z_n (C)) $
]

#notation[
  We often omit the subscript in $d_n$ and simply write $d$, so $d_n oo d_(n-1) = 0$ becomes $d^2 = 0$. To emphasise that $d$ belongs to the chain complex $C_cx$, we would write either $d_C$, or $d^((C))_n$ if we also need to explicitly specify the index.  We sometimes also omit the dot in $Ccx$ and simply write $C$. We might write $Z_n = Z_n (C)$ and $B_n = B_n (C)$.
]

#remark[
  In the case of $RMod$, an *$n$-cycle* in $C_n$ is an element $x in C_n$ such that $d(x) = 0$, and an *$n$-boundary* in $C_n$ is an element $y in C_n$ such that there exists $c' in C_(n+1)$ such that $d(c') = y$. An $n$-boundary must be an $n$-cycle because $d^2= 0$. The $n$-th homology becomes a quotient module#footnote()[The slogan is that "homology is cycles modulo boundaries" or even "homology is kernel modulo image".], $ H_n (C) = Z_n / B_n = (Ker d_n) /( IM d_(n+1)) $  An element in $H_n (C)$ can be written as $x + B_n$, or simply $[x]$, for some $n$-cycle $x$.
]


// #align(center,image("../imgs/2023-11-03-12-27-08.png",width:80%))

#definition[
    We can form a category $"Ch"(cA)$ where objects are chain complexes and morphisms are *chain maps* $u_cx : C_cx -> D_cx$ which
  commutes with differentials 
  $
    u d = d u
  $
  Namely, for all $n in ZZ$,
// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBpiBdUkANwEMAbAVxiRAGEB9QgX1PUy58hFAEZyVWoxZsuACjABaUQEoQfAdjwEiZUZPrNWiEABFu6-iAxbhRcfuqGZJ8wuVqekmFADm8IlAAMwAnCABbJDIQHAgkcSkjNihLYLDIxAAmalikAGYnaWMQFI0QUIionLiswqSTJgsyioyE3MQCxJcQRvdVdQoeIA
#align(center, commutative-diagram(
  node-padding: (30pt, 50pt),
  padding: 0.5em,
  node((0, 0), [$C_n$]),
  node((0, 1), [$C_(n-1)$]),
  node((1, 0), [$D_n$]),
  node((1, 1), [$D_(n-1)$]),
  arr((0, 0), (0, 1), [$d$]),
  arr((1, 0), (1, 1), [$d$]),
  arr((0, 0), (1, 0), [$u_n$]),
  arr((0, 1), (1, 1), [$u_(n-1)$]),
)) commutes.
]
#proposition[
$Ch(cA)$ is an abelian category if $cA$ is an abelian category.
]
#proof[
@rotman[Proposition 5.100]. 
]

#proposition[
  A chain map $u_cx : Ccx -> Dcx$ induces a morphism $ H_n (u) : H_n (C) -> H_n (D) $
]
#proof[
  It suffices to assume $cA = RMod$. First we show that $u_n : C_n -> D_n$ sends boundaries to boundaries. Take boundary $b in C_n$, then there exists $c in C_(n+1)$ such that $d(c) = b$. Thus $u(b) = u d(c) = d u (c)$, showing that $u(b)$ is a boundary in $D_n$. 

  Next we show that $u_n : C_n -> D_n$ sends cycles to cycles. Take cycle $z in C_n$ such that $d(z) = 0$. Then $d u(z) = u d(z) = u(0) = 0$, showing that $u(z)$ is a cycle in $D_n$. 

  Therefore, $u_n$ induces a function $H_n (C) -> H_n (D)$.
]

#corollary[
  $H_n : "Ch"(cA) -> cA$ is an additive functor.
]

#definition[
  A chain map  $C_cx -> D_cx$ is called a *quasi-isomorphism* if the induced maps $H_n (C) -> H_n (D)$ are  isomorphisms for all $n$. 
]

// #remark[
// (Remark here, connection to topology)
//   Derived category of an abelian category $cA$ is $ D(A) = Ch(A) ["qiso"^(-1)]$. Compare to $R[s^(-1)]$ for some $s in R$ and non-commutative $R$. 
  
//   Non-linear version: homotopy types. $Top[W^(-1)]$

//   (TODO)
// ]

#proposition[
  The followings are equivalent: 
  - $C_cx$ is exact at every $C_n$;
  - $C_cx$ is *acyclic*, i.e., $H_n (C) = 0$ for all $n$;
  - $0 -> C_cx$ is a quasi-isomorphism. 
]
#proof[Trivial.]

// #definition[
//   A cochain complex is given by ${C^n}_(n in ZZ)$ and $d^n : C^n -> C^(n+1)$ with $d^2 = 0$.

//   ... Just dual. TODO
// ]

#definition[
  A *cochain complex* $Ccx$ in $cA$ is a family ${C^n}_(n in ZZ)$ of objects in $cA$ with morphisms $d^n : C^n -> C^(n+1)$ such that $d^n oo d^(n+1) = 0$, where $d^n$ are called *differentials*. The *$n$-cocycles* of $C^cx$ are $ Z^n (C) := Ker d^n $ and the *$n$-coboundaries* are $ B^n (C) := IM d^(n-1) $
 
  We have $ B^n ( C) arrow.hook Z^n (C) arrow.hook C^n $ (as subobjects) for all $n$.

  The *$n$-th cohomology* are defined as $ H^n (C) := Coker(B^n (C) arrow.hook Z^n (C)) $

  We also define *cochain maps* similarly as before.
]

#example[@weibel[Application 1.1.4].
  Let $X$ be a topological
space, and let $S_k eq S_k lr((X))$ be the free $R$-module on the set of
continuous maps from the standard $k$-simplex $Delta_k$ to X. Restriction
to the $i$-th face of $Delta_k lr((0 lt.eq i lt.eq k))$ transforms a
map $Delta_k arrow.r X$ into a map
$Delta_(k minus 1) arrow.r X$, and induces an $R$-module
homomorphism $diff_i$ from $S_k$ to $S_(k minus 1)$. The alternating
sums $d eq sum lr((minus 1))^i diff_i$ (from $S_k$ to $S_(k minus 1)$) 
assemble to form a chain complex
$ dots.h.c arrow.r^d S_2 arrow.r^d S_1 arrow.r^d S_0 arrow.r 0 $ called the *singular chain complex* of $X$.
The $n$-th homology module of $S_cx (X)$ is called the
$n$-th singular homology of $X$ \(with
coefficients in $R$) and is written $H_n lr((X semi R))$. 
]
// #example[
//   Let $X$ be a topological space. Then $S_k = S_k (X)$ is the free $R$-module on the set of continuous maps $Delta_k -> X$, with restriction to the $i$-th face defines $S_k rgt(diff_i) S_(k-1)$, $d = sum (-1)^i diff_i$ gives a chain complex. 

//   The singular chain complex of $X$ 

//   $H_n^"singular"(X, R)$
// ]

// #remark[
//   If $cA$ is an abelian category, then we can define $S cA$ as the set of simplicial objects in $cA$. Then there is a functor $N: S cA -> Ch_(>= 0) (cA)$.

//   Dold-Kan
//   (?)
// ]

== Chain Homotopy

#definition[
  A chain map $f: Ccx -> Dcx$ is *null homotopic* if there are maps $s_n : C_n -> D_(n+1)$ such that $f = d s + s d$, or more rigorously,
  $ f_n = d_(n+1) s_n + s_(n+1) d_n $
  for all $n$.
  // #align(center,image("../imgs/2023-10-31-00-07-24.png",width:50%))
  // https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBpiBdUkANwEMAbAVxiRAGEB9ACjAGoAjAEoQAX1LpMufIRQDyVWoxZsuhcZOx4CRAEwLq9Zq0QceYALTCxEkBi0yiZAYqMrTAEXOCRGu1O1ZZHkXQ2UTEC91W3tpHRR9UKVjNi9eHzFFGCgAc3giUAAzACcIAFskMhAcCCR5ZPcQKBsi0orEepqkfQaI5r8S8rrqLsQAZmoGLDA+ujgAC2yQMJTTBAG24eraxAAWFcbClpBB9p7R-ZApmbYoOcXmg4j121OkCe2kS7c+47e9kY7ACsT1umVEQA
#align(center, commutative-diagram(
  node-padding: (50pt, 50pt),
  node((0, 0), [$C_(n+1)$]),
  node((0, 1), [$C_n$]),
  node((0, 2), [$C_(n-1)$]),
  node((1, 0), [$D_(n+1)$]),
  node((1, 1), [$D_n$]),
  node((1, 2), [$D_(n+1)$]),
  arr((0, 0), (0, 1), [$d$]),
  arr((0, 1), (0, 2), [$d$]),
  arr((0, 1), (1, 0), label-pos:-1em, [$s$], "dashed"),
  arr((0, 1), (1, 1), [$f$]),
  arr((0, 2), (1, 1), label-pos:-1em, [$s$], "dashed"),
  arr((1, 0), (1, 1), [$d$]),
  arr((1, 1), (1, 2), [$d$]),
))
  (Only the solid lines commute.) We denote $f tilde 0$ in this case.
]
#definition[
  Two chain maps $f$ and $g$ from $Ccx$ to $Dcx$ are *chain homotopic* if $f - g$ is null homotopic. We denote $f tilde g$.
]
#remark[
$f tilde g <=> f - g tilde 0 <=> f - g = s d + d s$.
]

#lemma[
  // If $f tilde g$, then $f_* = g_* :  H_* (C) -> H_* (D)$.
  Suppose that chain maps
$f comma g colon C_cx arrow.r D_cx$ are chain homotopic.
Then the induced maps
$f_* comma g_* colon H_n lr((C)) arrow.r H_n lr((D))$
are equal. In particular, if $f: Ccx-> Dcx$ is null homotopic, then $f_* = 0 : H_n (C) -> H_n (D)$. 
]

#proof[@notes[Lemma 2.32], @weibel[Lemma 1.4.5]. Let $h$ be a chain homotopy from $f$ to $g$. We have

$ f_n minus g_n eq s_(n minus 1) compose d_n^(lr((C))) plus d_(n plus 1)^(lr((D))) compose s_n $

for each $n$. Let $x in H_n lr((C))$. Then $x eq lr([c])$ for some cycle
$c in Z_n C$. We have

$ f_* lr((x)) minus g_* lr((x)) & eq lr([f_n lr((c)) minus g_n lr((c))])\
 & eq lr([s_(n minus 1) compose d_n^(lr((C))) lr((c)) plus d_(n plus 1)^(lr((D))) compose s_n lr((c))])\
 & eq lr([d_(n plus 1)^(lr((D))) compose s_n lr((c))])\
 & eq 0 comma $

The third equality is because $c$ is an $n$-cycle  in $C$ and last equality is because $d_(n plus 1)^(lr((D))) compose s_n lr((c))$ is an $n$-boundary in $D$.
 ]

#corollary[
  If the chain map $id : C_cx -> C_cx$ is null homotopic, then $C_cx$ is acyclic. 
]
<null-homotopic-acyclic>
#endlec(7)

#definition[@weibel[Translation 1.2.8].
If $C = Ccx$
is a chain complex (resp. cochain complex) and $p$ an integer, we form a new complex $C lr([p])$ as
follows:
$ C lr([p])_n eq C_(n plus p) quad lr((upright("resp. ") C lr([p])^n eq C^(n minus p))) $
with differential $lr((minus 1))^p d$. We call
$C lr([p])$ the *$p$-th translate* of $C$. The way to remember
the shift is that the degree $0$ part of $C lr([p])$ is $C_p$. The
sign convention is designed to simplify notation later on. Note that
translation shifts homology:
$ H_n lr((C lr([p]))) eq H_(n plus p) lr((C)) quad lr((upright("resp. ") H^n lr((C lr([p]))) eq H^(n minus p) lr((C)))) $

We make translation into a functor $[p]: Ch(cA) -> Ch(cA)$ by shifting indices on chain maps.
That is, if $f colon C arrow.r D$ is a chain map, then
$f lr([p])$ is the chain map given by the formula
$ f lr([p])_n eq f_(n plus p) quad lr((upright("resp. ") f lr([p])^n eq f^(n minus p))) $

]

// #definition[
// Translation $ (C[p])_n := C_(n+p) $

// $ (C[p])^n := C^(n-p) $

// differential is $(-1)^p d $

// ]

// $(C[p])_0 = C_p$

// $H_n (C[p]) = H_(n+p) (C)$

// $f: Ccx -> Dcx$ => $f[p]_n = f_(n+p)$ 

== Exact Sequences

Recall that if $cA$ is an abelian category, then $Ch(cA)$ is also an abelian category.
Therefore, we can form short exact sequences with chain complexes, and it turns out that they naturally induce long exact sequences in (co)homology.

#definition[ For chain complexes $A_cx, B_cx, Ccx$,
$ ses(A_cx, B_cx, Ccx) $ is a *short exact sequence* if $ses(A_n, B_n, C_n)$ is a short exact sequence for all $n$.
]

// Long exact sequence. 

#theorem[
  If $ 0 -> A_cx rgt(f) B_cx rgt(g) Ccx -> 0$ is a short exact sequence of chain complexes, then there is a natural map for each $n$ $ diff_n: H_n (C) -> H_(n-1) (A) $ which we call the *connecting homomorphism*, making 
  $ ... -> H_n (B) -> H_n (C) rgt(diff_n) H_(n-1) (A) -> H_(n-1)(B) -> ... $
  a long exact sequence. Further, $diff_n$ is explicitly given by the well-defined expression  $ diff_n = f^(-1) d_B g^(-1) $
  
 If $ 0 -> A_cx rgt(f) B_cx rgt(g) Ccx -> 0$ is a short exact sequence of cochain complexes, then we have the connecting homomorphism 
  $ diff^n : H^n\(C) -> H^(n+1)(A) $
  where the induced long exact sequence is
  $
     ... -> H_n (B) -> H_n (C) rgt(diff^n) H_(n+1) (A) -> H_(n+1)(B) -> ... 
  $
  and $ diff^n = f^(-1) d^B g^(-1) $
]
<connecting>

#proof[
  Again, we assume the context of $RMod$. This is an application of the @snake[Snake Lemma]. 
// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBpiBdUkANwEMAbAVxiRGJAF9T1Nd9CKAIzkqtRizYBBAPqFuvbHgJEATKOr1mrRCABCcrjxAYlAogGYN47WwDChhSb7LByACzWtk3Ryen+FRQyITFvHXYjRUC3EVDNCQjZAAowAFohAEoo5zMg5HV4mx99GVSM7P8XcxQrIvD7MvSsnIDXIk96xLY-MRgoAHN4IlAAMwAnCABbJDIQHAgkIScJ6aXqBaRVFcmZxHV5xcQLHbXjjaP3U72RQ6QANgTbXSgc1b2DzcQAdieS1+uSCsd0QAA5qAw6AAjGAMAAK1SCIAYMFGOBAfwiAOM7yQAFYLg9AYhHiDvsTfiDQcTwSCAJycCicIA
#align(center, commutative-diagram(
  node-padding: (50pt, 50pt),
  node((0, 0), [$0$]),
  node((0, 1), [$A_n$]),
  node((0, 2), [$B_n$]),
  node((0, 3), [$C_n$]),
  node((0, 4), [$0$]),
  node((1, 0), [$0$]),
  node((1, 1), [$A_(n-1)$]),
  node((1, 2), [$B_(n-1)$]),
  node((1, 3), [$C_(n-1)$]),
  node((1, 4), [$0$]),
  arr((0, 0), (0, 1), []),
  arr((0, 1), (0, 2), []),
  arr((0, 2), (0, 3), []),
  arr((0, 3), (0, 4), []),
  arr((0, 1), (1, 1), [$d_A$]),
  arr((0, 2), (1, 2), [$d_B$]),
  arr((0, 3), (1, 3), [$d_C$], label-pos: left),
  arr((1, 0), (1, 1), []),
  arr((1, 1), (1, 2), []),
  arr((1, 2), (1, 3), []),
  arr((1, 3), (1, 4), []),
))
  Using the Snake Lemma, if we write the cokernels (and shift up the index by $1$), we get 
  $
    A_n / (d A_(n+1)) -> B_n / (d B_(n+1)) -> C_n / (d C_(n+1)) -> 0
  $
  is exact, where $d A_(n+1) = IM d$; if we write the kernels, we get
  $
    0-> Z_(n-1)(A) -> Z_(n-1)(B) -> Z_(n-1)(C) 
  $
  is also exact. Notice that $d A_n subset.eq Z_(n-1)(A)$, so we can use $d$ to connect the rows again:
  
// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZARgBoAGAXVJADcBDAGwFcYkQBBAfTAAIB6XgAoovbkLABqYgEoZIAL6l0mXPkIoATBWp0mrdgCEeA4aOMTpcxcpAZseAkQDMOmgxZtEIAMInBIrx+lrLySioO6kQALG56nuzkNhFqTijkpMS6HgbeSeF2qo4aJJnZ+l4gAFpcEgC0skIcYbb2qSXaWe4V7DX1jYYtKcUuZd0J3n1gDTJCPmG6MFAA5vBEoABmAE4QALZIGSA4EEjEBdt7pzTHSJrnO-uI2kcniM73l4ixL0gArB+PX7XV4ANgBSBBwKQAHZwYhDjdEED4rkQFBkiALo8yD9EJCUZV0XDnojoeNUUTKAogA
#align(center, commutative-diagram(
  node-padding: (50pt, 50pt),
  node((0, 1), [$A_n / (d A_(n+1))$]),
  node((0, 2), [$B_n / (d B_(n+1))$]),
  node((0, 3), [$C_n / (d C_(n+1))$]),
  node((0, 4), [$0$]),
  node((1, 0), [$0$]),
  node((1, 1), [$Z_(n-1)(A)$]),
  node((1, 2), [$Z_(n-1)(B)$]),
  node((1, 3), [$Z_(n-1)(C)$]),
  arr((0, 1), (0, 2), []),
  arr((0, 2), (0, 3), []),
  arr((0, 3), (0, 4), []),
  arr((1, 0), (1, 1), []),
  arr((1, 1), (1, 2), []),
  arr((1, 2), (1, 3), []),
  arr((0, 1), (1, 1), [$d_A$]),
  arr((0, 2), (1, 2), [$d_B$]),
  arr((0, 3), (1, 3), [$d_C$]),
))

  Notice that $ Ker ( A_n / (d A_(n+1)) rgt(d) Z_(n-1) (A)) = H_n\(A) $ and 
  $
    Coker ( A_n / (d A_(n+1)) rgt(d) Z_(n-1) (A)) = H_(n-1) (A)
  $
  and the other two columns are similar.
  By the Snake Lemma again, we have the connecting map:
  $
    H_n (A) -> H_n (B) -> H_n (C) rgt(diff_n) H_(n-1) (A) ->  H_(n-1) (B) ->  H_(n-1) (C)
  $

  // #align(center,image("imgs/2023-11-03-11-53-54.png",width:80%))

  Putting all these exact sequences together, we get the desired long exact sequence.

  The explicit expression for $diff_n$ follows directly from the Snake Lemma.
  // See https://web.northeastern.edu/suciu/MATH7221/les_homology.pdf.
]

#theorem([Naturality of $diff$])[
  Given a morphism between short exact sequences of chain complexes, i.e., a commutative diagram
  // https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBpiBdUkANwEMAbAVxiRGJAF9T1Nd9CKAIzkqtRizYBBAPoBjAB5ceIDNjwEiAJlHV6zVohAAheUu691AogGZd4g2wDCZ5Zf6aUAFnv7JRjgtVPg1BElIhMT9Ddjdgq09kEUi9CRipAHJXILUPMJ0Uh38TLMU43NDbCKi051LzFQrrb2rUxwCuMRgoAHN4IlAAMwAnCABbJDIQHAgkISCR8bnqGaQdIpjBuMWJxHXVxDsNth7t0d2jg68F8+Xp2cQANhulvZWHgHYXi-ekAA5vkgAKy-J6Ap6gj5tYqDDJnV5Q+7-aExHpw8F-UEATk4FE4QA
#align(center, commutative-diagram(
  node-padding: (50pt, 50pt),
  node((0, 0), [$0$]),
  node((0, 1), [$A_cx$]),
  node((0, 2), [$B_cx$]),
  node((0, 3), [$C_cx$]),
  node((0, 4), [$0$]),
  node((1, 0), [$0$]),
  node((1, 1), [$A'_cx$]),
  node((1, 2), [$B'_cx$]),
  node((1, 3), [$C'_cx$]),
  node((1, 4), [$0$]),
  arr((0, 0), (0, 1), []),
  arr((0, 1), (0, 2), [$f$]),
  arr((0, 2), (0, 3), [$g$]),
  arr((0, 3), (0, 4), []),
  arr((0, 1), (1, 1), [$alpha$]),
  arr((0, 2), (1, 2), [$beta$]),
  arr((0, 3), (1, 3), [$gamma$]),
  arr((1, 0), (1, 1), []),
  arr((1, 1), (1, 2), [$f'$]),
  arr((1, 2), (1, 3), [$g'$]),
  arr((1, 3), (1, 4), []),
))
  then there is a morphism between long exact sequence, i.e., a commutative diagram
  // https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZARgBoAGAXVJADcBDAGwFcYkQAJAfTAAIAKAIIBKEAF9S6TLnyEUAJgrU6TVu259+AIVESp2PASIBmJTQYs2iTjwEBhXZJAYDsogBYzKy+q78wALTEwgIi4k4uMkYoZMTKFmrWGqEA5I76UXLIinHmqlY2mlpp4RmGWaa53omF9iV6ztLlHqRVCQXc-kEh-Hb1EU1uKORe7ewAdJOlja7RyACso-kTUw2RzcOt8cvWk+PT60MLW3k+u6vKMFAA5vBEoABmAE4QALZIABw0OBBI5A3PN5-b6-RBkaoFB5cehwHDTQHvMEgpCKCHsa7Q2Hwl6I1E-JCmNHWKBYB4PbFAxCE-GIACcAJxSGIIxANPcDMpnlZoMWRJADxSmLhHMRvJpADZTjVroKYcKnAikJLuUgAOxSgokskUxHqlVg4gi4H69kKxlI-XzI2IPGg8XW6mg1ViShiIA
#align(center, commutative-diagram(
  node-padding: (50pt, 50pt),
  node((0, 1), [$H_n (A)$]),
  node((0, 2), [$H_n (B)$]),
  node((0, 3), [$H_n (C)$]),
  node((0, 4), [$H_(n-1) (A)$]),
  node((1, 1), [$H_n (A')$]),
  node((1, 2), [$H_n (B')$]),
  node((1, 3), [$H_n (C')$]),
  node((1, 4), [$H_(n-1) (A')$]),
  node((0, 0), [$...$]),
  node((0, 5), [$...$]),
  node((1, 0), [$...$]),
  node((1, 5), [$...$]),
  arr((0, 0), (0, 1), []),
  arr((0, 1), (0, 2), [$f_ast$]),
  arr((0, 2), (0, 3), [$g_ast$]),
  arr((0, 3), (0, 4), [$diff$]),
  arr((0, 4), (0, 5), []),
  arr((1, 0), (1, 1), []),
  arr((1, 1), (1, 2), [$f'_ast$]),
  arr((1, 2), (1, 3), [$g'_ast$]),
  arr((1, 3), (1, 4), [$diff'$]),
  arr((1, 4), (1, 5), []),
  arr((0, 1), (1, 1), [$alpha_ast$]),
  arr((0, 2), (1, 2), [$beta_ast$]),
  arr((0, 3), (1, 3), [$gamma_ast$]),
  arr((0, 4), (1, 4), [$alpha_ast$]),
))
]
#proof[@rotman[Theorem 6.13].
  Since $H_n$ is a functor, the leftmost two squares commute. Take $[c] in H_n (C)$ for some $c in Z_n (C)$, we need to show that $alpha_ast diff ([c]) = diff' gamma_ast ([c])$. 
  
  Let $b in B_n$ be a lifting of $c$, i.e., $g(b) = c$. Then $diff([c]) = [a]$, where $f(a) = d_B (b)$. Therefore, $alpha_ast diff([c]) = [alpha (a)]$. 
  
  On the other hand, since $gamma$ is a chain map, we have $g' beta (b)= gamma g (b) = gamma (c)$. We see that $b' := beta(b) in B'_n$ is a lifting of $c'$ because $g'(b') = g'(beta(b)) = gamma(g(b)) = gamma(c) = c'$. Hence $diff' gamma_ast ([c]) = diff' ([gamma(c)]) = [a']$, where $f'(a') = d_(B') (b') = d_(B') (beta (b))$. 
  
  But 
  $
    f'(alpha(a)) = beta(f(a)) = beta(d_B (b)) = d_(B') (beta(b)) = f'(a')
  $
  and $f'$ is injective, so $alpha(a) = a'$.
]

#corollary[Let $cA$ be an abelian category.
  Then homology induces a functor from the category of #sess of chain complexes in $cA$ to the category of #less in $cA$.
]

== Resolutions


#definition[
  Let $cA$ be an abelian category. Let $M$ be an object of $cA$. A *left resolution* of $M$ is a complex $P_cx$, where $P_i = 0$ for negative $i$, with morphism $epsilon : P_0 -> M$ such that 
  $ ... -> P_2 rgt(d) P_1 rgt(d) P_0 rgt(epsilon) M -> 0 $
  is exact.

  If each $P_i$ is projective, then we call it a *projective resolution*.

  If $cA$ is $RMod$ or $ModR$ and each $P_i$ is a free module, then we call it a *free resolution*.

  In the same way, we define *right resolutions* and *injective resolutions*, only reversing all the arrows. 
]
#proposition[
  $P_cx -> M$ is a resolution if and only if the following chain map $f: P_cx -> M[0]$
// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBpiBdUkANwEMAbAVxiRADpOQBfU9TXPkIoAjOSq1GLNgAUA+gCYefEBmx4CRBeOr1mrRCHkjl-dUKIBmHZP2y5xU6oEbhyACw290w495nBTRRPEQlvAxA-FTVAt2tQ3SkIgFknGNctUgTbH0i0lwtRLLCktiiAjJQybPC2TnYeCRgoAHN4IlAAMwAnCABbJDIQHAgkMRyIqCce-rHqEaRtCbYp-xAZgcQlhcRrZcNVlQ2kPZ33NePEAE550cQADgvezfvbpAB2J9nEd7fEADYvpt-n8AKxAubDO6vfZ5CFbP6-WHldbPE5-EGwmBobAMTTwoY7G4gBhYMAROAQUlTRJ2Qz1RrcIA
#align(center, commutative-diagram(
  node-padding: (50pt, 50pt),
  node((0, 0), [$...$]),
  node((0, 1), [$P_2$]),
  node((0, 2), [$P_1$]),
  node((0, 3), [$P_0$]),
  node((0, 4), [$0$]),
  node((1, 4), [$0$]),
  node((1, 3), [$M$]),
  node((1, 2), [$0$]),
  node((1, 1), [$0$]),
  node((1, 0), [$...$]),
  arr((0, 0), (0, 1), [$d$]),
  arr((0, 1), (0, 2), [$d$]),
  arr((0, 2), (0, 3), [$d$]),
  arr((0, 3), (0, 4), []),
  arr((1, 0), (1, 1), []),
  arr((1, 1), (1, 2), []),
  arr((1, 2), (1, 3), []),
  arr((1, 3), (1, 4), []),
  arr((0, 1), (1, 1), [$0$]),
  arr((0, 2), (1, 2), [$0$]),
  arr((0, 3), (1, 3), [$epsilon$]),
  arr((0, 0), (1, 0), [$...$]),
))
is a quasi-isomorphism. 
]
<resolution-qi>

#proof[
  By definition, $P_cx$ is a resolution if and only if 
  
  1. $P_cx$ is exact at $P_n$ for $n>=1$ and 
  2. $M = Coker(P_1 rgt(d) P_0)$. 

  On the other hand, $f$ is quasi-isomorphism if and only if 
  3. $H_n (P) iso H_n\(M[0]) iso 0$ for $n>=1$ and 
  4. $ H_0(P) iso H_0(M[0]) iso M$. 
  
  (1) is obviously equivalent to (3). (4) is equivalent to $M iso P_0 over IM(d) = Coker(P_1 rgt(d) P_0)$ and thus  equivalent to (2).
]
// (Some more remark...?)
By finding a resolution of a potentially "complicated" object $M$, we can work with a chain complex of "simple" objects, e.g. projective or injective objects.

#lemma[
  If $cA$ has enough projectives, then every object has a projective resolution.

  Dually, if $cA$ has enough injectives, then every object has an injective resolution.
]
<enough-resolution>

#proof[@notes[Lemma 5.20].
  // https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZAdgBoAmAXVJADcBDAGwFcYkQBZEAX1PU1z5CKABwVqdJq3YAGHnxAZseAkQBs4mgxZtEIAAoB9Ob37KhRACybJO9kYCM8s4NUoArKQDME7dL0cxs6KAirCyBqWvlK6ICYKSq7h1lFaMbLBiWFEXqQO0XYBhk6mIeZuyOSkMgX+cZmhFihVVGmFBobkDeXJ1bWx8S7ZKA7e-eyBXaVZTcgypKm2dYNlSUSjrUuxAHS7PBIwUADm8ESgAGYAThAAtkjWIDgQSFVb7FhBpVe3SLmPz4gHn5YjA0NhGARisFvndATQnkh3F9rrC-gjEK9gewoFDkT8MfCAfM3npQeDISsYUhieiHHjYRp-vd6UgyEzEH8sXoPiUFFTEGJ2cQWYgAJyE1ltOpkrAQsCdaEopDi9mc9J6HFTPlKxBs2kyEUOUbslVckAfLUXHUOV60una-EONEA0XcSjcIA
#align(center, commutative-diagram(
  node-padding: (40pt, 40pt),
  node((2, 7), [$M$]),
  node((2, 8), [$0$]),
  node((2, 6), [$P_0$]),
  node((2, 4), [$P_1$]),
  node((3, 5), [$M_0$]),
  node((4, 6), [$0$]),
  node((4, 4), [$0$]),
  node((1, 3), [$M_1$]),
  node((0, 2), [$0$]),
  node((2, 2), [$P_2$]),
  node((0, 4), [$0$]),
  node((3, 1), [$M_2$]),
  node((4, 0), [$0$]),
  node((2, 1), [$...$]),
  arr((3, 5), (2, 6), [$i_0$], label-pos: -1em),
  arr((2, 4), (3, 5), [$epsilon_1$]),
  arr((3, 5), (4, 6), []),
  arr((2, 4), (2, 6), [$d_1$]),
  arr((2, 6), (2, 7), [$epsilon_0$]),
  arr((2, 7), (2, 8), []),
  arr((4, 4), (3, 5), []),
  arr((1, 3), (2, 4), [$i_1$]),
  arr((0, 2), (1, 3), []),
  arr((2, 2), (1, 3), [$epsilon_2$], label-pos: 1.5em),
  arr((2, 2), (2, 4), [$d_2$]),
  arr((1, 3), (0, 4), []),
  arr((3, 1), (2, 2), [$i_2$], label-pos: -1em),
  arr((4, 0), (3, 1), []),
  arr((2, 1), (2, 2), []),
))
  Let $M in cA$.
  By definition of having enough projectives, let $epsilon_0: P_0 -> M$ be an epimorphism where $P_0$ is projective.
  Let $M_0 := Ker epsilon_0$, and we have short exact sequence

  $
    0 -> M_0 -> P_0 -> M -> 0
  $

  Now we can let $epsilon_1: P_1 -> M_0$ be an epimorphism and $M_1 := Ker epsilon_1$, obtaining the short exact sequence
  $
    ses(M_1, P_1, M_0)
  $
  We define $d_1 = i_0 epsilon_1 : P_1 -> P_0$ and then 
  $
    d_1(P_1) = M_0 = Ker epsilon_0
  $
  Thus the chain in exact at $P_0$. The procedure above can be then iterated for any $n >= 1$ and the resultant chain is infinitely long.
  // Set $d_0 = epsilon_0$.
  // Suppose we now have monomorphism $i_(n-1) : M_(n-1) -> P_(n-1)$ and $d_(n-1) : P_(n-1) -> P_(n-2)$ 
  // By induction, givenlet $epsilon_n: P_n -> M_(n-1)$ be an epimorphism, where $P_n$ is projective, and let $M_n = ker epsilon_n$. Thus we have
  // $ 0 -> M_n -> P_n -> M_(n-1) -> 0 $
  // Define $d_n = i_(n-1) epsilon_n$, which is the composite $P_n -> M_(n-1) -> P_(n-1)$. The image of $d_n$ is $ d_(n) (P_n) = M_(n-1) = ker d_(n-1) $ and hence exact.
  // (TODO A very nice commutative diagram!!)
]

// (Some remarks...)

// In the case of $RMod$, we can work with free resolutions instead of just projective ones. 

#theorem("Comparison Theorem")[ In an abelian category $cA$, let $f': M->N$. Consider the commutative diagram, where the rows are chain complexes:
  // https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZAFgBoAGAXVJADcBDAGwFcYkQBZEAX1PU1z5CKMgEZqdJq3YA5HnxAZseAkQCsFCQxZtEIcvP7Kh60uJrbpeg7yODVKAMyaLU3SAAKAfRsKl94WQAJhdJHXZvUUNFARVA0VDLd28g6P84omdzMKsQAEUfNNiTFBDspPYCqNsY4wdkBPK3Sq9UmvSS5HJE5r0iusDupvC+7gkYKABzeCJQADMAJwgAWyQANhocCCQNHPcoaMWVnc3txDI99gOao9Xz06Ruy70YNGxGVRulu6etpCCvsdEAkQH9EI5AXcAOwPYGuEYgGA4eiHb5IAAcsJhzxAUAA5KigQBOWGYnH4wl3US-M5rSFIUQgsFE+mIDags4knFzVqUk4cjHw3I86oKW5IC5g7EVPQ83zzNGIGkMoXuOYEsbcIA
#align(center, commutative-diagram(
  node-padding: (50pt, 50pt),
  node((0, 4), [$M$]),
  node((1, 4), [$N$]),
  node((0, 5), [$0$]),
  node((1, 5), [$0$]),
  node((0, 3), [$P_0$]),
  node((0, 2), [$P_1$]),
  node((0, 1), [$P_2$]),
  node((1, 3), [$Q_0$]),
  node((1, 2), [$Q_1$]),
  node((1, 1), [$Q_2$]),
  node((0, 0), []),
  node((1, 0), []),
  arr((0, 1), (0, 2), [$d$]),
  arr((0, 2), (0, 3), [$d$]),
  arr((0, 3), (0, 4), [$epsilon$]),
  arr((0, 4), (0, 5), []),
  arr((1, 4), (1, 5), []),
  arr((1, 3), (1, 4), [$eta$]),
  arr((1, 2), (1, 3), [$d'$]),
  arr((1, 1), (1, 2), [$d'$]),
  arr((0, 0), (0, 1), []),
  arr((1, 0), (1, 1), []),
  arr((0, 1), (1, 1), [$f_2$], "dashed"),
  arr((0, 2), (1, 2), [$f_1$], "dashed"),
  arr((0, 3), (1, 3), [$f_0$], "dashed"),
  arr((0, 4), (1, 4), [$f'$]),
))
  Assume that $P_n$ is projective for all $n >= 0$ and that $eta: Q_cx -> N$ is a resolution (i.e., the bottom row is exact), then there is a chain map $f_cx: P_cx -> Q_cx$ lifting $f'$ (i.e., $f_cx$ makes the above diagram commutative).
  // i.e. $ eta oo f_0 = f' oo epsilon $
  Further, $f_cx$ is unique up to a chain homotopy equivalence. 
]
<comparison>

#proof[@weibel[Comparison Theorem 2.26], @rotman[Theorem 6.16]. // https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBpiBdUkANwEMAbAVxiRAAUB9ACjAGoAjAEoQAX1LpMufIRQDyVWoxZsAWpzAACbuxHjJ2PASLyBi+s1aIQ6rdwCKeiSAyGZRAEykz1CyuvEYs6u0sYoZD5Klmz2PPzCYoowUADm8ESgAGYAThAAtkhkIDgQSPJR-iBQQVm5BYjlJUheFVYgmRo17XXN1E2IAMz63fmFfaWIACzUDFhgbVB0cAAWySC+ym0wAB5YcDgIwzmjU+O9rWzVohSiQA
#align(center, commutative-diagram(
  node((0, 0), [$P_(n+1)$]),
  node((0, 1), [$Z_n (P)$]),
  node((1, 1), [$Z_n (Q)$]),
  node((1, 2), [$0$]),
  node((1, 0), [$Q_(n+1)$]),
  arr((0, 0), (0, 1), [$d_(n+1)$]),
  arr((0, 1), (1, 1), [$f_n$]),
  arr((1, 1), (1, 2), []),
  arr((0, 0), (1, 0), [$exists f_(n+1)$], "dashed"),
  arr((1, 0), (1, 1), [$d'_(n+1)$]),
)) Set   $f_(-1) = f'$.
  By induction, suppose that $f_n$ has been constructed. We have
  $d_(n+1)$ mapping $P_(n+1)$ to $B_n (P) subset.eq Z_n (P)$. 
  Take any $a in Z_n (P)$, then $ d'_n (f_n (a)) = f_(n-1) (d_n (a)) = f_(n-1) (0) = 0 $
  hence $f_n (a) in Z_n (Q)$, or $f_n : Z_n (P) -> Z_n (Q)$. Now due to the exactness of $Q_cx$, $d'_(n+1)
  : Q_(n+1) -> Z_n (Q)$ is an epimorphism. Since $P_(n+1)$ is an projective object,
  the morphism $f_(n+1) : P_(n+1) -> Q_(n+1)$ exists such that the above diagram commutes.

  For the uniqueness, let $h: P_cx -> Q_cx$ be another chain map lifting $f'$. We want to construct homotopy $s$ with terms $s_n: P_n -> Q_(n+1)$  such that 
  $ h_n - f_n = d'_(n+1) s_n + s_(n-1) d_n $
  for all $n >= -1$. 
  
  For the base case, set $f_(-1) = h_(-1) = f'$, $d_0 = epsilon, d_(-1) = 0, d'_0 = eta, d_(-1) = 0$. We construct $s_(-2) = s_(-1) = 0$, and the claim is trivially true for $n = -1$. 

  For the induction step, assume we have constructed $s_i$ for $i <= n$,

  // https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZAJgBoAGAXVJADcBDAGwFcYkQAFAfQAowBqAIwBKEAF9S6TLnyEUgitTpNW7bn37FREqdjwEiAZkU0GLNok5dCOkBj2yiAFhPLza3mAC0I8ZLvS+nLICoJKZqqWAIqemtr+9jIGKGRhpioWIDEavraJQUakaW6RWZ7xuknBLsURmdneuQmBjijkrnXsfpUFbUXhGV15LcnIAKwdg5bdAQ6jE7VTIOJKMFAA5vBEoABmAE4QALZILiA4EEgTJZlQAOSxWjP7R5c050gAbOnulnexTbsDsdEF8zhdEAB2b6lP58CogZ7AhRgpDta7sKAPeGI1FvcFkdG-f7YoFIAnvRDGQkgTFwp6kxBoilXTqWAAWxIABF5OTtiaIaIx6AAjGCMDgjOQgLBgbCwekvRDk8Gg1kgDlw7m88ogQUisUSuZSmVyti2HGUvFIKHUjWNYRavl8HwCkBC0XiyXsE1YeXmhnIimnNV2uKOrG6t36z1G72y31m-wWgAcVsQgn9ioAnGmnJngVSKYJyPnrWnBBmkwzla83TKbvQ4Gy1pG1XBrAqC2nVUt287fIL6xjG82oJ3cSjEKdGEPfiOW9DMn2BLlKGIgA
#align(center, commutative-diagram(
  node((0, 2), [$P_(n+1)$]),
  node((0, 1), [$P_(n+2)$]),
  node((0, 3), [$P_n$]),
  node((0, 4), [$P_(n-1)$]),
  node((1, 1), [$Q_(n+2)$]),
  node((1, 2), [$Q_(n+1)$]),
  node((1, 3), [$Q_(n)$]),
  node((1, 4), [$Q_(n-1)$]),
  node((0, 0), []),
  node((1, 0), []),
  node((0, 5), []),
  node((1, 5), []),
  arr((1, 1), (1, 2), [$d'_(n+2)$]),
  arr((1, 2), (1, 3), [$d'_(n+1)$]),
  arr((1, 3), (1, 4), [$d'_(n)$]),
  arr((0, 1), (0, 2), [$d_(n+2)$]),
  arr((0, 2), (0, 3), [$d_(n+1)$]),
  arr((0, 3), (0, 4), [$d_(n)$]),
  arr((0, 2), (1, 2), [$h_(n+1) - f_(n+1)$], label-pos: 0),
  arr((0, 3), (1, 3), [$h_(n) - f_(n)$], label-pos: 0),
  arr((0, 4), (1, 4), [$h_(n-1) - f_(n-1)$], label-pos: 0),
  arr((0, 1), (1, 1), [$h_(n+2) - f_(n+2)$], label-pos: 0),
  arr((0, 0), (0, 1), []),
  arr((1, 0), (1, 1), []),
  arr((0, 4), (0, 5), []),
  arr((1, 4), (1, 5), []),
  arr((0, 3), (1, 2), [$s_n$], label-pos: 0, "dashed"),
  arr((0, 4), (1, 3), [$s_(n-1)$], label-pos: 0, "dashed"),
  arr((0, 2), (1, 1), [$s_(n+1)$], label-pos: 0, "dashed"),
))

(Again, only the solid lines commute.)
We want to show the existence of $s_(n+1)$ which satisfies

$ d'_(n+2) s_(n+1) = h_(n+1) - f_(n+1) - s_n d_(n+1) $

We claim that $(h_(n+1) - f_(n+1) - s_n d_(n+1))$ sends $P_(n+1)$ to $Z_(n+1) (Q)$. First notice that this suffices to prove the existence of $s_(n+1)$, as we now have

// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZARgBoAGAXVJADcBDAGwFcYkQAFAfQAowBqYgEoQAX1LpMufIRRli1Ok1bsAWrwHCABDwCKI8ZOx4CRcqQU0GLNohC6N-AEwGJIDMZlEnFxdZV25GKKMFAA5vBEoABmAE4QALZI5iA4EEg+IIxYYLYgUPRwABahIFbKeXCOwmVZ9ABGMIwcUiayIDnYsGJucYkZNGlIZEo27FAA5HzOrjHxSYgpQ4gj-nlF1UJaALRa0Zs7WlVgWlCbtYwNTS2epnaMMNE4PXP9K4PpiADMopSiQA
#align(center, commutative-diagram(
  node((0, 1), [$P_(n+1)$]),
  node((1, 1), [$Z_(n+1) (Q)$]),
  node((1, 0), [$Q_(n+2)$]),
  node((1, 2), [$0$]),
  arr((0, 1), (1, 0), [$s_(n+1)$], label-pos: 0, "dashed"),
  arr((1, 0), (1, 1), [$d'_(n+2)$]),
  arr((0, 1), (1, 1), [$h_(n+1) - f_(n+1) - s_n d_(n+1)$], label-pos: left),
  arr((1, 1), (1, 2), []),
))

where $P_(n+1)$ is projective and $d'_(n+2) : Q_(n+2) -> Z_(n+1) (Q)$ is an epimorphism. 

Now $ 
  d'_(n+1) (h_(n+1) - f_(n+1) - s_n d_(n+1)) &= d'_(n+1) (h_(n+1) - f_(n+1)) - d'_(n+1) s_n d_(n+1) \
  &= d'_(n+1) (h_(n+1) - f_(n+1)) - (h_n - f_n - s_(n-1) d_n) d_(n+1) 
  \ &= d'_(n+1) (h_(n+1) - f_(n+1)) - (h_n - f_n) d_(n+1)
  \ &= 0
$

  Hence $(h_(n+1) - f_(n+1) - s_n d_(n+1))$ sends $P_(n+1)$ to $Z_(n+1) (Q)$.
  // The uniqueness is an exercise. 
]

#lemma("Horseshoe Lemma")[Suppose we have a commutative diagram
// #align(center,image("../imgs/2023-11-04-13-51-57.png",width:50%))
// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZARgBpiBdUkANwEMAbAVxiRAAUByAfQCYQAvqXSZc+Qil7kqtRizZduxQcJAZseAkQDM06vWatEHHgAYVIjeKIAWPbMNsAgpwtrRmicju8ZB+cZObupiWih22n5yRiAurkKWoV52plGOxuYJ7lZh3qQ2aQEgmaohnjqkkfrRCpxmwR7WkpWFMVw8ylllTSQt1ekmPPxdjbmm9v4xAHQzDTle41UORTNTc0lEAKwTNRnr5SjbS5NsmTIwUADm8ESgAGYAThAAtkjjIDgQSMRZjy-f1E+SF4vyer0QUg+X0QumWMRgaGwDAI8VUf3BxDIULeoP+iGIkKB+NMuIx7yJAE5SUgKYDoQAOamIel0pDbOFsBFIlGo+5gpAANlZMKZsKJdg5xiw3CCTIlRPZJ2MaGlsrR-MQ7KJAHZRcLiNomVrocQbAIKAIgA
#align(center, commutative-diagram(
  node-padding: (40pt, 40pt),
  node((1, 1), [$P'_2$]),
  node((1, 2), [$P'_1$]),
  node((1, 3), [$P'_0$]),
  node((1, 4), [$A'$]),
  node((2, 4), [$A$]),
  node((3, 4), [$A''$]),
  node((0, 4), [$0$]),
  node((4, 4), [$0$]),
  node((3, 3), [$P''_0$]),
  node((3, 2), [$P''_1$]),
  node((3, 1), [$P''_2$]),
  node((1, 0), [$...$]),
  node((3, 0), [$...$]),
  node((1, 5), [$0$]),
  node((3, 5), [$0$]),
  arr((1, 1), (1, 2), []),
  arr((1, 2), (1, 3), []),
  arr((1, 3), (1, 4), [$epsilon'$]),
  arr((1, 0), (1, 1), []),
  arr((3, 0), (3, 1), []),
  arr((3, 1), (3, 2), []),
  arr((3, 2), (3, 3), []),
  arr((3, 3), (3, 4), [$epsilon''$]),
  arr((0, 4), (1, 4), []),
  arr((1, 4), (2, 4), [$i_A$]),
  arr((2, 4), (3, 4), [$pi_A$]),
  arr((3, 4), (4, 4), []),
  arr((1, 4), (1, 5), []),
  arr((3, 4), (3, 5), []),
))
 where the
column is exact and the rows are projective resolutions. Set $P_n eq$
$P_n^prime xor P_n^(prime prime)$. Then the $P_n$ assemble to form a
projective resolution $P$ of $A$, and the right-hand column lifts to an
exact sequence of complexes
$ 0 arrow.r P'_cx arrow.r^(i_cx) P_cx arrow.r^(pi_cx) P''_cx arrow.r 0 comma $
where $i_n colon P_n^prime arrow.r P_n$ and
$pi_n colon P_n arrow.r P_n^(prime prime)$ are the natural inclusion and
projection, respectively.




  // Suppose $ses(A', A, A'')$ is a #sest, and $P'_cx rgt(epsilon') A'$ and $P''_cx rgt(epsilon'') A''$ are projective resolutions. Then there exists a projective resolution $P rgt(epsilon) A$ such that $P_n = P'_n ds P''_n$ such that 

  // $
  //   0 -> P' rgt(i) P rgt(pi) P'' -> 0
  // $
  // is a #sest of complexes where $i$ is the canonical inclusion (mono) and $pi$ is the canonical proj.
]
<horseshoe>
// (Some remark...)
#proof[@weibel[Horseshoe Lemma 2.2.8].
  Since $P''_0$ is projective and $pi_A : A -> A''$ is an epimorphism, we can lift $epsilon^(prime prime) : P''_0 -> A''$ to a map 
$tilde(epsilon^(prime prime)) : P_0^(prime prime) arrow.r A$. The direct sum of $tilde(epsilon^(prime prime))$ and
$i_A epsilon^prime colon P_0^prime arrow.r A$ gives a map
$epsilon colon P_0 arrow.r A$. Then the diagram  below
commutes：
// #align(center,image("../imgs/2023-11-04-13-59-23.png",width:80%))
// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZARgBpiBdUkANwEMAbAVxiRAGkYAnAChjWwMCAcgCUIAL6l0mXPkIoyAJiq1GLNp179BBcVJnY8BImQDMq+s1aIO3PgKxCwwsZOkgMR+USXlL6jYgAArCAPoADO6GciYofirUVhq2wZHRnrLGCsh+FkmBbKHhUQaZ3nHIZv4F1mwAgsIZXrE51Ylqdbb1zVk+KNX5nSkgjU1lLdlEETXDQaUek-3IACyzyfO9FTkzHRtsCzFTKGt7hbaH5a3TpEP7F1vXJ7cBXSCXS5VkEa8jH31fUgrX6bCYAnJ+H61P6PY65IEgg6w5bVKFzJFg7ZEarA6Gg1QwKAAc3gRFAADMuBAALZIACc1BwECQETKlJpLMZzMQZjZVNpPK5SAAbHi2DonCIMuyBaKQEykMRWR4ZYqyPLucQ+RzEOqFYgVtqBWsNUgAOxi2wS5zS-nmoW6pRGxXVU2IJ0qu3uh0AVmdiB9DoAHJaQNaRONPTqQ27iIaowLiIG3cqKV6ZrH-XruR60zq-LHhVmLW7eQmkK79fG88bff7k-riEH-SX9c3y4g5fqzVmGW6ix2Y-qlKyKBIgA
#align(center, commutative-diagram(
  node-padding: (40pt, 40pt),

  node((1, 1), [$Ker(epsilon')$]),
  node((2, 1), [$Ker(epsilon)$]),
  node((3, 1), [$Ker(epsilon'')$]),
  node((1, 2), [$P'_0$]),
  node((2, 2), [$P_0$]),
  node((3, 2), [$P''_0$]),
  node((1, 3), [$A'$]),
  node((2, 3), [$A$]),
  node((3, 3), [$A''$]),
  node((1, 0), [$0$]),
  node((1, 4), [$0$]),
  node((2, 0), [$0$]),
  node((2, 4), [$0$]),
  node((3, 0), [$0$]),
  node((3, 4), [$0$]),
  node((0, 1), [$0$]),
  node((4, 1), [$0$]),
  node((0, 2), [$0$]),
  node((4, 2), [$0$]),
  node((0, 3), [$0$]),
  node((4, 3), [$0$]),
  arr((1, 0), (1, 1), []),
  arr((1, 1), (1, 2), []),
  arr((1, 2), (1, 3), [$epsilon'$]),
  arr((1, 3), (1, 4), []),
  arr((2, 0), (2, 1), []),
  arr((2, 1), (2, 2), []),
  arr((2, 2), (2, 3), [$epsilon$]),
  arr((2, 3), (2, 4), []),
  arr((3, 0), (3, 1), []),
  arr((3, 1), (3, 2), []),
  arr((3, 2), (3, 3), [$epsilon''$]),
  arr((3, 3), (3, 4), []),
  arr((0, 1), (1, 1), []),
  arr((1, 1), (2, 1), []),
  arr((2, 1), (3, 1), []),
  arr((3, 1), (4, 1), []),
  arr((0, 2), (1, 2), []),
  arr((1, 2), (2, 2), []),
  arr((2, 2), (3, 2), []),
  arr((3, 2), (4, 2), []),
  arr((2, 3), (3, 3), []),
  arr((1, 3), (2, 3), []),
  arr((0, 3), (1, 3), []),
  arr((3, 3), (4, 3), []),
))

where the right two columns are short exact sequences, and
the @snake[Snake Lemma] shows that the left column is exact and that
$"Coker"lr((epsilon)) eq 0$, so that $P_0$ maps onto $A$. This
finishes the initial step and brings us to the situation
// #align(center,image("../imgs/2023-11-04-13-56-51.png",width:40%))
// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZAJgBoAGAXVJADcBDAGwFcYkRyQBfU9TXfIRRkAjNTpNW7ANIwATgAoYabIwIByAJTdeIDNjwEiZYuIYs2iELMXLVBbTz4HBx0gGYzky9flKVWGpg6lo6zgJGKCKkYjTmUlYACuoA+iJhevyGQsjRnnHe7Mmp6U6ZLpHI5DFeFuwAdI0Z+hE57jUFdVacZS3ZRNX5El0gjfXNWa7CpAAstQkcExVtHvM+PeIwUADm8ESgAGZyEAC2SABsNDgQSDNlR6e3VzeI0cMLUOoZD2evz0gAdnux1+1RA1yQImBjz+4JexGhvzIcKQ7kRSAAHP9EABWdG47Htd4+T5ffFEiGIACc5OxInIXEoXCAA
#align(center, commutative-diagram(
  node-padding: (40pt, 40pt),
  node((0, 2), [$0$]),
  node((1, 2), [$Ker(epsilon')$]),
  node((2, 2), [$Ker(epsilon)$]),
  node((3, 2), [$Ker(epsilon'')$]),
  node((1, 1), [$P'_1$]),
  node((3, 1), [$P''_1$]),
  node((1, 0), [$...$]),
  node((1, 3), [$0$]),
  node((3, 0), [$...$]),
  node((4, 2), [$0$]),
  node((3, 3), [$0$]),
  arr((1, 0), (1, 1), []),
  arr((1, 1), (1, 2), [$d'$]),
  arr((1, 2), (1, 3), []),
  arr((0, 2), (1, 2), []),
  arr((1, 2), (2, 2), []),
  arr((2, 2), (3, 2), []),
  arr((3, 0), (3, 1), []),
  arr((3, 1), (3, 2), [$d''$]),
  arr((3, 2), (4, 2), []),
  arr((3, 2), (3, 3), []),
))
The filling in of the "horseshoe" now proceeds by induction.
]
#endlec(8)