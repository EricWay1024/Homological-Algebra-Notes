#import "libs/template.typ": *
#import "libs/var.typ": *
#import "libs/commute.typ": node, arr, commutative-diagram

#set heading(numbering: "1.a.")

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
    Any $R$-module $M$ is isomorphic to quotient of free groups. 
]

#proof[
    Take some subset $X$ of $M$ and inclusion map $i : X -> M$, we have the corresponding homomorphism $sigma: R^(ds X) -> M$ with $im(sigma) iso R^(ds X) over ker(sigma)$. If we take $X = M$ (or any generating set of $M$), then $im(sigma) = M$. 
]

#definition[
    Let $R, S$ be rings. An $(R, S)$-bimodule is an abelian group $M$ being both a left $R$-module and a right $S$-module, satisfying:
    $ r(m s) = (r m) s $
    for all $m in M, r in R, s in S$.
]

#definition[
    Let $R$ be a ring. Consider #lrm $M$, #rrm $N$ and abelian group $(A, +)$. A map $B: M times N -> A$ is called a *balanced product* if it satisfies:
    - $B(x + x', y) = B(x, y) + B(x', y)$;
    - $B(x, y + y') = B(x, y) + B(x, y')$;
    - $B(x r , y) = B(x, r y)$,
    for all $x, x' in M$, $y, y' in N$ and $r in R$.Denote 
]