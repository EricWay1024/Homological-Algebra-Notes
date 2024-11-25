#import "../libs/template.typ": *

= Tensor Product of Modules
<tp-module>

== Existence and Functoriality


#let Bil = [$"Bil"$]
#definition[
  Let $R$ be a ring. Consider a #rrm $M$, a #lrm $N$ and an abelian group $A$. A map $f: M times N -> A$ is called a *balanced product* (or we say it is *$R$-biadditive*) if it satisfies:
  $
    f(x + x', y) = f(x, y) + f(x', y), \
    f(x, y + y') = f(x, y) + f(x, y'), \
    f(x r , y) = f(x, r y).
  $
  for all $x, x' in M$, $y, y' in N$ and $r in R$.

  // Denote the set of all balanced products $B : M times N -> A$ as $Bil\(M, N; A)$, which is an abelian group under addition.
]

#definition[
  The *tensor product* of a #rrm $M$ and a #lrm $N$ is an abelian group $M tpr N$ with a balanced product $M times N -> M tpr N$ such that for any balanced product $f: M times N -> A$, there exists a unique group homomorphism $M tpr N -> A$ that makes the diagram commute:

  // https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBpiBdUkANwEMAbAVxiRAFkACPAW3k4ByIAL6l0mXPkIoAjOSq1GLNlxxoAToJFiQGbHgJE5MhfWatEIAIIiFMKAHN4RUADN1EHkjIgcEJABM1GbKlgBC2m4eXohyvv6IQSAMWGAWIFB0cAAW9iDBSukwAB5YcDhwnACEkSDunt7UfkgywhTCQA
  #align(
    center,
    commutative-diagram(
      node-padding: (50pt, 50pt),
      node((0, 0), [$M times N$]),
      node((0, 1), [$M tpr N$]),
      node((1, 1), [$A$]),
      arr((0, 0), (1, 1), [$f$]),
      arr((0, 1), (1, 1), [$exists !$], "dashed"),
      arr((0, 0), (0, 1), []),
    ),
  )

  We might simply say $M tpr N$ is the tensor product of $M$ and $N$.
]
#remark[
  In other words, $M tpr N$ is an initial object of the category of all balanced products $M times N -> A$ (where a morphism is a group homomorphism $A -> A'$).

]
#lemma[The tensor product $M times N -> M tpr N$ exists, up to a unique isomorphism, for any #rrm $M$ and #lrm $N$.]
#proof[
  // #definition[
  //    For any set $X$, let $k[X]$ denote the vector space spanned by $X$: $ sum_(x in X) a_x x $ where $a_x = 0$ for almost all $x in X$.
  // ]
  Consider the free abelian group $F$ with basis $M times N$, and let $i : M times N -> F$ be the inclusion map. $F$ has a subgroup $I$ generated by all elements of the following forms
  $
    (x+x', y) - (x, y) - (x', y), \
    (x, y+y') - (x, y) - (x, y'), \
    (x r , y) - (x, r y),
  $
  for $x, x' in M$, $y , y' in N$ and $r in R$. Define $M tpr N$ as $F over I$, and denote the coset $(x, y) + I$ by $x tp y$. Then, define the map $
  h : M times N &-> M tpr N, \ (x, y) &|-> x tp y. $ It is clear that $h$ is biadditive.

  Let $f : M times N -> A$ be a balanced product, then there exists a homomorphism $f': F -> A$ which linearly extends $f$ such that $f = f' oo i$. Now we see that $I subset.eq Ker f'$ and thus $f'$ induces a map $
  hat(f) : F over I &-> A, \
  (x, y) + I &|-> f'(x, y) = f(x, y),
