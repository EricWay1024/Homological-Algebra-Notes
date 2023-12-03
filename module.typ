#import "libs/template.typ": *


= Module Theory Prerequisites

#definition[
    Let $R$ be a ring. A *left $R$-module* $M$ is an abelian group with maps $R times M -> M$ (called multiplication), denoted as $(r, m) |-> r dot m = r m$, which satisfies:
    $ r(m_1 + m_2) &= r m_1 + r m_2 \
      (r_1 + r_2) m &= r_1 m + r_2 m \
      (r_1 r_2) m &= r_1 (r_2 m) \
      1_R dot m &= m $
    
    A *right $R$-module* is defined similarly, but with multiplication on the right, namely $m r$.
]

Another way to understand the definition is to think of $R$ acting on an abelian group $M$, where for each $r in R$ we define a group homomorphism $M -> M$, denoted as $m |-> r dot m = r m$. 

If $R$ is a commutative ring then left and right $R$-modules are the same, and we call them $R$-modules. Obviously  a left $R$-module is the same as a right $R^op$-module. 

#definition[
    Let $M$ be a #lrm. A *submodule* $N$ of $M$ satisfies:
    - $N$ is a subgroup of $(M, +)$;
    - $r n in N$ for all $r in R$ and $n in N$.

    In this case we denote $N subset M$.
]

#definition[
    Let $R$ be a ring. Let $M_1, M_2$ be left $R$-modules. A map $phi : M_1 -> M_2$ is a *module homomorphism* if it satisfies:
    $
        phi(x + y) &= phi(x) + phi(y) \
        phi(r x) &= r phi(x)
    $
    for all $x, y in M_1$ and $r in R$.
]

Compositions of module homomorphisms are still module homomorphisms, and hence we obtain the category of left $R$-modules, denoted as $RMod$. Similarly, we have the category of right $R$-modules, denoted as $ModR$.


For all $M, M' in RMod$, we see that  $ homr(M, M')$ is an abelian group [Remark 6.1.8 Li]. Also, $endr(M)$ is a ring, where the multiplication is defined as composition. Therefore any right $R$-module is also a left $D := endr(M)$-module [p. 205, Li].

#definition[
    The *kernel* of a module homomorphism $phi : M_1 -> M_2$ is defined as 
    $ ker(phi) := {x in M_1 : phi(x) = 0} $
    The *image* of $phi$ is defined as 
    $ im(phi) := {phi(x) : x in M_1} $

    It can be shown that $ker(phi) subset M_1$ and $im(phi) subset M_2$.
]

#definition[
    Let $N subset M$ be #lrms. Define a #lrm on the quotient group $M over N$ with
    $ r(x + N) = r x + N $
    for all $r in R$ and $x in M$.
    Then the *quotient map* $M -> M over N$ is a module homomorphism and $M over N$ is 
    a *quotient module*. 
]

#definition[
    Let $X$ be a set. The *free module* with basis $X$ is defined as $ R^(ds X) = plus.circle.big_(x in X) R x $

    We have the inclusion map $i: X -> R^(ds X)$ between sets: $ i(x) = 1_R dot x $

    An element $m in R^(ds X) $ can be written as 
    $ m = sum_(x in X) a_x x $
    where only finitely many $a_x in R$ is non-zero.
]

#proposition[
    For any $R$-module $M$ and map between sets $phi.alt:  X -> M$, there exists a unique module homomorphism $phi : R^(ds X) -> M$ that make the following commute: 

    #align(center,image("imgs/2023-10-28-21-16-04.png",width:30%))
]

#definition[
    Let $X$ be a subset of $R$-module $M$ and let $i: X->M$ be the inclusion map. We have the corresponding map $sigma: R^(ds X) -> M$. We say
    - $X$ is *linear independent* or *free* if $sigma$ is injective and $X$ is *linear dependent* otherwise;
    - $X$ spans or generates $M$ if $sigma$ is surjective, in which case $X$ is a *generating set* of $M$. A module with a finite generating subset is called a *finitely generated module*.

    A linear independent generating subset of $M$ is called a *basis* of $M$, and a module with a basis is called a *free module*.
    // #align(center,image("imgs/2023-10-28-21-19-38.png",width:100%))
]



#corollary[
    Any $R$-module $M$ is isomorphic to a quotient of a free module. <module-generator>
]

#proof[
    Take some subset $X$ of $M$ and inclusion map $i : X -> M$, we have the corresponding homomorphism $sigma: R^(ds X) -> M$ with $im(sigma) iso R^(ds X) over ker(sigma)$. If we take $X = M$ (or any generating set of $M$), then $im(sigma) = M$. 
]

#remark[
    This means we have the exact sequence:
    $ 0 -> ker(sigma) -> R^(ds X) rgt(sigma) M -> 0 $
]

#proposition[
    Any submodule of a free module over a PID is free. <sub-pid>
]
#proof[
    TODO
]

