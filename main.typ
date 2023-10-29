#import "libs/template.typ": *
#import "libs/var.typ": *
#import "libs/commute.typ": node, arr, commutative-diagram

#set heading(numbering: "1.a.")
#set enum(numbering: "(1)")


// Take a look at the file `template.typ` in the file panel
// to customize this template and discover how it works.
#show: project.with(
  title: "Homological Algebra",
  authors: (
    "Yuhang Wei",
  ),
  date: "October 24, 2023",
)

#pagebreak()
#include "module.typ"
// #outline(indent: true)



#pagebreak()
= Tensor products


Let $k$ be a field and let $veck$ denote the category of $k$-vector spaces. Let $V, W, L in veck$, denote by $"Bilin"(V, W; L)$ the set of bilinear transformations. Let $T in "Bilin"(V, W; L)$, then $T: V times W -> L$. Can we write $T$ in terms of linear algebra?

$"Hom"_veck (V, W) = "Hom"_k (V, W)$ is the set of linear transformations from $V$ to $W$, and it is a $k$-vector space (in a natural way). We denote the same set by $#underline("Hom") (V, W)$ to emphasise the vector space structure. 

$
"Bilin"(V, W; L) tilde.eq homk (V, homk (W, L)) tilde.eq homk(V, homk(V, L))
$

[This is currying in computer science.]

Question: Is $"Bilin"(V, W; -): veck -> bd("Set")$ representable? In other words, is there a $k$-vector space $V times.circle_k W$ with a natural isomorphism $ "Bilin"(V, W; -) tilde.eq homk (V times.circle_k W, -) $

What does natural mean? It means it is compatible with changes in $L$: if there is a linear map $T: L -> L'$ then this isomorphism should be compatible with $T$.

Also equivalent to: is there a vector space $V times.circle_k W$ with a bilinear map $V times W -> V times.circle_k W$ which is universal? We want to find bilinear map $V times W -> V times.circle_k W$ such that for any blinear map $V times W -> L$, there exists a unique linear map $V times.circle_k W -> L$ such that the diagram commutes:

// #image("imgs/1.png", width: 50%)

// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBoBGAXVJADcBDAGwFcYkQA1AAjwFt4uAdRABfUuky58hFOQrU6TVuwAyo8SAzY8BInOIKGLNok480AayGiFMKAHN4RUADMAThF5IyIHBCTkYq4eXog+fkgATEEg7p5RNBGIciCMWGAmIFD0cAAWdiA0RsqmMAAeWHA4cFwAhDYiQA
#align(center, commutative-diagram(
  node((1, 0), [$V times W$]),
  node((1, 1), [$L$]),
  node((0, 1), [$V tpk W$]),
  arr((1, 0), (1, 1), []),
  arr((1, 0), (0, 1), []),
  arr((0, 1), (1, 1), [$exists !$], "dashed"),
))


Remark: it is also equivalent to asking for an adjoint functor.

For any $(v, w) in V times W$ we want to find $v times.circle w in V tpk W$. This is a bilinear map, so for example:

$
(v+v') tp w = v tp w + v' tp w
$

#definition[
   For any set $X$, let $k[X]$ denote the vector space spanned by $X$: $ sum_(x in X) a_x x $ where $a_x = 0$ for almost all $x in X$.
]

Now we look at $k[V times W]$ (a free vector space). This is large: even if $V$ and $W$ have finite dimensions this vector space has infinite. We look at the subspace spanned by the relations $ M = "span"{(v + v', w) - (v, w) - (v', w) \ (v, w + w') - (v, w) - (v, w') \ c(v, w) - (c v, w) \ c(v, w) - (c w, v)} $ TODO

for all $v, v' in V$ and $w, w' in W$ and $c in k$. Then we have 
$
homk (k[V times W] \/ M, L) tilde.eq "Bilin"(V, W; L)
$
due to the first isomorphism theorem. We see that if $T in homk (k[V times W] \/ M, L)$ then $T$ is a linear transformation $k[V times W] -> L$ such that $T(M) = 0$. For any $(v, w) in V times W$:

$ V times W -> k[V times W] -> k[V times W] \/ M \
(v, w) |-> (v, w) |-> (v, w) + M $

We can thus define $V tpk W := k[V times W] \/ M$.

Note: $V tpk W$ is defined up to a unique isomorphism. This follows from the universal property (ref. category theory). 

// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBoBGAXVJADcBDAGwFcYkQA1AAjwFt4uAdRABfUuky58hFOVLFqdJq3bccaANZDR4kBmx4CROQCZFDFm0ScemgOTaRimFADm8IqABmAJwi8kMhAcCCRyMW8-AMQgkKQTCJBff3iaOMQ5EEYsMCsQKHo4AAsXEBoAIxgwKCQAZiCLFWsYAA8sOBw4LgBCHUiUjLTQxBMKqprEepps3PYC4tKaRrzW9s6e0UoRIA
#align(center, commutative-diagram(
  node((1, 0), [$V times W$]),
  node((0, 1), [$V tpk W$]),
  node((2, 1), [$V tpk' W$]),
  arr((1, 0), (0, 1), []),
  arr((1, 0), (2, 1), []),
  arr((2, 1), (0, 1), [$exists !$], curve: 30deg, "dashed"),
  arr((0, 1), (2, 1), [$exists !$], curve: 30deg, "dashed"),
))

