#import "libs/template.typ": *
#import "libs/var.typ": *
#import "libs/commute.typ": node, arr, commutative-diagram

#set heading(numbering: "1.1.")
#set enum(numbering: "(1)")

#let textwidth = 100%;
#let img(path, width: textwidth) = {
  align(center, image("imgs/ha/" + path + ".jpg", width: width))
}



// Take a look at the file `template.typ` in the file panel
// to customize this template and discover how it works.
#show: project.with(
  title: "Homological Algebra",
  authors: (
    "Notes by Yuhang Wei",
    "Lectures by Kobi Kremnitzer"
  ), 
  date: "October 24, 2023",
)

#outline(indent: true)
#pagebreak()
#include "module.typ"



#pagebreak()

= Basic Category Theory

This section is a crash course in Category Theory. The reader is advised to take the Category Theory course concurrently and/or refer to other materials when necessary.

== Basic Definitions

#definition[
  A *category* $cal(C)$ consists of 
  - A collection of *objects* $ob cC$ and 
  - For every pair of objects $X, Y in ob cC$, a collection of *morphisms* $hom_cC (X, Y)$, where for $f in Hom(C)(X, Y)$ we denote $f: X->Y$ or $X ->^f Y$ and say $X$ is the *domain* of $f$ and $Y$ is the *codomain* of $f$;
  such that
  - For every object $X$, there exists an *identity morphism* $id_X in Hom(C) (X, X)$;
  - For every pair of morphisms $f : X -> Y$ and $g : Y -> Z$, there exists a *composite morphism* $g oo f : X -> Z$,

  subject to the axioms:
  - For every morphism $f : X -> Y$, we have $id_y oo f = f oo id_X = f$;
  - For every triple of morphisms $f : X -> Y$, $g : Y -> Z$ and $h: Z -> W$, we have $(h oo g) oo f = h oo (g oo f)$, which we simply denote as $h oo g oo f$. 
]

#notation[
  We usually write $X in cC$ when we mean $X in ob cC$. We sometimes denote $Hom(C)(X, X)$ as $End(C) (X)$ (the *endomorphisms* of $X$). We might simply write $hom$ instead of $Hom(C)$ if the underlying category is clear from the context.
]

#definition[
  A category $cC$ *locally small* if for every $X, Y in cC$, $Hom(C) (X, Y)$ is a set. A category $cC$ is *small* if it is locally  small and further $ob cC$ is a set. 
]
// #remark[
  These definitions above are to avoid set-theoretic size issues, which we shall not delve into. They are employed when necessary to ensure that we do not run into paradoxes.
// ]
#example[
  A *discrete category* $cC$ is one where 
  $
    hom_cC (X, Y) = cases({id_X} quad &X = Y, nothing quad &X != Y)
  $
  It does not contain more information than $ob cC$, so it can be simply regarded as a collection of objects, or a set when $cC$ is small.
]
#example[
  If $ob cC = {x}$, then $hom_cC (x, x)$ is a *monoid*.
]

// #remark[
  If you have never heard of monoids before, the above can be seen as the definition of a monoid.
In general, a category is a "generalised" monoid because in a category you can only compose two morphisms $f, g$ in certain situations (namely, when the codomain of $f$ and the domain of $g$ match), whereas composition is allowed for any two elements of a monoid.
// ]

#example[ The following are the main cateogries we will be working with.
  - The category $Set$ has objects which are sets and morphisms which are functions between sets. Notice in category theory we avoid talking directly about elements of a set, because a set, which is an object of the category $Set$, is "atomic" or inseparable.
  - Let $k$ be a field. The category $veck$ has objects which are vector spaces over $k$ and morphisms which are linear transformations between vector spaces. We often denote $hom_veck$ as $homk$. In particular, for any $V, W in veck$, $homk (V, W)$ is also a vector space.
  - Let $R$ be a ring. The category $RMod$ has objects which are #lrms and morphisms which are module homomorphisms. Similarly, we have the category $ModR$ of #rrms. We often denote $hom_RMod$ or $hom_ModR$ as $homr$; it should be clear from the context which one we are referring to.
  - The category $Grp$ has objects which are groups and morphisms which are group homomorphisms. Similarly, we have the category $Ab$ of abelian groups. 
  // $veck, Set, $ left/right $R$-modules, bimodules, topological spaces, etc.
]

#definition[
  A morphism $f: B-> C$ is *monic* (or a *monomorphism*) if for any $e_1, e_2 : A -> B$ such that $f compose e_1 = f compose e_2$ we have $e_1 = e_2$.
  
  A morphism $f: B->C$ is *epic* (or an *epimorphism*) if for any $g_1, g_2 : C-> D$ such that $g_1 compose f = g_2 compose f$ we have $g_1 = g_2$.
]

#example[
  In $Set$, a monomorphism is equivalent to a one-to-one map and an epimorphism is equivalent to an onto map.
]
#example[
  In the category of commutative rings, $ZZ -> QQ$ is both monic and epic. Note that if two maps agree on $ZZ->R$, they must also agree on $QQ -> R$, since a ring homomorphism $f: QQ -> R$ is uniquely determined by $f(1)$. 
]
#example[
   In the category of commutative rings, for any ring $R$ and its ideal $I$, $R -> R\/I$ is epic.
]
// [Any localisation in ring is epic? #TODO]

== Categories with a Zero Object

#definition[
  An *initial object* $I$ of category $cC$ is an object such that for any $A in ob cC$, there exists a unique map $I -> A$.  
  
  A *final object* $T$ is an object such that for any $A in ob cC$ there exists a unique map $A -> T$.
]

#example[
  In $Set$, an initial object is equivalent to an empty set, while a final object is equivalent to a one-element (or singleton) set.
]

#definition[
  A *zero object* $0$ is both initial and final.
]

#example[
  In $RMod$, a zero object is equivalent to the zero module.
]

#proposition[
  If there is a zero object in the category, then for any $B, C in cC$ we have a *zero morphism* $0 in hom_cC (B, C)$ which factors through the zero object.
  <zero-factor>

  // https://tikzcd-typst-editor.pages.dev/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBpiBdUkANwEMAbAVxiRACEQBfU9TXfIRQAmclVqMWbAMLdeIDNjwEiARlKrx9Zq0Qhi3cTCgBzeEVAAzAE4QAtkjIgcEJKp5XbDxE5dJRIAxYYLogUHRwABbGcp72-tR+iOqBwaHhUTFcFFxAA
// #image("imgs/4.png", width: 30%)
]
#proof[
  #align(center, commutative-diagram(
  node-padding: (40pt, 40pt),
  node((0, 0), [$B$]),
  node((0, 2), [$C$]),
  node((1, 1), [$0$]),
  arr((0, 0), (0, 2), [$0$]),
  arr((0, 0), (1, 1), [$exists!$], "dashed"),
  arr((1, 1), (0, 2), [$exists!$], "dashed"),
))
  It is clear from the commutative diagram.
]
#notation[
  In a commutative diagram, two paths with the same starting and ending points correspond to two equal morphisms.
]

#notation[
  We (ab)use the notation $0$ to denote both a zero object and a zero morphism.
]

#definition[
  In a category with a zero object, a *kernel* of $f: B->C$ is a map $i: A-> B$ such that $f compose i  = 0$ in a universal way. That is, for any $i' : A'-> B$ such that $f compose i' = 0$, there exists a unique morphism $h : A' -> A$ such that $i' = i oo h$. We denote $i = ker(f)$. Diagrammatically,
// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZARgBpiBdUkANwEMAbAVxiRAEEQBfU9TXfIRQAmUsKq1GLNgCFuvEBmx4CRAMzkJ9Zq0QgAwvL7LBRAAybq26XvYByI4v4qhyUWa1TdIM9wkwoAHN4IlAAMwAnCABbJDIQHAgkUUkdNjDHSJikCwSkxHjrbyxMqNjEDTyc6gYsMG8oOjgACwCQKy82GAAPLDgcOAACAEJS7IrqRLiOtL0sBx5wsuqqxAAWRZAs8rXJ-OFN7aRKqfWuCi4gA
#align(center, commutative-diagram(
  node-padding: (50pt, 50pt),
  node((1, 1), [$A$]),
  node((2, 2), [$B$]),
  node((1, 3), [$C$]),
  node((1, 0), [$A'$]),
  node((0, 2), [$0$]),
  arr((2, 2), (1, 3), [$f$]),
  arr((1, 1), (2, 2), [$i$]),
  arr((1, 0), (1, 1), [$exists !$], "dashed"),
  arr((1, 0), (2, 2), [$i'$], label-pos: -1em),
  arr((1, 1), (0, 2), []),
  arr((0, 2), (1, 3), []),
  arr((1, 0), (0, 2), []),
))
  // #v(20pt)
  // https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBpiBdUkANwEMAbAVxiRAEEQBfU9TXfIRQBGclVqMWbAELdeIDNjwEiAJjHV6zVohABhOXyWCiZYeK1Td7AOTdxMKAHN4RUADMAThAC2SUSA4EEjqEtps7oYgXr5IZIHBiAGWOiBYUTF+iPFBIdQARjBgUEgALACcmpKpxBneWQDM1LnZ1AxYYKlQdHAAFo4gVeG6MAAeWHA4cAAEAIR1sYhNCf5DVml2PB71SMstoSlstVwUXEA
// #align(center, commutative-diagram(
//   node-padding: (40pt, 40pt),
//   node((0, 0), [$A$]),
//   node((0, 1), [$B$]),
//   node((0, 2), [$C$]),
//   node((1, 0), [$A'$]),
//   arr((0, 1), (0, 2), [$f$]),
//   arr((0, 0), (0, 1), [$i$]),
//   arr((0, 0), (0, 2), [$0$], curve: 35deg),
//   arr((1, 0), (0, 0), [$exists !$], label-pos: 1.5em, "dashed"),
//   arr((1, 0), (0, 1), [$i'$]),
//   arr((1, 0), (0, 2), [$0$], label-pos: -1em),
// ))
  // #image("imgs/5.png", width: 30%)
]
#notation[
  Sometimes, people might also say the object $A$ in the above definition is the kernel of $f$ when the map $i$ is clear, and write $A = ker(f)$. However, this easily leads to confusion later on, so this note adapts the following non-standard notation: we write $A = Ker(f)$ (with a capital K) when we mean the object and $i = ker(f)$ when we mean the morphism. Hence, we would have 
  $
    Ker(f) -->^(ker(f)) B ->^f C
  $
  such that $f oo ker(f) = 0$ in a universal way.
   Similar notations will be used for concepts we define later.
   <ker-notation>
]

// #example[
//   In $Set$, a kernel of $f: X -> Y$ is the inclusion map
//   $
//     i: { x in X | f(x) = 0} arrow.hook X
//   $
//   Hence we might also say the set ${ x in X | f(x) = 0}$ is a kernel of $f$.
// ]

#example[
  In $veck$, kernels are kernels.
]
#theorem[
  A kernel is a monomorphism. 
]

// (This indicates that $A$ is the "biggest" subobject (to be defined!) of $B$ to be mapped to zero by $f$.)

#definition[ A *cokernel* of $f: B->C$ is a map $j: C-> D$ such that $j compose f  = 0$ in a universal way. We denote $j = coker(f)$ and $D = Coker(f)$.]

#theorem[
  A cokernel is an epimorphism.
]

#example[
  In $veck$, the cokernel of $T: V -> W$ is the quotient map $W -> W \/ im T$.
]

#lemma[
  Let $A$ be any object. Then for the unique morphism $f: A -> 0$, we have $ker(f) = id_A$ and $coker(f) = id_0 = 0$. Dually, for $g: 0->A$, we have $ker(g) = 0$ and $coker(g) = id_A$.
]

#definition[
  The *opposite category* of $cC$ is a category $cC^op$  where $ob cC^op = ob cC$ and $hom_(cC^op)(x, y) = hom_cC (y, x)$.
]

#proposition[A morphism $f: B->C$ is monic in $cC$ if and only if $f^op : C -> B$ is epic in $cC^op$.]

We say that "monic" and "epic" are *dual* concepts. Similarly, "initial objects" and "final objects" are dual; "kernels" and "cokerels" are dual.

== Products and Coproducts

#definition[
  Let  ${C_i | i in I}$ be a family of objects, then their *product* $product_(i in I) C_i$ is an object such that there exist $pi_j : product_(i in I) -> C_j$ for all $j in I$ in a universal way. That is, for any object $D$ with morphisms $g_j : D -> C_j$ for all $j in I$, there exists a unique morphism $D -> product_(i in I)$.
// #image("imgs/6.png", width: 50%)
// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBpiBdUkANwEMAbAVxiRABEQBfU9TXfIRQBGclVqMWbNACdoTAMY4A+gAosAAixgNASQCUGgMLKs3XiAzY8BIqOHj6zVohAmAVt3EwoAc3hEoABmcgC2SGQgOBBIoiAM2i4gUHRwABY+5sFhEdTRSABM1E5Srr7KnjzZEOGIcfmIRRLO0lgVXlxAA
#align(center, commutative-diagram(
  node((0, 0), [$D$]),
  node((0, 1), [$product_(i in I) C_i$]),
  node((1, 1), [$C_j$]),
  arr((0, 0), (0, 1), [$exists !$], "dashed"),
  arr((0, 0), (1, 1), [$g_j$]),
  arr((0, 1), (1, 1), [$pi_j$]),
))

  The *coproduct* of ${C_i | i in I}$ is defined as their product in the opposite category $C^op$. 

  // https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBpiBdUkANwEMAbAVxiRABEQBfU9TXfIRQBGclVqMWbNACdoTAMY4A+gAosAAixgNASQCUGgMLKs3XiAzY8BIqOHj6zVohAmAVt3EwoAc3hEoABmcgC2SKIgOBBIZCAM2i4gUHRwABY+5sFhSABM1NGx1E5SrkHKnjzZEOGI+VExiJElSVgVXlxAA
#align(center, commutative-diagram(
  node((0, 0), [$D$]),
  node((0, 1), [$product.co_(i in I) C_i$]),
  node((1, 1), [$C_j$]),
  arr((0, 1), (0, 0), label-pos: -1em, [$exists !$], "dashed"),
  arr((1, 1), (0, 0), label-pos: -1em, [$f_j$]),
  arr((1, 1), (0, 1), label-pos: -1em, [$i_j$]),
))

// Products in $cC^op$ are coproducts $product.co_(i in I) C_i$:

// #image("imgs/7.png", width: 50%)
]

#example[
  In $Set$, let ${X_i | i in I}$ be a family of sets.
$ product_(i in I) X_i = {(x_i)_(i in I) | x_i in X_i} $ and $product.co_(i in I) X_i$ is the disjoint union. 
]

#remark[
  We need to use tuples here for the ordering of elements; suppose we want to use sets only, then it can be messy and arbitrary! This is an advantage of the language of category theory over that of set theory.
]

#proposition[
  $ Hom(C) (A, product C_i) bij product Hom(C) (A, C_i) $
]

#proof[
 For any $C_i$, there exists $pi_i : product C_i -> C_i$ satisfying the universal property. Define $phi: Hom(C) (A, product C_i) -> product Hom(C) (A, C_i)$ as 

 $ f |-> (pi_i compose f)_i = (pi_1 compose f, ..., pi_n compose f) $
  #align(center, commutative-diagram(
    node((0, 0), [$A$]),
    node((0, 1), [$product C_i$]),
    node((1, 1), [$C_i$]),
    arr((0, 0), (0, 1), [$f$]),
    arr((0, 0), (1, 1), [$g_i$]),
    arr((0, 1), (1, 1), [$pi_i$]),
  ))
Any $(g_i)_i in product Hom(C) (A, C_i)$ can be factorised as $(pi_i compose f')_i$ for some unique $f': A -> product C_i$ due to the universal property of the product. The existence of $f'$ ensures the surjectivity of $phi$ and uniqueness injectivity. Thus $phi$ is a bijection.
  // #image("imgs/8.png", width: 50%)
]

#proposition[
  $ Hom(C) (product.co C_i, A) bij product Hom(C) (C_i, A) $
]

#proof[ This is similar to the above case: we just reverse all the arrows.
  #align(center, commutative-diagram(
    node((0, 0), [$A$]),
    node((0, 1), [$product.co C_i$]),
    node((1, 1), [$C_i$]),
    arr((0, 1), (0, 0), label-pos: -1em, [$f$]),
    arr((1, 1), (0, 0),  label-pos: -1em, [$g_i$]),
    arr((1, 1), (0, 1), label-pos: -1em, [$i_i$]),
  ))
  Notice the asymmetry here. It is not coproduct on the right hand side because it is still a tuple of arrows.
]



== Functors and Natural Transformations

#definition[
  Let $cC$, $cD$ be categories.
  A *functor* $F: cC -> cD$ consists of
  - A map of objects $ob cC -> ob cD$;
  - #fw[For every pair objects $C_1, C_2 in cC$, a map of morphisms $ Hom(C) (C_1, C_2) -> Hom(D) (F(C_1), F(C_2)) $ ]
  subject to preserving morphism composition and identity morphisms. ]
#definition[
  Now we can define $bd("Cat")$, the category of all (small) categories, where $ob bd("Cat")$ are small categories and $hom_Cat (cC, cD)$ are functors between $cC$ and $cD$. 
]
#definition[
  Suppose $F, G: cC -> cD$, then a *natural transformation* $alpha: F => G$ is defined by a collection of morphisms in $cD$ indexed by $x in ob cC$: $ {alpha_x: F(x) -> G(x)}_(x in ob cC) $ where the diagram commutes:
  // https://tikzcd-typst-editor.pages.dev/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBpiBdUkANwEMAbAVxiRADEAKADwEoQAvqXSZc+QigCM5KrUYs2AcR78hI7HgJEyk2fWatEHHgHJVwkBg3ii03dX0Kjy7mcGyYUAObwioAGYAThAAtkhkIDgQSJJqIEGhMdRRSADMDvKGIMr+5gHBYYgRKYgATBkGbFy5ghYJheWR0YipAhQCQA