== Tensor Products


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
#let Bil = [$"Bil"$]
#definition[
    Let $R$ be a ring. Consider #rrm $M$, #lrm $N$ and abelian group $A$. A map $f: M times N -> A$ is called a *balanced product* (or we say it is *$R$-biadditive*) if it satisfies:
      $ f(x + x', y) = f(x, y) + f(x', y) \
      f(x, y + y') = f(x, y) + f(x, y') \
     f(x r , y) = f(x, r y) $
    for all $x, x' in M$, $y, y' in N$ and $r in R$. 
    
    // Denote the set of all balanced products $B : M times N -> A$ as $Bil\(M, N; A)$, which is an abelian group under addition. 
]
#definition[
    If $R$ is a commutative ring and $M, N, A$ are $R$-modules, a map $f : M times N -> A$ is called *$R$-bilinear* if it is $R$-biadditive and also 
    $ f(r x , y) = f(x, r y) = r f(x, y) $
    for all $x in M$, $y in N$ and $ r in R$.
]
#definition[
    The *tensor product* of a #rrm $M$ and a #lrm $N$ is an abelian group $M tpr N$ with a balance product $M times N -> M tpr N$ such that for any balanced product $f: M times N -> A$, there exists a unique group homomorphism $M tpr N -> A$ that makes the diagram commutes:

    // https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBpiBdUkANwEMAbAVxiRAFkACPAW3k4ByIAL6l0mXPkIoAjOSq1GLNlxxoAToJFiQGbHgJE5MhfWatEIAIIiFMKAHN4RUADN1EHkjIgcEJABM1GbKlgBC2m4eXohyvv6IQSAMWGAWIFB0cAAW9iDBSukwAB5YcDhwnACEkSDunt7UfkgywhTCQA
#align(center, commutative-diagram(
  node-padding: (50pt, 50pt),
  node((0, 0), [$M times N$]),
  node((0, 1), [$M tpr N$]),
  node((1, 1), [$A$]),
  arr((0, 0), (1, 1), [$f$]),
  arr((0, 1), (1, 1), [$exists !$], "dashed"),
  arr((0, 0), (0, 1), []),
))

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
  (x+x', y) - (x, y) - (x', y) \
  (x, y+y') - (x, y) - (x, y') \
  (x r , y) - (x, r y)
$
for $x, x' in M$, $y , y' in N$ and $r in R$. Denote $M tpr N := F over I$, and denote the coset $(x, y) + I$ by $x tp y$, and define $
  h : M times N &-> M tpr N \ (x, y) &|-> x tp y $ It is clear that $h$ is biadditive. 

Let $f : M times N -> A$ be a balanced product, then there exists a homomorphism $f': F -> A$  which linearly extends $f$ such that $f = f' oo i$. Now we see that $I subset.eq Ker f'$ and thus $f'$ induces a map $
  hat(f) : F over I &-> A \ 
  (x, y) + I &|-> f'(x, y) = f(x, y)
$ 
which is the same as saying 
$
    hat(f) : M tpr N &-> A \ 
  x tp y &|->  f(x, y)
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
#proof[Both send $m tp n$ to $phi'(phi(m)) tp psi'(psi(n))$, but such a homomorphism should be unique. ]

#corollary[
  Let $M$ be a #rrm and $N$ be a #lrm, then we have functors 
  $
    M tpr - : RMod &-> Ab \
    B   &|-> M tpr B \
    (g:B-> B') &mapsto id_M tp g 
  $
  $
    - tpr N : ModR &-> Ab \
    A &|-> A tpr N \
    (f: A -> A') &mapsto f tp id_N
  $
]


#proposition[
    Let $Q, R, S$ be rings, $M$ be a $Q$-$R$-bimodule, and $N$ be a $R$-$ S$-bimodule. Then $M tpr N$ is a $Q$-$S$-bimodule. 
]
#proof[
    // See @li[Proposition 6.5.9].
    Let $q in Q$ and $s in S$. Then $f: m |-> q m$ is a homomorphism $M -> M$ and $g: n |-> n s$ is a homomorphism $N -> N$. Then $f tp id_N$ gives a left multiplication on $M tpr N$ and $id_M tp g$ gives a right multiplication on $M tpr N$, which satisfies $(f tp id_N) oo (id_M tp g) = f tp g =  (id_M tp g) oo (f tp id_N)$.
    ]

// In this case we know $M tpr N$ is not merely an abelian group.

#proposition[
    Let $R$ be a commutative ring and $A, B$ be $R$-modules. Then $A tpr B$ is an $R$-module and $h: A times B -> A tpr B$ is $R$-bilinear.  Further, for any $R$-bilinear map $g : A times B -> C$, there exists an $R$-homomorphism $hat(g) : A tpr B -> C$ such that $g = hat(g) oo h$. 
]
#proof[
    // See @rotman[Proposition 2.55].
  We view $A$, $B$ as $R$-$R$-bimodules, then we easily see that $A tpr B$ is also an $R$-$R$-bimodule (i.e. an $R$-module) with (left) multiplication given by $(a |-> r a) tp id_B$, hence $r(a tp b) = (r a) tp b = a tp (r b)$ and $h$ is $R$-bilinear. 

  Suppose $g : A times B -> C$ is an $R$-bilinear map.  Then $g$ is $R$-biadditive and $g$ induces a $ZZ$-homomorphism $hat(g) : A tpr B -> C$ such that $g = hat(g) oo h$. We only need to show that $hat(g)$ is also an $R$-homomorphism. Let $r in R$. Then $hat(g) (r (a tp b)) = hat(g) ((r a) tp b) = g(r a, b) = r g(a, b) = r hat(g) (a tp b)$. 
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