// #image("imgs/2.png")

== Properties of tensor product

$"Bilin"(V, W; -) tilde.eq "Bilin"(W, V; -)$ in a canonical way and hence $V tpk W tilde.eq W tpk V$. Also $k tpk W tilde.eq W$.

$ "Trilin"(V_1, V_2, V_3; L) tilde.eq "Bilin"(V_1 tpk V_2, V_3; L)  tilde.eq  "Bilin"(V_1,  V_2 tpk V_3; L) $
and hence $ (V_1 tpk V_2) tpk V_3 tilde.eq V_1 tpk (V_2 tpk V_3) $

It is obviously hard to verify these properties using the definition directly (but good exercise?).

More generally, let $sigma in S_n$ (symmetric group),

$ ( ... (V_1 tpk V_2) tpk ... tpk V_n) tilde.eq ( ... (V_sigma(1) tpk V_sigma(2)) tpk ... tpk V_sigma(n)) $

Remark: in category theory, we think of things by their properties not their definition.

Remark: we now have $(veck, - tpk -)$ which also preserves liner maps. If we have $T: V-> V'$ and $S: W-> W'$ then $T tpk S: V tpk W -> V' tpk W$. (This is heavily used in quntum computing.) This is a symmetric monoidal category.

#definition[
  A $k$-algebra is a monoid object in $(veck, tpk)$; namely, $A in veck$ with multiplication $m: A tpk A -> A$ and a unit $i: k -> A$ which are associative and unital. Namely, $m$ is a multiplication that takes two elements in $A$ and is bilinear; $i$ just sends $1 in K$ to $i(1)$ which is the unit element in $A$. Associativity of $m$ is shown in commuting diagram:

  #image("imgs/3.png")
]

== Non-linear version

In the category of $bd("Set")$, 
$ hom(X times Y, Z) = hom(X, hom (Y, Z)) $ 
This is Cartesian category (?)

(This is the end of lecture 1.)

== More discussions

$ dim (V ds W) = dim V + dim W $
$ dim (V tp W) = dim V dot dim W $

An alternative definition of the tensor product: let $V$ be a vector space with basis ${v_i}_(i in I)$ and $W$ with ${w_j}_(j in J)$ and define $V tpk W$ to have basis ${v_i tp w_j}_(i in I, j in J)$. When we change basis this can be problematic.

Remark: Categorification. If we discuss a category $(C, ds, tp)$ then this is similar to categorifying some underlying structure of a ring. Active field of research.

We were discussing $V tpk W$ for $k$ a field. To generalise, for a ring $R$ and left $R$-modules $M, N$, we can define $M tpr N$.

Note: if $R$ is a non-commutative ring, $M$ is a right $R$-module and $N$ is a left $R$-module, then $M tpr N$ is (only) an abelian group. There would be a problem moving the scalars $r in R$ from side to side in the definition (using free modules), i.e. we can only have things like $m r tp n - m tp r n$.

= Crash course in category theory

== Basic definitions

#definition[
  A category $cal(C)$ consists of a set (or a class) of objects $ob cC$ and for every $x, y in ob cC$ a set $hom_cC (x, y)$, with composition maps which are associative and unit morphisms (ref. category theory).
]

#example[
  If $ob cC = {x}$ then $hom(x, x)$ is a monoid.
]

In general, a category is a "generalised" monoid because you can only compose morphisms in certain situations, not always.

#example[
  $veck, Set, $ left/right $R$-modules, bimodules, topolocial spaces, etc.
]

#definition[
  $f: B-> C$ or $f in hom_cA (B, C)$ is monic if for any $e_1, e_2 : A -> B$ such that $f compose e_1 = f compose e_2$ we have $e_1 = e_2$; $f$ is epic if for any $g_1, g_2 : C-> D$ such that $g_1 compose f = g_2 compose f$ we have $g_1 = g_2$.
]

#example[
  In $Set$, monic is 1-1 and epic is onto.
]
#example[
  In the category of commutative rings, $ZZ -> QQ$ is monic and epic. If we have $ ZZ -> QQ -> R $ and if two maps agree on $ZZ->R$ they must also agree on $QQ -> R$.
]
#example[
   In the category of commutative rings, for any ring $R$ and its ideal $I$, $R -> R\/I$ is epic.
]
[Any localisation in ring is epic?]

#definition[
  An initial object $I$ is such that for any $A in ob cC$ there exists a unique map $I -> A$.  A final object $T$ is such that for any $A in ob cC$ there exists a unique map $A -> T$.
]

#example[
  In $Set$ an initial object is an empty set, a final object in a one-element set.
]

#definition[
  A zero object $0$ is both initial and final (here $0$ is an object!).
]

#example[
  In $RMod$ the zero module is a zero object.
]