$
  which is the same as saying
  $
    hat(f) : M tpr N &-> A, \
    x tp y &|-> f(x, y).
  $
  Thus we see that $hat(f) oo h = f$, and we can conclude that $M tpr N$ is a tensor product of $M$ and $N$. The uniqueness follows from the universal property.
  // Now we look at $k[V times W]$ (a free vector space). This is large: even if $V$ and $W$ have finite dimensions this vector space has infinite. We look at the subspace spanned by the relations $ M = "span"{(v + v', w) - (v, w) - (v', w) \ (v, w + w') - (v, w) - (v, w') \ c(v, w) - (c v, w) \ c(v, w) - (c w, v)} $ TODO
  // for all $v, v' in V$ and $w, w' in W$ and $c in k$. Then we have
  // $
  // homk (k[V times W] \/ M, L) tilde.eq "Bilin"(V, W; L)
  // $
  // due to the first isomorphism theorem. We see that if $T in homk (k[V times W] \/ M, L)$ then $T$ is a linear transformation $k[V times W] -> L$ such that $T(M) = 0$. For any $(v, w) in V times W$:
  // $ V times W -> k[V times W] -> k[V times W] \/ M \
  // (v, w) |-> (v, w) |-> (v, w) + M $
  // We can thus define $V tpk W := k[V times W] \/ M$.
]

#lemma[
  Let $phi : M -> M'$ and $psi : N -> N'$ be module homomorphisms, then there exists a unique group homomorphism $phi tp psi : M tpr N -> M' tpr N'$, such that $ phi tp psi : m tp n mapsto phi(m) tp psi(n) $
]


#proof[
  The function $ f : M times N &-> M' tpr N' \ (m, n) &|-> phi(m) tp psi(n) $
  is $R$-biadditive. Therefore, $f$ induces a unique homomorphism
  $
    hat(f): M tpr N &-> M' tpr N' \
    m tp n &|-> phi(m) tp psi(n)
  $
  which we write as $phi tp psi$.
]

#corollary[
  $(phi' oo phi) tp (psi' oo psi) = (phi' tp psi') oo (phi tp psi)$ for any $M ->^phi M' ->^(phi') M''$ and $N ->^psi N' ->^(psi') N''$.
]
<tp-composition>
#proof[Both send $m tp n$ to $phi'(phi(m)) tp psi'(psi(n))$, but such a homomorphism should be unique. ]

#corollary[
  Let $M$ be a #rrm and $N$ be a #lrm, then we have functors
  $
    M tpr - : RMod &-> Ab \
    B &|-> M tpr B \
    (g:B-> B') &mapsto id_M tp g
  $
  $
    - tpr N : ModR &-> Ab \
    A &|-> A tpr N \
    (f: A -> A') &mapsto f tp id_N
  $
]

== Bimodules and Bilinearity

#definition[
  Let $R, S$ be rings. An *$R$-$S$-bimodule* is an abelian group $M$ being both a left $R$-module and a right $S$-module, satisfying:
  $ r(m s) = (r m) s $
  for all $m in M, r in R, s in S$.
]

#example[
  Any #lrm is an $R$-$ZZ$-bimodule, and any #rrm is a $ZZ$-$R$-bimodule.
]
#example[
  When $R$ is commutative, any $R$-module can be seen as an $R$-$R$-bimodule.
]


#proposition[
  Let $Q, R, S$ be rings, $M$ be a $Q$-$R$-bimodule, and $N$ be an $R$-$S$-bimodule. Then $M tpr N$ is a $Q$-$S$-bimodule.
]
#proof[
  // See @li[Proposition 6.5.9].
  Let $q in Q$ and $s in S$. Then $f: m |-> q m$ is a homomorphism $M -> M$ and $g: n |-> n s$ is a homomorphism $N -> N$. Then $f tp id_N$ gives a left multiplication on $M tpr N$ and $id_M tp g$ gives a right multiplication on $M tpr N$, which satisfies $(f tp id_N) oo (id_M tp g) = f tp g =  (id_M tp g) oo (f tp id_N)$.
]

