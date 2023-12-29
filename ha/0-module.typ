#import "../libs/template.typ": *


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

    #align(center,image("../imgs/2023-10-28-21-16-04.png",width:30%))
]

#definition[
    Let $X$ be a subset of $R$-module $M$ and let $i: X->M$ be the inclusion map. We have the corresponding map $sigma: R^(ds X) -> M$. We say
    - $X$ is *linear independent* or *free* if $sigma$ is injective and $X$ is *linear dependent* otherwise;
    - $X$ spans or generates $M$ if $sigma$ is surjective, in which case $X$ is a *generating set* of $M$. A module with a finite generating subset is called a *finitely generated module*.

    A linear independent generating subset of $M$ is called a *basis* of $M$, and a module with a basis is called a *free module*.
    // #align(center,image("imgs/2023-10-28-21-19-38.png",width:100%))
]



#corollary[
    Any $R$-module $M$ is isomorphic to a quotient of a free module. 
]
    <module-generator>

#proof[
    Take some subset $X$ of $M$ and inclusion map $i : X -> M$, we have the corresponding homomorphism $sigma: R^(ds X) -> M$ with $im(sigma) iso R^(ds X) over ker(sigma)$. If we take $X = M$ (or any generating set of $M$), then $im(sigma) = M$. 
]

#remark[
    This means we have the exact sequence:
    $ 0 -> ker(sigma) -> R^(ds X) rgt(sigma) M -> 0 $
]

#proposition[
    Any submodule of a free module over a PID is free. 
]
    <sub-pid>
// #proof[
//     TODO
// ]


// Remark: Categorification. If we discuss a category $(C, ds, tp)$ then this is similar to categorifying some underlying structure of a ring. Active field of research.

// We were discussing $V tpk W$ for $k$ a field. To generalise, for a ring $R$ and left $R$-modules $M, N$, we can define $M tpr N$.

// Note: if $R$ is a non-commutative ring, $M$ is a right $R$-module and $N$ is a left $R$-module, then $M tpr N$ is (only) an abelian group. There would be a problem moving the scalars $r in R$ from side to side in the definition (using free modules), i.e. we can only have things like $m r tp n - m tp r n$.


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