#proposition[
  If there is a zero object in the category, then for any $B, C in cC$ we have $0 in hom_cC (B, C)$ (now $0$ is a morphism!).

  // https://tikzcd-typst-editor.pages.dev/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBpiBdUkANwEMAbAVxiRACEQBfU9TXfIRQAmclVqMWbAMLdeIDNjwEiARlKrx9Zq0Qhi3cTCgBzeEVAAzAE4QAtkjIgcEJKp5XbDxE5dJRIAxYYLogUHRwABbGcp72-tR+iOqBwaHhUTFcFFxAA
#align(center, commutative-diagram(
  node((0, 0), [$B$]),
  node((0, 2), [$C$]),
  node((1, 1), [$0$]),
  arr((0, 0), (0, 2), [$0$]),
  arr((0, 0), (1, 1), [$exists!$], "dashed"),
  arr((1, 1), (0, 2), [$exists!$], "dashed"),
))
// #image("imgs/4.png", width: 30%)
]

#definition[
  A kernel of $f: B->C$ is a map $i: A-> B$ such that $f compose i  = 0$ in a universal way:

  #v(20pt)
  // https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBpiBdUkANwEMAbAVxiRAEEQBfU9TXfIRQBGclVqMWbAELdeIDNjwEiAJjHV6zVohABhOXyWCiZYeK1Td7AOTdxMKAHN4RUADMAThAC2SUSA4EEjqEtps7oYgXr5IZIHBiAGWOiBYUTF+iPFBIdQARjBgUEgALACcmpKpxBneWQDM1LnZ1AxYYKlQdHAAFo4gVeG6MAAeWHA4cAAEAIR1sYhNCf5DVml2PB71SMstoSlstVwUXEA
#align(center, commutative-diagram(
  node((0, 0), [$A$]),
  node((0, 1), [$B$]),
  node((0, 2), [$C$]),
  node((1, 0), [$A'$]),
  arr((0, 1), (0, 2), [$f$]),
  arr((0, 0), (0, 1), [$i$]),
  arr((0, 0), (0, 2), [$0$], curve: 35deg),
  arr((1, 0), (0, 0), [$exists !$], "dashed"),
  arr((1, 0), (0, 1), [$i'$]),
  arr((1, 0), (0, 2), [$0$], label-pos: -1em),
))
  // #image("imgs/5.png", width: 30%)
]

#example[
  In $veck$, kernels are kernels.
]
#theorem[
  Kernels are monic. 
]

(This indicates that $A$ is the "biggest" subobject (to be defined!) of $B$ to be mapped to zero by $f$.)

#definition[ A cokernel of $f: B->C$ is a map $j: C-> D$ such that $j compose f  = 0$ in a universal way.]

#theorem[
  Cokernels are epic.
]

#example[
  For vector spaces $T: V -> W$, the cokernel is $W \/ im T$.
]

#definition[
  Opposite category: $cC |-> cC^op$, where $ob cC^op = ob cC$ and $hom_(cC^op)(x, y) = hom_cC (y, x)$.
]

#proposition[$f: B->C$ is monic in $cC$ if and only if $f^op : C -> B$ is epic in $cC^op$.]

== Products and coproducts

#definition[
  Suppose we have a family of objects ${C_i | i in I}$, then the product $product_(i in I) C_i$ satisfies universally:
#image("imgs/6.png", width: 50%)

Products in $cC^op$ are coproducts $product.co_(i in I) C_i$:

#image("imgs/7.png", width: 50%)
]

#example[
  In $Set$,
$ product X_i = {(x_i)_(i in I) | x_i in X_i} $ and $product.co X_i$ is the disjoint union. 
]

#remark[
  We need to use tuples here for the ordering of elements; suppose we want to use sets only then it can be messy and arbitrary! This is an advatange of the language of category theory over that of set theory.
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
    arr((0, 1), (0, 0), [$f$]),
    arr((1, 1), (0, 0), [$g_i$]),
    arr((1, 1), (0, 1), [$i_i$]),
  ))
  Notice the asymmetry here! It's not coproduct on the right hand side because it's still a tuple of arrows.
]



== Functors

#definition[
  A functor $F: cC -> cD$ is such that it maps objects $F: ob cC -> ob cD$ and morphisms $F: Hom(C) (C_1, C_2) -> Hom(D) (F(C_1), F(C_2))$, while preserving composition and identity morphisms.]

#definition[
  Now we can define $bd("Cat")$, the category of all (small) categories, where $ob bd("Cat")$ are small categories and $hom_Cat (cC, cD)$ are functors between $cC$ and $cD$. 
]
#definition[
  Suppose $F, G: cC -> cD$, then a natural transformation $alpha: F => G$ is defined by a collection of morphisms in $cD$ indexed by $x in ob cC$: $ {alpha_x: F(x) -> G(x)}_(x in ob cC) $ where the diagram commutes:
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

Then we see that $"Fun"(cC, cD)$ is a category (functor category) where the objects are functors and the morphisms are natural transformations. 

Then we see that in $Cat$, the hom-sets are not only sets but also categories, which means that $Cat$ is a 2-category. 

(This is the end of lecture 2.)