// In this case we know $M tpr N$ is not merely an abelian group.
#definition[
  If $R$ is a commutative ring and $M, N, A$ are $R$-modules, a map $f : M times N -> A$ is called *$R$-bilinear* if it is $R$-biadditive and also
  $ f(r x , y) = f(x, r y) = r f(x, y) $
  for all $x in M$, $y in N$ and $ r in R$.
]
#proposition[
  Let $R$ be a commutative ring and $A, B$ be $R$-modules. Then $A tpr B$ is an $R$-module and $h: A times B -> A tpr B$ is $R$-bilinear.

  Further, for any $R$-bilinear map $g : A times B -> C$, there exists an $R$-homomorphism $hat(g) : A tpr B -> C$ such that $g = hat(g) oo h$.
]
#proof[
  // See @rotman[Proposition 2.55].
  Viewing $A$, $B$ as $R$-$R$-bimodules, we easily see that $A tpr B$ is also an $R$-$R$-bimodule (i.e., an $R$-module) with (left) multiplication given by $(a |-> r a) tp id_B$, hence $r(a tp b) = (r a) tp b = a tp (r b)$ and $h$ is $R$-bilinear.

  Suppose $g : A times B -> C$ is an $R$-bilinear map. Then $g$ is $R$-biadditive and $g$ induces a $ZZ$-homomorphism $hat(g) : A tpr B -> C$ such that $g = hat(g) oo h$. We only need to show that $hat(g)$ is also an $R$-homomorphism. Let $r in R$. Then $hat(g) (r (a tp b)) = hat(g) ((r a) tp b) = g(r a, b) = r g(a, b) = r hat(g) (a tp b)$.
]

// In this section, let $R$ be a commutative ring unless stated otherwise.

// #definition[
//   Let $M, N, P$ be $R$-modules. A map $f : M times N -> P$ is called *bilinear* if the following identities are satisfied:

//   $
//     f(m + m', n) = f(m, n) + f(m', n) \
//     f(m, n + n') = f(m, n) + f(m, n') \
//     f(r m, n) = r f(m, n) = f(m, r n)
//   $

// ]


// Let $k$ be a field and let $veck$ denote the category of $k$-vector spaces. Let $V, W, L in veck$, denote by $"Bilin"(V, W; L)$ the set of bilinear transformations $V times W -> L$. Let $T in "Bilin"(V, W; L)$, then can we write $T$ in terms of linear algebra?

// Denote
// $ "Hom"_k (V, W) := "Hom"_veck (V, W) $ as the set of linear transformations $V -> W$, and it is a $k$-vector space (in a natural way).
// //  We denote the same set by $#underline("Hom") (V, W)$ to emphasise the vector space structure.

// We see that

// $
// "Bilin"(V, W; L) tilde.eq homk (V, homk (W, L)) tilde.eq homk(V, homk(V, L))
// $

// #remark[This is currying in computer science.]

// Is $"Bilin"(V, W; -): veck -> bd("Set")$ _representable_? In other words, is there a $k$-vector space $V times.circle_k W$ with a _natural_ isomorphism $ "Bilin"(V, W; -) tilde.eq homk (V times.circle_k W, -) $
// where naturality means that the isomorphism is compatible with changes in $L$: if there is a linear map $T: L -> L'$ then this isomorphism should be compatible with $T$.

// Also equivalent to: is there a vector space $V times.circle_k W$ with a bilinear map $V times W -> V times.circle_k W$ which is universal? We want to find bilinear map $V times W -> V times.circle_k W$ such that for any bilinear map $V times W -> L$, there exists a unique linear map $V times.circle_k W -> L$ such that the diagram commutes:

// // #image("imgs/1.png", width: 50%)

// // https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBoBGAXVJADcBDAGwFcYkQA1AAjwFt4uAdRABfUuky58hFOQrU6TVuwAyo8SAzY8BInOIKGLNok480AayGiFMKAHN4RUADMAThF5IyIHBCTkYq4eXog+fkgATEEg7p5RNBGIciCMWGAmIFD0cAAWdiA0RsqmMAAeWHA4cFwAhDYiQA
// #align(center, commutative-diagram(
//   node((1, 0), [$V times W$]),
//   node((1, 1), [$L$]),
//   node((0, 1), [$V tpk W$]),
//   arr((1, 0), (1, 1), []),
//   arr((1, 0), (0, 1), []),
//   arr((0, 1), (1, 1), [$exists !$], "dashed"),
// ))


// Remark: it is also equivalent to asking for an adjoint functor.

// For any $(v, w) in V times W$ we want to find $v times.circle w in V tpk W$. This is a bilinear map, so for example:

// $
// (v+v') tp w = v tp w + v' tp w
// $


// Note: $V tpk W$ is defined up to a unique isomorphism. This follows from the universal property (ref. category theory).

