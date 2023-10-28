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

                                                                                                          