#align(center, commutative-diagram(
  node((0, 0), [$F(x)$]),
  node((0, 1), [$G(x)$]),
  node((1, 0), [$F(x')$]),
  node((1, 1), [$G(x')$]),
  arr((0, 0), (0, 1), [$alpha_x$]),
  arr((0, 1), (1, 1), label-pos: 1.5em, [$G(f)$]),
  arr((0, 0), (1, 0), label-pos: 1.5em, [$F(f)$]),
  arr((1, 0), (1, 1), [$alpha_x'$]),
))
// #image("imgs/9.png", width: 50%)
]

#definition[
The *functor category* $"Fun"(cC, cD)$ is a category where the objects are functors $cC -> cD$ and the morphisms are natural transformations. 
]

#remark[
In $Cat$, the hom-sets are not only sets but also categories, which means that $Cat$ is a *2-category*. 
]


#endlec(2)

== Adjoint Functors 
#definition[
  Functors $L : cA arrows.rl cB : R$ are *adjoint* if for all $A in cA, B in cB$ there exists a bijection $ tau_(A B) : Hom(B)(L(A), B) bij Hom(A) (A, R(B)) $ such that for any $f: A-> A'$ and $g: B-> B'$, the diagram commutes:
//  #image("imgs/10.png")
// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBpiBdUkANwEMAbAVxiRAAkIBbACgCEAlAAIeAGR4BBAOQDSQwQJABfUuky58hFAEZyVWoxZtOvQSPETZ8xSrXY8BIgCY91es1aIO3fsLGSrPhllVRAMe00iMm19dyMvEwCRaTkAJV8bUPCNRx1SGLdDT29eS2S0jJC7HK1kFwKDD2MfMskKoIEbfRgoAHN4IlAAMwAnbiQyEBwIJG1bEFHxxF0pmcQnecWuCepppABmQqavHDomAH1JKUEqhbHt5d21gBYj+Kmzy4lrW62kF1WSAArG9iqcLpJ5MFNvcDk8kM8YUtXoDEEClBQlEA
#align(center, commutative-diagram(
  node-padding: (40pt, 40pt),
  node((0, 0), [$Hom(B) (L(A'), B))$]),
  node((0, 1), [$Hom(B) (L(A), B)$]),
  node((0, 2), [$Hom(B) (L(A), B')$]),
  node((1, 0), [$Hom(A) (A', R(B))$]),
  node((1, 1), [$Hom(A) (A, R(B))$]),
  node((1, 2), [$Hom(A) (A, R(B'))$]),
  arr((0, 0), (0, 1), []),
  arr((0, 1), (0, 2), []),
  arr((0, 0), (1, 0), [$tau_(A'B)$]),
  arr((0, 1), (1, 1), [$tau_(A B)$]),
  arr((0, 2), (1, 2), [$tau_(A B')$]),
  arr((1, 0), (1, 1), []),
  arr((1, 1), (1, 2), []),
))
]

#remark[
  Recall in linear algebra we have $angle.l T v, w angle.r  = angle.l v, T^* w angle.r $, where the name "adjoint" comes from.
]

Equivalently, $tau$ is a natural isomorphism between $Hom(B) (L(-), -)$ and $Hom(A) (-, R(-))$, both of which are functors $cA^op times cB -> Set$.

What's a product category? It's just pairs of objects and pairs of morphisms. 

Why $cA^op$ here? Because $Hom(A)(-, B)$ is a contravariant functor.

#example[
  (Free, Forget) adjunction. Forget: $ veck &-> Set \ (V, +, dot) &|-> V $ Free: $ Set &-> veck \ X &|-> k[X] $

$ hom_(veck)(k[X], W) &iso hom_(Set) (X, "Forget"(W))\
T &|-> T|_X \
"linearly extended" f &arrow.l.bar f
$

Free is the left adjoint of Forget. 

Forget: $Grp -> Set$. Free: $Set -> Grp$. Also happens. 
]


== Equivalence of Categories

#definition[
  In a category $cC$, objects $X, Y$ are *isomorphic* if there exists $f: X-> Y$ and $g: Y -> X$ such that $f compose g = id_Y$ and $g compose f  = id_X$. We say that $f$ and $g$ are *isomorphisms*. 
]
  In the functor category, an isomorphism (which is a natural transformation between functors) is often called a *natural isomorphism*.

Consider $Cat$, then two small categories $cC$ and $cD$ are isomorphic if there are functors $F: cC-> cD$ and $G: cD-> cC$ such that $F compose G  = Id$ and $G compose F = Id$. However, this rarely happens. We hence introduce the following weaker condition.
#definition[
  Two categories $cC$ and $cD$ are *equivalent* if there are functors $F: cC-> cD$ and $G: cD-> cC$ such that there exist natural isomorphisms $epsilon: F G => Id$ and $eta: Id => G F$. In this way $F(G(X)) iso X$ instead of $F(G(X))=X$.
]
  It does not really matter here if we write $F G => Id$ or $Id => F G$ (the same for $G F$) because it is a natural isomorphism, but the above way of writing is to ensure consistency with an alternative definition of adjoint functors.

#remark[
  Let $X, Y in Top$ and $f: X arrows.lr Y : g$ be continuous maps. If $f compose g tilde id $ and $g compose f tilde id$ then $X, Y$ are homotopy equivalent. Natural transformations are simiar to the notion of homotopy.
] 

== Limits and Colimits

#definition[
Let $I$ be a small category and $F: I -> cA$ be a functor. Then $F$ is called a *diagram*. Denote $F(i)  = F_i$ for all $i in I$. 
A *cone* of $F$ is an object $C$ of $cA$ with morphisms ${f_i : C -> F_i}_(i in I)$, such that for any $alpha : j -> i $  in $I$,

// #image("imgs/11.png", width: 30%)
// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBpiBdUkANwEMAbAVxiRABkQBfU9TXfIRRkAjFVqMWbAGIB9AFbdeIDNjwEiI0mOr1mrRCDlZu4mFADm8IqABmAJwgBbJGRA4ISLRP1s0WBSU7RxdENw8kACZdSQMVAJMeYOcvagjEaJ8pQ2kACkY0AAs6AEpTLiA
#align(center, commutative-diagram(
  node-padding: (50pt, 50pt),
  node((0, 0), [$C$]),
  node((1, 0), [$F_j$]),
  node((1, 1), [$F_i$]),
  arr((0, 0), (1, 0), [$f_j$]),
  arr((0, 0), (1, 1), [$f_i$]),
  arr((1, 0), (1, 1), [$F(alpha)$]),
))

commutes. 

A limit is a universal cone; namely, $L$ is a *limit* of $F$ if it is a cone of $F$ with ${pi_i : L -> F_i}_(i in I)$ and there exists a unique morphism $h : C -> L$ for any cone $C$ of $F$ with ${f_i : C-> F_i}_(i in I)$ such that $f_i = pi_i oo h$ for all $i in I$. We denote $L = lim_I F$.


// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBoBGAXVJADcBDAGwFcYkQAZEAX1PU1z5CKMgCZqdJq3YAxAPoArHnxAZseAkXKlxNBizaIQ8rMv7qhRMsQn7pRgMI8JMKAHN4RUADMAThABbJDIQHAgkbUkDdjQsRTMQP0DgmjCkUT0pQ1U4014ffyDESLTEDKj7YwAKJjQAC3oASgSkooBmVPDimgAjGDAoJABaNpC7bO94mkZ6PsYABQENYRBfLDc6nBbCpA7QrvK+gd2xrPZJvJVW3c6UkEYsMGyoejg61xBM6KMYAA8sOA4OAAAgAhM5uEA
#align(center, commutative-diagram(
  node-padding: (50pt, 50pt),
  node((1, 0), [$L$]),
  node((2, 0), [$F_j$]),
  node((2, 1), [$F_i$]),
  node((0, 0), [$C$]),
  arr((1, 0), (2, 0), [$pi_j$]),
  arr((1, 0), (2, 1), [$pi_i$]),
  arr((2, 0), (2, 1), [$F(alpha)$]),
  arr((0, 0), (2, 0), [$f_j$], curve: -30deg, label-pos: right),
  arr((0, 0), (2, 1), [$f_i$], curve: 30deg),
  arr((0, 0), (1, 0), [$exists !$], "dashed"),
))


// (Any $L$ that makes the diagram commute is called a cone and being universal means that it's a final object in the category of cones.)

// #image("imgs/12.png", width: 30%)

// If such $L$ exists then we call it the limit of $F$ or $lim_cal(I) F$.
]
#notation[
  Sometimes we write $L = lim F_i$ when $I$ is clear from the context or is not important.
]
Dually, we define the colimit of $F$. This concept is important enough to be restated as follows. 
#definition[
Let $I$ be a small category and $F: I -> cA$ be a diagram. Denote $F(i)  = F_i$ for all $i in I$. 
A *cocone* of $F$ is an object $C$ of $cA$ with morphisms ${f_i :  F_i -> C}_(i in I)$, such that for any $alpha : j -> i $  in $I$,
// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBpiBdUkANwEMAbAVxiRABkQBfU9TXfIRRkAjFVqMWbAGIB9AFbdeIDNjwEiI0mOr1mrRCDlZu4mFADm8IqABmAJwgBbJFpA4ISMhP1s0WBSU7RxdEACZqDy9dSQMVAJNqBjoAIxgGAAV+dSEQeywLAAscIJAHZ1dIz3CY30NpAApGNEK6AEpTLiA
#align(center, commutative-diagram(
    node-padding: (50pt, 50pt),
  node((0, 0), [$C$]),
  node((1, 0), [$F_j$]),
  node((1, 1), [$F_i$]),
  arr((1, 0), (0, 0), [$f_j$], label-pos: 1.5em),
  arr((1, 1), (0, 0), [$f_i$], label-pos: -1em),
  arr((1, 0), (1, 1), [$F(alpha)$]),
))
commutes.

A colimit is a universal cocone; namely, $L$ is a *colimit* of $F$ if it is a cocone of $F$ with ${pi_i :  F_i -> L}_(i in I)$ and there exists a unique morphism $h :  L -> C$ for any cocone $C$ of $F$ with ${f_i : F_i -> C}_(i in I)$ such that $f_i = h oo pi_i $ for all $i in I$. We denote $L = colim_I F$.
// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBoBGAXVJADcBDAGwFcYkQAZEAX1PU1z5CKMgCZqdJq3YAxAPoArHnxAZseAkXKlxNBizaIQ8rMv7qhRMsQn7pRgMI8JMKAHN4RUADMAThABbJG0QHAgkMkkDdjQsRTMQP0CkURowiL0pQ1U4014ffyDEEPTEVKj7YwAKJjQAC3oASgSkopLwxABmGgAjGDAoJE7Iu2zveJpGej7GAAUBDWEQRhhvHBbClLSO7pA+gaQAWmHM6KNxvJVWjNCdyawwbKh6ODrXEFPKmAAPLDgcOAAAgAhM5uEA
#align(center, commutative-diagram(
    node-padding: (50pt, 50pt),
  node((1, 0), [$L$]),
  node((2, 0), [$F_j$]),
  node((2, 1), [$F_i$]),
  node((0, 0), [$C$]),
  arr((2, 0), (1, 0), [$pi_j$], label-pos: -1em),
  arr((2, 1), (1, 0), [$pi_i$], label-pos: -1em),
  arr((2, 0), (2, 1), [$F(alpha)$]),
  arr((2, 0), (0, 0), [$f_j$], curve: 30deg, label-pos: 1em),
  arr((2, 1), (0, 0), [$f_i$], label-pos: 1em, curve: -30deg),
  arr((1, 0), (0, 0), [$exists !$], label-pos: -1em, "dashed"),
))
]

#proposition[
  If any limit or colimit exists, then it is unique up to a unique isomorphism. 
]

#notation[
  Hence we usually say "the" limit (or kernel, product, etc.) instead of "a" limit of a diagram.
]

#example[
  If $I$ is a discrete category, then $lim_I F = product_(i in I) F_i$ is the product and $colim_I F = product.co_(i in I) F_i$ is the coproduct.
]
#definition[Let $I = circle.filled arrows.rr circle.filled$ be the category with two objects and two parallel morphisms between them. Let $F : I-> cC$ be a functor which maps $I$ to 
$
   A arrows.rr^f_g B
$
in $cC$. Then we define the *equaliser* of $f$ and $g$ as $lim_I F$, denoted as $Eq(f, g)$, and *coequaliser* of $f$ and $g$ as $colim_I F$, denoted as $Coeq(f, g)$. #TODO
]

#notation[
  Continuing with #thmref(<ker-notation>)[Notation], we have
  $
  EQ(f, g) -->^(Eq(f, g)) A arrows.rr^f_g B -->^(Coeq(f, g))  COeq(f, g)
$
]

#proposition[
  In a category with a zero object,
$Eq(f, 0) = ker f $ and $Coeq (f, 0) = coker f$.

]

#proposition[
  An equaliser is a monomorphism.  A coequaliser is an epimorphism.
]


// #image("imgs/15.png")

// Coequaliser is just another direction. 


#proposition[ 
  Let $L : cA arrows.lr cB : R$ be an adjunction and $ L(colim A_i) iso colim L (A_i) \ R(lim B_i) iso lim R(B_i) $ 
]
#proof[
  Take $X in cB$.

  $ hom_cB (L(colim A_i), X) = hom_cA (colim A_i,  R(X)) =  lim hom_cA (A_i, R(X)) \ = lim hom_cB (L (A_i),  X)  =  hom_cB (colim L (A_i), X) $

If we move colimit out of $hom$, it becomes limit. This is seen for products and coproducts. 

We then apply Yoneda Lemma to show $L(colim A_i) $ and $colim L(A_i)$ are isomorphic. 
]

#remark[
Left adjunction preserves colimits and right adjunction preserves limits.
In particular, left adjunction preserves cokernels and are right exact; right adjunction preserves kernels and are left exact (to be defined later). 
]

== Subobjects

@awodey[Section 5.1]. 
This section offers some new vocabulary to describe things we already have seen.

#definition[
  Let $A$ be an object of category $cC$. A *subobject* of $A$ is a monomorphism $u : S -> A$. 
  
  Give two subobjects $u : S-> A$ and $v : T->A$ of $A$, we define the relation of *inclusion* of subobjects by $u subset.eq v$ if and only if there exists $f : S -> T$ such that $u = v oo f$. Such $f$ is unqiue if it exists, since $v$ is a monomorphism.

  We say two subobjects $u : S-> A$ and $v : T->A$ of $A$ are *equivalent* if $u subset.eq v$ and $v subset.eq u$.
]

#proposition[
  Let  $u : S-> A$ and $v : T->A$  be two equivalent subobjects of $A$, then $S$ and $V$ are isomorphic objects.
]

#notation[
  Sometimes instead of saying $u: S-> A$ is a subobject of $A$, we may say $S$ is a subobject of $A$ when the monomorphism $u$ is clear from the context. 
]

#proposition[
  In category $cC$, $i: A->B$ is the equaliser of $f, g: B-> C$ if and only if $i$ is the largest subobject of $B$ such that $f oo i = g oo i$. In particular, $i: A->B$ is the kernel of $f: B-> C$ if and only if $i$ is the largest subobject of $B$ such that $f oo i = 0$. 
]

The dual concept of subobjects is *quotient objects*.

#pagebreak()

= Abelian Categories 

== $Ab$-enriched Categories

We have seen, for example, that in $veck$ every hom-set not only is a collection (or set) of morphisms but also has some "additional structures", i.e. a vector space. This leads to the idea of enriched categories, where enriching means equipping the hom-sets with "additional structures". The following is an instance where every hom-set is an abelian group.

#definition[
  We call a category $cC$ *$Ab$-enriched* if every $Hom(C)(X, Y)$ is a abelian group, subject to bilinear morphism composition, namely $ (f + g) compose h  = f compose h + g compose h quad "and" quad f compose (k + h) = f compose k + f compose h $
  for all $f, g : Y-> Z$ and $h, k : X->Y$. 
]
#remark[
An equivalent way to put the bilinearity is the following: the composition mappings $ c_(X Y Z): Hom(C)(X, Y) times Hom(C)(Y, Z) -> Hom(C)(X, Z), quad (f, g) mapsto g oo f $
are group homomorphisms in each variable @borceux[Definition 1.2.1]. 
]

// The abelian group structure on hom-sets means that we are allowed to add two morphisms (as above) in $Hom(C)(X, Y)$. 

#definition[
Let $cC$ be an $Ab$-enriched category and $X, Y in cC$. The *zero morphism* $0 in Hom(C)(X, Y)$ is defined as the identity of the abelian group $Hom(C) (X, Y)$.

]
However, note that an $Ab$-enriched category needs not have a zero object, so this is actually a redefinition of a zero morphism from #thmref(<zero-factor>)[Proposition]. We will see later that the two definitions match when the zero object is present. Since group homomorphisms map identity to identity, we have the following:

#proposition[
  In an *Ab*-enriched category, let $X->^g Y->^f Z->^h W$. If $f$ is a zero morphism, then $f oo g$ and $h oo f$ are zero morphisms. <zero-composition>
]

#endlec(3)

We can also define functors between $Ab$-enriched categories which respect the abelian group structures of the hom-set:

#definition[
  If $cC, cD$ are $Ab$-enriched, we call $F : cC -> cD$ an *additive functor* if $ Hom(C)(X, Y) -> Hom(D)(F(X), F(Y)) $ is a group homomorphism for any $X, Y in cC$.
]


#proposition[
  If $cC$ is an *Ab*-enriched category, then so is $cC^op$.
]
#proof[
  The definition is self-dual. Namely, reversing all the arrows in $cC$ breaks neither the group structure on hom-sets nor the bilinear morphism composition. 
]

 An $Ab$-enriched category needs not have a zero object. Nevertheless, once it has an initial or final object, it has a zero object, as shown below.

#proposition[Let $*$ be an object in an *Ab*-enriched category, then the followings are equivalent:
+ $*$ is a final object;
+ $*$ is an initial object;
+ $*$ is a zero object.
<ab-zero>]

#proof[
  (3) $=>$ (1) and (3) $=>$ (2) is obvious. We only prove (1) $=>$ (3), and (2) $=>$ (3) follows from duality.

  Suppose $*$ is a terminal object and let $id_* : * -> *$ be the unique morphism in the abelian group of $Hom(C)(*, *)$, and so $id_* = 0$. 
For any object $A$ and $f : * -> A$ (because $Hom(C)(*, A) $ contains at least the zero morphism), we have $ f = f compose id_* = f compose 0 = 0 in Hom(C)(*, A) $
So there is a unique morphism from $*$ to $A$ and therefore $*$ is also initial. 
]

// This also includes the case of the empty product and coprodut, namely any final object is initial and thus zero. 

In fact, a final object is an empty product and an initial object an empty coproduct, and the previous result can be generalised. 
#proposition[
  In an *Ab*-enriched category $cC$, let $X_1, X_2$ be two objects. Then
  + If the product $X_1 times X_2$ exists, then the coproduct $X_1 union.sq X_2$ also exists and is isomorphic to $X_1 times X_2$;
  + If the coproduct $X_1 union.sq X_2$ exists, then the product $X_1 times X_2$ also exists and is isomorphic to $X_1 union.sq X_2$.'
  <ab-product>
]

#proof[@notes[Proposition 3.7], @li[Theorem 3.4.9] and @borceux[Proposition 1.2.4]. We prove statement (1) and leave (2) to duality.
  
  Suppose the product $X_1 times X_2$ exists with projections $p_k colon X_1 times X_2 arrow.r X_k$. By definition of products, there are unique morphisms $i_k colon X_k arrow.r X_1 times X_2$ such that the following diagrams commute.

// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZARgBpiBdUkANwEMAbAVxiRAA0B9YgAjwFt4PLgCYQAX1LpMufIRQAGclVqMWbLsQlSQGbHgJERy6vWatEHTmMnT9cokoUqz6y5u13ZhlMZEu1CysbFRgoAHN4IlAAMwAnCH4kJRAcCCRiWxB4xOTqNKQRLJykxABmfPTEMlVzNiwoTgAKTQBKT2yE0orUquMQACMYMCgkMpTXIIUOkrHKvJAGLDAgqDo4AAswkFNAthgADyw4HDgAQhmupAAWecR+yfrGlut24qvEW96M6iGRsYme0s03euU+dxSSxWbDWm22uzqlkOx1OPAu4go4iAA
#align(center, commutative-diagram(
  node((1, 1), [$X_1 times X_2$]),
  node((1, 0), [$X_1$]),
  node((1, 2), [$X_2$]),
  node((0, 0), [$X_1$]),
  node((2, 2), [$X_2$]),
  arr((1, 1), (1, 0), [$p_1$], label-pos: -1em),
  arr((1, 1), (1, 2), [$p_2$]),
  arr((0, 0), (1, 0), [$id_(X_1)$]),
  arr((0, 0), (1, 2), [$0$], curve: 30deg),
  arr((0, 0), (1, 1), [$exists ! i_1$], label-pos: -1em, "dashed"),
  arr((2, 2), (1, 2), [$id_(X_2)$], label-pos: -1.5em),
  arr((2, 2), (1, 0), [$0$], label-pos: -1em, curve: 30deg),
  arr((2, 2), (1, 1), [$exists ! i_2$], label-pos: -1em, "dashed"),
))

Explicitly, we have for $j, k in {1, 2}$, $ p_j oo i_k = cases(id_(X_j) quad &"if " j = k, 0 quad &"otherwise") $
// #image("imgs/16.png")

Then we have $ p_1 compose lr((i_1 p_1 plus i_2 p_2)) eq p_1 comma quad p_2 compose lr((i_1 p_1 plus i_2 p_2)) eq p_2 $

By definition of products, $id_(X_1 times X_2) $ is the unique morphism $h : X_1 times X_2 -> X_1 times X_2$ with $p_k compose h eq p_k$ for each $k$, so $i_1 p_1 plus i_2 p_2 eq id_(X_1 times X_2)$. We claim that
$ X_1 rgt(i_1) X_1 times X_2 lft(i_2) X_2 $ is a universal cocone and thus a coproduct. Suppose 
$X_1 rgt(f_1) A lft(f_2) X_2 $
is another cocone. Then we have a map
$ phi eq f_1 compose p_1 plus f_2 compose p_2 colon X_1 times X_2 arrow.r A $
such that for $k = 1, 2$, $phi oo i_k = f_k $.
This gives a commutative diagram
#align(center,image("imgs/2023-10-29-11-34-35.png",width:30%))

It remains to show that $phi$ is unique. To see this, note that for any
such $phi$ we have $ phi & eq phi compose id_(X_1 times X_2)\
 & eq phi compose lr((i_1 p_1 plus i_2 p_2))\
 & eq phi i_1 compose p_1 plus phi i_2 compose p_2\
 & eq f_1 compose p_1 plus f_2 compose p_2 dot.basic $
]


#definition[
  Let $cC$ be an $Ab$-enriched category and let $X, Y in cC$. If $X$ and $Y$ has a product (or a coproduct) in $cC$, then it is called the *biproduct* of $X$ and $Y$, denoted as $X xor Y$.
]

#corollary[
  In an $Ab$-enriched category, a binary biproduct is both a product and a coproduct. 
]
// We can show that $x union.sq y iso x times y$ and we use the notation of a biproduct $x ds y$ to denote both. 

#remark[This extends to all _finite_ products and coproducts but
   does not extend to _infinite_ products or coproducts. 
]

Being able to add and subtract parallel morphisms means we can rephrase the definitions for a monomorphism and epimorphism.

#proposition[
  In an $Ab$-enriched category $cC$, $f : B-> C$ is a monomorphism if and only if  $f oo u = 0$ implies $u = 0$ for all $u : A -> B$. 

  Dually, $f : B -> C$ is an epimorphism if and only if $v oo f = 0$ implies $v = 0$ for all $v : C -> D$. 
  <ab-mono>
]
#proof[
  if $f : B -> C$ is a monomorphism, then in
  $
    A arrows.rr_(u_1)^(u_2) B ->^f C
  $
  whenever $f oo u_1 = f oo u_2$, we have $u_1 = u_2$. This is equivalent to saying whenever $f oo (u_1 - u_2) = 0$, we have $u_1 - u_2 = 0$. On the one hand, take $u_1 = u$ and $u_2 = 0$ gives the "only if" direction; on the other, take $u = u_1 - u_2$ gives the "if" direction.
]

== Additive Categories

Inspired by #thmref(<ab-zero>)[Proposition] and #thmref(<ab-product>)[Proposition], we naturally define the following:

#definition[
  An $Ab$-enriched category $cC$ is *additive* if it has all finite coproducts.
]

Hence an additive category has all finite biproducts, including the zero object which can be considered as the empty biproduct. Now we can reconcile the two definitions we have had for zero morphisms.

#proposition[
  In an additive category $cC$, let $f: A->B$. Then $f$ is the identity of $Hom(C) (A, B)$ if and only if it can be factored as $A -> 0 -> B$.
]
#proof[
  Since $Hom(C) (A, 0)$ has an unique element $h$, it must be the identity of the group. Similarly, $Hom(C) (0, B)$ contains only the identity $g$. The composition $g oo h$ is the identity of $Hom(C) (A, B)$ by #thmref(<zero-composition>)[Proposition].
]



#proposition[
  In an additive category, if a monomorphism $i : A-> B$ is a zero morphism, then $A$ is the zero object. 
  
  Dually, if an epimorphism $p : C -> D$ is a zero morphism, then $D$ is the zero object.
  <additive-mono-zero>
]
#proof[
  Take any $X$ and $u : X -> A$, we have
  $
    X arrow^u A ->^i B
  $
  $i = 0$, so $i oo u = 0$; but since $i$ is monic, $u = 0$ by #thmref(<ab-mono>)[Proposition].
  Therefore there is a unique (zero) morphism from any $X$ to $A$, so $A$ is final and thus zero.
]

#proposition[@rotman[Proposition 5.89]. 
Let $f colon A arrow.r B$ be a morphism in an additive
category $cal(C)$. If $ker f$ exists, then $f$ is monic if and only if $ker f eq 0$.

Dually, if  $coker f$ exists, then $f$ is epic if and only  $coker f eq 0$.
<additive-ker>
]
#proof[
Let $ker f$ be $i : K -> A$. Suppose $i = 0$. Since we know a kernel is a monomorphism, by #thmref(<additive-mono-zero>)[Proposition], $K = 0$. To show that $f$ is monic, take any $u : X -> A$ such that $f oo u = 0$. Then by the universal property of a kernel, there exists a unique morphism $h : X -> K$ such that $u = i oo h$. Thus $u$ factors through $K = 0$, so $u = 0$, proving $f$ is monic by #thmref(<ab-mono>)[Proposition]. 
// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBpiBdUkANwEMAbAVxiRAGkQBfU9TXfIRQBGclVqMWbAILdeIDNjwEiAJjHV6zVohAAhOXyWCiZYeK1TdADW7iYUAObwioAGYAnCAFskAZmocCCQyEAYsMB0QKDo4AAsHEE1JKLjDEE8ff0DgxFEJbTYmdMzfPJykdQKrDJKvMtCgpHzLKKw7LiA
#align(center, commutative-diagram(
  node-padding: (50pt, 50pt),
  node((0, 0), [$K$]),
  node((0, 1), [$A$]),
  node((0, 2), [$B$]),
  node((1, 0), [$X$]),
  arr((1, 0), (0, 0), [$h$], label-pos: 1em, "dashed"),
  arr((1, 0), (0, 1), [$u$], label-pos: -1em),
  arr((0, 1), (0, 2), [$f$]),
  arr((0, 0), (0, 1), [$i$]),
))