// // https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBoBGAXVJADcBDAGwFcYkQA1AAjwFt4uAdRABfUuky58hFOVLFqdJq3bccaANZDR4kBmx4CROQCZFDFm0ScemgOTaRimFADm8IqABmAJwi8kMhAcCCRyMW8-AMQgkKQTCJBff3iaOMQ5EEYsMCsQKHo4AAsXEBoAIxgwKCQAZiCLFWsYAA8sOBw4LgBCHUiUjLTQxBMKqprEepps3PYC4tKaRrzW9s6e0UoRIA
// #align(center, commutative-diagram(
//   node((1, 0), [$V times W$]),
//   node((0, 1), [$V tpk W$]),
//   node((2, 1), [$V tpk' W$]),
//   arr((1, 0), (0, 1), []),
//   arr((1, 0), (2, 1), []),
//   arr((2, 1), (0, 1), [$exists !$], curve: 30deg, "dashed"),
//   arr((0, 1), (2, 1), [$exists !$], curve: 30deg, "dashed"),
// ))

// #image("imgs/2.png")

== Further Properties

#proposition[
  If $R$ is a ring, $M$ is a #rrm and $N$ is a #lrm, then there is a natural $ZZ$-isomorphism
  $
    tau : M tpr N &-> N tp_(R^op) M \
    m tp n &|-> n tp m
  $
]
#proof[
  This follows from the fact that a map $f: M times N -> A$ is $R$-biadditive if and only if the map $g: N times M -> A$ defined by $g(n, m) = f(m, n)$ is $R^op$-biadditive.
]
// #proof[
//   Consider map
//   $
//     f: M times N  &->  N tp_(R^op) M   \
//      (m, n)&|-> n tp m
//   $
//   then $f$ is $R$-biadditive so that it induces a unique $ZZ$-homomorphism $ tau : M tpr N &-> N tp_(R^op) M \ m tp n &mapsto n tp m  $
//   Similarly, we can get a $ZZ$-homomorphism $n tp m |-> m tp n$ which gives an inverse to $tau$, and thus $tau$ is an isomorphism.
// ]

#corollary[
  If $R$ is a commutative ring and $M$, $N$ are $R$-modules, then there is a natural $R$-isomorphism
  $
    tau: M tpr N &-> N tpr M \
    m tp n &mapsto n tp m
  $
]
<r-tpr>

#proposition[
  Given a #rrm $A$, an $R$-$S$-bimodule $B$, and a left $S$-module $C$, there is an isomorphism
  $
    theta : A tpr (B tp_S C) iso (A tpr B) tp_S C,
  $
  given by $a tp (b tp c) |-> (a tp b) tp c$.
]
#proof[
  @rotman[Proposition 2.57].
  They are both solutions to the universal mapping problem of *triadditive functions*, but the solution is unique.
]

#corollary[
  Let $R$ be a commutative ring, and let $M_1, M_2, ..., M_n$ be $R$-modules. Let $sigma in S_n$ (where $S_n$ is the symmetric group of degree $n$), then
  $
    ( ... (M_1 tpr M_2) tpr ... tpr M_n) iso ( ... (M_sigma(1) tpr M_sigma(2)) tpr ... tpr M_sigma(n))
  $
]
#proof[
  Notice that both solve the universal mapping problem of $R$-$n$-linear functions.
]

#proposition[
  Given ring $R$ and #lrm $M$, there is a natural $R$-isomorphism
  $
    phi_M : R tpr M &-> M \
    r tp m &|-> r m
  $
]
<r-tp-m>
#proof[
  $f : R times M -> M$ defined by $(r, m) mapsto r m$ is $R$-biadditive and thus induces an $R$-homomorphism $phi: R tpr M -> M$ with $r tp m |-> r m$. Now $g : M -> R tpr M$ defined by $g : m mapsto 1 tp m$ satisfies that $phi g$ and $g phi$ are identity maps, so $phi$ is an $R$-isomorphism.
]

// $"Bilin"(V, W; -) tilde.eq "Bilin"(W, V; -)$ in a canonical way and hence $V tpk W tilde.eq W tpk V$. Also $k tpk W tilde.eq W$.

// $ "Trilin"(V_1, V_2, V_3; L) tilde.eq "Bilin"(V_1 tpk V_2, V_3; L)  tilde.eq  "Bilin"(V_1,  V_2 tpk V_3; L) $
// and hence $ (V_1 tpk V_2) tpk V_3 tilde.eq V_1 tpk (V_2 tpk V_3) $

