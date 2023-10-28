#import "libs/template.typ": *
#import "libs/var.typ": *
#import "libs/commute.typ": node, arr, commutative-diagram

#set heading(numbering: "1.a.")

#show: project.with(
  title: "Category Theory",
  authors: (
    "Yuhang Wei",
  ),
  date: "October 24, 2023",
)

= Lecture 5

#definition[
    Functors $F:cC arrows.lr cD:G$ are adjoint if there exist natural transformations $ e: id_cC => G F \ epsilon : F G => id_cD $ such that the composite
    $ F attach(arrow.double.long, t: id_F compose e) F G F attach(arrow.double.long, t: epsilon compose id_F ) F $
    is $id_F$ and the composite
    $ G attach(arrow.double.long, t: e compose id_G ) G F G attach(arrow.double.long, t: id_G compose epsilon) G $
    is $id_G$.

    In this case we denote $F tack.l G$ and we say that $F$ is *left adjoint* to $G$ and $G$ is *right adjoint* to $F$. Also $e$ is called the *unit* and $epsilon$ the *counit*.
]

    The following commutative diagrams are in the categories of $Fun(cC, cD)$ and $Fun(cD, cC)$ respectively (where objects are functors and morphisms are natural transformations).
    // https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBoBGAXVJADcBDAGwFcYkQAxEAX1PU1z5CKcqWLU6TVuw4BxLr37Y8BIgCYKEhizaJOPCTCgBzeEVAAzAE4QAtkjIgcEJKMk72WKAH0OAAgBjOww4GD82RRBrO1caZyQNd2k9GDRsRgJA4Mwwr18ePiibe0RHeMRE7WSQPIVKbiA
#align(center, commutative-diagram(
  node((1, 0), [$F$]),
  node((0, 1), [$F G F$]),
  node((1, 2), [$F$]),
  arr((1, 0), (0, 1), [$id_F compose e$]),
  arr((0, 1), (1, 2), [$epsilon compose id_F$]),
  arr((1, 0), (1, 2), [$id_F$]),
)) 

#align(center, commutative-diagram(
  node((1, 0), [$G$]),
  node((0, 1), [$G F G$]),
  node((1, 2), [$G$]),
  arr((1, 0), (0, 1), [$e compose id_G $]),
  arr((0, 1), (1, 2), [$  id_G compose epsilon$]),
  arr((1, 0), (1, 2), [$id_G$]),
)) 

#image("imgs/2023-10-27-18-55-27.png")

#image("imgs/2023-10-28-12-46-27.png")

The first triangle says (in morphisms of $cD$):
$ epsilon_(F(x)) compose F(e_x) = id_(F(x)) $
for all $x in cC$. Similarly, the second triangle says (in morphisms of $cC$): 
$ G(epsilon_y) compose e_(G(y)) = id_(G(y)) $
for all $y in cD$ (this is in $cC$).

== Understanding the definition

Take any $x in cC$ and $y in cD$. Let $f in Hom(D)(F(x), y)$. Then (in $cC$)
$ x rgt(e_x) G F (x) rgt(G(f)) G(y) $

we have map $phi : Hom(D)(F(x), y) -> Hom(C)(x, G(y))$ defined by $ phi(f) := G(f) compose e_x in Hom(C)(x, G(y)) $

Conversely, for $g in Hom(C)(x, G(y))$, we have (in $cD$)

$ F(x) rgt(F(g)) F G (y) rgt(epsilon_y) y $

then define $psi: Hom(C)(x, G(y)) -> Hom(D)(F(x), y)$ as
$ psi(g) := epsilon_y compose F(g) in Hom(D)(F(x), y) $

#proposition[$phi$ and $psi$ are inverse to each other.]

#proof[
    We show that $(phi compose psi)(g) = g$ for $g in Hom(C)(x, G(y))$.

    Copying the defintion of $phi$, we have LHS is 

    $ x rgt(e_x) G F (x) rgt(G(psi(g))) G(y) $

    Wrapping the definition of $psi$ with $G$ we have $G(psi(g)): G F (x) -> G(y)$ is

    $ G F(x) rgt(G F(g)) G F G (y) rgt(G(epsilon_y)) G(y) $

    Combining them we have

    $ x rgt(e_x) G F (x) rgt(G F(g)) G F G (y) rgt(G(epsilon_y)) G(y) $

    Since $e$ is a natrual transformation, we have the commutative diagram (in $cC$): 

    #image("imgs/2023-10-28-13-37-45.png", width: 30%)

    Hence $ phi psi (g) = G(epsilon_y) oo G F(g) oo e_x = G(epsilon_y) oo e_(G(y)) oo g $

    But $ G(epsilon_y) oo e_(G(y)) = id_(G(y)) $ due to the second triangle. So $phi psi (g) = g$.

    The other direction is similar. (dual?)
]