On the other hand, suppose $f$ is monic. Then $ker f = 0$ directly follows from #thmref(<ab-mono>)[Proposition].
// We refer to the diagrams in the definitions of kernel and
// cokernel. Let ker $u$ be $iota colon K arrow.r A$, and assume that
// $iota eq 0$. If $g colon X arrow.r A$ satisfies $u g eq 0$, then the
// universal property of kernel provides a morphism
// $theta colon X arrow.r K$ with $g eq iota theta eq 0$ \(because
// $iota eq 0$). Hence, $u$ is monic. Conversely, if $u$ is monic,
// consider $ K arrows.rr^iota_0 A arrow.r^u B dot.basic $
// Since $u iota eq 0 eq u 0$, we have $iota eq 0$. The proof for
// epimorphisms and cokers is dual. 
// #TODO modify
]

== Pre-abelian Categories

Now inspired by #thmref(<additive-ker>)[Proposition], we define the following:

#definition[
  An additive category $cC$ is *pre-abelian* if any morphism has a kernel and a cokernel. 
]

#corollary[
  Let $f$ be a morphism in a pre-abelian category. $f$ is monic if and only if $ker f$ = 0. Dually, $f$ is epic if and only if $coker f = 0$. 
  <pre-add-mono>
]

In fact, we get more than just kernels and cokernels:

#proposition[
  A pre-abelian category has all finite limits and colimits.
]
#proof[
  Let $cC$ be a pre-abelian category. Since
$Eq(f, q) = ker(f - g)$, $cC$ has all equalisers and coequalisers, and thus it has all finite limits or colimits (by category theory, because it also has products and coproducts) @li[Corollary 2.8.4]. #TODO
]

#proposition[
    If $cC$ is pre-abelian, for every morphism $f : X-> Y$, there exists a unique morphism $G -> D$ as shown below. 

// // https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBpiBdUkANwEMAbAVxiRAGsYAnAAgAoAZgEoQAX1LpMufIRQBGclVqMWbABpiJIDNjwEiAJkXV6zVohABNTZN0yiAZmPKzbAMYROXQSPG3p+vKkckqmqhYeXnxRwr5aOgGyyEYhJirmHNx8kVmxYkowUADm8ESgAlwQALZIZCA4EEhyfiAV1U3UDUhGLuGtNq2VNYg9XYgOLW3DCvWNiAAsk0NIAKydcwZL7Qvrq9QMWGAZUHRwABaFIGmuFjAAHlhwOHA8AIT5okA
// #align(center, commutative-diagram(
//   node-padding: (50pt, 50pt),
//   node((0, 0), [$ker (f)$]),
//   node((0, 1), [$X$]),
//   node((0, 2), [$Y$]),
//   node((0, 3), [$coker(f)$]),
//   node((1, 1), [$coker(ker(f))$]),
//   node((1, 2), [$ker(coker(f))$]),
//   arr((0, 0), (0, 1), []),
//   arr((0, 1), (0, 2), [$f$]),
//   arr((0, 2), (0, 3), []),
//   arr((0, 1), (1, 1), []),
//   arr((1, 2), (0, 2), []),
//   arr((1, 1), (1, 2), [$exists !$], "dashed"),
// ))
// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBpiBdUkANwEMAbAVxiRAGkQBfU9TXfIRQBGclVqMWbABrdeIDNjwEiAJjHV6zVohABNOXyWCiAZg0TtbAMKGF-ZUOSjh4rVN0BxO4oEqU6q6akjogACLc4jBQAObwRKAAZgBOEAC2SGQgOBBIopYeIADWMMkAFIkAlHYp6XnUOUjqBaGJNakZiM2NiOYtbADGECXlVe11iPk9ACzBVrpDIwAEZcsVldU8SR1IAKwNuV1zhSNli6Xrm-K1nbPZh-sgDFhgoVB0cAAW0SDHoTAADywcBwcCWAEJIlwgA
#align(center, commutative-diagram(
  node((0, 0), [$K$]),
  node((0, 1), [$X$]),
  node((0, 2), [$Y$]),
  node((0, 3), [$C$]),
  node((1, 1), [$G$]),
  node((1, 2), [$D$]),
  arr((0, 0), (0, 1), [$ker(f)$]),
  arr((0, 1), (0, 2), [$f$]),
  arr((0, 2), (0, 3), [$coker(f)$]),
  arr((0, 1), (1, 1), [$coker (ker (f))$], label-pos: -3.5em),
  arr((1, 2), (0, 2), [$ker(coker(f))$], label-pos: -3.5em),
  arr((1, 1), (1, 2), [$exists !$], "dashed"),
))
<pre-ab-morphism>
]
#proof[
  Since $coker(f) oo f = 0$, by the universal property of kernel, there exists $c : X -> D$ such that $f = ker(coker(f)) oo c$. Since $f oo ker(f) = 0$, we have $ker(coker(f)) oo c oo ker(f) = 0$. Now notice $ker(coker(f))$ is monic, and hence by #thmref(<pre-add-mono>)[Corollary], $ker(ker(coker(f))) = 0$. By the universal property of kernel again, there exists $d : K -> 0$ such that $c oo ker(f) = ker(ker(coker(f))) oo d$. Thus $c oo ker(f)$ factors through the zero object and thus is $0$.  The desired morphism is obtained from the universal property of cokernel.
  #align(center, commutative-diagram(
  node((0, 0), [$K$]),
  node((0, 1), [$X$]),
  node((0, 2), [$Y$]),
  node((0, 3), [$C$]),
  node((1, 1), [$G$]),
  node((1, 2), [$D$]),
  node((2, 2), [$0$]),
  arr((0, 0), (0, 1), [$ker(f)$]),
  arr((0, 1), (0, 2), [$f$]),
  arr((0, 2), (0, 3), [$coker(f)$]),
  arr((0, 1), (1, 1), [$coker (ker (f))$], label-pos: 0),
  arr((1, 2), (0, 2), [$ker(coker(f))$], label-pos: -3.5em),
  arr((1, 1), (1, 2), [$exists !$], "dashed"),
  arr((0, 1), (1, 2), [$c$]),
  arr((2, 2), (1, 2), [$ker(ker(coker(f)))$], label-pos: -4.5em),
  arr((0, 0), (2, 2), [$d$], curve: -40deg)
))
]

#definition[In a pre-abelian category, we define the *coimage* of a morphism $f$ as $ coim (f) = coker(ker(f)) $ and *image* of $f$ as $ im(f) = ker(coker(f)) $ Continuing with #thmref(<ker-notation>)[Notation], we have $G = Coim(f)$ and $D = IM(f)$ in the above diagram.
// #image("imgs/17.png")
// [See Definition 1.2.4, Li-2]

We call $f$ *strict* if the map $Coim (f) -> IM f$ is an isomorphism. 
]
== Abelian Categories



#definition[
  A pre-ablian category is *abelian* if all morphisms are strict. 
]
#corollary[
In an abelian category, every morphism $f : X-> Y$ has a factorisation 
$
  X ->^g IM (f) ->^h Y
$
where $g$ is an epimorphism and $h$ is a monomorphism.
]
#proof[
  Notice $g = coker(ker(f)) = coim(f)$ and $h = ker(coker(f)) = im(f)$.
]

We can always write $f = im(f) oo coim(f)$ and consider $im(f)$ as a subobject of $Y$. 


#remark[
  The followings are two equivalent definitions of an abelian category:
  - A pre-abelian category where every monomorphism is a kernel and every epimorphism is a cokernel;
  - A pre-abelian category where every monomorphism is the kernel of its cokernel and every epimorphism is the cokernel of its kernel.
]

We prove part of the equivalence:

#proposition[
  In an abelian category, every monomorphism is the kernel of its cokernel, and every epimorphism is the cokernel of its kernel.
]
#proof[
  Use the diagram in the proof of #thmref(<pre-ab-morphism>)[Proposition]. Let $f$ be a monomorphism, then $ker(f) = 0$ and $K = 0$. It is not to hard to find $G = X$ and $coker(ker(f)) = id_X$. Since $D$ and $G$ are isomorphic, we see that $X$ is isomorphic to $D$ and thus $f = ker(coker(f))$.
]


#remark[
Now it is time to give a list of properties that abelian categories have, packing everything we have picked up along the way:
- Every hom-set is an abelian group subject to bilinear morphism composition;
- It has a zero object and has a zero morphism between any two objects, which is the identity of the abelian group and factors through $0$;
- It has all limits and colimits;
- Any finite product and coproduct coincide as the biproduct;
- $f$ is monic if and only if $f oo u = 0$ implies $u = 0$, and $g$ is epic if and only if $v oo g = 0$ implies $v = 0$;
- $f$ is monic and $f = 0$ implies the domain of $f$ is $0$, and $g$ is epic and $g = 0$ implies the codomain of $g$ is $0$;
- $f$ is monic if and only if $ker f = 0$, and $g$ is epic if and only if $coker g = 0$;
- $Coim(f) -> IM(f)$ is an isomorphism;
- Any $f$ can be factorised as $f = ker(coker(f)) oo coker(ker(f)) = im(f) oo coim(f)$;
- $f$ is monic if and only if $f = im(f)$, and $g$ is epic if and only if $g = colim(g)$.
]

// Remark. This is equivalent to:  (The converses are always true in any category.) This is equivalent to every mono is the kernel of its cokernel and every epi is the cokernel of its kernel. (? TODO)

We now introduce the most important member in the family of abelian categories.

#proposition[
  For any ring $R$, the category $RMod$ is an abelian category. In particular, $Ab$ is an abelian category.
]
#proof[
  ($RMod$ is $Ab$-enriched.) For any $A, B in RMod$, the set $homr(A, B)$ of module homomorphisms $A -> B$ can be naturally seen as an abelian group under pointwise addition. It is easy to check that the composition is blinear.

  ($RMod$ is additive.) We know that the direct sum exists as a coproduct for any finite family of modules $(M_i)_(i in I)$ in $RMod$.


  ($RMod$ is pre-abelian.) Let $f : A -> B$ be a morphism in $RMod$. Then 
  $
    Ker(f) = {a in A : f(a) = 0}
  $
  with $ker(f) : Ker(f) -> A$ being the inclusion map, is a categorical kernel. Also,
  $
    Coker(f) = B over IM(f)
  $
  where $IM(f) = {f(a) in B : a in A}$, with $coker(f) : B -> Coker(f)$ being the quotient map, is a categorical cokernel. 

  ($RMod$ is abelian.) We find 
  $
    Coker(ker(f)) = A over Ker(f) iso IM(f)
  $
  by the First Isomorphism Theorem and 
  $
    Ker(coker(f)) = IM(f)
  $
  by construction. Hence the image and coimage coincide up to isomorphism, i.e. any $f$ is strict.
]

#remark[
  Note that the product and coproduct of a family $(M_i)_(i in I)$ coincide when $I$ is finite but differ when $I$ is infinite:
$ union.sq.big _(i in I) M_i = plus.circle.big_(i in I) M_i = {(m_i) _(i in I) | m_i in M_i, m_i = 0 "for almost all" i} $
  $ product _( i in I) M_i = {(m_i) _(i in I) | m_i in M_i} $
]

#proposition[
  In $RMod$, a monomorphism is equivalent to an injective homomorphism and an epimorphism is equivalent to a surjective homomorphism.
]


#example[If $cA$ is an abliean category and $cC$ is any small category and then the category of functors $Fun(cC, cA)$ is abelian. [TODO]]

$Fun(cC^op, cA)$ are presheves from $cC$ to $cA$.

#example[
  Non-example. Banach spaces over $RR$. We have $V attach(arrow.r.hook, t: i) W$ which are open. Then $coker i = W \/ overline(V)$. Then $ker coker i = overline(V) != V$. (The closure of $V$.)
This is an example of quasi-abelian categories. 
]


== Exact Sequences and Functors

#note[
  All discussions in this section are limited to an abelian category.
]

We have trekked a long way to establish abelian categories.
The key element that we seek from an abelian category is the notion of exactness:

#definition[
  In an abelian category, a sequence of maps $A attach(->, t: f) B attach(->, t: g) C $ is called *exact* at $B$ if $ker g = im f$ (as equivalent subobjects of $B$).
]

#definition[
  In an abelian category, a *short exact sequence* $0 -> A attach(->, t: f) B attach(->, t: g) C -> 0$ is exact at $A$, $B$ and $C$, or "exact everywhere". 
]

#lemma[
  $im (0 -> A) = 0$ and $im(A -> 0) = 0$.
]

#proposition[
  $0 -> A attach(->, t: f) B attach(->, t: g) C -> 0$ is a #sest if and only if $f$ is monic, $g$ is epic, and $ker g = im f$. 
]
#proof[
  - Exactness at $A$ $<=>$ $ker f = im (0 -> A) = 0$ $<=>$ $f$ is monic.
  - Exactness at $B$ $<=>$ $ker g = im f$.
  - Exactness at $C$ $<=>$ $im g = ker (C -> 0) = id_C$ $<=>$ $g = coim (g )$ $<=>$ $g$ is epic.
]

#proposition[
  If $ses(A, B, C, f:f, g:g)$ is a #sest, then $f = ker g$ and $g  = coker f$. 
]
#proof[
  $f$ is monic, so $f = im(f) = ker(g)$. $g$ is epic, so $g = coim(g) = coker(ker(g)) = coker(f)$.
]

#corollary[
  $ses(A, B, C, f:f, g:g)$ can be rewritten as 
  $
    ses(IM(f), B, Coker(f), f:f, g:coker(f))
  $ or 
  $
    ses(Ker(g), B, Coim(g), f:ker(g), g:g)
  $
]

#definition[
  A #sest $ses(A, B, C)$ is *split* if $B$ is isomorphic to $A ds C$. 
  // #image("imgs/19.png")
]

#lemma(name: "Splitting Lemma")[
  Let $ses(A, B, C, f:f, g:g)$ be a short exact sequence. The followings are equivalent:
  + The short exact sequence is split;
  + There exists a *retraction*#footnote[The terms "retraction" and "section" come from algebraic topology, but for our purpose they are nothing more than certain morphisms.] $r: B->A$ such that $r oo f = id_A$;
  + There exists a *section* $s : C -> B$ such that $g oo s = id_C$.
    <splitting-lemma>
]

#proof[#TODO https://math.stackexchange.com/questions/748699/abstract-nonsense-proof-of-the-splitting-lemma] 

#definition[
  An additive functor $F: cC -> cD$ is called *right exact* if for every #sest $0-> A-> B-> C-> 0$ the sequence $ F(A) -> F(B) -> F(C) ->  0 $ is exact; $F$ is called *left exact* if   $ 0 -> F(A) -> F(B) -> F(C) $ is exact; $F$ is called *exact* if $F$ is both right and left exact, or
  $
    ses(F(A), F(B), F(C))
  $
  is exact.
]

#remark[
  By definition, _right exactness preserves cokernels_, since $C$ is the cokernel of the map $A -> B$ and $F(C)$ is the cokernel of the map $F(A) -> F(B)$. Similarly, _left exactness preserves kernels_. 
]


#lemma[
  Let $cA$ be an abelian category. Let $M in cA$. The functor $ Hom(A)(M, -): cA -> Ab $ is left exact. 
  <hom-left-exact>
]

#proof[
  Let $ses(A, B, C, f: f, g: g)$ be a #sest in $cA$, then we want to prove 
$ 0 -> Hom(A)(M, A) ->^(f oo -) Hom(A)(M, B) ->^(g oo -) Hom(A)(M, C) $
is exact in $Ab$.

  Exactness at $Hom(A) (M, A)$ is equivalent to $(f oo -) $ being monic, so let us calculate $Ker(f oo -)$. Let $u in Hom(A)(M, A)$ such that $(f oo  -) (u) = 0$, i.e. $f oo u  = 0$. But $f$ is monic, so $u = 0$, and thus $Ker(f oo -) = 0$ and $(f oo -)$ is monic.

  Exactness at $Hom(A) (M, B)$ is equivalent to $Ker(g oo -) = IM(f oo -)$. Let $ v in Ker(g oo -)$, in other words $v in Hom(A) (M, B)$ such that $(g oo -) (v) = 0$, i.e. $g oo v = 0$. Then by universal property of kernel, there exists $h : M -> Ker(g)$ such that $v = ker(g) oo h$. But $Ker(g) = IM(f)$ by exactness and $ker(g) = f$, so we have $v = f oo h = (f oo -)(h) in IM(f oo -)$. Hence $Ker(g oo -) subset.eq IM(f oo -)$. The other direction of the inclusion can be similarly proven. Hence $Ker(g oo -) = IM(f oo -)$. 
]


#TODO how to understand $f oo -$

#remark[
  The functor $Hom(A) (M, -)$ fails to be exact in general because it does not necessarily send an epimorphism to an epimorphism. For a counterexample, let $cA = Ab$ (where an epimorphism is equivalent to a surjective homomorphism) and $M = ZZ over 2 ZZ$. The quotient map $h: ZZ -> ZZ over 4 ZZ $ is an surjective homomorphism. On the other hand, for any abelian group $A$, an element in $hom_Ab (ZZ over 2 ZZ, A)$ (i.e. a group homomorphism $ZZ over 2ZZ -> A$) is uniquely determined by an element in $A$ with order $2$. Hence $hom_Ab ( ZZ over 2 ZZ, ZZ) = 0$ and $hom_Ab ( ZZ over 2 ZZ, ZZ over 4ZZ) = ZZ over 2ZZ$, and we see the induced map $ (h oo -) : hom_Ab ( ZZ over 2 ZZ, ZZ) -> hom_Ab ( ZZ over 2 ZZ, ZZ over 4ZZ) $ cannot be surjective. 
]

#corollary[Dually, $Hom(A) (-, M): cA^op -> Ab$ is also left exact. ]


#endlec(4)

== Projective and Injective Objects


#definition[
   Let $cA$ be an abelian category. An object $P$ is called *projective* if $Hom(A) (P, -)$ is exact. 
   
   Dually, an object $I$ is called *injective* if $Hom(A) (-, I)$ is exact. 
]

In other words, $P$ is projective if for any #sest $ses(X, Y, Z)$ in $cA$, $ ses(Hom(A)(P, X), Hom(A)(P, Y), Hom(A)(P, Z)) $ is a #sest.
Thanks to #thmref(<hom-left-exact>)[Lemma], the only special part of the definition is that $Hom(A)(P, Y) -> Hom(A)(P, Z)$ is surjective. 

#proposition[
  $P$ is *projective* if and only if for any epimorphism $h: Y->Z$ and any $f: P->Z$, there exists (not necessarily unique) $g: P->Y$ such that the following commutes (which we refer to as the *lifting property*): 
// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZARgBoAGAXVJADcBDAGwFcYkQAFEAX1PU1z5CKAEyli1Ok1btyPPiAzY8BImQk0GLNohAAtef2VCi5cZK0zdATR6SYUAObwioAGYAnCAFskZkDgQSGJS2uxuhiCePsE0gUjEvO5evogAzHFBiCGWOiAAFpHRqf7x6TSMWGB5UPRw+Q4gmtJ5MAAeWHA4CNyU3EA
#align(center, commutative-diagram(
  node((0, 1), [$P$]),
  node((1, 2), [$0$]),
  node((1, 1), [$Z$]),
  node((1, 0), [$Y$]),
  arr((0, 1), (1, 1), [$f$]),
  arr((1, 1), (1, 2), []),
  arr((1, 0), (1, 1), [$h$]),
  arr((0, 1), (1, 0), [$exists g$], "dashed"),
))
// #image("imgs/20.png", width: 30%)
]

#proof[
  By definition, $P$ is projective if and only if for any epimorphism $h: Y->Z$, we have $ (h oo -) : Hom(A)(P, Y) -> Hom(A)(P, Z) $ is surjective, which means for any $f : P->Z$, there exists $g: P-> Y$ such that $f = h oo g$.
]

#corollary[
  $P$ is a projective object, #iff any #sest 
  $
    ses(A, B, P)
  $
  splits.
]
#proof[
// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZARgBpiBdUkANwEMAbAVxiRAEEQBfU9TXfIRQAmclVqMWbAELdeIDNjwEiAZjHV6zVohAAFOXyWCiAFg0TtbAAyGF-ZUOTWLWqbts8jAlSnXXxNx19bnEYKABzeCJQADMAJwgAWyQAVmocCCRRS3cQLCgAfQMvEATkpDIQTOzNSWCIu3KUxHTqrMQqhiwwYKg6OAALcJA6q10EUuakc3akaynElpc5zsWKxByaxFUuCi4gA
#align(center, commutative-diagram(
  node-padding: (50pt, 50pt),
  node((1, 1), [$A$]),
  node((1, 2), [$B$]),
  node((1, 3), [$P$]),
  node((1, 4), [$0$]),
  node((1, 0), [$0$]),
  node((0, 3), [$P$]),
  arr((0, 3), (1, 3), [$id_P$]),
  arr((1, 2), (1, 3), [$g$]),
  arr((0, 3), (1, 2), [$s$], label-pos: -1em, "dashed"),
  arr((1, 0), (1, 1), []),
  arr((1, 1), (1, 2), []),
  arr((1, 3), (1, 4), []),
))
  Suppose $P$ is projective. Since $g : B-> P$ is an epimorphism, we can always find $s : P -> B$ such that $g oo s= id_P$ by the lifting property. Then just recall #thmref(<splitting-lemma>)[Splitting Lemma]. 
  
  The converse should also be clear.
]

#corollary[Dually, $I$ is injective #iff for any monomorphism $h: X->Y$ and any $f: X->I$, there exists $g: Y->I$ such that the following commutes (which we refer to as the *extension property*):
// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZARgBpiBdUkANwEMAbAVxiRAEkQBfU9TXfIRQAGUsKq1GLNsO68QGbHgJEy46vWatEIABpy+SwUQBMYiZuk6AmtwkwoAc3hFQAMwBOEALZIzIHAgkUUktNjcDEE8fJDIAoMQTHncvX0TqQKQAZg0pbRAAC0jotJz44OoGLDB8qDo4AocQXLCdGAAPLDgcOAACRzsuIA
#align(center, commutative-diagram(
  node((1, 1), [$I$]),
  node((0, 0), [$0$]),
  node((0, 1), [$X$]),
  node((0, 2), [$Y$]),
  arr((0, 1), (1, 1), [$f$]),
  arr((0, 0), (0, 1), []),
  arr((0, 1), (0, 2), [$h$]),
  arr((0, 2), (1, 1), [$exists g$], "dashed"),
))

Also, $I$ is injective #iff any #sest 
$
  ses(I, A, B )
$
splits.
]



// == 
#pagebreak()

= Categories of Modules

== Embedding Theorems

#proposition[
  Ring $R$ viewed as an object in $RMod$ is projective. 
]