// It is obviously hard to verify these properties using the definition directly (but good exercise?).

// More generally, let $sigma in S_n$ (symmetric group),

// $ ( ... (V_1 tpk V_2) tpk ... tpk V_n) tilde.eq ( ... (V_sigma(1) tpk V_sigma(2)) tpk ... tpk V_sigma(n)) $

// Remark: in category theory, we think of things by their properties not their definition.

// Remark: we now have $(veck, - tpk -)$ which also preserves liner maps. If we have $T: V-> V'$ and $S: W-> W'$ then $T tpk S: V tpk W -> V' tpk W$. (This is heavily used in quantum computing.) This is a symmetric monoidal category.

== Monoidal Categories and $k$-algebras
#definition[
  A *monoidal category* is a category $cC$ equipped with a bifunctor $tp: cC times cC -> cC$ associative up to a natural isomorphism, and an object $I$ that is both a left and right identity for $tp$ up to a natural isomorphism.
]

#proposition[
  Let $R$ be a commutative ring, then the category $(RMod, tpr)$ is a monoidal category. In particular, for a field $k$, the category $(veck, tpk)$ is a monoidal category.
]
#proof[
  The identity for $tpr$ in $RMod$ is clearly given by $R$.
]
#definition[
  A *monoid object* in a monoidal category $(cC, tp, I)$ is an object $M$ with two morphisms:
  - $mu: M tp M -> M$ called *multiplication*,
  - $eta: I -> M$ called *unit*,

  such that the following diagrams commute:
  // https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBpiBdUkANwEMAbAVxiRAAoBZAAhzW84BKXv04gAvqXSZc+QigCM5KrUYs2PPty4iBgiVJAZseAkQBMy6vWatEITaIPSTci6QUqb6+2MkvZMxQyT2s1OwddPxUYKABzeCJQADMAJwgAWyQAFmocCCQAZjDbNgymZxA0zKRLEHyikp8QcsrqrMQyeoLEXNVS+3LdLCgAfT9DdqQuhsQlfubGNAALOjb0jvnZuu8IkfHuXVbxCnEgA
  #align(
    center,
    commutative-diagram(
      node-padding: (70pt, 50pt),
      node((0, 0), [$(M tp M) tp M$]),
      node((0, 1), [$M tp (M tp M)$]),
      node((0, 2), [$M tp M$]),
      node((1, 2), [$M$]),
      node((1, 0), [$M tp M$]),
      arr((1, 0), (1, 2), [$mu$]),
      arr((0, 2), (1, 2), [$mu$]),
      arr((0, 0), (1, 0), [$mu tp id_M$]),
      arr((0, 0), (0, 1), [$alpha$]),
      arr((0, 1), (0, 2), [$id_M tp mu$]),
    ),
  )
  // https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBpiBdUkANwEMAbAVxiRAEkACHNTgWRABfUuky58hFAEZyVWoxZs+3XgOGjseAkQBMs6vWatEIZT07shIkBk0SiMqXMOKTauTCgBzeEVAAzACcIAFskMhAcCCQZeSM2GBw6FU4sKAB9NWsg0KQ9SOjEWJdjEDTMlMS6KwDgsKLqKKQAZgMFUpCmGpAc+oimxFa41xAGOhCAIyhq9R66vMbCoZK2QIALaMEKQSA
  #align(
    center,
    commutative-diagram(
      node-padding: (70pt, 50pt),
      node((0, 0), [$I tp M$]),
      node((0, 1), [$M tp M$]),
      node((0, 2), [$M tp I$]),
      node((1, 1), [$M$]),
      arr((0, 0), (0, 1), [$eta tp id_M$]),
      arr((0, 2), (0, 1), label-pos: -.8em, [$id_M tp eta$]),
      arr((0, 1), (1, 1), [$mu$]),
      arr((0, 0), (1, 1), [$lambda$], label-pos: right),
      arr((0, 2), (1, 1), label-pos: left, [$rho$]),
    ),
  )
  where $alpha$, $lambda$, $rho$ are natural isomorphisms for the associativity, the left identity and the right identity, respectively.
]
#definition[
  Let $k$ be a field. A (unital associative) *$k$-algebra* is a monoid object in $(veck, tpk)$.
]
#remark[
  Let $M$ be a $k$-algebra, then
  $M$ is a $k$-vector space equipped with bilinear multiplication $mu: M tpk M -> M$ and unit $eta: k -> M$ which sends $1 in k$ to $i(1) in M$, the multiplicative unit.

  An equivalent definition: $M$ is both a $k$-vector space and a unital ring, where the ring multiplication satisfies
  $
    a (x y) = (a x) y = x( a y) \
  $
  for all $a in k$ and $x,y in M$.
]