== Adjoint functors 
#definition[
  Functors $L : cA arrows.rl cB : R$ are adjoint if for all $A in cA, B in cB$ there exists a bijection $ tau_(A B) : Hom(B)(L(A), B) bij Hom(A) (A, R(B)) $ such that for any $f: A-> A'$ and $g: B-> B'$, the diagram commutes:
 #image("imgs/10.png")
]

#remark[
  Recall in linear algebra we have $angle.l T v, w angle.r  = angle.l v, T^* w angle.r $ and that's where the name adjoint comes from.
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




== Equivalence of categories

#definition[
  In a category $cC$, objects $X, Y$ are isomorphic if there exists $f: X-> Y$ and $g: Y -> X$ such that $f compose g = id_Y$ and $g compose f  = id_X$.
]


Consider $Cat$, then two small categories $cC$ and $cD$ are isomorphic if there are functors $F: cC-> cD$ and $G: cD-> cC$ such that $F compose G  = Id$ and $G compose F = Id$. However, this rarely happens.
#definition[
  Equivalence of categories. Two categories $cC$ and $cD$ are equivalent if there are functors $F: cC-> cD$ and $G: cD-> cC$ such that $F G => Id$ (natural isomorphism) and $G F => Id$. In this way $F(G(X)) iso X$ instead of $F(G(X))=X$.
]

#remark[
  Let $X, Y in Top$ and $f: X arrows.lr Y : g$ be continuous maps. If $f compose g tilde id $ and $g compose f tilde id$ then $X, Y$ are homotopy equivalent. Natural transformations are simiar to the notion of homotopy.
] 

== Limits and colimits

#definition[
Let $cal(I)$ be a small category and $F: cal(I) -> cA$ be a functor. Then $F$ is called a diagram. Denote $F(i)  = F_i$ for all $i in I$. The limit of $F$ is an object $L$ of $cA$ with morphisms $pi_i : L -> F_i$ such that for any $alpha : j -> i $  in $cal(I)$,

#image("imgs/11.png", width: 30%)

commutes and it is universal. (Any $L$ that makes the diagram commute is called a cone and being universal means that it's a final object in the category of cones.)

#image("imgs/12.png", width: 30%)

If such $L$ exists then we call it the limit of $F$ or $lim_cal(I) F$.
]

#definition[Dually, we define the colim of $F$. 

#image("imgs/13.png", width: 30%)]

#proposition[
  If any limit or colimit exists then it is unique up to a unique isomorphism. 
]

#example[
  If $cal(I)$ is a discrete category (to be defined), then $lim F = product F_i$ and $colim F = product.co F_i$.
]
#definition[Equalisers and coequalisers. Consider category $cal(I) = circle.filled arrows.rr circle.filled$.]

#proposition[
  Equalisers are always monomorphisms. 
]
Equalisers are the biggest subobject which when composed with $f$ or $g$ you can the same thing. 

// #image("imgs/14.png")

#image("imgs/15.png")

Coequaliser is just another direction. 

Note: $Eq(f, 0) = ker f $ and $Coeq (f, 0) = coker f$.

#proposition[
  Let $L : cA arrows.lr cB : R$ be an adjunction and $ L(colim A_i) iso colim L (A_i) \ R(lim B_i) iso lim R(B_i) $ 
]
#proof[
  

  $ Hom (L(colim A_i), X) = Hom (colim A_i R(X)) =  lim Hom (A_i, R(X)) \ = lim Hom (L (A_i),  X)  =  Hom (colim L (A_i), X) $

Move colimit out of Hom and it becomes limit: this is seen for products and coproducts. 

We then apply Yoneda Lemma to show $L(colim A_i) $ and $colim L(A_i)$ are isomorphic. 
]

Left adjunction preserves colimits and right adjunction preserves limits. In particular, left adjunction preserves cokernels and are right exact and right adjunction preserves kernels and are left exact. 

== Abelian categories 

#definition[
  We call a category $cC$ *Ab-enriched* if every $Hom(C)(x, y) in Ab$ (which means we can now add morphisms in $Hom(C)(x, y)$) and composition is bilinear, namely $(f + g) compose h  = f compose h + g compose h$ and $f compose (g + h) = f compose g + f compose h$.
]

Another way to put the bilinearity is the following: the composition mappings $ c_(x y z): Hom(C)(x, y) times Hom(C)(y, z) -> Hom(C)(x, z), quad (f, g) mapsto g oo f $
are group homomorphisms in each variable @borceux[Definition 1.2.1].

(This is the end of lecture 3).

#definition[
  If $cC, cD$ are Ab-enriched, we call $F : cC -> cD$ an *additive functor* if $ Hom(C)(x, y) -> Hom(D)(F(x), F(y)) $ is a group homomorphism for any $x, y in cC$.
]

#definition[
  An Ab-enriched category $cC$ is *additive* if it admits finite coproducts.  
]

#proposition[
  If $cC$ is an Ab-enriched category, then so is $cC^op$.
]
#proof[
  The definition is self-dual. Namely, reversing all the arrows in $cC$ does not break the group structure on hom-sets or the bilinear composition. 
]