#proof[ It is equivalent to say the functor $ homr (R, -)$ is exact.  In fact,
  $homr (R, M) = M $ because any module morphism $phi : R -> M $ is entirely determined by $phi(1_R)$. Given any #sest $ses(M, M', M'') $, if we apply $homr (R, -)$, we get the same #sest, which is exact. 
]

#corollary[
Any free module $R^(ds I)$ is projective. 
]

#proof[
  The proof is similar as above. #TODO
]
#note[In $RMod$, we have
$ homr (R, plus.circle.big_(i in I) M_i) = plus.circle.big_(i in I) M_i = plus.circle.big_(i in I) homr (R, M_i) $
This does not follow from the universal property of the direct sum; this is because $R$ is special. 
]

#definition[
  Let $cA$ be an additive category. We call an object $C$ *compact* if the canonical morphism $ product.co_(i in I) Hom(A) (C, G_i) -> Hom(A)(C, product.co_(i in I) G_i) $
  is an isomorphism for any family ${G_i}_(i in I)$ of objects in $cA$ such that $product.co_(i in I) G_i$ exists. 
]

#remark[
You might find different definitions for an arbitrary category (not necessarily additive), but they are equivalent under the additive context. 
]


#definition[
  In a category $cC$ with coproducts, an object $G$ is called a *generator* if for any $X in cC$, there is an epimorphism 
  $product.co G -> X
  $.
  
]

#note[
For any $M in RMod$, we can find an epimorphism $R^(ds I) -> M -> 0$. (Any module has some generators.) This is not unique. We call $R$ a generator of $M$. Recall #thmref(<module-generator>)[Corollary]. 

]



#lemma[
  In an abelian category $cA$, any hom-set 
  $hom_cA (X, Y)$ can be seen as a right module over ring $End(A)(X)$, or equivalently a left module over $End(A)(X)^op$.
]
#proof[
  First notice $End(A)(X)$ is indeed a ring with composition as multiplication.
  Take any $m in Hom(A)(X, Y)$ and $r in End(A)(X)$: 
  $
    X->^r X ->^m Y
  $
  define the multiplication $m r$ as $m oo r in Hom(A)(X, Y)$. It is easy to verify the this makes a right module.
]

#theorem(name: "Morita's Theorem")[
  Let $cA$ be an abelian category. Assume $cA$ has (small) coproducts. Assume that $P$ is a compact, projective generator. Let ring $R = End(A) (P)$, then the functor $ Hom(A)(P, -) : cA -> ModR $ is an equivalence of categories. 
]


#note[
If $cA = RMod$, we have observed that $R$ (as an object of $RMod$) is a compact, projective generator. In this case, $end_R (R) = R^op$ because any module homomorphism $phi: R -> R$ is determined by $phi(1)$ with the opposite composition; in other words, $phi(r) = r phi(1)$. Then $end_R (R)^op hyph Mod$ is just $RMod$ because $(R^op)^op = R$.
]

#remark[
  Using the definition of equivalence, you want to construct another functor in the opposite direction and show their composites are natural isomprphic to identity functors. Alternatively, you might also prove that the functor is fully faithful and essentially surjective, if you can.
]

#proof[
@rotman[Theorem 5.55]. @pareigis[p. 211].


https://cornellmath.wordpress.com/2008/04/10/abelian-categories-and-module-categories/

We need a functor $G: ModR -> cA$. Inspired by the special case, we want to send $R |-> P$. This is right exact (?) so it must send $R^(ds I) |-> P^(ds I)$. 

For any $M in ModR$ we can find a presentation $ R^(ds J) -> R^(ds I) -> M -> 0 $ 



// #image("imgs/22.png", width: 50%)
#TODO
]

#remark[
$cA$ can have more than one compact, projective generator, say $P_1$ and $P_2$. Then $A = End(A) (P_1)^op hyph Mod = End(A) (P_2)^op hyph Mod$, where rings $End(A) (P_1)$ and $End(A) (P_2)$ are not necessarily isomorphic. This is *Morita equivalence* of rings. 

Consider $veck$ for some field $k$. Then $k$ and $k^n$ are both compact, projective generators of $veck$. Then $k$ and $M_n (k)$ ($n times n$ matrices over $k$) both are equivalent to $veck$ as categories. 
]



#theorem(name: "Freyd-Mitchell Embedding Theorem")[
  If $cA$ is a small abelian category, there is a ring $R$ and an exact, fully faithful embedding $cA -> RMod$.
]

#proof[
Using Yoneda embeddings. $cA -> Fun(cA^op, Ab)$. (?)
]


We can embed an abstract category into a concrete one. From a practical perspective, we can prove any reasonable statements for $RMod$ and they will also hold for abelian categories because of this theorem. An example is the following.


#lemma(name: "Snake Lemma")[
 Suppose we have a commutative diagram of objects in an abelian category or $RMod$ 

 // https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZARgBpiBdUkANwEMAbAVxiRAEEQBfU9TXfIRQAmclVqMWbAELdeIDNjwEiAZjHV6zVohABhOXyWCiZAAzitU3ewDkhhf2VDkoi5sk6Q0+zyMCVFHV3CW02PV95RQCXABZSEKsvMwdo5yIzDVDrEBSucRgoAHN4IlAAMwAnCABbJHUQHAgkTOyvcocq2qR4xubEMja2Is7qusQAVmompFEh3QALUe7EBpnEXqS2LEiKsZ7p-qn5hV2QLvHj9YA2P3P9xAB2Q5a7i5aXgY8w3Sxl8cG6zmW10aBA1AYWDAXjgEEhUG4FC4QA
#align(center, commutative-diagram(
  node((1, 1), [$A$]),
  node((1, 2), [$B$]),
  node((1, 3), [$C$]),
  node((0, 1), [$A'$]),
  node((0, 2), [$B'$]),
  node((0, 3), [$C'$]),
  node((0, 4), [$0$]),
  node((1, 0), [$0$]),
  arr((0, 1), (1, 1), [$f$]),
  arr((0, 2), (1, 2), [$g$]),
  arr((0, 3), (1, 3), [$h$]),
  arr((0, 1), (0, 2), [$i'$]),
  arr((0, 2), (0, 3), [$p'$]),
  arr((0, 3), (0, 4), []),
  arr((1, 0), (1, 1), []),
  arr((1, 1), (1, 2), [$i$]),
  arr((1, 2), (1, 3), [$p$]),
))
// #image("imgs/23.png")

such that the rows are exact, then there is an exact sequence 
$ ker f -> ker g -> ker h attach(->, t: diff)  coker f -> coker g -> coker h $

Further, if $A' -> B'$ is monic, so is $ker f -> ker g$.
If $B -> C$ is epic, so is $coker g -> coker h$.
]
#proof[
  [See https://faculty.etsu.edu/gardnerr/5410/notes/Snake-Lemma.pdf.]
We have the following commutative diagram: 
#v(20pt)
// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZARgBoAmAXVJADcBDAGwFcYkQBBEAX1PU1z5CKchWp0mrdgCEefEBmx4CRAMxiaDFm0QgAwnP5KhRMsXFapujgHJDCgcuHJR5zZJ0hpd3kcEqUdTcJbXY9H3lFf2cyAAYLD3YAaxgAJwACADN7KKciUXj3UN0UjIBzHMcTQNJCkKsQUvSAC0rjAJJSVQTikABjCCbs3wd251FuooaBpoqR3OrkdUn6zxm0lrboogAWUmDLT1itvJRYjVX2Y+5xGCgy+CJQTNSIAFskADYaHAgkVRGL3e-x+f0Q50uumG8iBH3BoKQAE5Aa84QB2BGIHYo4FYzFkSEgOYw1FIAm-MmxHFwgAcmIArNSkPTMaJCa0mYg2RTEMRiJz1CAeXtCVgIs9SXihWCWYS0OKQLDmfjyJziIKeVSSbiITyCYd2Fh7Ereaypp40CAaIwsGBPFB6HBmndjZK6dKkdbbfbHc6oFaQAAjGBgf2IAC0aP52rhiPxWoluOIurBfM53w9iDRnIxmZpN24QA
#align(center, commutative-diagram(
  node((2, 1), [$A$]),
  node((2, 2), [$B$]),
  node((2, 3), [$C$]),
  node((1, 1), [$A'$]),
  node((1, 2), [$B'$]),
  node((1, 3), [$C'$]),
  node((0, 1), [$ker f$]),
  node((0, 2), [$ker g$]),
  node((0, 3), [$ker h$]),
  node((3, 1), [$coker f$]),
  node((3, 2), [$coker g$]),
  node((3, 3), [$coker h$]),
  node((1, 4), [$0$]),
  node((2, 0), [$0$]),
  arr((0, 1), (1, 1), []),
  arr((1, 1), (2, 1), [$f$]),
  arr((2, 1), (3, 1), []),
  arr((0, 2), (1, 2), []),
  arr((1, 2), (2, 2), [$g$]),
  arr((2, 2), (3, 2), []),
  arr((0, 3), (1, 3), []),
  arr((1, 3), (2, 3), [$h$]),
  arr((2, 3), (3, 3), []),
  arr((1, 1), (1, 2), [$i'$]),
  arr((1, 2), (1, 3), [$p'$]),
  arr((1, 3), (1, 4), []),
  arr((2, 0), (2, 1), []),
  arr((2, 1), (2, 2), [$i$]),
  arr((2, 2), (2, 3), [$p$]),
  arr((0, 3), (3, 1), [$diff$], curve: -68deg, "dashed"),
  arr((3, 1), (3, 2), [$j$]),
  arr((3, 2), (3, 3), [$q$]),
  arr((0, 1), (0, 2), [$j'$]),
  arr((0, 2), (0, 3), [$q'$]),
))

  In the first row, consider map $j' := i'|_(ker f) : ker f -> B'$. We claim that $j' : ker f -> ker g$. Indeed, take any $a' in ker f subset.eq A'$, we have 
  $ g(j'(a')) = g(i'(a')) = i(f(a')) = i(0) = 0 $
  Then $j'(a') in ker g$ and thus $j' : ker f -> ker g$. Similarly, $q' := p'|_(ker g) : ker g -> ker h$. We then see the first row is exact because of the exactness of $A' -> B' -> C'$.

  In the last row, define $j : coker(f) -> coker(g)$ as $a + im(f) |-> i(a) + im(g)$ for any $a in A$. We claim that this map is well-defined. If $a_1, a_2 in A$ such that $a_1 + im(f) = a_2 + im(f)$, then $a_1 - a_2 in im(f)$, thus there exists $a' in A'$ so that $a_1 - a_2 = f(a')$. Then 

  $ i(a_1 - a_2) = i(f(a')) = g(i'(a')) in im(g) $

  Then 
  $ j(a_1 + im(f)) = i(a_1) + im(g) = i(a_2) + im(g) = j(a_2 + im(f)) $

  So $j$ is well-defined. Similarly, we can define $q : coker g -> coker h$ and show the exactness of the last row.

  Now all arrows except $diff$, which we call the *connecting homomorphism*, are clear. 
  Pick any $c' in ker h subset.eq C'$. 
  Since $p'$ is surjective, there exists $b' in B'$ so that $p'(b') = c'$. 
  Now $ 0 = h(c') = h(p'(b')) = p(g(b')) $ so $g(b') in ker p = im i$, and there exists unique $a in A$ such that $i(a) = g(b')$. 
  We thus define $diff: ker h -> coker f$ as $ diff(c') = a + im(f) $ 
  We claim this is a well-defined function. 
  Then it suffices to show for any two choices $b'_1, b'_2$ of $b'$ and corresponding choices $a_1, a_2$ of $a$, $diff (c')$ gives the same value. Since $p'(b'_1) = p'(b'_2) = c'$, we have $b'_1 - b'_2 in ker(p') = im(i')$. Thus we can write $b'_1 - b'_2 = i'(a')$ for some $a' in A'$. Then 
  $ i(a_1 - a_2) = g(b'_1 - b'_2) = g(i'(a')) = i (f (a'))  $
  but $i$ is injective, and hence $a_1 - a_2 = f(a') in im f$. In other words, we could define $ diff(c') = i^(-1) g p'^(-1) (c') + im(f) $
  where $p'^(-1)$ means finding some element $b' in B'$ such that $p'(b') = c'$ and so on. 

  We still need to verify this is exact. TODO
  
  See @li[Theorem 6.8.6].
]

== Tensor Products

#TODO hom-tensor adjoint

The functor $- tp_R M$ is left adjoint so it commutes with colimits. In particular, it sends cokernels to cokernels and is right exact. It also preserves direct sums.

 If we want to calcualte $N tp_R M$. Then we pick the relations and generators of $N$: 
$ R^(ds J) -> R^(ds I) -> N -> 0 $
Then we have
$ R^(ds J) tp_R M -> R^(ds I) tp_R M  -> N tp_R M  -> 0 $

Note that $ R^(ds J) tp_R M iso (R tp_R M)^(ds J) = M^(ds J) $ and so it becomes 
$ M^(ds J) -> M^(ds I) -> N tp_R M  -> 0 $

Consider $R^(ds J) -> R^(ds I)$, this homomorphism between free modules can be represented by a (possibly infinite?) matrix $a_(i j) in R$. Then the same matrix can also act as $M^(ds J) -> M^(ds I) $; and when you take the cokernel of it you get the tensor product $N tp_R M$.

#endlec(5)

Assume $R$ is a commutative ring. The functor $- tp_R M$ is left adjoint which implies that it is right exact and commutes with all colimits. Suppose we want to calculate $N tp_R M$, then we write $ N = coker(R^(ds J) rgt((a_(i j))) R^(ds I)) $ and then $ N tpr M = coker(R^(ds J) rgt((a_(i j))) R^(ds I)) tpr M iso coker(R^(ds J) tpr M rgt((a_(i j))) R^(ds I) tpr M) \ iso coker((R tpr M)^(ds J) rgt((a_(i j))) (R tpr M)^(ds I)) iso coker (M^(ds J) rgt((a_(i j))) M^(ds I)) $

#example[
  Suppose $I$ is an ideal of $R$ generated by ${x_i}_(i in J)$, then we have ses $ ses(I, R, R \/ I) $ but we also have $ R^(ds J) -> I -> 0 $ and thus 
  $ R^(ds J) rgt((x_j)) R -> R \/ I -> 0 $

  Thus if we want to calculate for some $M$ $ (R over I )tpr M iso coker (M^(ds J) rgt((x_j)) M) = M over I M $
]
[Check https://math.stackexchange.com/questions/175789/how-to-prove-that-r-i-otimes-r-m-cong-m-im]

#definition[
  A localisation of $R$ is defined by $R[t] over (t x - 1)$, denoted as $R[x^(-1)]$.
]

#example[
  $R[x^(-1)] tpr M iso M[x^(-1)]$.
]

#proof[
  Notice that $R[t] tpr M = M[t]$, because $R[t] iso plus.circle.big_(i=1)^(infinity) R$ in $RMod$.
]

#proposition[
  If $B$ is an $R-S$ bimodule and $C$ is a right $S$-module, then $hom_S (B, C)$ is a right $R$-module.
]

#proof[
  Take any $f in hom_S (B, C)$ and $r in R$, define $f r : B -> C$ as $ b |-> f(r b) $
]

Then this makes $Hom_S (B, -)$ a functor from $Mod hyph S$ to $Mod hyph R$, which is right adjoint to $ - tpr B : Mod hyph S -> Mod hyph R $, as we have cannoical isomorphism 
$ Hom_S (A tpr B, C) bij Hom_R (A, Hom_S (B, C)) $

#remark[
  We haven't really defined $ - tpr B $ when $R$ is not commutative but this can be a definition itself, as left adjoint of $Hom_S (B, -)$.
]

#remark[
  We can define $ M tpr N := Coeq (M tp_ZZ R tp_ZZ N arrows M tp_ZZ N ) $
  This coequaliser basically just makes sure $m r tp n = m tp r n$.
]

// == Projective and Injective Modules

// Recall $P$ is projective if $Hom(A)(P, -)$ is exact and $I$ is injective if $Hom(A)(-, I)$ is exact.

// #lemma[
//   $P$ is projective if and only if it has the lifting property (refer to earlier).

//   $I$ is injective if and only if it has the extension property.
// ]

== $RMod$ has Enough Projectives

#definition[
  An abelian category $cA$ is said to *have enough projectives* (resp. *injectives*) if for any object $M$ there is an epimorphism $P-> M -> 0$ where $P$ is projective (resp. a monomorphism $0 -> M->I$ where $I$ is injective). 
]

For most of our homological algebra to work a category needs to have enough projectives and injectives. We show that $RMod$ has enough projectives and injectives.

#lemma[Free $R$-modules are projective.]

#proof[
Let $F eq plus.circle.big_(i in I) R x_i$ be a free $R$-module with basis
$lr({x_i colon i in I})$. Suppose that we have a diagram
// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZARgBpiBdUkANwEMAbAVxiRACEQBfU9TXfIRQAmclVqMWbAAzdeIDNjwEi0sdXrNWiEAEE5fJYKJlp4zVJ0AxbuJhQA5vCKgAZgCcIAWyQBmajgQSGoSWmyuBiAe3sEBQYjEPG6ePoiiIIGxoZYKWJHRqf4Z8ekMWGDaIFB0cAAW9iAakpWMaLV0tlxAA
#align(center, commutative-diagram(
  node((1, 1), [$B$]),
  node((1, 2), [$0$]),
  node((1, 0), [$A$]),
  node((0, 1), [$F$]),
  arr((0, 1), (1, 1), [$f$]),
  arr((1, 1), (1, 2), []),
  arr((1, 0), (1, 1), [$pi$]),
  arr((0, 1), (1, 0), [$alpha$], label-pos:-1em, "dashed"),
))

Since $pi$ is surjective, for each $i$ there is some $a_i in A$ with
$pi lr((a_i)) eq f lr((e_i))$. Define map
$ alpha colon F arrow.r A$ by $alpha lr((x_i)) eq a_i$ and we have $f = pi oo alpha$.
]

#proposition[$P$ is a projective $R$-module if and only if $P$ is a direct summand of a free module.
]

#proof[
  Assume $P$ is a projective. Then we can always find a free module $F=R^(ds I)$ such that $g: F -> P$ is onto. Using the lifting property,

// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBoBGAXVJADcBDAGwFcYkQAxEAX1PU1z5CKchWp0mrdgAUefEBmx4CRAExiaDFm0Qhic-kqFFRxcVqm7Z3cTCgBzeEVAAzAE4QAtkjIgcEJHJeVw9vRFE-AMRVYJB3LyQAZhp-HxpGLDAdECh6OAALOxBNSWyYAA8sOBwEWPiw5MjAku12LCgeSm4gA
#align(center, commutative-diagram(
  node-padding: (50pt, 50pt),
  node((1, 0), [$F$]),
  node((1, 1), [$P$]),
  node((1, 2), [$0$]),
  node((0, 1), [$P$]),
  arr((1, 0), (1, 1), [$g$]),
  arr((1, 1), (1, 2), []),
  arr((0, 1), (1, 0), [$exists$], "dashed"),
  arr((0, 1), (1, 1), [$id$]),
))

So there exists a section $P-> F$ in the ses $ ses(K, F, P) $
and hence $F iso K ds P$, where $K = ker(g)$. This shows that $P$ is a direct summand of a free module.

[This is equivalent to find some idempotent $p: R^(ds I) -> R^(ds I)$ such that $p^2= p$. ? ]

Now we show a direct summand of a free module is projective. 
Suppose that $P$ is a direct summand of a free module. Then there
exists some $R$-module $P^prime$ such that $P xor P^prime$ is free. Let
$pi colon A arrow.r B$ be a surjection and let $f colon P arrow.r B$ be
some map. Let $f^prime colon P xor P^prime arrow.r B$ be the map
$f^prime lr((p comma p^prime)) eq f lr((p))$. Since $P xor P^prime$ is
free, hence projective, $f^prime$ has a lift
$alpha^prime colon P xor P^prime arrow.r A$. Now define
$alpha colon P arrow.r A$ by
$alpha lr((p)) eq alpha^prime lr((p comma 0))$.

// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZARgBoAmAXVJADcBDAGwFcYkQAhEAX1PU1z5CKchWp0mrdgAYefEBmx4CRaWJoMWbRCACCc-kqFEyxcZqk6ACgAIocG1YDkBhQOXCSpaecnaQVjziMFAA5vBEoABmAE4QALZIoiA4EEjSvNFxiYhqKWmIxJkgsQlIACw0qekafuxRIDQARjBgUEgAzBnypTkdVQV5Fv5RLs2t7bnFvZ0DSTSMWGD+UPRwABYhjRJa7Exo6-RjIC1t6dPZFXOIyYvL7KsbW7W7OvuH26eTALRdF2WISr5TrcSjcIA
#align(center, commutative-diagram(
  node-padding: (50pt, 50pt),
  node((2, 1), [$B$]),
  node((2, 2), [$0$]),
  node((2, 0), [$A$]),
  node((1, 1), [$P ds P'$]),
  node((0, 1), [$P$]),
  arr((2, 0), (2, 1), [$pi$], label-pos: -1em),
  arr((2, 1), (2, 2), []),
  arr((0, 1), (2, 1), [$f$], curve: 30deg),
  arr((1, 1), (2, 1), [$f'$], label-pos: -1em),
  arr((1, 1), (2, 0), [$alpha'$], "dashed"),
  arr((0, 1), (2, 0), [$alpha$], curve: -30deg, "dashed"),
  arr((0, 1), (1, 1), [$i$], label-pos: -1em),
))
]

#corollary[
    $RMod$ has enough projectives. 
]
#proof[
  For any module $M$ we can find a free (and thus projective) module $F$ with a surjection $ F-> M-> 0 $
]


== $RMod$ has Enough Injectives

#lemma(name: "Baer's criterion")[
  A right $R$-module $M$ is injective iff for every right ideal $I$ of $R$, every module homomorphism $I -> M$ can be extended to $R -> M$.
]

#proof[
  One direction easily follows from definition. We focus on the other.

  // https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBpiBdUkANwEMAbAVxiRAEEQBfU9TXfIRQBGclVqMWbdgHJuvEBmx4CRAExjq9Zq0QcZcnn2WCiAZk0SdbAELzjA1SjLDx2qXoCy3cTCgBzeCJQADMAJwgAWyQyEBwIJFE4uiwGNgALCAgAa3sQcKjE6nikDWTUjKzco3yI6MQyksQLcrS9TJy8gvrYpoAWLUldfK66oriExAGQBiwwYag6OHS-EEHrPUY0dLpDBW7S4snp92GtnYM1mbmFpZWoUcLmo6Rp2fm2ReXVrgouIA
#align(center, commutative-diagram(
  node-padding: (50pt, 50pt),
  node((0, 0), [$A$]),
  node((0, 1), [$A'$]),
  node((0, 2), [$A''$]),
  node((0, 3), [$B$]),
  node((1, 0), [$M$]),
  arr((0, 0), (0, 1), [], "inj"),
  arr((0, 1), (0, 2), [], "inj"),
  arr((0, 2), (0, 3), [], "inj"),
  arr((0, 0), (1, 0), [$f$]),
  arr((0, 1), (1, 0), [$alpha'$], "dashed"),
  arr((0, 2), (1, 0), [$alpha''$], curve: 10deg, "dashed"),
  arr((0, 3), (1, 0), [], curve: 30deg, "dashed"),
))

  Fix some injection $i colon A arrow.r B$ of
$R$-modules, and some map $f colon A arrow.r M$. Without loss of
generality, assume that $A subset.eq B$ and $i$ is the inclusion. 


[Construction of $A'$ and $alpha' : A' -> M$.] Let
$Sigma$ be the set whose elements are $R$-module maps
$alpha^prime colon A^prime arrow.r M$, where
$A subset.eq A^prime subset.eq B$ and $alpha^prime$ extends $f$. We may give this set a partial order by
saying that $alpha^prime lt.eq alpha^(prime prime)$ when
$A^prime subset.eq A^(prime prime)$ and $alpha^(prime prime)$ extends
$alpha^prime$. Suppose that $alpha_1 lt.eq alpha_2 lt.eq dots.h$ is an
ascending chain in $Sigma$, with corresponding modules
$A_1 subset.eq A_2 subset.eq dots.h$. Let $A^prime eq union A_n$, and
define $alpha^prime colon A^prime arrow.r M$ by
$alpha^prime lr((a)) eq alpha_i lr((a))$ for $a in A_i$. It is easy to
check that $alpha^prime$ is a well-defined element of $Sigma$, and it is
an upper bound on the chain \(n.b. we are really just taking the colimit
of the chain).
Since $Sigma$ is a partially ordered set in which every ascending chain
has an upper bound, by Zorn’s Lemma it has a maximal element,
which we call $alpha^prime colon A^prime -> M$. 

To show that $M$
is injective, we need to show that $A^prime eq B$, since we then have an
extension $alpha$ of $f$ to $B$. 

[Construction of $phi : R-> M$.] Suppose that $A^prime eq.not B$. Let $b in B without A^prime$, and
define 
$ A^(prime prime) eq A^prime plus R b = {a + r b : a in A', r in R} subset.eq B $ Let
$I eq brace.l r in R$ : $b r in A^prime}$. Then $I$ is a right ideal of
$R$, and we have a map
$ I arrow.r M comma quad r arrow.r.bar alpha^prime lr((b r)) $

By assumption, this extends to a map $phi colon R arrow.r M$. 

[Construction of $alpha'' : A'' -> M$.] We
claim that there is a well-defined map
$ alpha^(prime prime) colon A^(prime prime) arrow.r M comma quad a plus b r arrow.r.bar alpha^prime lr((a)) plus phi lr((r)) comma $
where $a in A^prime$ and $r in R$. To see that this is well-defined,
suppose that $a plus b r eq a^prime plus b r^prime$
where $a, a' in A'$ and $r, r' in R$.
Then
$ a minus a^prime eq b lr((r^prime minus r)) in A^prime sect b R dot.basic $

From this we see $r - r' in I$, and then we have
$ phi lr((r^prime minus r))
 = alpha^prime lr((b lr((r^prime minus r)))) = alpha^prime lr((a minus a^prime)) $

Therefore, it follows that
$alpha^prime lr((a)) plus phi lr((r)) eq alpha^prime lr((a^prime)) plus phi lr((r^prime))$
so $alpha^(prime prime)$ is well-defined. But then $alpha^(prime prime)$
strictly extends $alpha^prime$, contradicting maximality of
$alpha^prime$. Hence $A^prime eq B$.

See @notes[Theorem 5.8] and @rotman[Theorem 3.30].]

#definition[
  Let $R$ be an integral domain. A $R$-module $M$ is called *divisible* if, for all $r in R without {0}$, every element $m$ of $M$ can be \"divided\"
by $r$, in the sense that there is an element $m^prime$ in $M$ such that
$m eq r m^prime$. 
]
This condition can be reformulated by saying that the
multiplication by $r$ defines a surjective map from $M$ to $M$.

#corollary[
  If $R$ is a PID, then an $R$-module $M$ is injective if
  and only if it is divisible.
]

That is, for all $m in M$ and
  $r in R without brace.l 0 brace.r$ there exists $m' in M$ such that
  $m eq r m'$. Also recall that a PID is an integral domain in which every ideal is principal, i.e., can be generated by a single element.

  // [Unfortunately the notations are confusing, because we use $I$ to represent an ideal in the last theorem but the same letter for an $R$-module here.]

// The details of the proof can get in the way of the intuitive idea, which
// is quite simple. Maybe try proving it yourself before reading on \(use
// Baer’s Criterion).

#proof[
Let $M$ be an injective $R$-module, and let $m in M$ and
$r in R without brace.l 0 brace.r$. Set $J eq r R$ (which is an ideal of $R$) and define
$f colon J arrow.r M$ by $f lr((r)) eq m$. By Baer’s Criterion, we may
extend $f$ to a homomorphism $tilde(f) colon R arrow.r M$. Then
$ m eq f lr((r)) = tilde(f)(r)eq tilde(f) lr((r dot.op 1)) eq r dot.op tilde(f) lr((1)) $
So taking $m' eq tilde(f) lr((1))$, we see that $M$ is divisible.

Suppose conversely that $M$ is a divisible $R$-module. Let $J$ be an
ideal of $R$ and let $f colon J arrow.r M$ be a module homomorphism. If
$J$ is the zero ideal, then trivially we may extend $f$ to the zero
homomorphism $R arrow.r M$. Assume that $J$ is nonzero.
Since $R$ is a PID, we have $J eq R r$ for some nonzero $r in J$. Let
$m eq f lr((r))$. Then since $M$ is divisible, there is some $m' in M$
such that $m eq r m'$. Define $tilde(f) colon R arrow.r M$ by
$tilde(f) lr((1)) eq m'$. Clearly $tilde(f)$ is an extension of $f$, so
$M$ is injective by Baer’s Criterion.

See @rotman[Corollary 3.35] and @notes[Corollary 5.9].]

#example[
  In $Ab = ZZ hyph Mod$, we have that $QQ, ZZ_(p^ infinity) = ZZ[1 / p] over ZZ, QQ over ZZ$ are injective.

  Every injective abelian group $I = I_"tor" ds I_"free"$, where $I_"free"$ is a $QQ$-vector space and $I_"tor"$ (torsion part) is a direct sum copies of $ZZ_(p^ infinity)$.
]

#lemma[
    Direct sums of projectives are projectives, and   products of injectives are injectives. 
]

#proof[
  The first half is easily seen from 
  $ Hom (ds P_i, -) = product Hom (P_i, -) $
  The second half is dual.
]
#proposition[
  $Ab$ has enough injectives. 
]

#proof[
  For any $A in Ab$, define a map $I : Ab -> Ab$ by $ I(A) := product_(Hom_Ab (A, QQ over ZZ)) QQ over ZZ $

  The RHS is injective as a product of injectives $QQ over ZZ$.

  Consider canonical map $e_A: A -> I(A)$, where (because $I(A)$ is a product) we need to define for each $phi  in hom_Ab (A, QQ over ZZ)$ the component $e_(a, phi) : A -> QQ  over ZZ$, which we just define to be $phi$ itself. Explicitly, for any $a in A$, 
  $ e_A (a) = (phi(a))_(phi in hom_Ab (A, QQ over ZZ)) $

  We claim that $e_A$ is injective. We need to show that for any $0 != a in A$ there exists $phi in Hom_Ab (A, QQ over ZZ)$ such that $phi(a) != 0$.
  //  (using that $QQ over ZZ$ is injective). 

  - If $a$ has an infinite order, then set $phi(a)$ as any nonzero element of $QQ over ZZ$ and we obtain a group homomorphism $phi$ such that $phi(a) != 0$;
  - If $a$ has order $m$ for some integer $m > 1$, then we set $phi(a) = 1/m + ZZ$ and this is a well defined group homomorphism. 

  [See https://math.stackexchange.com/questions/4071941/category-of-abelian-groups-has-enough-injectives.]
]

#endlec(6)

// = injective and projective and adjoints 

#proposition[
  If an additive functor $R: cB -> cA$ between abelian categories is right adjoint to an exact functor and $I$ is injective in $cB$, then $R(I)$ is injective in $cA$. 
  
  Dually, if an additive functor $L: cA -> cB$ is left adjoint to an exact functor and $P$ is projective in $cA$, then $L(P)$ is projective in $cB$. 
]
#proof[
  We want to show that 
  $ Hom(A)(-, R(I)) $ is exact. 
  We have
  $ Hom(A)(-, R(I)) iso Hom(B)(L(-), I ) $
  but $L$ is exact and $Hom(B)(-, I)$ is exact, so $Hom(B)(L(-), I )$ is a composition of exact functors and thus exact.

  See @notes[Lemma 5.25] and @weibel[Proposition 2.3.10].
]
With this proposition, we can construct adjunctions to prove if there is enough proj/inj.

#corollary[
  If $I$ is an injective abelian group, then $hom_Ab (R, I)$ is an injective #rrm.
]
#proof[
  // Notice that $hom_Ab (R, A)$ is a #lrm.
Assume $R$ is a ring and $M$ is a #rrm. $ hom_Ab ("Forget"(M), A) bij hom_Ab (M tpr R, A ) bij hom_ModR (M, hom_Ab (R, A)) $
using hom-tensor adjunction, where $"Forget": ModR -> Ab$ is the forgetful functor and we view $R$ as a left $R$-module here (instead of an $R, R$-bimodule). 

This shows that $"Forget"$ is left adjoint to $hom_Ab (R, -)$. The forgetful functor is clearly exact.
]