// #definition[
//   #TODO
//   A $k$-algebra is a monoid object in $(veck, tpk)$; namely, Associativity of $m$ is shown in commuting diagram:

//   // #image("imgs/3.png")
// ]



// == Non-linear version
#remark[
  $(veck, tpk)$ is a *symmetric monoidal category*, where the tensor product is commutative.
]
#remark[
  In $Set$,
  $ hom(X times Y, Z) = hom(X, hom (Y, Z)). $
  $Set$ is a *cartesian monoidal category*, where the categorical product is the same as the tensor product.
]



// #endlec(1)

// == More discussions

#remark[ For vector spaces $V, W$ over field $k$,
  $ dim (V ds W) = dim V + dim W, quad dim (V tp W) = dim V dot dim W. $

  An alternative definition of the tensor product: let $V$ be a vector space with basis ${v_i}_(i in I)$ and $W$ with ${w_j}_(j in J)$ and define $V tpk W$ as the vector space with basis ${v_i tp w_j}_(i in I, j in J)$. This definition relies on the choice of basis and can be inconvenient when we have to change basis.
]

== Tensor-hom Adjunction


#proposition[
  If $B$ is an $R$-$S$-bimodule and $C$ is a right $S$-module, then $hom_S (B, C)$ is a right $R$-module.
]
<hom-module>
#proof[
  Take any $f in hom_S (B, C)$ and $r in R$, define right multiplication $f r : B -> C$ by $f r(b) = f(r b)$.
  Then we see that $(f r) (b s) = f (r b s) = f (r b) s = (f r) (b) s$, which indicates that $f r$ is still a homomorphism $B -> C$ of right $S$-modules.
]

Then this makes $hom_S (B, -)$ a functor from $ModS$ to $ModR$.

#theorem[
  Let $R$, $S$ be rings. Let $A$ be a #rrm, $B$ be an $R$-$S$-bimodule, and $C$ be a right $S$-module. Then we have a canonical isomorphism
  $ tau: hom_S (A tpr B, C) bij hom_R (A, hom_S (B, C)) $
  where for $f : A tpr B -> C$, $a in A$, and $b in B$,
  $
    tau(f)(a)(b) = f(a tp b)
  $
]
<tensor-hom>
#proof[
  $tau$ is a group homomorphism because for any $a in A$ and $b in B$, $ tau(f + g)(a)(b) = (f+g)(a tp b) = f(a tp b) + g(a tp b) = tau(f)(a)(b) + tau(g)(a)(b) $
  and hence $tau(f+g) = tau(f) + tau(g)$.

  $tau$ is injective because if $tau(f) = 0$, then $f(a tp b) = tau(f)(a)(b) = 0$ for all $a in A$ and $b in B$. Thus $f = 0$ since it vanishes on all generators of $A tpr B$.

  It remains to be shown that $tau$ is surjective. Take any $R$-homomorphism $g : A -> hom_S (B, C)$, define $phi: A times B -> C$ by $phi(a, b) = g(a)(b)$. Now it is easy to check that $phi$ is $R$-biadditive and hence there exists a group homomorphism $hat(phi) : A tpr B -> C$ such that $hat(phi) (a tp b) = phi(a, b) = g(a)(b)$ for all $a in A$ and $b in B$. Therefore $g = tau(hat(phi))$ and $tau$ is surjective.

  Verifying the naturality of $tau$ is omitted.
]