#proposition[Let $*$ be an object in an Ab-enriched category, then the followings are equivalent:
+ $*$ is a final object;
+ $*$ is an initial object;
+ $*$ is a zero object.]

#proof[
  (3) $=>$ (1) and (3) $=>$ (2) is obvious. We only prove (1) $=>$ (3), and (2) $=>$ (3) follows from duality.

  Suppose $*$ is a terminal object and let $id_* : * -> *$ be the unique morphism in the abelian group of $Hom(C)(*, *)$, and so $id_* = 0$. 
For any object $A$ and $f : * -> A$ (because $Hom(C)(*, A) $ contains at least the zero morphism), we have $ f = f compose id_* = f compose 0 = 0 in Hom(C)(*, A) $
So there is a unique morphism from $*$ to $A$ and therefore $*$ is also initial. 
]

// This also includes the case of the empty product and coprodut, namely any final object is initial and thus zero. 

A final object is an empty product and an initial object an empty coproduct, and therefore the next result is a generalisation of the previous one.

#proposition[
  In an Ab-enriched category $cC$, a binary product is also a coproduct. 
]

#proof[Let $X_1, X_2 in ob cC$. Suppose that $X_1$ and $X_2$ have a product $X_1 times X_2$ in $cal(C)$, with projections $p_k colon X_1 times X_2 arrow.r X_k$. By definition of products, there are unique morphisms $i_k colon X_k arrow.r X_1 times X_2$ such that the following diagrams commute.

// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZARgBpiBdUkANwEMAbAVxiRAA0B9YgAjwFt4PLgCYQAX1LpMufIRQAGclVqMWbLsQlSQGbHgJERy6vWatEHTmMnT9cokoUqz6y5u13ZhlMZEu1CysbFRgoAHN4IlAAMwAnCH4kJRAcCCRiWxB4xOTqNKQRLJykxABmfPTEMlVzNiwoTgAKTQBKT2yE0orUquMQACMYMCgkMpTXIIUOkrHKvJAGLDAgqDo4AAswkFNAthgADyw4HDgAQhmupAAWecR+yfrGlut24qvEW96M6iGRsYme0s03euU+dxSSxWbDWm22uzqlkOx1OPAu4go4iAA
#align(center, commutative-diagram(
  node((1, 1), [$X_1 times X_2$]),
  node((1, 0), [$X_1$]),
  node((1, 2), [$X_2$]),
  node((0, 0), [$X_1$]),
  node((2, 2), [$X_2$]),
  arr((1, 1), (1, 0), [$p_1$]),
  arr((1, 1), (1, 2), [$p_2$]),
  arr((0, 0), (1, 0), [$id_(X_1)$]),
  arr((0, 0), (1, 2), [$0$], curve: 30deg),
  arr((0, 0), (1, 1), [$exists ! i_1$], "dashed"),
  arr((2, 2), (1, 2), [$id_(X_2)$]),
  arr((2, 2), (1, 0), [$0$], curve: 30deg),
  arr((2, 2), (1, 1), [$exists ! i_2$], "dashed"),
))

Explicitly, we have for $j, k in {1, 2}$, $ p_j oo i_k = cases(id_(X_j) quad &"if " j = k, 0 quad &"otherwise") $
// #image("imgs/16.png")

Then we have $ p_1 compose lr((i_1 p_1 plus i_2 p_2)) eq p_1 comma quad p_2 compose lr((i_1 p_1 plus i_2 p_2)) eq p_2 $

By defintion of products, $id_(X_1 times X_2) $ is the unique morphism $h : X_1 times X_2 -> X_1 times X_2$ with $p_k compose h eq p_k$ for each $k$, so $i_1 p_1 plus i_2 p_2 eq id_(X_1 times X_2)$. We claim that
$ X_1 rgt(i_1) X_1 times X_2 lft(i_2) X_2 $ is a universal cocone and thus a coproduct. Suppose 
$ X_1 rgt(f_1) A lft(f_2) X_2 $
is another cocone. Then we have a map
$ phi eq f_1 compose p_1 plus f_2 compose p_2 colon X_1 times X_2 arrow.r A $
such that for $k = 1, 2$, $ phi oo i_k = f_k $ 
This gives a commutative diagram
#align(center,image("imgs/2023-10-29-11-34-35.png",width:30%))

It remains to show that $phi$ is unique. To see this, note that for any
such $phi$ we have $ phi & eq phi compose id_(X_1 times X_2)\
 & eq phi compose lr((i_1 p_1 plus i_2 p_2))\
 & eq phi i_1 compose p_1 plus phi i_2 compose p_2\
 & eq f_1 compose p_1 plus f_2 compose p_2 dot.basic $

 See @notes[Proposition 3.7], @li[Theorem 3.4.9] and @borceux[Proposition 1.2.4].
]


We can show that $x union.sq y iso x times y$ and we use the notation of a biproduct $x ds y$ to denote both. 

This extends to all finite products and coproducts. 

#remark[
  This doesn't extend to infinite products or coproducts. In the case of abelian groups, 