#example[
  $hom_Ab (R, QQ over ZZ)$ is injective.
]

#proposition[
  $RMod$ has enough injectives. 
]

#proof[
  Let $M$ be a left $R$-module. 
  We define
  $ I(M) = product_(homr(M, hom_Ab (R, QQ over ZZ))) hom_Ab (R, QQ over ZZ) $
  $I(M)$ is injective as a product of injectives, and there is a canonical morphism $e_M : M -> I(M)$. We only need to construct $ e_(M, phi) : ModR ->hom_Ab (R, QQ over ZZ), quad M mapsto phi(M) $ for all $phi in homr(M, hom_Ab (R, QQ over ZZ))$.

  // Exercise: $e_M$ is one-to-one (mono). (like what we did before.) [TODO]

  We only need to show that for any $0 != m in M$, there exists $phi : M -> hom_Ab (R, QQ over ZZ)$ such that $phi(m) != 0$. Notice that we have $ phi in homr(M, hom_Ab (R, QQ over ZZ)) iso hom_Ab (M, QQ over ZZ) $
  Hence we only need to find some $phi : M -> QQ over ZZ$ in $Ab$ so that $phi(m) != 0$. This is the same case as before.
]

#pagebreak()
= Chain Complexes

Let $cA$ be an abelian category. 

#definition[
  A *chain complex* $Ccx$ in $cA$ is a family ${C_n}_(n in ZZ)$ of objects in $cA$ with morphisms $d_n : C_n -> C_(n-1)$ such that $d_n oo d_(n-1) = 0$ (or $d^2 = 0$), where $d_n$ are called *differentials*. The *$n$-cycles* of $Ccx$ are $ Z_n := ker d_n $ and the *$n$-boundaries* are $ B_n := im d_(n+1) $
 
  We have $ B_n arrow.hook Z_n arrow.hook C_n $ (as subobjects) for all $n$.

  The *$n$-th homology* are defined as $ H_n (C_cx) := coker(B_n arrow.hook Z_n) $
]

#align(center,image("imgs/2023-11-03-12-27-08.png",width:80%))

#definition[
    We can form a category $"Ch"(cA)$ with objects as chain complexes and morphisms as *chain maps* $u_cx : C_cx -> D_cx$ which
  commutes with differentials, namely for all $n in ZZ$,
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
#example[
  Show that $u_cx : Ccx -> Dcx$ induces a morphism $H_n (u_cx) : H_n (Ccx) -> H_n (Dcx)$ and thus $H_n : "Ch"(cA) -> cA$ is a functor. 
]


#definition[
  A chain map  $C_cx -> D_cx$ is called a *quasi-isomorphism* if the induced maps $H_n (C_cx) -> H_n (D_cx)$ are all isomorphisms. 
]

// #remark[
// (Remark here, connection to topology)
//   Derived category of an abelien category $cA$ is $ D(A) = Ch(A) ["qiso"^(-1)]$. Compare to $R[s^(-1)]$ for some $s in R$ and non-commutative $R$. 
  
//   Non-linear version: homotopy types. $Top[W^(-1)]$

//   (TODO)
// ]

#proposition[
  Tfae: 
  - $C_cx$ is exact at every $C_n$;
  - $C_cx$ is *acyclic*, i.e. $H_n (C_cx) = 0$ for all $n$;
  - $0 -> C_cx$ is a quasi-isomorphism. 
]
#proof[Trivial.]

// #definition[
//   A cochain complex is given by ${C^n}_(n in ZZ)$ and $d^n : C^n -> C^(n+1)$ with $d^2 = 0$.

//   ... Just dual. TODO
// ]

#definition[
  A *cochain complex* $Ccx$ in $cA$ is a family ${C^n}_(n in ZZ)$ of objects in $cA$ with morphisms $d^n : C^n -> C^(n+1)$ such that $d^n oo d^(n+1) = 0$, where $d^n$ are called *differentials*. The *$n$-cocycles* of $C^cx$ are $ Z^n := ker d^n $ and the *$n$-coboundaries* are $ B^n := im d^(n+1) $
 
  We have $ B^n arrow.hook Z^n arrow.hook C^n $ (as subobjects) for all $n$.

  The *$n$-th cohomology* are defined as $ H^n (C^cx) := coker(B^n arrow.hook Z^n) $
]

#example[
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

See @weibel[Application 1.1.4].
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
  #align(center,image("imgs/2023-10-31-00-07-24.png",width:50%))
  (This is not a commutative diagram.) We denote $f tilde 0$ in this case.
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

#proof[ Let $h$ be a chain homotopy from $f$ to $g$. We have

$ f_n minus g_n eq s_(n minus 1) compose d_n^(lr((C))) plus d_(n plus 1)^(lr((D))) compose s_n $

for each $n$. Let $x in H_n lr((C))$. Then $x eq lr([c])$ for some cycle
$c in Z_n C$. We have

$ f_* lr((x)) minus g_* lr((x)) & eq lr([f_n lr((c)) minus g_n lr((c))])\
 & eq lr([s_(n minus 1) compose d_n^(lr((C))) lr((c)) plus d_(n plus 1)^(lr((D))) compose s_n lr((c))])\
 & eq lr([d_(n plus 1)^(lr((D))) compose s_n lr((c))])\
 & eq 0 comma $

The third equality is because $c$ is an $n$-cycle  in $C$ and last equality is because $d_(n plus 1)^(lr((D))) compose s_n lr((c))$ is an $n$-boundary in $D$.

See @notes[Lemma 2.32] and @weibel[Lemma 1.4.5].]

#endlec(7)

#definition[
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

See @weibel[Translation 1.2.8].
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
#proposition[
$Ch(cA)$ is an abelian category if $cA$ is an abelian category.
]
#proof[
See @rotman[Proposition 5.100]. 
]


We can form short exact sequences with chain complexes, and they naturally induce long exact sequences in (co)homology.

#definition[ For chain complexes $A_cx, B_cx, Ccx$,
$ ses(A_cx, B_cx, Ccx) $ is a *short exact sequence (s.e.s.)* if $ses(A_n, B_n, C_n)$ is a short exact sequence for all $n$.
]

// Long exact sequence. 

#theorem[
  If $ 0 -> A_cx rgt(f) B_cx rgt(g) Ccx -> 0$ is a short exact sequence of chain complexes, there is a natural map (for each $n$) $ diff: H_n (C) -> H_(n-1) (A) $ (which we call the *connecting homomorphism*) making 
  $ ... -> H_n (B) -> H_n (C) rgt(diff_n) H_(n-1) (A) -> H_(n-1)(B) -> ... $
  a long exact sequence. 

  Same with cochain complexes, with the connecting homomorphism 
  $ diff : H^n\(C) -> H^(n+1)(A) $
]

#proof[
  This is an application of the Snake Lemma. 
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
  arr((0, 1), (1, 1), [$d$]),
  arr((0, 2), (1, 2), [$d$]),
  arr((0, 3), (1, 3), [$d$], label-pos: left),
  arr((1, 0), (1, 1), []),
  arr((1, 1), (1, 2), []),
  arr((1, 2), (1, 3), []),
  arr((1, 3), (1, 4), []),
))
  Using the Snake Lemma, if we write the cokernels (and shifting up the index by $1$), we get 
  $
    A_n / (d A_(n+1)) -> B_n / (d B_(n+1)) -> C_n / (d C_(n+1)) -> 0
  $
  is exact, where $d A_(n+1) = im d$; if we write the kernels, we get
  $
    0-> Z_(n-1)(A) -> Z_(n-1)(B) -> Z_(n-1)(C) 
  $
  is also exact. Notice $d A_n subset.eq Z_(n-1)(A)$ so we can use $d$ to connect the rows again:
  
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
  arr((0, 1), (1, 1), [$d$]),
  arr((0, 2), (1, 2), [$d$]),
  arr((0, 3), (1, 3), [$d$]),
))

  Notice $ ker ( A_n / (d A_(n+1)) rgt(d) Z_(n-1) (A)) = H_n\(A) $ and 
  $
    coker ( A_n / (d A_(n+1)) rgt(d) Z_(n-1) (A)) = H_(n-1) (A)
  $
  and the other two columns are similar.
  By the Snake Lemma again, we have the connecting map:
  $
    H_n (A) -> H_n (B) -> H_n (C) rgt(diff) H_(n-1) (A) ->  H_(n-1) (B) ->  H_(n-1) (C)
  $

  // #align(center,image("imgs/2023-11-03-11-53-54.png",width:80%))

  Putting all these exact sequences together, we get the desired long exact sequence.

  See https://web.northeastern.edu/suciu/MATH7221/les_homology.pdf.
]
#remark[
  The connecting morphism can be written as $diff = f^(-1) d_B g^(-1)$. This is well defined in the same way as in the proof of the Snake Lemma. 
]

#example[
  Show that there exists a functor 

  category of ses of complexes in $cA$
  $->$
  category of les in $cA$

  We just construct the object maps, still need to verify it works on the morphisms and thus it is a functor.
  #TODO
]

== Resolutions
#definition[
  Let $cA$ be an abelian category. Let $M$ be an object of $cA$. A *left resolution* of $M$ is a complex $P_cx$ with $P_i = 0$ for negative $i$, with morphism $epsilon : P_0 -> M$ such that 
  $ ... -> P_2 rgt(d) P_1 rgt(d) P_0 rgt(epsilon) M -> 0 $
  is exact.

  If each $P_i$ is projective, then we call it a *projective resolution*.

  If $cA$ is $RMod$ or $ModR$ and each $P_i$ is a free module, then we call it a *free resolution*.

  In the same way, we define *right resolutions* and *injective resolutions*, only reversing all the arrows. 
]

#proposition[
  $P_cx$ is a resolution if and only if the following chain map $f: P_cx -> M[0]$
// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBpiBdUkANwEMAbAVxiRADpOQBfU9TXPkIoAjOSq1GLNgAUA+gCYefEBmx4CRBeOr1mrRCHkjl-dUKIBmHZP2y5xU6oEbhyACw290w495nBTRRPEQlvAxA-FTVAt2tQ3SkIgFknGNctUgTbH0i0lwtRLLCktiiAjJQybPC2TnYeCRgoAHN4IlAAMwAnCABbJDIQHAgkMRyIqCce-rHqEaRtCbYp-xAZgcQlhcRrZcNVlQ2kPZ33NePEAE550cQADgvezfvbpAB2J9nEd7fEADYvpt-n8AKxAubDO6vfZ5CFbP6-WHldbPE5-EGwmBobAMTTwoY7G4gBhYMAROAQUlTRJ2Qz1RrcIA
#align(center, commutative-diagram(
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

#proof[
  By definition, $P_cx$ is a resolution if and only if 
  (a) $P_cx$ is exact at $P_n$ for $n>=1$ and 
  (b) $M = coker(P_1 rgt(d) P_0)$. 
  On the other hand, $f$ is quasi-isomorphism if and only if 
  (a') $H_n (P_cx) iso H_n\(M[0]) iso 0$ for $n>=1$ and 
  (b') $ H_0(P_cx) iso H_0(M[0]) iso M$. 
  (a) is obviously equivalent to (a'); (b') is equivalent to $M = P_0 over im(d) = coker(P_1 rgt(d) P_0)$ and thus  equivalent to (b).
]
// (Some more remark...?)

Instead of working with a complicated object $M$, we are working with a complex of "simple" objects.

#lemma[
  If $cA$ has enough projectives, then every object has a projective resolution.
]

#proof[
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
  Let $M_0 := ker epsilon_0$, and we have short exact sequence

  $
    0 -> M_0 -> P_0 -> M -> 0
  $

  Now we can let $epsilon_1: P_1 -> M_0$ be an epimorphism and $M_1 := ker epsilon_1$, obtaining the short exact sequence
  $
    ses(M_1, P_1, M_0)
  $
  We define $d_1 = i_0 epsilon_1 : P_1 -> P_0$ and then 
  $
    d_1(P_1) = M_0 = ker epsilon_0
  $
  Thus the chain in exact at $P_0$. The precedure above can be then iterated for any $n >= 1$ and the resultant chain is infinitely long.
  // Set $d_0 = epsilon_0$.

  // Suppose we now have monomorphism $i_(n-1) : M_(n-1) -> P_(n-1)$ and $d_(n-1) : P_(n-1) -> P_(n-2)$ 
  
  // By induction, givenlet $epsilon_n: P_n -> M_(n-1)$ be an epimorphism, where $P_n$ is projective, and let $M_n = ker epsilon_n$. Thus we have
  // $ 0 -> M_n -> P_n -> M_(n-1) -> 0 $

  // Define $d_n = i_(n-1) epsilon_n$, which is the composite $P_n -> M_(n-1) -> P_(n-1)$. The image of $d_n$ is $ d_(n) (P_n) = M_(n-1) = ker d_(n-1) $ and hence exact.

  // (TODO A very nice commutative diagram!!)
  See @notes[Lemma 5.20].
]

// (Some remarks...)

Dually, we get the same construction for injective resolutions. 

// In the case of $RMod$, we can work with free resolutions instead of just projective ones. 

#theorem(name: "Comparison theorem")[
  Let $P_cx rgt(epsilon) M$ be a projective resolution of $M$ (enough to assume $P_cx$ is a complex with projective objects). Let $f': M->N$. Then for every resolution $eta: Q_cx -> N$, there is a chain map $f: P_cx -> Q_cx$ lifiting $f'$, i.e. $ eta oo f_0 = f' oo epsilon $
  which is unique up to a chain homotopy equivalence. (Any two choices of lifting are homotopic.)
]