#corollary[ Let $R$, $S$ be rings and let $B$ be an $R$-$S$-bimodule.
  We have an adjunction
  $
    (- tpr B) tack.l hom_S (B, -)
  $
  where $(- tpr B) : ModR -> ModS$ and $hom_S (B, -) : ModS -> ModR$.
]

#corollary[
  The functor $(- tpr B) : ModR -> ModS$ preserves colimits. In particular, it preserves cokernels and is thus right exact; it also preserves direct sums.
]
<tensor-right-exact>

#theorem[
  Let $A$ be a left $R$-module, $B$ be an $S$-$R$-bimodule, and $C$ be a left $S$-module, then there is a canonical isomorphism
  $
    hom_S (B tpr A, C) bij hom_R (A, hom_S (B, C))
  $
  Thus $(B tpr -): RMod -> SMod$ and $hom_S (B, -): SMod -> RMod$ form an adjunction
  $
    (B tpr -) tack.l hom_S (B, -)
  $
  Hence $(B tpr -)$ preserves colimits and in particular is right exact.
]
<tensor-right-exact-2>

//  which is right adjoint to $ - tpr B : Mod hyph S -> Mod hyph R $,

// #remark[
//   We haven't really defined $ - tpr B $ when $R$ is not commutative but this can be a definition itself, as left adjoint of $Hom_S (B, -)$.

//   We can define $ M tpr N := Coeq (M tp_ZZ R tp_ZZ N arrows M tp_ZZ N ) $
//   This coequaliser basically just makes sure $m r tp n = m tp r n$.
// ]

== Computations


#example[
  Let $R$ be a commutative ring. Given $R$-modules $N$ and $M$, suppose we want to calculate $N tp_R M$, then we can pick the relations and generators of $N$:
  $ R^(ds J) -> R^(ds I) -> N -> 0 $
  Consider $R^(ds J) -> R^(ds I)$, this homomorphism between free modules can be represented by a (possibly infinite) matrix $a_(i j) in R$. Therefore, we can write
  $ N = Coker(R^(ds J) rgt((a_(i j))) R^(ds I)) $

  Notice that the same matrix can also act as $M^(ds J) -> M^(ds I) $, hence

  $
    N tpr M = Coker(R^(ds J) rgt((a_(i j))) R^(ds I)) tpr M iso Coker(R^(ds J) tpr M rgt((a_(i j))) R^(ds I) tpr M) \ iso Coker((R tpr M)^(ds J) rgt((a_(i j))) (R tpr M)^(ds I)) iso Coker (M^(ds J) rgt((a_(i j))) M^(ds I))
  $
]

// The functor $- tp_R M$ is left adjoint so it commutes with colimits. In particular, it sends cokernels to cokernels and is right exact. It also preserves direct sums.

//  If we want to calculate $N tp_R M$.
// Then we have
// $ R^(ds J) tp_R M -> R^(ds I) tp_R M  -> N tp_R M  -> 0 $

// Note that $ R^(ds J) tp_R M iso (R tp_R M)^(ds J) = M^(ds J) $ and so it becomes
// $ M^(ds J) -> M^(ds I) -> N tp_R M  -> 0 $



// Assume $R$ is a commutative ring. The functor $- tp_R M$ is left adjoint which implies that it is right exact and commutes with all colimits.

#example[
  Suppose $I$ is an ideal of $R$ generated by ${x_i}_(i in J)$, then we have #sest $ ses(I, R, R \/ I) $ On the other hand, $ R^(ds J) -> I -> 0 $ and thus
  $ R^(ds J) rgt((x_j)) R -> R \/ I -> 0 $

  Let $M$ be a left $R$-module, then
  $ (R over I )tpr M iso Coker (M^(ds J) rgt((x_j)) M) = M over I M $
]
<tensor-ideal>
// [Check https://math.stackexchange.com/questions/175789/how-to-prove-that-r-i-otimes-r-m-cong-m-im]



#example[ The *localisation* of a commutative ring $R$ at element $x$ is defined as $R[t] over (t x - 1)$, denoted as $R[x^(-1)]$.

  For $R$-module $M$, we have
  $ R[x^(-1)] tpr M iso M[x^(-1)] $
]

#proof[
  Notice that $R[t] tpr M = M[t]$, because $R[t] iso plus.circle.big_(i=1)^(infinity) R$ in $RMod$.
]