#remark[
    Historically the $Hom$ definition preceded the triangle definition; we made the triangle identity as axioms so that it works here. Unit and counit are used to construct the two maps $phi$ and $psi$.
]

#corollary[
    The adjuntion defintion implies there is a bijection 
    $ Hom(D)(F(x), y) iso Hom(C)(x, G(y)) $

    for any $x in cC$ and $y in cD$. Moreover, this is natural in both $x$ and $y$. 
]

#proof[
    Natural in $y$. Suppose we have $alpha : y -> y'$ and thus $G(alpha): G(y) -> G(y')$.
    #align(center, image("imgs/2023-10-28-13-48-54.png", width: 80%))

    Claim: $phi(alpha oo f) = G(alpha) oo phi(f)$.

    #align(center,image("imgs/2023-10-28-13-53-09.png",width:50%))

    The right hand side triangle commutes simply because $G$ is a functor. 
]

#proposition[
    A collection of bijection $Hom(D)(F(x), y) iso Hom(C)(x, G(y)) $ that are natural in both $x, y$ is equivalent to the data of an adjuntion $F tack.l G$.
]

#example[
    Typically, the forgetful functors have left adjoints given by some "free" construction. 

    $"Forget": veck -> Set$ and $"Free": Set -> veck$, where $"Free"(X)$ is the vector space with $X$ as a basis.
    
    $ hom_veck ("Free"(X), V) iso hom_Set (X, "Forget"(V)) $

    $ T mapsto T|_X $

    $ f mapsto "extending to a linear map" $
]

#example[
    In representation theory, Frobenius reciprocity is such an example. 
]

#proof[
    We have proved one direction. 
    Given the hom-set adjunction, how do we construct $e, epsilon$?

    We have $ Hom(D)(F(x), y) iso Hom(C)(x, G(y)) $

    Considering $e_x in Hom(C)(x, G  F (x))$, we specialise $y = F(x)$, and 

    $ Hom(D)(F(x), F(x)) iso Hom(C)(x, G  F(x)) $

    Very naturally we take $id_(F(x))$ from the LHS and we define $e_x$ as its corresponding element in the RHS. 

    Similarly, $epsilon_y$ is defined as: 

    $ Hom(D)(F G(y), y) iso Hom(C)(G(y), G(y)) $

    The element corresponding to $id_(G(y))$ in LHS.

    Is $e$ a natural transformation? Does this commute for any $beta: x -> x'$?

    #align(center,image("imgs/2023-10-28-14-09-02.png",width:30%))

    We have the following: 

    #align(center,image("imgs/2023-10-28-14-12-50.png",width:80%))

    The top and bottom squares commute because we assumed the naturality of the bijection between the hom-sets.
    Top: 
    $ tau oo F(beta) = G F (beta) oo e_x $
    Bottom:
    $ tau oo F(beta) = e_(x') oo beta $

    (notice that $F(beta) oo id_(F(x)) = F(beta) = id_(F(x')) oo F(beta) $). From this we see that $e$ is natural.

    Similarly, $epsilon$ is also natural.

    Last thing: the commuting triangle for $e$ and $epsilon$. 

    #align(center,image("imgs/2023-10-28-14-20-27.png",width:60%))
]

#example[
    $"Forget": Ab-> Grp$ and $"Abel": G -> G over [G, G]$ and we have $"Abel" tack.l "Forget"$.
]
= Lecture 6 

== More examples on adjunctions

#example[
    Fix a set $T$. Define functor $F: Set -> Set$ as 
    $ A &|-> A times T \
      A rgt(f) B &|-> f times id_T =: tilde(f) $
    where $tilde(f) (a, t) = (f(a), t)$.

    Define functor $G: Set -> Set$ as 
    $
        A &mapsto hom (T, A) \
        A rgt(f) B &|-> f compose - : hom (T, A) -> hom (T, B) 
    $

    Then $F tack.l G$ because 
    $
        hom(F(A), B) = hom(A times T, B) iso hom (A, hom (T, B)) = hom(A, G(B))
    $
    as we have the canonical bijection between 
    $
        h: A times T -> B -> tilde(h) : A -> hom(T, B)
    $
    where $tilde(h)(a)(t) = h(a, t)$.
]

#example[
    Let $R$ be a commutative ring. Fix $M$ as an $R$-module. 

    Define $F : RMod -> RMod$ as $F = -tpr M$, or 
    $
        A mapsto A tpr M 
    $
    and define $G: RMod -> RMod$ as $G = hom_R(M, -)$. Then $F tack.l G$ because $
    hom_R (A tpr M, -)  iso hom_R (A, hom_R (M, -)) $
]