#proof[// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBpiBdUkANwEMAbAVxiRAAUB9ACjAGoAjAEoQAX1LpMufIRQDyVWoxZsAWpzAACbuxHjJ2PASLyBi+s1aIQ6rdwCKeiSAyGZRAEykz1CyuvEYs6u0sYoZD5Klmz2PPzCYoowUADm8ESgAGYAThAAtkhkIDgQSPJR-iBQQVm5BYjlJUheFVYgmRo17XXN1E2IAMz63fmFfaWIACzUDFhgbVB0cAAWySC+ym0wAB5YcDgIwzmjU+O9rWzVohSiQA
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
  Suppose $f_n$ has been constructed, we have
  $d_(n+1)$ mapping $P_(n+1)$ to $B_n (P)$ which is contained in $Z_n (P)$. 
  Take any $a in Z_n (P)$, then $ d'_n (f_n (a)) = f_(n-1) (d_n (a)) = f_(n-1) (0) = 0 $
  hence $f_n (a) in Z_n (Q)$, or $f_n$ sends $Z_n (P)$ to $Z_n (Q)$. Now due to the exactness of $Q_cx$, $d'_(n+1)
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
  See @weibel[Comparison Theorem 2.26], @rotman[Theorem 6.16].
]

#lemma(name: "Horseshoe Lemma")[Suppose given a commutative diagram
#align(center,image("imgs/2023-11-04-13-51-57.png",width:50%))
 where the
column is exact and the rows are projective resolutions. Set $P_n eq$
$P_n^prime xor P_n^(prime prime)$. Then the $P_n$ assemble to form a
projective resolution $P$ of $A$, and the right-hand column lijts to an
exact sequence of complexes
$ 0 arrow.r P' arrow.r^i P arrow.r^pi P'' arrow.r 0 comma $
where $i_n colon P_n^prime arrow.r P_n$ and
$pi_n colon P_n arrow.r P_n^(prime prime)$ are the natural inclusion and
projection, respectively.




  // Suppose $ses(A', A, A'')$ is a #sest, and $P'_cx rgt(epsilon') A'$ and $P''_cx rgt(epsilon'') A''$ are projective resolutions. Then there exists a projective resolution $P rgt(epsilon) A$ such that $P_n = P'_n ds P''_n$ such that 

  // $
  //   0 -> P' rgt(i) P rgt(pi) P'' -> 0
  // $
  // is a #sest of complexes where $i$ is the canonical inclusion (mono) and $pi$ is the canonical proj.
]
// (Some remark...)
#proof[
  Lift $epsilon.alt^(prime prime)$ to a map
$P_0^(prime prime) arrow.r A$; the direct sum of this with the map
$i_A epsilon.alt^prime colon P_0^prime arrow.r A$ gives a map
$epsilon.alt colon P_0 arrow.r A$. The diagram $lr((ast.basic))$ below
commutes.
#align(center,image("imgs/2023-11-04-13-59-23.png",width:80%))
The right two columns of $lr((ast.basic))$ are short exact sequences.
The Snake Lemma shows that the left column is exact and that
$"coker"lr((epsilon.alt)) eq 0$, so that $P_0$ maps onto $A$. This
finishes the initial step and brings us to the situation
#align(center,image("imgs/2023-11-04-13-56-51.png",width:40%))
The filling in of the \"horseshoe\" now proceeds by induction.

See @weibel[Horseshoe Lemma 2.2.8].
]
#endlec(8)
#pagebreak()
= Derived Functors

== Homological $delta$-functors

See @weibel[Section 2.1]. The next two definitions are stated separately for clarity here.
#definition[
  Let $cA, cB$ be abelian categories. A *homological $delta$-functor* between $cA$ and $cB$ is, defined for each #sest $ses(A, B, C)$ in $cA$, a collection of additive functors $ T_n: cA -> cB $ for $n >= 0$ together with morphisms 
  $ delta_n : T_n (C)  -> T_(n-1)(A) $ 
  for $n >= 1$
  such that 
  #enum(block(width: 100%)[
    $ ... -> T_(n+1)(C) ->^delta T_n (A) -> T_n (B) -> T_n (C) rgt(delta) T_(n-1)(A) -> ... $
    is a #lest and $T_0$ is right exact;
  ],
  [
    For each morphism of #sess from $ses(A', B', C')$ to $ses(A, B, C)$, the $delta$'s give a commutative diagram 
    #align(center,image("imgs/2023-11-24-19-38-59.png",width:30%))
  ])
]

#definition[
  Let $cA, cB$ be abelian categories. A *cohomological $delta$-functor* between $cA$ and $cB$ is, defined for each #sest $ses(A, B, C)$ in $cA$, a collection of of additive functors $ T^n : cA -> cB $  for $n >= 0$ together with morphisms 
  $ delta^n : T^n (C)  -> T^(n+1)(A) $
  for $n >= 0$ such that 
  #enum(block(width: 100%)[
    $ ... -> T^(n-1)(C) ->^delta T^n (A) -> T^n (B) -> T^n (C) rgt(delta) T^(n+1)(A) -> ... $
    is a #lest and $T^0$ is left exact;
  ],
  [
    For each morphism of #sess from $ses(A', B', C')$ to $ses(A, B, C)$, the $delta$'s give a commutative diagram 
    #align(center,image("imgs/2023-11-24-19-39-14.png",width:30%))
  ])
]


#example[
  Homology gives a homological $delta$-functor
  $ 
    H_ast : Ch_(>= 0)(cA) -> cA
  $

  Cohomology gives a cohomologicla $delta$-functor $ H^ast : Ch^(>= 0) (cA) -> cA $
]

#example[
   If $p$ is an integer, the functors
$T_0 lr((A)) eq A slash p A$,
$ T_1 lr((A)) eq zws_p A equiv brace.l a in A colon p a eq 0 brace.r $
and $T_n = 0$ for $n >= 2$
fit together to form a homological $delta$-functor, or a cohomological
$delta$-functor \(with $T^0 eq T_1$ and $T^1 eq T_0$ ) from $Ab$
to $Ab$. To see this, apply the Snake Lemma to #align(center,image("imgs/2023-11-06-21-52-48.png",width:50%)) to get the exact
sequence
$ 0 arrow.r zws_p A arrow.r zws_p B arrow.r zws_p C arrow.r^delta A slash p A arrow.r B slash p B arrow.r C slash p C arrow.r 0 $


  // For any integer $p$, define $T_(0)(A) = A over p A$ and $T_1(A) = p A = {a in A | p a = 0}$ and $T_n = 0$ for $n >= 2$ gives a homological $delta$-functor from $Ab -> Ab$, by the Snake Lemma,
  // TODO
]

#let dftor = [$delta$-functor]

#definition[
  A *morphism* $S->T$ of $delta$-functors is a collection of natural transformations $S_n -> T_n$ (resp. $S^n -> T^n$) which commutes with $delta$.  This is equivalent to saying that there is a commutative ladder diagram connecting
the long exact sequences for $S$ and $T$ associated to any short exact
sequence in $cA$.]
#definition[
   A homological $delta$-functor $T = {T_n}$ is *universal* if, given any other $delta$-functor $S = {S_n}$ and a natural transformation $f_0: S_0 -> T_0$, there exists a unique morphism $ {f_n : S_n -> T_n} $ of #dftor extending $f_0$. 

  // A cohomological #dftor $T$ is *universal* if given $S$ and $f^0 : T^0 -> S^0$, there exists a unique extension $T->S$.

  A cohomological $delta$-functor $T$ is *universal* if, given $S$ and
$f^0 colon T^0 arrow.r S^0$, there exists a unique morphism
$T arrow.r S$ of $delta$-functors extending $f^0$.
]

#example[
  If $F : cA -> cB$ is exact, then $T_0 = F$ and $T_1 = 0$ for $n != 0$ defines a universal #dftor.
]

How to construct a universal #dftor? In categories with enough projectives or injectives, derived functors work.


== Derived Functors 

The main object of this section is to show that left derived functors, defined as follows, are homological $delta$-functors.
#definition[
Let $F : cA -> cB$ be a right exact functor between two abelian categories. Assume $cA$ has enough projectives. For any $A in ob cA$, pick a projective resolution $P_(cx) ^A -> A$. Define $ L_i F(A) := H_i (F(P_cx^A))  $ as the *$i$-th left derived functor*.

]

Since $F(P_1) -> F(P_0) arrow F(A) -> 0$ is exact, we always have $L_0 F(A) iso F(A)$.


#lemma[
  If $P_cx -> A$ and $Q_cx -> A$ are two projective resolutions, then there is a canonical isomorphism 
  $ H_i (F(P_cx)) bij H_i (F(Q_cx)) $
]
This means the choice in the definition does not matter.

#proof[
  By the comparison lemma, there is a chain map $f: P_cx -> Q_cx$ lifting the identity $id_A : A->A$, unique up to homotopy, giving $f_ast : H_i F(P_cx) -> H_i F(Q_cx)$. Any other lift $f' : P_cx -> Q_cx$ is chain homotopic to $f$ so $f_ast = f'_ast$.
  (TODO)
  So $f_ast$ is canonical. We can also lift the identity to a map $g: Q_cx -> P_cx$, so we get $g_ast : H_i F(Q) -> H_i F(P)$. Notice we can compose the two maps and $g oo f : P_cx -> P_cx$ and $id_P : P_cx -> P_cx$ are both lifts of the identity. Then we apply the comparison theorem to $P$ itself, so $ g_* f_* = (g f)_* = (id_P)_* $ and similarly 
  $ f_* g_* = (id_Q)_* $
]

#corollary[
  If $A$ is projective, then $L_i F (A) = 0$ for $i != 0$.
]

#lemma[
  If $f : A' -> A$ a morphism in $cA$, then there is a natural map $ L_i F(f) : L_i F(A') -> L_i F(A) $ 
]
#proof[
  Let $P'_cx -> A'$ and $P_cx -> A$ be chosen resolutions. So $f$ lifts to a map $tilde(f) : P'_cx -> P_cx$. This gives a map $tilde(f_ast) : H_i F(P'_cx) -> H_i F(P_cx)$ as any other lift is homotopic to $tilde(f)$, the map $tilde(f_ast)$ is independent of the lift. 
]

#proposition[
  $L_i F$ is an additive functor from $cA$ to $cB$. 
]
#proof[
  It is the same again. $id_P$ lifts $id_A$. So $L_i F(id_A) = id_(L_i F(A))$. Given $A' rgt(f) A rgt(g) A''$ and lifts $tilde(f), tilde(g)$, then $tilde(g) oo tilde(f )$ is a lift of $g oo f$, so $g_ast oo f_ast = (g f)_ast$.  So $L_i F$ is a functor. 
  
  If $f_1, f_2 : A' -> A$ with lifts $tilde(f_1), tilde(f_2)$, then $tilde(f_1) + tilde(f_2)$ lifts $f_1 -> f_2$, so $f_(1 ast) + f_(2 ast) = (f_1 + f_2)_ast$. So $L_i F$ is additive.
] 

#theorem[
  ${L_i F}$ form a homological #dftor. They form a universal homological #dftor.
]
We never use the fact that it is unviersal. Check the book for proof.
#proof[
  Given a #sest $ ses(A', A, A'') $ and projective resolutions $P' -> A'$ and $P'' -> A''$, there is a projective resolution $P-> A$ such that $ses(P', P, P'')$ is a #sest of resolutions and $ses(P'_n, P_n, P''_n)$ is split (being split is important!) by the Horseshoe Lemma. As $F$ is additive, $
    ses(F(P'_n), F(P_n), F(P''_n))
  $
  is still exact in $cB$. Hence 
  $
    ses(F(P'), F(P), F(P''))
  $
  is a #sest of complexes. Hence we have the connecting maps and it gives a #lest.
]
#endlec(9)
#definition[
  Let $F : cA  -> cB$ be a left exact functor between two abelian categories. Assume $cA$ has enough injectives and for any $A in cA$ we have injective resolution $A -> I^cx$. Then the *$i$-th right derived functor*  is
  $ R^i F (A) := H^i (F (I^cx)) $
]
// If $F : cA  -> cB$ is left exact, we can define the right derived functor $R^i F(A) = H^i F(I)$ for $A -> I^cx$.

Note: $R^i F(A) = (L_i F^op)^op (A)$.
== Defining $Ext$ and $Tor$ 

#definition[
  Let $cA$ be an abelian category.
Recall that $Hom(A)(A, -): cA -> Ab$ is left exact.
  If $cA$ has enough injectives, we can define 
  $ Ext_cA^i (A, B):= R^i Hom(A)(A, -)(B) = H^i (Hom(A) (A, I^cx)) $
  where $B -> I^cx$ is an injective resolution.
]
#proposition[
  We have the following equivalences:
  - $B$ is injective;
  - $Hom(A)(-, B)$ is exact;
  - $Ext_cA^i (A, B) = 0$ for $i !=0$ and all $A$;
  - $Ext_cA^1 (A, B) = 0$ for all $A$.

  Similarly,
  - $A$ is projective;
  - $Hom(A)(A, -)$ is exact;
  - $Ext_cA^i (A, B) = 0$ for $i !=0$ and all $B$;
  - $Ext_cA^1 (A, B) = 0$ for all $B$.
]
#proof[
  We need to prove $
    Ext^*_cA (A, B) iso R^ast Hom(A) (-, B)(A)
  $
]

#definition[
  Let $R$ be a ring and $B$ be a left $R$-module. $- tpr B : ModR -> Ab$ is right exact, so we can define  
  $ Tor_n^R (A, B) = L_n (- tpr B) (A) $
]


We will prove: 

$ L_n (- tpr B) (A) iso L_n (A tpr -) (B) $

This is called the balancing of $Tor$. We need two new tools to prove this: mapping cones and double complexes. 

#TODO #lest induced by $Tor$ and $Ext$
#pagebreak()
= Balancing $Ext$ and $Tor$
== Mapping Cones and Mapping Cylinders
#remark[
In topology,  let $f: X-> Y  $ be a continuous map between two topological spaces. 

  The *topological mapping cylinder* $M_f$ of $f : X-> Y$ is the quotient
  $ ((X times I) product.co Y) over tilde $
  where the equivalence relation $tilde$ is generated by $ (x, 1) tilde f(x)$ for all $x in X$. That is, the mapping cylinder is obtained by gluing one end of $X times I$ to $Y$ via the map $f$. It is often denoted as $(X times I) union.sq_f Y$.

  The *topological mapping cone* $C_f$ of $f : X-> Y$ is the quotient space of the mapping cylinder $(X times I) union.sq_f Y$ with respect to the equivalence relation $(x, 0) tilde (x', 0)$ for all $x, x' in X$. That is, the end of $X times I$ that is not glued to $Y$ is identified as a point.
  #align(center,image("imgs/Mapping_cone.svg",width:30%))
]

On the level of complexes, let $f : B_cx -> Ccx$ be a map of chain complexes.
#definition[
 Define the *mapping cone* of $f$ as the complex chain $ cone(f)_n = B_(n-1) plus.circle C_n $ 
 with differential given by $ d(b, c) = (-d(b), d(c) - f(b)) $ for $b in B_(n-1)$ and $c in C_n$.
We could also write in the form of a matrix:
$
mat(-d_b, 0; -f, d_c) : vec(B_(n-1), C_n) -> vec(B_(n-2), C_(n-1))
$
]

There is a #sest:
$ ses(C, cone(f), B[-1], f: i, g: delta) $
where the first map is $i: c mapsto (0, c)$ and the second map $delta : (b, c) |-> -b$. Recalling $H_(n+1)(B[-1]) = H_n (B)$, we get the corresponding #lest in homology:

$ 
 ... -> H_(n+1) (cone(f)) ->^(delta_ast)  H_n (B) ->^diff H_n (C) -> H_n (cone(f)) -> ...
$

#lemma[ The connecting morphism
  $diff = f_ast$.
]
#proof[
  We have $diff = i^(-1) d_(cone(f)) delta^(-1)$ due to the proof of the connecting homomorphism.
  Let $b in B_n$ be a cycle. We can lift it to $(-b, 0)$ in $cone(f)$. Apply the differential of $cone(f)$ to get $(d b, f b) = (0, f b)$. Thus $diff[b] = [f b] = f_ast b$.
]
#corollary[
  $f: B_cx -> C_cx$ is a quasi-isomorphism if and only if $cone(f)$ is exact. <cone-qi>
]

#definition[
  The *mapping cylinder* of $f$ is defined as the chain complex $cyl(f)_n = B_n xor B_(n-1) xor C_n$. The differential can be represented by the matrix 
  $
    mat(d_B, id_B, 0;0, -d_B, 0; 0, -f, d_C)
  $
]
#remark[
Let $0->B->^f C->^g D-> 0$ be a #sest of complexes. Then $phi: cone(f) -> D$ has $phi(b, c)-> g(c)$.#align(center,image("imgs/2023-11-10-12-30-40.png",width:50%)) You can prove $cyl(f)-> C$ is a quasi-isomorphism and also $phi$ is quasi-isomorphism. (This is non-examinable.)
]
== Double Complexes and Total Complexes
Recall that $Ch(cA)$ is also an abelian category. Then we may look at $Ch(Ch(cA))$. But what we define next is slightly different from that.
#definition[
  A *double complex* (or *bicomplex*) $C = C_(cx cx)$ in an abelian category $cA$ is a family ${C_(p, q)}$ of objects in $cA$ with maps $d^h : C_(p, q) -> C_(p-1, q)$ and $d^v : C_(p, q) -> C_(p, q-1)$ such that $ (d^h)^2 = (d^v)^2 = 0 $ and $ d^v d^h + d^h d^v = 0 $ (anti-commute!).
]
#align(center,image("imgs/2023-11-12-16-01-47.png",width:50%))
#remark[
  If you replace $d^v_(p, q)$ by $(-1)^p d^v_(p, q)$ we get that the square commute which gives an isomorphism of categories between bicomplexes and $Ch(Ch(cA))$.
]
#definition[
  Let $C_(bullet bullet)$ be a double complex. We say that
$C_(bullet bullet)$ is an *upper half-plane complex* if there is some
$q_0$ such that $C_(p q) eq 0$ for all $q lt q_0$. Similarly,
$C_(bullet bullet)$ is a *right half-plane complex* if there is some $p_0$
such that $C_(p q) eq 0$ for all $p lt p_0$.
]

#definition[
  Given $C = {C_(p, q)}$, we can define the *total complex*
  $ Tot^Pi (C)_n = product_(p + q = n) C_(p, q) $
  as well as the finite version 
  $ Tot^xor (C)_n = plus.circle.big _(p+q=n) C_(p, q) $
  with differential $ d= d^h + d^v $
We have that $d^2 = 0$. (which is why we define double complex in the anti-commuting way) @rotman[Lemma 10.5]
]

The total complex is illustrated by the colours in the following diagram; each “diagonal
slice” is given a different colour. For example, $Tot(C_(cx cx))_0$ is the direct sum of all the
red terms @notes[Definition 8.6]. This diagram also helps explain how the differential of the total complex works. For example, take $ c = (..., c_(-1, 1), c_(0, 0), c_(1, -1), ...) in product_p C_(-p, p) = Tot(C)_0 $
Then 
$ d (c) = ( ...,  
underbrace(d^v (c_(-1, 1)) + d^h (c_(0,0)), in C_(-1, 0)) , 
underbrace(d^v (c_(0, 0)) + d^h (c_(1, -1)), in C_(0, -1)), ... ) in Tot(C)_(-1) $
#align(center,image("imgs/2023-11-12-16-04-08.png",width:50%))

#endlec(10)

#lemma(name: "Acyclic Assembly Lemma")[
  Let $C = {C_(p, q)}$ be a double complex. If
  + $C$ is an upper half-plane complex with exact columns, or
  + $C$ is a right half-plane complex with exact rows,
  then $Tot^Pi (C)$ is acyclic.
  If 
  3. $C$ is an upper half-plane complex with exact rows, or
  4. $C$ is a right half-lane complex with exact columns,

  then $Tot^xor (C)$ is acyclic.
  <aal>
]
#proof[
  We only prove (1) here and the other conditions follow similarly.
  Let $C$ be an upper half-plane bicomplex with exact columns. We will show that 
  $ H_0 (Tot^Pi (C)) = 0 $
  and by translating $C$ left and right, this will indicate that $H_n (Tot^Pi (C)) = 0$ for all $n$ and hence prove the result.
  Let $ c = (..., c_(-2, 2), c_(-1, 1), c_(0, 0)) in product C_(-p, p) = Tot^Pi (C)_0 $ be a $0$-cycle (i.e. $d(c) = 0$).
  We will use indcution to find elements $b_(-p, p+1)$ such that $ d^v (b_(-p, p+1)) + d^h (b_(-p+1, p)) = c_(-p, p) $

  Let $b_(10) = 0$ for $p = -1$. Since the $0$-th column is exact, there is a $b_01 in C_01$ so that $d^v (b_01) = c_00$. 

  By induction, suppose we have found $b_(-p+1, p)$ and want to find $b_(-p, p+1)$. We compute that 
$ d^v lr((c_(minus p comma p) minus d^h lr((b_(minus p plus 1 comma p))))) & eq d^v lr((c_(minus p, p))) plus d^h d^v lr((b_(minus p plus 1 comma p)))\
 & eq d^v lr((c_(minus p, p))) plus d^h lr((c_(minus p plus 1 comma p minus 1))) minus d^h d^h \(b_(minus p plus 2 comma p minus 1 )) \
 & eq 0 dot.basic $

 where $d^v lr((c_(minus p, p))) plus d^h lr((c_(minus p plus 1 comma p minus 1))) = 0$ because $d(c) = 0$.

Since the $(minus p)$-th  column is exact, there is a
$b_(minus p comma p plus 1)$ so that
$ d^v lr((b_(minus p comma p plus 1))) eq c_(minus p comma p) minus d^h lr((b_(minus p plus 1 comma p))) $
as desired. Now assembling all $b_(-p, p+1)$ gives 

$ b = (..., b_(-1, 2), b_(0, 1), b_(1, 0)) in product C_(-p, p+1) = Tot^Pi (C)_(1) $ such that $d (b) =  c$, which proves that $H_0 (Tot^Pi (C)) = 0$. 

See @weibel[Lemma 2.7.3].
]

#remark[
  Spectral sequences. This lemma is a consequence of sepectral sequences. 
]


== Balancing $Tor$
#definition[
Suppose $P_cx$ and $Q_cx$ are complexes of right/left-$R$ modules. We can form a double complex of abelian groups which we call the *tensor product double complex*, denoted as $P_cx tpr Q_cx$, where the $(p, q)$ term is $P_p tpr Q_q$ and $d^h = d_P tp 1$ and $d^v = (-1)^p tp d_Q$. The sign trick is to make this anticommute. ]