$ union.sq.big _I M_i = plus.circle.big_I M_i = {(m_i) _(i in I) | m_i in M_i, m_i = 0 "for almost all" i} $
$ product _I M_i = {(m_i) _(i in I) | m_i in M_i} $
]

#definition[
  An additive category $cC$ is pre-abelian if any morphism has a kernel and a cokernel. 
]

Note: $Eq(f, q) = ker(f - g)$ and hence it has all equalisers and coequalisers, and thus it has all finite limits or colimits (by category theory, because it also has products and coproducts) @li[Corollary 2.8.4].

#definition[
  If $cC$ is pre-abelian we get: 

// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBpiBdUkANwEMAbAVxiRAGsYAnAAgAoAZgEoQAX1LpMufIRQBGclVqMWbABpiJIDNjwEiAJkXV6zVohABNTZN0yiAZmPKzbAMYROXQSPG3p+vKkckqmqhYeXnxRwr5aOgGyyEYhJirmHNx8kVmxYkowUADm8ESgAlwQALZIZCA4EEhyfiAV1U3UDUhGLuGtNq2VNYg9XYgOLW3DCvWNiAAsk0NIAKydcwZL7Qvrq9QMWGAZUHRwABaFIGmuFjAAHlhwOHA8AIT5okA
#align(center, commutative-diagram(
  node((0, 0), [$ker (f)$]),
  node((0, 1), [$X$]),
  node((0, 2), [$Y$]),
  node((0, 3), [$coker(f)$]),
  node((1, 1), [$coker(ker(f))$]),
  node((1, 2), [$ker(coker(f))$]),
  arr((0, 0), (0, 1), []),
  arr((0, 1), (0, 2), [$f$]),
  arr((0, 2), (0, 3), []),
  arr((0, 1), (1, 1), []),
  arr((1, 2), (0, 2), []),
  arr((1, 1), (1, 2), [$exists !$], "dashed"),
))

where we define $coim (f) = coker(ker(f))$ and $im(f) = ker(coker(f))$.
// #image("imgs/17.png")
[See Definition 1.2.4, Li-2]

We call $f$ strict if the map $coim (f) -> im f$ is an isomorphism. 
]


#definition[
  A pre-ablian category is abelian if all morphisms are strict. 
]

Remark. This is equivalent to: every mono is a kernel and every epi is a cokernel. (The converses are always true in any category.) This is equivalent to every mono is the kernel of its cokernel and every epi is the cokernel of its kernel. (? TODO)

#example[ $Ab$ and R-modules are abelian categories. ]

#example[If $cA$ is an abliean category and $cC$ is any small category and then the category of functors $Fun(cC, cA)$ is abelian. [TODO]]

$Fun(cC^op, cA)$ are presheves from $cC$ to $cA$.

#example[
  Non-example. Banach spaces over $RR$. We have $V attach(arrow.r.hook, t: i) W$ which are open. Then $coker i = W \/ overline(V)$. Then $ker coker i = overline(V) != V$. (The closure of $V$.)
This is an example of quasi-abelian categories. 
]

#proposition[
In an abelian category every morphism has a factorisation (epi-mono factorisation):

#image("imgs/18.png", width: 30%)
]

= Exact sequences
#definition[
  A sequence of maps $A attach(->, t: f) B attach(->, t: g) C $ is called exact at $B$ if $ker g = im f$ (as subobjects of $B$). 
]

#definition[
  A short exact sequence $0 -> A attach(->, t: f) B attach(->, t: g) C -> 0$ is exact everywhere. This means that $f$ is mono, $g$ is epi, and $ker g = im f$ (which indicates that $f = ker g$ and $g  = coker f$). (?)
]

#definition[
  A split short exact sequence if $B$ is isomorphic to $A ds C$. ($ds$ is biproduct here.)
  #image("imgs/19.png")
]

Equivalently, exsistence of section or retract. 

#definition[
  An additive functor $F: cC -> cD$ is called right exact if for every s.e.s. $0-> A-> B-> C-> 0$ the sequence $ F(A) -> F(B) -> F(C) ->  0 $ is exact; it is called left exact if   $ 0 -> F(A) -> F(B) -> F(C) $ is exact.
]


Right exactness preserves cokernels: $C$ is the cokernel of the map $A -> B$ and $F(C)$ is the cokernel of the map $F(A) -> F(B)$. Left exactness preserves kernels. 

#lemma[
  Let $cA$ be an abelian category. Let $M in cA$. The functor $ Hom(A)(M, -): cA -> Ab $ is left exact. 
So if $ses(A, B, C)$ is a ses in $cA$ then 
$ 0 -> Hom(A)(M, A) -> Hom(A)(M, B) -> Hom(A)(M, C) $
is exact in $Ab$.
]

Proof. TODO

#corollary[Dually, $Hom(A) (-, M): cA^op -> Ab$ is also left exact. ]


(This is the end of lecture 4.)

#definition[
   Let $cA$ be an abelian category. An object $P$ is called *projective* if $Hom(A) (P, -)$ is exact. Dually, an object $I$ is called *injective* if $Hom(A) (-, I)$ is exact. 
]