// Also equivalent to: is there a vector space $V times.circle_k W$ with a bilinear map $V times W -> V times.circle_k W$ which is universal? We want to find bilinear map $V times W -> V times.circle_k W$ such that for any blinear map $V times W -> L$, there exists a unique linear map $V times.circle_k W -> L$ such that the diagram commutes:

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

#endlec(1)

== More discussions

$ dim (V ds W) = dim V + dim W $
$ dim (V tp W) = dim V dot dim W $

An alternative definition of the tensor product: let $V$ be a vector space with basis ${v_i}_(i in I)$ and $W$ with ${w_j}_(j in J)$ and define $V tpk W$ to have basis ${v_i tp w_j}_(i in I, j in J)$. When we change basis this can be problematic.

Remark: Categorification. If we discuss a category $(C, ds, tp)$ then this is similar to categorifying some underlying structure of a ring. Active field of research.

We were discussing $V tpk W$ for $k$ a field. To generalise, for a ring $R$ and left $R$-modules $M, N$, we can define $M tpr N$.

Note: if $R$ is a non-commutative ring, $M$ is a right $R$-module and $N$ is a left $R$-module, then $M tpr N$ is (only) an abelian group. There would be a problem moving the scalars $r in R$ from side to side in the definition (using free modules), i.e. we can only have things like $m r tp n - m tp r n$.
#proposition[

]


// = Introduction

// #definition[A ring $(R, +, dot)$ satisfies:
// - $R$ is an abelian group under addition;
// - Multiplication is associative;
// - Distributive: $a(b+c)= a b + a c, (a + b) c = a c + b c$.

// Optionally,
// - Multiplication can be commutative $=>$ commutative rings;
// - Multiplication can have an identity.
// ]

// == Analogies between groups and rings

// Groups act on sets. Rings act on modules.

// #definition[
//   Let $M$ be an abelian group. A module is when $R$ acts on $M$, satisfying:
//   - $r (m + n) = r m + r n$ (distributitive for addition in $M$);
//   - $(r + s) m = r m + s m$ (distributitive for addition in $R$);
//   - $(r s) m = r (s m)$ (associative? for multiplication in $R$);
//   - $1_R m = m$ if $R$ has $1_R$.
// ]

// When $R=ZZ$ the module is an abelian group.

// We have left, right, and 2-sided group actions (where the left and right actions commute). Similarly, we have left, right, and 2-sided modules. If the ring is commutative, then left and right modules are the same.

// We have disjoint union for sets. We also have direct sum for modules:
// #definition[
//   Let $M, N$ be $R$-modules. The direct sum $M plus.circle N$ is the $R$-module formed by $(m, n)$ where $m in M, n in N$.
// ]

// We have cartisian product for sets. We also have tensor product for modules. $abs(S times T) = abs(S) times abs(T)$ and similarly $dim (V plus.circle W) = dim V times dim W$. Caution: the inclusion-exclusion priciple does not work for modules when there are more than $2$ modules.

// Cayley theorem claims that every group $G$ is the symmetry of the set $G$ acted on the right by $G$; hence the symmetry group is $G$ acting on the left. Every ring is the set of endomorphisms of some abelian group. We take $M = R$ with a right action of $R$. The endomorphism is just $R$ acting on the left.

// Homomorphisms of groups. Homomorphisms of rings. Caution: $ZZ \/ 6ZZ tilde.equiv ZZ \/ 2 ZZ plus.circle ZZ \/ 3ZZ$ by the Chinese remainder theorem but $ZZ \/ 2 ZZ$ is not a subring of $ZZ \/ 6 ZZ$, because it does not take $1$ to $1$.

// We have maps of $G$-sets that preserve the action of $G$. We also have homomorphism of modules (linear transformation). Notice that for a left module, a homomorphism $f: M-> N$ of modules should be written on the right: $m f in N$ so that $(r m) f = r (m f)$.

// We have subgroups. We also have subrings. Normal subgroups; ideals. But we have left, right and 2-sided ideals. A 2-sided ideal is a kernel of homomorphism of rings. 

// #definition[An ideal is closed under addition and for any $i in I, r in R$, we have $i r , r i in I$.]

// We also have left or right submodules. A left ideal is just a submodule of $R$ considered as a left module. 

// We have symmteric groups $S_n$. We also have symmetric groups of free modules $R^n = R plus.circle R plus.circle ...$ and the set of linear transformations of $R^n$ which is $M_n (R)$, $n times n$ matrices.

// = Group rings

// Given a group $G$ and a ring $R$