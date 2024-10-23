
#import "../libs/template.typ": *

= Basic Category Theory
<cat-theory>

This section is a crash course in category theory. The reader is advised to take the Category Theory course concurrently and/or refer to other materials, e.g. @awodey.

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

#example[ The following are the main categories we will be working with.
  - The category $Set$ has objects which are sets and morphisms which are functions between sets. Notice in category theory we avoid talking directly about elements of a set, because a set, which is an object of the category $Set$, is "atomic" or inseparable.
  - Let $k$ be a field. The category $veck$ has objects which are vector spaces over $k$ and morphisms which are linear transformations between vector spaces. We often denote $hom_veck$ as $homk$. In particular, for any $V, W in veck$, $homk (V, W)$ is also a vector space.
  - Let $R$ be a ring. The category $RMod$ has objects which are #lrms and morphisms which are module homomorphisms. Similarly, we have the category $ModR$ of #rrms. We often denote $hom_RMod$ or $hom_ModR$ as $homr$; it should be clear from the context which one we are referring to.
  - The category $Grp$ has objects which are groups and morphisms which are group homomorphisms. Similarly, we have the category $Ab$ of abelian groups. 
  // $veck, Set, $ left/right $R$-modules, bimodules, topological spaces, etc.
]

#definition[
  Let $cC, cD$ be categories. The *product category* $cC times cD$ consists of objects $(C, D)$ for $C in cC$ and $D in cD$, and morphisms $(f, g) : (C_1 ,D_1 )-> (C_2, D_2)$ for $f : C_1 -> C_2$ and $g: D_1 -> D_2$. 
]

#definition[
  A morphism $f: B-> C$ is *monic* (or a *monomorphism*) if for any $e_1, e_2 : A -> B$ such that $f compose e_1 = f compose e_2$ we have $e_1 = e_2$.
  A morphism $f: B->C$ is *epic* (or an *epimorphism*) if for any $g_1, g_2 : C-> D$ such that $g_1 compose f = g_2 compose f$ we have $g_1 = g_2$.
]

#note[
  $f: B-> C$ is monic if and only if the induced map $(f oo -) : hom_cC (A, B) -> Hom(C) (A, C)$ is injective for any $A$, and $f : B-> C$ is epic if and only if the induced map $(- oo f) : Hom(C) (C, D) -> Hom(C) (B, D)$ is injective for any $D$. 
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
  An *initial object* $I$ of category $cC$ is an object such that for any $A in ob cC$, there exists a unique morphism $I -> A$.  
  
  A *final object* $T$ is an object such that for any $A in ob cC$ there exists a unique morphism $A -> T$.
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

  // https://tikzcd-typst-editor.pages.dev/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBpiBdUkANwEMAbAVxiRACEQBfU9TXfIRQAmclVqMWbAMLdeIDNjwEiARlKrx9Zq0Qhi3cTCgBzeEVAAzAE4QAtkjIgcEJKp5XbDxE5dJRIAxYYLogUHRwABbGcp72-tR+iOqBwaHhUTFcFFxAA
// #image("imgs/4.png", width: 30%)
]
  <zero-factor>
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
  In a category with a zero object, a *kernel* of $f: B->C$ is a morphism $i: A-> B$ such that $f compose i  = 0$ in a universal way. That is, for any $i' : A'-> B$ such that $f compose i' = 0$, there exists a unique morphism $h : A' -> A$ such that $i' = i oo h$. We denote $i = ker(f)$. Diagrammatically,
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
  Sometimes, people might also say the object $A$ in the above definition is the kernel of $f$ when the morphism $i$ is clear, and write $A = ker(f)$. However, this easily leads to confusion later on, so this note adapts the following non-standard notation: we write $A = Ker(f)$ (with a capital K) when we mean the object and $i = ker(f)$ when we mean the morphism. Hence, we would have 
  $
    Ker(f) -->^(ker(f)) B ->^f C
  $
  such that $f oo ker(f) = 0$ in a universal way.
   Similar notations will be used for concepts we define later.
]
   <ker-notation>

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

#definition[ A *cokernel* of $f: B->C$ is a morphism $j: C-> D$ such that $j compose f  = 0$ in a universal way. We denote $j = coker(f)$ and $D = Coker(f)$.]

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

We say that "monic" and "epic" are *dual* concepts. Similarly, "initial objects" and "final objects" are dual; "kernels" and "cokernels" are dual.