#theorem[ For all $n$,
  $ L_n (A tpr -)(B) iso L_n (- tpr B)(A) = Tor_n^R (A, B) $ 
]
#proof[ @weibel[Theorem 2.7.2].
  #align(center,image("imgs/2023-11-23-03-00-04.png",width:80%))
  Choose a projective resolution $P_cx rgt(epsilon) A$ in $ModR$ and a project resolution $Q_cx rgt(eta) B$ in $RMod$. 
  We can view $A, B$ as complexes concentrated in degree $0$. Look at the double complexes $P_cx tpr Q_cx$, $A_cx tpr Q_cx$ and $P_cx tpr B_cx$, and we get morphisms of bicomplexes $epsilon tp Q: P tpr Q -> A tpr Q$ and $Q tp eta: P tpr Q -> P tpr B$. Now we want to show that maps
  $ epsilon tp Q : Tot^xor (P tpr Q) -> Tot^xor (A tpr Q) = A tpr Q $ and
  $ P tp eta: Tot^xor (P tpr Q) -> Tot^xor (P tpr B) = P tpr B $
  are quasi-isomoprhisms, which would give isomorphisms on homology and thus prove the result, i.e.

  $ H_ast (Tot^xor (P tpr Q)) iso H_ast (A tpr Q) = L_ast (A tpr - ) (B) $ 
  $ H_ast (Tot^xor (P tpr Q)) iso H_ast (P tpr B) = L_ast (- tpr B ) (A) $  

  If we look at the double complex $C$ obtained from $P tpr Q$ by adding $A tpr Q[-1]$ in the column $p = -1$ using the augmentation, we get that $Tot(C)[1]$ is the mapping cone of $ epsilon tp Q : Tot(P tpr Q) -> A tpr Q $

  To show that $epsilon tp Q$ is a quasi-isomorphism, we need to show $cone(epsilon tp Q) = Tot(C)[1]$ is acyclic by #thmref(<cone-qi>)[Corollary]. Note that $- tpr Q_p$ is exact as $Q_p$ are projective. So every row of $C$ is exact and so $Tot^xor (C)$ is exact by #thmref(<aal>)[Acyclic Assembly Lemma]. So $epsilon tp Q$ is a quasi-isomorphism. 
  Similarly, we can show that $P tp eta$ is also a quasi-isomorphism.
  // ($Q$ means $id_Q$ in proper places)
]

== Balancing $Ext$

#definition[
Given a chain complex $P$ and a cochain complex $I$, we can form a double complex $ hom(P, I) = {hom (P_p, I^q)} $

For $f : P_p -> I^q$, $a in P_p$ we have $(d^h f) (a) = f (d a)$ and $(d^v f)(a) = (-1)^(p+q+1) d f(a)$. 

Then we define

  $ Tot^Pi (hom(P, I)) $ as the *$hom$ cochain complex*.
]

#remark[If $C, D$ are chain complexes and we reindex $D$ to be a cochain complex. Then $H^n Tot^Pi hom (C, D)$ is the group of chain homotopy eq classes of morphisms $C -> D[-n]$.]

Check: #TODO

$ hom_Ab (Tot^xor (P tp Q), I) iso hom_R (P , Tot^Pi (hom_Ab (Q, I))) $
$I$ cochain complex of abelian groups and $P, Q$ are chain complexes of right/left $R$-modules.


#endlec(11)

#theorem[ For all $n$,
  $ Ext^n_R (A, B) = R^n hom_R (A, -) (B) iso R^n hom_R (-, B) (A) $
] 
#proof[
  #align(center,image("imgs/2023-11-23-03-27-44.png",width:80%))
  Take projective resolution $P_cx -> A$ and injective resolution $B -> I^cx$. We can view $A$ and $B$ as complexes concentracted at degree $0$. We can form double cochain complexes $hom(P, I)$, $hom(A, I)$ and $hom(P, B)$. Then we need to show 
  $ hom(A, I) -> Tot^Pi hom(P, I) $ and 
  $ hom(P, B) -> Tot^Pi hom(P, I) $ are quasi-isomorphisms. This is equivalent to the cones of the maps being acyclic. 

  We observe that $cone(hom (A, I) -> Tot^Pi hom (P, I))$ is the total complex of the double complex $hom(P, I)$ with $hom(A, I)[-1]$ added.  For this augumented double complex, we see that $Tot^Pi$ is exact by #thmref(<aal>)[the Acyclic Assmebly Lemma] since $hom(P_p, -)$ is exact and $hom(-, I^q)$ is exact. Then 

  $ R^ast hom(A, -) (B) = H^ast hom (A, I) = H^ast Tot^Pi ( hom(P, I))  \ iso H^ast hom(P, B) = R^ast hom(-, B) (A) $
  #TODO review
]

#pagebreak()

= Ring Structures on $Ext$
== Reinterpreting $Ext$
#lemma[.
  Let $P_cx -> M$ and $Q_cx -> N$ be projective resolutions, then
  $
    Ext^ast_R (M, N) = H^ast Tot^Pi (hom_R (P_cx, Q_cx))
  $
]
The proof is similar to above and can be seen @notes[Lemma 8.16]. A useful diagram is 
#align(center,image("imgs/2023-11-23-22-22-07.png",width:80%))

Note that the $n$-th term of the total _cochain_ complex can be written explicitly as 
$
  [Tot^Pi (hom_R (P_cx, Q_cx))]^n = product_(p >= max{0, n}) hom (P_p, Q_(p - n))
$
Applying cohomology to this total cochain complex yields $Ext^ast _R (M, N)$. 

#corollary[
  $Ext_R^n (M, N)$ is isomorphic to the chain homotopy classes of chain maps $P_cx -> Q_cx [-n]$, namely the 
   quotient of the module of chain maps $P_cx -> Q_cx [-n]$ by the submodule of null homotopic chain maps.
]
A detailed proof can be seen @notes[Section 9.1]. 
To see this intuitively, notice a chain map $P_cx -> Q_cx [-n]$ is a collection of 
$hom (P_p, Q_(p - n))
$ for all suitable index $p$, subject to commuting with the differentials. 
Hence, it is an element of $[Tot^Pi (hom_R (P_cx, Q_cx))]^n =: T^n$.
One can show that the commuting condition for a chain map is equivalent to being a cycle in $T^n$. 
Further, the chain map is null homotopic if and only if it is a boundary in $T^n$.
Cohomology is cycles quotient by boundaries, which is now the same as "chain maps" quotient by "null homotopic chain maps".

== Yoneda Product


Given $R$-modules $A, B, C$ with projective resolutions $P_cx -> A$, $ Q_cx -> B$, $ T_cx-> C$, we see that $Ext^i_R\(A, B) $ is the chain homotopy classes of chain maps $P -> Q[-i]$, and $Ext^j_R\(B, C)$ is the chain homotopy classes of chain maps $Q -> T[-j]$. 

Note that $hom(Q, T[-j]) iso hom(Q[-i], T[-i - j])$, namely the translation (shifting) functor is an isomorphism on the category of chain complexes and it preserves chain homotopy. 
Also homotopy commutes with composition
of maps. 
Hence the composition $P -> Q[-i] ->T[-i-j]$ gives a map $ ⌣ :  Ext_R^i (A, B) times Ext_R^j (B, C) -> Ext^(i+j) (A, C) $ 

One can show that this is associative and biadditive. 

#remark[
We have shown $D^- (RMod) iso K^- ("Proj" RMod)$.
]

$Ext_R^ast (A, A) = plus.circle.big_i Ext_R^i (A, A)$ is a graded ring. For any $B$, $Ext_R^ast (A , B) = plus.circle.big_i Ext^i (A, B)$ is a graded module over the ring. 

#TODO what is even a graded ring 

#TODO alternative definition of Yoneda product, "gluing sequences"

#pagebreak()
= $Tor$ and Flatness

== Flat Modules

#definition[
  A #lrm $B$ is *flat* if $ - tpr B$ is exact. A #rrm $A$ is *flat* if $  A tpr -$ is exact. 
]

#remark[
  #TODO link to algebraic geometry, algebraic continunity
//   In some sense flatness gives "continuity". It appears in algebraic geometry.
// Assume $R$ is commutative, and let $M$ be an $R$-module. Then $tilde(M)$ quasi- ?? sheaf on $"Spec"(R)$.
]

// #proposition[
//   Free modules are flat.
// ]
// #proof[
//   Take free module $plus.circle.big _I R$ and any module $M$, then 
//   $
//     M tpr plus.circle.big _I R iso plus.circle.big_I M tpr R iso plus.circle.big_I M
//   $
//   The functor $plus.circle.big_I$ is exact.
// ]

// #proposition[
//   Projective modules are flat.
// ]
// #proof[
//   Let $P$ be a projective module, then there exists module $Q$ such that $P xor Q$ is free. #TODO @rotman[Propositin 3.46]
// ]

// #remark[
//   We already used that projective modules are flat. First we have free modules are flat. Second, if $P xor Q$ is free (i.e. $P$ is projective) then $- tpr P$ is exact. 
// ]

#proposition[
  Let $B$ a #lrm. 
  The followings are equivalent: 
  + $B$ is flat;
  + $Tor_n^R (A, B) = 0$ for all $n > 0$ and all $A$;
  + $Tor_1^R (A, B) = 0$ for all $A$.
  <flat-tor>
]
#proof[@notes[Lemma 6.26].
(1) $=>$ (2). Suppose that $B$ is flat. Let $F_cx arrow.r A$ be a free
resolution of $A$. Since $minus times.circle_R B$ is exact, the sequence
$ dots.h arrow.r F_2 times.circle_R B arrow.r F_1 times.circle_R B arrow.r F_0 times.circle_R B arrow.r A times.circle_R B arrow.r 0 $
is exact, so the homology of
$ dots.h arrow.r F_2 times.circle_R B arrow.r F_1 times.circle_R B arrow.r F_0 times.circle_R B arrow.r 0 $
vanishes in positive degree. 

The implication \(2) $arrow.r.double lr((3))$
is trivial.

Finally, \(3) $arrow.r.double$ \(1) follows from the long
exact sequence of $Tor$, since for any short exact sequence
$0 arrow.r X arrow.r Y arrow.r Z arrow.r 0$, we have that
$ 0 eq "Tor"_1^R lr((Z comma B)) arrow.r X times.circle B arrow.r Y times.circle B arrow.r Z times.circle B arrow.r 0 $
is exact. 
]

#corollary[Every projective module is flat. In particular, every free module is flat.]
#proof[
If $P$ is projective, then $0 arrow.r P$ is a projective
resolution, so $"Tor"_n^R lr((A comma P)) eq 0$ for all $A$ and all
$n gt.eq 1$.
]
Another way to prove the corollary is found @rotman[Propositin 3.46].

  Recall that since the tensor product is left adjoint, it commutes with all colimits. Thus $ (colim_I A_i) tpr B iso colim_I (A_i tpr B) $

  #remark[
    In case the notation seems confusing,
    notice that in cateogry theory we would usually write $colim_I F$, where $F : I -> RMod$ is a functor. Here by $colim_I A_i$ we indicate that $A_i = F(i)$ for all $i in I$.  
  ]



#proposition[
  // For any small category $I$ and any functor $I -> ModR$, we have 
  Let $I$ be a filtered poset (for any $i, j in I$ there exists $k$ such that $i <= k$ and $j <= k$). View $I$ as a small category. Then the functor $ colim_I: Fun(I, RMod) -> RMod $ is exact. 
]
#proof[#TODO Ref: category theory.]

#remark[
  $colim_I$ is not a exact functor in general.
]

#corollary[
  A filtered colimit of flat $R$-modules is flat. 
]
#proof[
  Let $A = colim_I A_i$ where $I$ is a filtered poset and $A_i$ are flat for all $i in I$. We want to show $A$ is flat. If we have #sest $ ses(B_1, B_2, B_3) $ then for all $i in I$, 
  $
    ses(A_i tpr B_1, A_i tpr B_2, A_i tpr B_3)
  $
  Taking $colim_I$, which is exact as $I$ is a filtered poset, yields 
  $
    ses(colim_I (A_i tpr B_1), colim_I (A_i tpr B_2), colim_I (A_i tpr B_3))
  $
  $colim_I$ commutes with tensor products, hence 
  $
    ses((colim_I A_i) tpr B_1, (colim_I A_i) tpr B_2, (colim_I A_i) tpr B_3)
  $
  which is just 
  $
    ses( A tpr B_1, A tpr B_2, A tpr B_3)
  $
  showing $A$ is flat.
]

#example[
  Let $A$ be a torsion free abelian group. Then $A = union A_i$ where $A_i$ are finitely generated subgroups of $A$, so $A_i$ is free and hence flat.  $ A = union A_i = colim A_i $  Hence torsion free abelian groups are flat. #TODO
]

#example[
  Let $s in R$ be a central element of $R$. We can localise $s$ to get $R[s^(-1)]$ (this is the universal ring where $s$ is invertible, which is $colim(R->^s R ->^s R-> ...)$), so this flat $R$-module.

  To generalise, for a set $S$, we form $R[S^(-1)]$, and this is flat as well. #TODO
]

#endlec(12)
== Flat Resolutions

#definition[
  $F_cx -> A$ is a *flat resolution* of $A$ if $F_n$ are flat modules for all $n$.
]

#lemma(name: "Flat Resolution Lemma")[
  Let $F_cx -> A$ be a flat resolution of $A$. Then 
  $
    Tor_ast^R (A, B) iso H_ast (F_cx tpr B )
  $
  Similarly, if $F'_cx -> B$ is a flat resolution, then 
  $
    Tor_ast^R (A, B) iso H_ast (A tpr F'_cx)
  $
  <flat-resolution>
]
#proof[
  By induction. As $- tpr B$ is right exact, we get the result for $n = 0$. Let 
  $
    ses(K, F_0, A)
  $ be a short exact sequence.   If we write $E_cx = (... -> F_2 -> F_1 -> 0)$, then $E_cx -> K$ is a flat resolution of $K$. 

  We can write the #lest induced by $Tor$: 
  $
    ... ->  Tor_n (F_0 , B) -> Tor_n (A , B) -> Tor_(n-1) (K , B) -> Tor_(n-1) (F_0 , B) -> ...
  $
  But $Tor_n (F_0, B) = 0$ for $n >= 1$ by (the dual of) #thmref(<flat-tor>)[Proposition]. 
  Thus, 
  $
    Tor_n (A, B) iso cases(ker (K tp B -> F_0 tp B) quad &n = 1, Tor_(n-1) (K, B) quad &n >= 2)
  $
  For $n=1$, 
  $
    Tor_1 (A, B) = ker (K tp B -> F_0 tp B) = ker ((F_1 tp B) / im(F_2 tp B) -> F_0 tp B) = H_1 (F tp B)
  $
  For $n >= 2$, 
  $
    Tor_n (A, B) iso Tor_(n-1) (K, B) iso H_(n-1) (E tp B) = H_n (F tp B)
  $
  by induction.
]

#remark[
  Why not define $Tor$ with flat resolutions in the first place? The problem is that we have to show it is well defined regardless of the choice of flat resolutions. This may not be as convenient as using projective resolutions. Nevertheless, now we are free to use flat resolutions, a larger class than projective resolutions, for calculations.
]

#definition[
If $F$ is a right exact functor, an object $Q$ is *$F$-acyclic* if $L_i F(Q) = 0$ for all $i != 0$.  
]
#proposition[
If $Q_cx -> A$ is a resolution where $Q_n$ is $F$-acyclic for all $n$, then $L_i F(A) = H_i (F (Q_cx))$. 
]
#proof[
  The proof is exactly the same as above.
]

#remark[#TODO Quillen model structures, fibrations and cofibrations.]

== Universal Coefficient Theorem

How is the homology of $P_cx$ related to the homology of $P_cx tp M$?

#theorem(name: "Künneth Formula")[
  Let $P_cx$ be a chain complex of flat, right $R$-modules such that each submodule $d(P_n)$ of $P_(n-1)$ is also flat. Then for every $n$ and every left $R$-module $M$ there is a #sest 
  
  $
    ses(H_n (P) tpr M, H_n (P_cx tpr M), Tor_1^R (H_(n-1)(P), M))
  $
  
]
#proof[@rotman[Theorem 7.55].
  Let $Z_n = ker (P_n ->^d P_(n-1))$. 
  We have a #sest 
  $
    ses(Z_n, P_n, d(P_n))
  $
  The associated #lest in $Tor$ shows that $Z_n$ is also flat, as $ Tor_k (P_n, M) = Tor_k (d(P_n), M) = 0 $ for all $k >= 1$. (#TODO In general, if two terms in a #sest are flat then the third one is also flat. ) Since 
  $Tor_1^R (d(P_n), M) = 0
  $,
  we have that
  $
    ses(Z_n tp M, P_n tp M, d(P_n) tp M)
  $
  is a #sest for every $M$, so we get a #sest of complexes 
  $
    ses(Z_cx tp M , P_cx tp M, d(P)_cx tp M)
  $
  We now look at the #lest induced by homology: 
  #math.equation(block: true, numbering: "(1)", supplement: "long exact sequence",
  $
    H_(n+1) (d(P)_cx tp M ) ->^diff H_n (Z_cx tp M) \ -> H_n (P_cx tp M) -> H_n (d(P)_cx tp M) ->^diff H_(n-1) (Z_cx tp M) 
  $) <eq1>
  Note that the differentials on the complexes  $Z_cx$ and $d(P)_cx$ are all zero, and hence the differentials on $Z_cx tp M$ and $d(P)_cx tp M$ are also all zero, which gives 
  $
    H_n (d(P)_cx tp M) = d(P_n) tp M quad "and" quad H_n (Z_cx tp M ) = Z_n tp M
  $
  #TODO A theorem saying differential zero gives homology equals chain complex.

  Hence @eq1 now becomes 
  $
    d(P_(n+1)) tp M ->^(diff_(n+1)) Z_n tp M -> H_n (P_cx tp M) -> d(P_(n)) tp M ->^(diff_n) Z_(n-1) tp M
  $
  Here we can calculate the connecting homomorphism $diff_(n+1) = i_n tp M$, where $i_n : d(P_(n+1)) -> Z_n$ is the inclusion map.
  According to a theorem regarding exact sequences #TODO, we have a #sest
  $
    ses(coker(i_n tp M), H_n (P_cx tp M), ker(i_(n-1) tp M))
  $
  On the other hand, we have a flat resolution for $H_n (P_cx)$ 
  $
    ses(d(P_(n+1)), Z_n, H_n (P_cx), f: i_n)
  $
  By #thmref(<flat-resolution>)[Flat Resolution Lemma], $Tor_ast^R (H_n (P_cx), M)$ is the homology of 
  $
    0 -> d(P_(n+1)) tp M ->^(i_n tp M) Z_n tp M -> 0
  $
  Hence 
  $
    H_n (P_cx) tp M = Tor_0 (H_n (P_cx), M) = H_0 = coker (i_n tp M)
  $ and 
  $
    Tor_1^R (H_n (P_cx), M) = H_1 = ker (i_n tp M)
  $
  replacing $n$ with $n-1$ in the last equation gives the result.
] 
#remark[
  These are the games you play with the machine.
]
#theorem(name: "Universal Coefficient Theorem")[
  Let $P$ be a chain complex of free abelian groups, then for every $n$ and every $M$, the Künneth #sest splits, so $ H_n (P tp M) = H_n (P) tp M ds Tor_1^ZZ (H_(n-1) (P), M) $
  The split is not canonical.
]
#proof[
  #TODO
  Note: $P_n -> d(P_n)$ splits. 
]

Recall if $P_cx, Q_cx$ are complexes, we define $P_cx tpr Q_cx$.

#theorem(name: "Full Künneth Formula")[
  If $P_n$ and $d(P_n)$ are flat for each $n$, then there is a #sest 
  $
    ses(plus.circle.big _(i+j=n) H_i (P) tp H_j (Q), H_n (P tpr Q), plus.circle.big_(i+j = n-1) Tor_1^R (H_i (P), H_j (Q)))
  $
]

#example[
  In topology, 
  $
    H_n (X times Y) = (plus.circle.big_(p=1)^n H_p (X) tp H_(n-p) (Y)) xor (plus.circle.big_(p=1)^n Tor_1^ZZ (H_(p-1) (X), H_(n-p) (Y)))
  $
]
#endlec(12)

#pagebreak()
= Koszul Complexes

@weibel[Section 4.5].

#definition[
Let $R$ be a ring and let $x in Z lr((R))$ be a central element. Then we
define the *Koszul complex* $K lr((x))$ of $x$ to be the chain complex
$ 0 arrow.r R arrow.r^x R arrow.r 0 $ concentrated in degrees $1$ and $0$.

We denote the generator of $K lr((x))_1$ by $e_x$, so that
$K lr((x))_1 eq R dot.op e_x comma K lr((x))_0 eq R dot.op 1$, and
$d (e_x) eq x$.

If $bd(x) = (x_1, ..., x_n)$ is a finite sequence of central elements, define 
$
  K(bd(x)) = K(x_1) tpr K(x_2) tpr ... tpr K(x_n)
$
]
#definition[
For an $R$-module $A$, we define the *Koszul homology* and *Koszul
cohomology* to be
$ H_q lr((bd(x) comma A)) & eq H_q lr((K lr((bd(x))) times.circle_R A)) comma\
H^q lr((bd(x) comma A)) & eq H^q lr(("Hom"_R lr((K lr((bd(x))) comma A)))) dot.basic $
]

#example[
 As an example,
$K lr((x comma y))$ is the complex
#align(center,image("imgs/2023-11-25-10-34-10.png",width:80%))
]

#TODO what is exterior product

#proposition[
  $K_p (bd(x))$ is a free module with rank $vec(n, p)$.
]
#proof[
  By induction.
]

The degree $p$ part of $K lr((bd(x)))$ is a free $R$-module generated by the
symbols
$ e_(i_1) and dots.h.c and e_(i_p) eq 1 times.circle dots.h.c times.circle 1 times.circle e_(x_(i_1)) times.circle dots.h.c times.circle e_(x_(i_p)) times.circle dots.h.c times.circle 1 quad lr((1 <= i_1 lt dots.h.c lt i_p <= n)) dot.basic $

(There are in total $n$ terms of the tensor product and in the degree $p$ part of $K(bd(x))$ there should be $p$ terms that come from the degree $1$ part of $K(x_j)$ and thus are $e_x_(j)$, and the remaining ($n-p$) terms should come from the degree $0$ part and are $1$.) 

In particular, $K_p lr((bd(x)))$ is isomorphic to the $p$-th exterior
product $Lambda^p R^n$ of $R^n$ and has rank $vec(n, p)$, so $K lr((x))$
is often called the *exterior algebra complex*. 