So $P$ is projective if for any ses $ses(X, Y, Z)$ in $cA$ then $ ses(Hom(A)(P, X), Hom(A)(P, Y), Hom(A)(P, Z)) $

The only interesting part is that $Hom(A)(P, Y) -> Hom(A)(P, Z)$ is onto. 

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
  This is just a paraphrase of the definition. By definition, $P$ is projective iff for any epimorphism $h: Y->Z$, we have $ h oo - : Hom(A)(P, Y) -> Hom(A)(P, Z) $ is onto, which means for any $f : P->Z$, there exists $g: P-> Y$ such that $f = h oo g$.
]

#corollary[Dually, $I$ is injective iff for any monomorphism $h: X->Y$ and any $f: X->I$, there exists $g: Y->I$ such that the following commutes (which we refer to as the *extension property*):
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
]

#example[
  $R$ ring. In the category of $RMod$ 
  $ Hom_RMod (R, M) = M $ because any $phi $ is entirely determined by $phi(1_R)$. If $ses(M, M', M'')$ and we apply $Hom_RMod (R, -)$ to this we get the same ses $ses(M, M', M'')$ which is exact. 
  
  In a similar way, any free module $R^(ds I)$ is projective. 
]


Note: $ Hom_RMod (R, plus.circle.big_(i in I) M_i) = plus.circle.big M_i = plus.circle.big_(i in I) Hom_RMod (R, M_i) $

This does not follow from the universal property; this is because $R$ is special. 

#definition[
  Let $cA$ be an additive category. We call an object $C$ compact if $ product.co_(i in I) Hom(A) (C, G_i) -> Hom(A)(C, product.co_(i in I) G_i) $
  is an isomorphism for any family ${G_i}_(i in I)$ of objects in $cA$ such that $product.co_(i in I) G_i$ exists. 
]

Remark. You might find different definitions for an arbitrary category (not necessarily additive), but it is equivalent under the additive context. 

// #definition[
//   Generators
// ]

Note. For any $RMod$ $M$ we can find an epi $R^(ds I) -> M -> 0$. (Any module has some generators.) This is not unique. We call $R$ a generator of $M$.

#theorem[
  Let $cA$ be an abelian category. Assume $cA$ has (small)(?) coproducts. Assume that $P$ is a compact, projective generator. Then the functor $Hom(A)(P, -) : cA -> End_cA (P)^op hyph Mod$ (not only an abelian group because any $f: P->P$ can act on it which makes it a module) is an equivalence of categories. 
]

See @rotman[Theorem 5.55]. ?

Note. If $cA = RMod$ we observe that $R$ (as an $RMod$) is a compact, projective generator with arbitrary coproducts (direct sums). In this case $End_RMod (R) = R^op$ because any module homomorphism $phi: R -> R$ is determined by $phi(1)$ but the composition is opposite. Then $End_RMod (R)^op hyph Mod$ is just $RMod$ because $(R^op)^op = R$.

Idea of proof. Using the definition of equivalence you want to construct another functor in the opposite direction and show their composites are natural isomprphic to identity functors. Alternatively, you might also prove that the functor is fully faithful and essentially surjective, if you can.

Let $R$ denote the ring $End(A) (P)^op$. We need a functor $G: RMod -> cA$. Inspired by the special case we want to send $R |-> P$. This is right exact (?) so it must send $R^(ds I) |-> P^(ds I)$. 

For any $M in RMod$ we can find $ R^(ds J) -> R^(ds I) -> M -> 0 $ where $R^(ds J)$ represents the relations and $R^(ds I)$ the generators. 

#image("imgs/22.png", width: 50%)
[TODO]

Note: $cA$ can have more than one compact, projective generator. Then $A = End(A) (P_1)^op hyph Mod = End(A) (P_2)^op hyph Mod$ where $End(A) (P_1)$ and $End(A) (P_2)$ are not necessarily equivalent. This is Morita equivalence of rings. 

Note. Consider $veck$ for some field $k$. Then $k$ and $k^n$ are both compact, projective generators of $veck$. Then $k$ and $M_n (k)$ ($n times n$ matrices over $k$) both are equivalent to $veck$ as categories. 

#theorem(name: "Freyd-Mitchell Embedding Theorem")[
  If $cA$ is a small abelian category, there is a ring $R$ and an exact, fully faithful embedding $cA -> RMod$.
]


Remark. We can embed an abstract category in a concrete one. We can prove any reasonable statements for $RMod$ and they will also hold for abelian categories because of this theorem. 

Proof. Using Yoneda embeddings. $cA -> Fun(cA^op, Ab)$. (?)

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

= Tensor products

The functor $- tp_R M$ is left adjoint so it commutes with colimits. If we want to calcualte $N tp_R M$. Then we pick the relations and generators of $N$: 
$ R^(ds J) -> R^(ds I) -> N -> 0 $
Then we have
$ R^(ds J) tp_R M -> R^(ds I) tp_R M  -> N tp_R M  -> 0 $