#example[
    Most general: let $R, S$ be rings. Let $M$ be a $(S, R)$-bimodule. (M is left S-module and right R-module. Should define this in module thoery. TODO)

    Define $ F = - tp_S M : "right S-Mod" -> "right R-mod" $ and $ G = hom_R (M, -) : "right R-mod" -> "right S-mod" $.

    Explanation: Let $B$ be a #rrm and let $phi in hom_R (M, B)$, then we claim that $S$ acts on $phi$ on the right: $ phi dot s = m |-> phi(s dot m) $

    We can verify that $ phi dot (s_1 s_2) (m) = phi(s_1 s_2 m) \ (phi(s_1) s_2)(m) = (phi s_1)(s_2 m) = phi(s_1 (s_2 m)) $

    Then $F tack.l G$ because 
    $
        hom_R (A tp_S M, B) iso hom_S (A, hom_R (M, B))
    $

    Frob reciprocity is just an example of this, taking $R = k[G], S = k[H], H <= G, M = R = k[G]$. 
]

== A characterization of adjunction via universal properties

#definition[
    $x in cC$ is an initial object if $Hom(C)(x, y)$ has exactly one element for any $y in cC$.
]

#example[
    The empty set is initial in $Set$. $0$ is initial in $veck$. Any singleton is initial in $Set_*$.
]

#proposition[
    An initial object, if it exists, is unique up to unique isomorphism.
]

#example[
    $cC = "Fields"$ does not have an initial object.  (When the characteristic of two fields are different there is no field homomorphism between them, thus there cannot be an object in Field which has morphisms with all other objects. (?))
]

#definition[
    Dually, we have the final object. 
]

#definition(name: "Comma categories")[
    Given a functor $G: cD -> cC$ and an object $x in cC$, define the comma category $(x => G) $, where 
    - objects are pairs $(y, f)$ for $y in cD$ and $f : x -> G(y)$ (notice that $f$ is a morphism in $ cC$), and 
    - morphisms are $(alpha, G(alpha) compose -)$ for $alpha: y_1 -> y_2$ that makes the diagram commute:

// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBoBGAXVJADcBDAGwFcYkQAPEAX1PU1z5CKcqWLU6TVuwDiACgCeAfXIBKHnxAZseAkVFUaDFm0Qh5ygEzruEmFADm8IqABmAJwgBbJGRA4IJFFJE3ZXFQ03Tx9EPwCkSyMpUxBwy0jU6KCaeMREkOkzeSY0AAt6G0puIA
#align(center, commutative-diagram(
  node((1, 0), [$x$]),
  node((0, 1), [$G(y_1)$]),
  node((1, 1), [$G(y_2)$]),
  arr((1, 0), (0, 1), [$f_1$]),
  arr((1, 0), (1, 1), [$f_2$]),
  arr((0, 1), (1, 1), [$G(alpha)$]),
))
]

#example[
    See https://en.wikipedia.org/wiki/Tensor_algebra.

    Let $k$ be a field. If $V in veck$, then we have tensor algebra 
    $ T(V) = k ds V ds V^(tp 2) ds ... $
    where $V^(tp k) = V tp V tp ... tp V$ for $k$ times, and the multiplication has $V^(tp k) tp V^(tp l) -> V^(tp (k + l))$.

    We could define it using the universal property. $i_V: V -> T(V)$ is the unique $k$-algebra such that for any $k$-algebra $A$ and every $k$-linear map $alpha: V-> A$, there exists a unique $k$-algebra morphism $tilde(alpha) : T(V) -> A$ such that the diagram commutes:
// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBpiBdUkANwEMAbAVxiRADUQBfU9TXfIRQBGUsKq1GLNgEFuvEBmx4CRUZWr1mrRCAAqACnYBKbhJhQA5vCKgAZgCcIAWyRkQOCElGTtbRmgAFnTy9k6uiO6eSABMmlI6IFgA+pw8YS6x1NGIPgxYYIlQdHCBFiDxfrowAB5YcDhwAAQAhE14DLAGAcGmXBRcQA
#align(center, commutative-diagram(
  node((0, 0), [$V$]),
  node((1, 1), [$A$]),
  node((0, 1), [$T(V)$]),
  arr((0, 0), (1, 1), [$alpha$]),
  arr((0, 0), (0, 1), [$i_V$]),
  arr((0, 1), (1, 1), [$exists ! tilde(alpha)$], "dashed"),
))
    This says: $(T(v), i_V)$ is an initial object in the comma category $(V => "Forget")$, where $"Forget": bd("Alg")_k -> veck$.

    The functor $T : veck -> bd("Alg")_k$ is left adjoint to $"Forget"$. 
]

#theorem[
    Let $F : cC arrows.lr cD: G$. T.f.a.e.:
    - $F tack.l G$;
    - There exists a natural transformation $e : id_cC => G F$ such that $(F(x), e_x)$ is initial in $(x => G)$ for all $x in cC$. 
]

#remark[
    One can prove that in fact given $F: cD -> cC$, $F$ has a left adjoint iff $forall x in cC$ the comma category $(x => G)$ has an initial object. 
]

#proof[
    See 2.7 in lecture notes.

    (1) => (2). 
]