The derivative
$K_p lr((bold(bd(x)))) arrow.r K_(p minus 1) lr((bold(x)))$ sends
$e_(i_1) and dots.h.c and e_(i_p)$ to
$sum lr((minus 1))^(k plus 1) x_(i_k) e_(i_1) and dots.h.c and$
$hat(e)_(i_k) and dots.h.c and e_(i_p)$.


#proposition[
$lr({H_q lr((x comma minus))})$ is a
homological $delta$-functor, and that
$lr({H^q lr((bold(x) comma minus))})$ is a cohomological $delta$-functor
with
$ H_0 lr((bold(x) comma A)) eq A slash lr((x_1 comma dots.h.c comma x_n)) A\
H^0 lr((bold(x) comma A)) eq "Hom"lr((R slash x R comma A)) eq lr({a in A colon x_i a eq 0 upright(" for all ") i}) dot.basic $
<koszul-zero>
]

#proposition[
  There are isomorphisms
$H_p lr((x comma A)) tilde.equiv H^(n minus p) lr((x comma A))$ for all
$p$. 
]

#lemma(name: "Künneth Formula for Koszul Complexes")[
If
$C eq C_ast.basic$ is a chain complex of $R$-modules and $x in R$, there
are exact sequences
$ 0 arrow.r H_0 lr((x comma H_q lr((C)))) arrow.r H_q lr((K lr((x)) times.circle_R C)) arrow.r H_1 lr((x comma H_(q minus 1) lr((C)))) arrow.r 0 $
<kunneth-koszul>
]

#proof[
  $K(x) tpr C$ by definition is a direct sum of two complexes and thus we can write a #sest of complexes: 
  $
    ses(C, K(x) tpr C, C[-1])
  $
  which is associated to the long exact sequence: 
  $
    H_(q plus 1) lr((C lr([minus 1]))) arrow.r^diff H_q lr((C)) arrow.r H_q lr((K lr((x)) times.circle C)) arrow.r H_q lr((C lr([minus 1]))) arrow.r^diff H_q lr((C)) 
  $
  where $H_(q+1) (C[-1]) = H_q (C)$ and $H_(q) (C[-1]) = H_(q-1) (C)$. One can find that the connecting homomorphism $diff$ is multiplication by $x$. Now we have 
  $
    H_q lr((C)) arrow.r^x H_q lr((C)) arrow.r H_q lr((K lr((x)) times.circle C)) arrow.r H_(q-1) lr((C))  arrow.r^x H_(q-1) lr((C)) 
  $
  which leads to the #sest 
  $
    ses(coker(H_q (C) ->^x H_q (C)), H_q lr((K lr((x)) times.circle C)), ker(H_(q-1) (C) ->^x H_(q-1) (C)))
  $
  

  Now since $ H_q (C) ->^x H_q (C) = (R ->^x R) tpr H_q (C) $

  We find 
  $
    coker(H_q (C) ->^x H_q (C)) = H_0 (x, H_q (C))
  $ and 
  $
    ker(H_q (C) ->^x H_q (C)) = H_1 (x, H_(q) (C))
  $
  and the result follows.
]

#definition[
  If $A$ is an $R$-module, a *regular sequence* on $A$ is a sequence of elements $(x_1, ..., x_n)$ where each $x_i in R$ such that $x_1$ is a non-zero-divisor on $A$ and each $x_i$ is a non-zero-divisor on $A over (x_1, ..., x_(i-1))$.
]

#corollary[
  If $bd(x) = (x_1, ... , x_n)$ is a regular sequence on an $R$-module $A$, then $H_q (bd(x), A) = 0$ for $q != 0$ and $H_0 (bd(x), A) = A over (x_1, ..., x_n) A$. 
]

#proof[
  We already know $H_0(bd(x), A)$ from #thmref(<koszul-zero>)[Proposition]. We prove the $q != 0$ part by induction. If $x$ is a non-zero-divisor on $A$ then $K(x) tpr A$ is 
  $
    0 -> A ->^x A -> 0
  $
  so $H_1 = ker x = 0$ and $H_0 = A over x A$. 

  Let $x  = x_n$ and $bd(y) = (x_1, ..., x_(n-1))$. By #thmref(<kunneth-koszul>)[Lemma], we have a #sest 
  
  $
    ses(H_0(x, H_q (bd(y), A)), H_q (bd(x), A), H_1 (x, H_(q-1) (bd(y), A)))
  $
  For $q >= 2$, the flanking terms are both $0$ by induction and hence $H_q (bd(x), A) = 0$. 
  
  For $q  = 1$, we get 
  $
    H_1 (bd(x), A) iso H_1 (x, H_(0) (bd(y), A)) = H_1 (K(x) tpr H_(0) (bd(y), A))
  $
  Since
  $
    H_(0) (bd(y), A) = A over (x_1, ..., x_(n-1)) A
  $ we see that $K(x) tpr H_(0) (bd(y), A)$ is the complex 
  $
    A over (x_1, ..., x_(n-1)) A ->^x A over (x_1, ..., x_(n-1)) A
  $
  which has kernel zero because $x$ is a non-zero-divisor of $A over (x_1, ..., x_(n-1)) A$, and thus has $H_1 = 0$. 
]

#corollary[
  If $bd(x) = (x_1, ..., x_n)$ is a regular sequence on $R$, then $K(bd(x))$ is a free resolution of $R over I$, where $I  =(x_1, ..., x_n) R$, and 
  $
    H_p (bd(x), A) = Tor_p^R (R over I, A) \
    H^p (bd(x), A) = Ext_p^R (R over I, A) \
  $
]
#remark[
  #TODO Tower, Past paper, Serre...
]

// Suppose that $upright(x) eq lr((x_1 comma dots.h comma x_n))$ is a
// finite sequence of central elements in $R$. Then $K lr((upright(x)))$ is
// the chain complex
// $ K lr((x_1)) times.circle_R dots.h times.circle_R K lr((x_n)) dot.basic $



// Koszul resolution

// Let $x in R$ be a central element. Let $K(x)$ be the chain complex 
// $
//   0->R->^x R ->0
// $ 
// in degrees $0,1$. We call the generator in degree $1$ $e_x$ so $d(e_x) = x$. 

#pagebreak()

= $Ext^1$ and Extensions

== Extensions

#definition[
  Let $A$ and $B$ be $R$-modules. An *extension* of $A$ by $B$ is a #sest 
  $
    ses(B, X, A)
  $
  Two extensions are *equivalent* if there is a commutative diagram 
  #align(center,image("imgs/2023-11-25-13-22-33.png",width:50%))
  
  This is an equivalence relation. We denote $e(A, B)$ as the equivalence classes of extensions of $A$ by $B$. 


  An extension is *split* if it is equivalent to 
  $
    ses(B, A xor B, A)
  $
]
#lemma[
  If $Ext^1 (A, B) = 0$, then every extension of $A$ by $B$ is split.   
]
#proof[
  We look at the #lest of $Ext^ast (A, -)$: 
  $
    hom (A, X) -> hom (A, A) ->^diff Ext^1 (A, B)
  $
  The first arrow is a surjection, so
  $id_A$ can always lift to a splitting $sigma: A -> X$.
]

From the above proof we see that $diff(id_A) in Ext^1 (A, B)$ is the obstruction to being split:  the extension is split if and only if $id_A$ lifts to $hom (A, X)$ if and only if $0 = diff (id_A)$. 

#endlec(14)


#theorem[
  Given $R$-modules $A$ and $B$, the map 
  $
    Theta: e(A, B) &-> Ext_R^1 (A, B) \ 
    [ses(B, X, A)] &mapsto diff(id_A)
  $
  is a bijection, and split extensions correspond to $0 in Ext_R^1 (A, B)$. 
]
#proof[
  This is a sketch of the proof.

  We first show that $Theta$ is surjective. Let $x in Ext^1 (A, B)$, and we want to construct some extension $xi = (ses(B, X, A))$ such that $Theta(xi) = x$. We proceed as follows. 

  Since $RMod$ has enough injectives, we can find a #sest 
  $
    ses(B, I, N, f:j, g: pi)
  $
  where $I$ is injective and $pi = coker(j)$. Since $I$ is injective, we have $Ext^1(A, I) = 0$, so the #lest of $Ext$ gives an exact sequence 
  $
    0 -> hom (A, B) -> hom (A, I) -> hom (A, N) ->^(delta') Ext^1 (A, B) -> 0
  $
  Now $delta'$ is surjective, so $x in Ext^1 (A, B)$ can be lifted to some $beta in hom (A, N)$ such that $delta' (beta) = x$. Now we have the following:

  // https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZARgBpiBdUkANwEMAbAVxiRACEQBfU9TXfIRQAmclVqMWbAJLdeIDNjwEiAZjHV6zVohAA5OXyWCiABg0TtbU4YX9lQ5ABYLWqbps8jAlSjKnxNx0OW0UfR3UAzUlggEFucRgoAHN4IlAAMwAnCABbJAA2ahwIJFFLdxAAIxgcOltsvKQAVmLSxHMK4KwoAH1OLxBG-MR1EBKkU0HhybakMi62ACsGnJGFicRyoLY0LFWmrbnEJy4KLiA
#align(center, commutative-diagram(
  node-padding: (50pt, 50pt),
  node((1, 1), [$B$]),
  node((1, 2), [$I$]),
  node((1, 3), [$N$]),
  node((1, 0), [$0$]),
  node((1, 4), [$0$]),
  node((0, 1), [$B$]),
  node((0, 3), [$A$]),
  arr((0, 3), (1, 3), [$beta$]),
  arr((0, 1), (1, 1), [$id_B$]),
  arr((1, 0), (1, 1), []),
  arr((1, 1), (1, 2), [$j$]),
  arr((1, 2), (1, 3), [$pi$]),
  arr((1, 3), (1, 4), []),
))
  We now apply @rotman[Lemma 7.29] to find a commutative diagram with exact rows that completes the above diagram:
  // https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZARgBpiBdUkANwEMAbAVxiRACEQBfU9TXfIRQAmclVqMWbAJLdeIDNjwEiAZjHV6zVohAA5OXyWCiABg0TtbU4YX9lQ5ABYLWqbps8jAlSjKnxNx0OW0UfR3UAzUlggEFQ+xMRUijLdxAADQTjX2RzVKDrbPCiFwKYoq5xGCgAc3giUAAzACcIAFskADZqHAgkUTTggCMYHDpbVo6kAFZe-sRzIbYsKAB9Ti8QKc7EdRA+pFMtnaP5pDJl3QArSbbdy8PEQcLdNCw76efzxCcT+6QAHYfsR-l85gcFoCwbtgZDujCkAAOH4zRGIHrwxAATiqXCAA
#align(center, commutative-diagram(
  node-padding: (50pt, 50pt),
  node((1, 1), [$B$]),
  node((1, 2), [$I$]),
  node((1, 3), [$N$]),
  node((1, 0), [$0$]),
  node((1, 4), [$0$]),
  node((0, 1), [$B$]),
  node((0, 3), [$A$]),
  node((0, 2), [$X$]),
  node((0, 0), [$0$]),
  node((0, 4), [$0$]),
  arr((0, 3), (1, 3), [$beta$]),
  arr((0, 1), (1, 1), [$id_B$]),
  arr((1, 0), (1, 1), []),
  arr((1, 1), (1, 2), [$j$]),
  arr((1, 2), (1, 3), [$pi$]),
  arr((1, 3), (1, 4), []),
  arr((0, 2), (1, 2), []),
  arr((0, 1), (0, 2), []),
  arr((0, 2), (0, 3), []),
  arr((0, 0), (0, 1), []),
  arr((0, 3), (0, 4), []),
))
  where the top row is the extension $xi$ we claim to have $Theta(xi) = x$. To prove that it is indeed the case, notice by naturality of the #lest of $Ext$, there is a commutative diagram
  // https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBpiBdUkANwEMAbAVxiRAAsIBbACgEFSAAj4BKEAF9S6TLnyEUARnJVajFmwCiADxwA9BfyEAhMZOnY8BImQUr6zVog7dDggHKmpIDBblElttT26k7aegYCgiYSKjBQAObwRKAAZgBO3EhKIDgQSADMQWqOIFhQEl7pmYhkOXmI2cElsAw4dBWpGVxItblIAExFDmwARjBtghAQggC0HSBV3YiDdQVDISAtbQDkMeJAA
#align(center, commutative-diagram(
  node-padding: (50pt, 50pt),
  node((0, 0), [$hom(A, A)$]),
  node((0, 1), [$Ext^1(A, B)$]),
  node((1, 0), [$hom(A, N)$]),
  node((1, 1), [$Ext^1(A, B)$]),
  arr((0, 1), (1, 1), [$id$]),
  arr((0, 0), (0, 1), [$delta$]),
  arr((0, 0), (1, 0), [$beta oo -$]),
  arr((1, 0), (1, 1), [$delta'$]),
))
  from which we see 
  $
    Theta(xi) = delta(id_A) = delta'((beta oo -)(id_A)) = delta'(beta) = x
  $
  Thus we have shown $Theta$ is surjective.

  Now again by @rotman[Lemma 7.29], the extension $xi$ we have constructed is unique up to equivalence, so we have effectively constructed a well-defined map 
  $
    Phi : Ext^1 (A, B) -> e(A, B)
  $
  with $Theta(Phi(x)) = x$, if we can show that $Phi$ is indepedent of the choices of $I$ and $beta$.
  
  It remains to be shown that $Phi(Theta([xi])) = [xi]$ for any extension class $[xi] in e(A, B)$. #TODO
]

== Baer Sum

When a set $X$ has a bijection with the underlying map of a group $G$, then in general $X$ can be also equipped with a group structure. We are therefore interested in characterising the group structure on $e(A, B)$, in view of its bijection with the group $Ext^1(A, B)$. The natural addition operation on $e(A, B)$ was first explicitly acertained by R. Baer.

#definition[
Let
$ xi_1 colon 0 arrow.r B arrow.r^(i_1) X_1 arrow.r^(pi_1) A arrow.r 0 comma quad xi_2 colon 0 arrow.r B arrow.r^(i_2) X_2 arrow.r^(pi_2) A arrow.r 0 $
be extensions of $A$ by $B$. Let
$ X^(prime prime) eq X_1 times_A X_2 eq lr({lr((x_1 comma x_2)) in X_1 times X_2 colon pi_1 lr((x_1)) eq pi_2 lr((x_2))}) $
and let
$Y eq X^(prime prime) slash lr({lr((i_1 lr((b)) comma minus i_2 lr((b)))) colon b in B})$.
We have maps
$ i colon B arrow.r Y comma b arrow.r.bar lr((i_1 lr((b)) comma 0)) $
and
$ pi colon Y arrow.r A comma lr((x_1 comma x_2)) arrow.r.bar pi_1 lr((x_1)) plus pi_2 lr((x_2)) dot.basic $

The sequence $ 0 arrow.r B arrow.r^i Y arrow.r^pi A arrow.r 0 $ is
called the Baer sum of $xi$ and $xi^prime$.]

#lemma[
The Baer sum is
a well-defined extension of $A$ by $B$.
]

#lemma[
  The set of
equivalence classes of extensions of $A$ by $B$ is an abelian group
under the Baer sum, and the map $Theta$ is an isomorphism of abelian
groups.
]


== Yoneda $Ext$ Groups


Using extensions of $A$ by $B$, we can define $"Ext"^1 lr((A comma B))$
in any abelian category \(i.e. no need for projectives or injectives).
We call this the Yoneda $Ext$ group.

#definition[
More generally, we define the Yoneda $"Ext"^n lr((A comma B))$ to be the
equivalence classes of exact sequences

$ xi colon 0 arrow.r B arrow.r X_n arrow.r dots.h arrow.r X_1 arrow.r A arrow.r 0 $

under the equivalence relation generated by $xi tilde.op xi^prime$ if
there is a diagram

#align(center, img("2023_10_29_1d9afce33fbce6757ca2g-099(1)", width: 80%))
]

Note that the arrows $X_i arrow.r X_i^prime$ do not have to be
isomorphisms. At first glance, this seems different to our definition of
equivalence for extensions of $A$ by $B$. However, by the Five Lemma, when $n = 1$, the morphism $X_1 -> X'_1$ is necessarily an isomorphism.

#definition[
We again define a notion of a Baer sum. Let $xi$ and $xi^prime$ be
representatives of elements of $"Ext"^n lr((A comma B))$. Let
$X_1^(prime prime)$ be the pullback of

#block[
#box(width: textwidth, img("2023_10_29_1d9afce33fbce6757ca2g-099(2)", width: 15%))

]
and let $X_n^(prime prime)$ be the pushout of

#block[
#box(width: textwidth, img("2023_10_29_1d9afce33fbce6757ca2g-099", width: 15%))

]
Let $Y_n$ be the quotient of $X_n^(prime prime)$ by the antidiagonal.
Then the Baer sum is

$ 0 arrow.r B arrow.r Y_n arrow.r X_(n minus 1) xor X_(n minus 1)^prime arrow.r dots.h arrow.r X_2 xor X_2^prime arrow.r X_1^(prime prime) arrow.r A arrow.r 0 $
]
Suppose that $cal(A)$ has enough projectives and $P_bullet arrow.r A$ is
a projective resolution. Consider the diagram

#block[
#box(width: textwidth, img("2023_10_29_1d9afce33fbce6757ca2g-100(1)", width: 80%))

]
By the comparison theorem, there is a chain map from the top row to the
bottom row lifting id : $A arrow.r A$. Setting
$M eq ker diff_n^(lr((P)))$ gives a diagram

#block[
#box(width: textwidth, img("2023_10_29_1d9afce33fbce6757ca2g-100", width: 80%))

]
with exact rows.

#proposition[There is a natural isomorphism between Yoneda
$Ext ^n$ and the standard $"Ext"^n$.]


#pagebreak()


= Group (Co)homology

== Definitions

#definition[
  Let $G$ be a group. A *(left) $G$-module* is an abelian group $A$ together with a left group action $rho: G times A -> A$, with $rho(g, a)$ denoted as $g dot a$, such that 
  $
    g dot (a_1 + a_2) = g dot a_1 + g dot a_2
  $
  for all $g in G$ and $a_1, a_2 in A$. 

  A *morphism* $A -> B$ of $G$-modules is a group homomorphism (i.e. $ZZ$-linear map) $phi: A -> B$ such that 
  $
    phi(g dot a) = g dot phi (a)
  $
  for all $g in G$ and $a in A$.

  The category of $G$-modules is denoted as $GMod$, where we write $hom_GMod$ as $homg$.
]

  Recall that for any group $G$, $ZZ G$ is the integral group ring which consists of formal sums of elements of $G$ with integer coefficients:
  $
    sum_(g in G) f_g g
  $
  where $f_g in ZZ$ is non-zero for only fintely many $g in G$. $ZZ G$ is a ring because the product of two elements of $ZZ G$ is well-defined.

  #lemma[
    There is an equivalence of categories $GMod iso ZGMod$.
  ]

  This indicates that $GMod$ is also an abelian category (which we love).

  #definition[
    A $G$-module is *trivial* if $g dot a  = a$ for all $g in G$ and $a in A$. 

    We define a functor $triv: Ab -> GMod$ by sending an abelian group $A$ to a trivial $G$-module $A$.
  ]

  #definition[
    Let $A in GMod$. Then the submodule of *invariants* of $A$ is 
    $
      A^G = {a in A : g dot a = a "for all" g in G}
    $ 
    and the module of *coinvariants* of $A$ is 
    $
      A_G = A over angle.l g dot a - a : g in G, a in A angle.r 
    $    
  ]

  #lemma[
    $-^G$ and $-_G$ are functors $GMod -> Ab$. 
  ]

  #lemma[
    We have adjunctions 
    $
      -_G tack.l triv tack.l -^G.
    $
  ]
  #proof[
    We first show 
    $
      hom_G (triv(A), B) iso hom_Ab (A, B^G)
    $
    Take any $f : triv(A) -> B$, then $f$ is a group homomorphism $A -> B$ such that $f(g dot a) = g dot f(a)$ for all $g in G$ and $a in A$. But $g dot a = a$ due to triviality and hence $f(a) = g dot f(a)$, i.e. $f(a) in B^G$ for all $a$. Then $f$ is equivalent to a group homomorphism $A -> B^G$. 

    Now we prove 
    $
      hom_Ab (A_G, B) iso homg (A, triv(B))
    $
    Take any $h : A -> triv(B)$, then $h$ is a group homomorphism $A -> B$ such that for all $g in G$ and $a in A$, $ h (g dot a) = g dot h(a) = h(a) <=> h(g dot  a - a) = 0 <=> g dot a - a in Ker(h) $
    which means $h$ is equivalent to a group homomorphism $A_G -> B$. 
  ]

  #corollary[
    The functor $-_G : GMod -> Ab$ is right exact and the functor $-^G : GMod -> Ab$ is left exact. 
  ]

  #lemma[
    Let $A$ be any $G$-module and let $ZZ$ be the trivial $G$-module. Then 
    $
      A_G iso ZZ tpzg A 
    $
    and 
    $
      A^G iso hom_(ZZ G) (ZZ , A)
    $
  ]
  #proof[
 Considering $bb(Z)$ as a $bb(Z)$-$ bb(Z) G$ bimodule, the trivial module functor $ZMod -> ZGMod$ is the functor
$"Hom"_(bb(Z)) lr((bb(Z) comma minus))$. We have seen that
$bb(Z) times.circle_(bb(Z) G) -$  is its left adjoint; this functor must
agree with its other left adjoint $minus_G$. (See alternative proof in @notes[Lemma 13.9].)

For the second
equation, we use adjointness:
$A^G tilde.equiv "Hom"_(Ab) lr((bb(Z) comma A^G)) tilde.equiv$
$"Hom"_G lr((bb(Z) comma A))$.
 ]

#definition[
Let $A$ be a $G$-module. We write
$H_ast.basic lr((G semi A))$ for the left derived functors
$L_ast.basic lr((minus^ G)) lr((A))$ and call them the *homology groups of
$G$ with coefficients in $A$*; by the lemma above,
$H_ast.basic lr((G semi A)) tilde.equiv "Tor"_ast.basic^(bb(Z) G) lr((bb(Z) comma A))$.
By definition, $H_0 lr((G semi A)) eq A_G$. 

Similarly, we write
$H^ast.basic lr((G semi A))$ for the right derived functors
$R^ast.basic lr((-_G)) lr((A))$ and call them the *cohomology groups of
$G$ with coefficients in $A$*; by the lemma above,
$H^ast.basic lr((G semi A)) tilde.equiv "Ext"_(bb(Z) G)^ast.basic lr((bb(Z) comma A))$.
By definition, $H^0 (G; A) = A^G$. 
]

#example[
  #TODO
]

== First Homology



#pagebreak()
#bibliography("bib.yml", style: "chicago-author-date")