Note that $ R^(ds J) tp_R M iso (R tp_R M)^(ds J) = M^(ds J) $ and so it becomes 
$ M^(ds J) -> M^(ds I) -> N tp_R M  -> 0 $

Consider $R^(ds J) -> R^(ds I)$, this homomorphism between free modules can be represented by a (possibly infinite?) matrix $a_(i j) in R$. Then the same matrix can also act as $M^(ds J) -> M^(ds I) $; and when you take the cokernel of it you get the tensor product $N tp_R M$.

(This is the end of lecture 5.)

Assume $R$ is a commutative ring. The functor $- tp_R M$ is left adjoint which implies that it is right exact and commutes with all colimits. Suppose we want to calculate $N tp_R M$, then we write $ N = coker(R^(ds J) rgt((a_(i j))) R^(ds I)) $ and then $ N tpr M = coker(R^(ds J) rgt((a_(i j))) R^(ds I)) tpr M iso coker(R^(ds J) tpr M rgt((a_(i j))) R^(ds I) tpr M) \ iso coker((R tpr M)^(ds J) rgt((a_(i j))) (R tpr M)^(ds I)) iso coker (M^(ds J) rgt((a_(i j))) M^(ds I)) $

#example[
  Suppose $I$ is an ideal of $R$ generated by ${x_i}_(i in J)$, then we have ses $ ses(I, R, R \/ I) $ but we also have $ R^(ds J) -> I -> 0 $ and thus 
  $ R^(ds J) rgt((x_j)) R -> R \/ I -> 0 $

  Thus if we want to calculate for some $M$ $ R over I tpr M iso coker (M^(ds J) rgt((x_j)) M) = M over I M$
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

= Projective and injective modules

Recall $P$ is projective if $Hom(A)(P, -)$ is exact and $I$ is injective if $Hom(A)(-, I)$ is exact.

#lemma[
  $P$ is projective if and only if it has the lifting property (refer to earlier).

  $I$ is injective if and only if it has the extension property.
]

#definition[
  An abelian category $cA$ has enough projectives (injectives) if for any object $M$ there is an epi $P-> M -> 0$ where $P$ is projective ($0->M->I$ where $I$ is injective). 
]

For most of our homological algebra to work a category needs to have enough projectives and injectives. We show that $RMod$ has enough projectives and injectives.

== Projective modules

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

#proposition[$P$ is a projective $R$-module iff $P$ is a direct summand of a free module.
]

#proof[
  Assume $P$ is a projective. Then we can always find a free module $F=R^(ds I)$ such that $g: F -> P$ is onto. Using the lifting property,

// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBoBGAXVJADcBDAGwFcYkQAxEAX1PU1z5CKchWp0mrdgAUefEBmx4CRAExiaDFm0Qhic-kqFFRxcVqm7Z3cTCgBzeEVAAzAE4QAtkjIgcEJHJeVw9vRFE-AMRVYJB3LyQAZhp-HxpGLDAdECh6OAALOxBNSWyYAA8sOBwEWPiw5MjAku12LCgeSm4gA
#align(center, commutative-diagram(
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


== Injective modules

#lemma(name: "Baer's criterion")[
  A right $R$-module $M$ is injective iff for every right ideal $I$ of $R$, every module homomorphism $I -> M$ can be extended to $R -> M$.
]

#proof[
  One direction easily follows from definition. We focus on the other.

  // https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBpiBdUkANwEMAbAVxiRAEEQBfU9TXfIRQBGclVqMWbdgHJuvEBmx4CRAExjq9Zq0QcZcnn2WCiAZk0SdbAELzjA1SjLDx2qXoCy3cTCgBzeCJQADMAJwgAWyQyEBwIJFE4uiwGNgALCAgAa3sQcKjE6nikDWTUjKzco3yI6MQyksQLcrS9TJy8gvrYpoAWLUldfK66oriExAGQBiwwYag6OHS-EEHrPUY0dLpDBW7S4snp92GtnYM1mbmFpZWoUcLmo6Rp2fm2ReXVrgouIA
#align(center, commutative-diagram(
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

#proposition[
  $Ab$ has enough injectives. 
]

[See https://math.stackexchange.com/questions/4071941/category-of-abelian-groups-has-enough-injectives.]

#proof[
  Direct sums of projectives are projectives. 
  $ Hom (ds P_i, -) = product Hom (P_i, -) $

  Products of injectives are injectives. 

  Define a functor $ I(A) := product_(Hom_Ab (A, QQ over ZZ)) QQ over ZZ $

  The RHS is injective as a product of injectives $QQ over ZZ$.

  Consider canonical map $e_A: A -> I(A)$, where (because $I(A)$ is a product) we need to define for each $phi  in Hom_Ab (A, QQ over ZZ)$ the component $e_(a, phi) : A -> QQ  over ZZ$, which we just define to be $phi$ itself. 

  We claim that $e_A$ is injective. We need to show that for any $0 != a in A$ there exists $phi in Hom_Ab (A, QQ over ZZ)$ such that $phi(a) != 0$ (using that $QQ over ZZ$ is injective). (?)
]

(This is the end of lecture 6.)

#bibliography("bib.yml", style: "chicago-author-date")