== Products and Coproducts

#definition[
  Let  ${C_i | i in I}$ be a family of objects, then their *product* $product_(i in I) C_i$ is an object such that there exist $pi_j : product_(i in I) -> C_j$ for all $j in I$ in a universal way. That is, for any object $D$ with morphisms $g_j : D -> C_j$ for all $j in I$, there exists a unique morphism $D -> product_(i in I) C_i$.
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
Any $(g_i)_i in product Hom(C) (A, C_i)$ can be factorised as $(pi_i compose f')_i$ for some unique $f': A -> product C_i$ due to the universal property of the product. The existence of $f'$ ensures that $phi$ is surjective and the uniqueness of $f$ ensures injectivity. Thus $phi$ is a bijection.
  // #image("imgs/8.png", width: 50%)
]

#proposition[We have
  $ Hom(C) (product.co C_i, A) bij product Hom(C) (C_i, A). $
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



#remark[
Equivalently, $tau$ is a natural isomorphism between $Hom(B) (L(-), -)$ and $Hom(A) (-, R(-))$, both of which are functors $cA^op times cB -> Set$. Note that $A^op$ is used here because $Hom(A)(-, B)$ is a contravariant functor.
]



// What's a product category? It's just pairs of objects and pairs of morphisms. 


#example[
  $"Free"$ is the left adjoint of $"Forget"$. For example, we define the functors between $veck$ and $Set$: $ "Forget": veck &-> Set \ (V, +, dot) &|-> V $  $ "Free" :  Set &-> veck \ X &|-> k[X] $

Then we have:
$ hom_(veck)(k[X], W) &iso hom_(Set) (X, "Forget"(W))\
T &|-> T|_X \
"linearly extended" f &arrow.l.bar f
$



// Forget: $Grp -> Set$. Free: $Set -> Grp$. Also happens. 
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
  Let $X, Y in Top$ and $f: X arrows.lr Y : g$ be continuous maps. If $f compose g tilde id $ and $g compose f tilde id$ then $X, Y$ are homotopy equivalent. Natural transformations are similar to the notion of homotopy.
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
#example[Let $I = circle.filled arrows.rr circle.filled$ be the category with two objects and two parallel morphisms between them. Let $F : I-> cC$ be a functor which maps $I$ to 
$
   A arrows.rr^f_g B
$
in $cC$. Then when $lim_I F$ exists, we have two associated morphisms $h: lim_I F -> A$ and $h' : lim_I F -> B$, such that $f oo h = h' = g oo h$. We define the *equaliser* of $f$ and $g$ as this $h : lim_I F -> A$, denoted as $Eq(f, g)$. 
We also dually define the *coequaliser* of $f$ and $g$ using $colim_I F$, denoted as $Coeq(f, g)$, such that $Coeq(f, g) oo f = Coeq(f, g) oo g$. 
  Continuing with @ker-notation, we have
  $
  EQ(f, g) -->^(Eq(f, g)) A arrows.rr^f_g B -->^(Coeq(f, g))  COeq(f, g).
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

  $ hom_cB (L(colim A_i), X) iso hom_cA (colim A_i,  R(X)) iso  lim hom_cA (A_i, R(X)) \ iso lim hom_cB (L (A_i),  X)  iso  hom_cB (colim L (A_i), X). $

If we move colimit out of $hom$, it becomes limit. (This has been seen for products and coproducts.)
We then apply Yoneda Lemma to show $L(colim A_i) $ and $colim L(A_i)$ are isomorphic. 
]

#remark[
Left adjunction preserves colimits and right adjunction preserves limits.
In particular, left adjunction preserves cokernels and are right exact; right adjunction preserves kernels and are left exact (to be defined later). 
]

#proposition[
  A category $cC$ has all finite limits #iff it has finite products and equalizers.
]
<all-finite-limits>
#proof[@awodey[Proposition 5.21].]

== Subobjects and Quotient Objects

@awodey[Section 5.1]. 
This section offers some new vocabulary to describe things we already have seen.

#definition[
  Let $A$ be an object of category $cC$. A *subobject* of $A$ is a monomorphism $u : S -> A$. 
  
  Give two subobjects $u : S-> A$ and $v : T->A$ of $A$, we define the relation of *inclusion* of subobjects by $u subset.eq v$ if and only if there exists $f : S -> T$ such that $u = v oo f$. Such $f$ is unique if it exists, since $v$ is a monomorphism.

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
