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

#let textwidth = 100%;
#let img(path, width: textwidth) = {
    align(center, image("imgs/cat/" + path + ".jpg", width: 40%))
}

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

    // #image("imgs/2023-10-28-13-37-45.png", width: 30%)

    // https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBpiBdUkANwEMAbAVxiRAA8QBfU9TXfIRQBGclVqMWbAOIAKAJ4BKbrxAZseAkTLDx9Zq0QhpAAgBis9sp58NgoqN3V9Uo6bMm5S7uJhQA5vBEoABmAE4QALZIZCA4EEiiEgZs-iqhEdGISfFIAMzOkoYgMAD6sl6K1qrhUTHUuYgATIUpRmWcNiC1WS1xCYgFya7G5iay-tYUXEA
#align(center, commutative-diagram(
  node((0, 0), [$x$]),
  node((0, 1), [$G(y)$]),
  node((1, 0), [$G F(x)$]),
  node((1, 1), [$G F G(y)$]),
  arr((0, 0), (0, 1), [$g$]),
  arr((0, 1), (1, 1), [$e_(G(y))$]),
  arr((0, 0), (1, 0), [$e_x$]),
  arr((1, 0), (1, 1), [$G F (g)$]),
))

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

    #v(30pt)

    // https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBpiBdUkANwEMAbAVxiRAA8QBfU9TXfIRQBGclVqMWbAOIACAGIAKdgEpuvEBmx4CRAExjq9Zq0QhpigJ5qefbYP2lh441LMXLAchviYUAObwRKAAZgBOEAC2SGQgOBBIohImbDAA+py2IOFRidTxSAbJbuaKITYaOdGIRQWIAMxGkqaljGgAFnQVoRHVSXWNxS0WbZ2yEBCy5eo9uYixdUUARjBgUEgALACcTSlmHVhlatQMWGAtUHRw7X4z2b0x+QkN1CtrSAC09bGn52yX11uuxKB0Uozo40m0y4FC4QA
#align(center, commutative-diagram(
  node((0, 0), [$x$]),
  node((0, 1), [$G F(x)$]),
  node((0, 2), [$G(y)$]),
  node((1, 2), [$G(y')$]),
  arr((0, 0), (0, 1), [$e_x$]),
  arr((0, 1), (0, 2), [$G(f)$]),
  arr((0, 2), (1, 2), [$G(alpha)$]),
  arr((0, 1), (1, 2), [$G(alpha oo f)$]),
  arr((0, 0), (0, 2), [$phi(f)$], curve: 30deg, "dashed"),
  arr((0, 0), (1, 2), [$phi(alpha oo f)$], curve: 0deg, "dashed"),
))

    // #align(center,image("imgs/2023-10-28-13-53-09.png",width:50%))

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

// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBpiBdUkANwEMAbAVxiRAA8QBfU9TXfIRQBGclVqMWbdgHJuvEBmx4CRUcPH1mrRCADiAAgBiAClkBKeX2WCiZDdS1Tdh0+0tdxMKAHN4RUAAzACcIAFskMhAcCCRRCW02ACMYHDorEBDwuOoYpAAmR0kdEBgAfTMZDwUsiMQovMQAZiLE3XLOHiDQupbo2MRChOd9YxMUtI8KLiA
#align(center, commutative-diagram(
  node((0, 0), [$x$]),
  node((0, 1), [$x'$]),
  node((1, 1), [$G F(x')$]),
  node((1, 0), [$G F(x)$]),
  arr((0, 0), (0, 1), [$beta$]),
  arr((0, 1), (1, 1), [$e_(x')$]),
  arr((0, 0), (1, 0), [$e_x$]),
  arr((1, 0), (1, 1), [$G F(beta)$]),
))
    // #align(center,image("imgs/2023-10-28-14-09-02.png",width:30%))

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
    // Let $F : cC arrows.lr cD: G$. T.f.a.e.:
    // - $F tack.l G$;
    // - There exists a natural transformation $e : id_cC => G F$ such that $(F(x), e_x)$ is initial in $(x => G)$ for all $x in cC$. 

The following two structures on the functors $F comma G$
are equivalent:

\(1) An adjunction $F tack.l G$,

\(2) A natural transformation
$e colon upright(i d)_(cal(C)) arrow.r.double G F$ such that
$lr((F lr((x)) comma e_x))$ is initial in $lr((x arrow.r.double G))$ for
all $x in cal(C)$.
]

#remark[
    One can prove that in fact given $F: cD -> cC$, $F$ has a left adjoint iff $forall x in cC$ the comma category $(x => G)$ has an initial object. 
]

#proof[
    See 2.7 in lecture notes.

    (1) => (2). 
]

- $lr((1)) arrow.r.double lr((2))$.

Suppose $F tack.l G$. Then we want to prove that the unit of the
adjunction gives rise to an initial object of
$lr((x arrow.r.double G))$.

Take an object $lr((y comma f)) in lr((x arrow.r.double G))$ where
$f colon x arrow.r G lr((y))$ and consider a morphism
$g colon F lr((x)) arrow.r y$ making the diagram

#block[
#box(width: textwidth, img("2023_10_29_c96760a46085980a504cg-17(2)", width: textwidth))

]
commute. The composite $G lr((g)) compose e_x eq f$ is the image of $g$
under the isomorphism

$ "Hom" lr((F lr((x)) comma y)) tilde.equiv "Hom" lr((x comma G lr((y)))) $

But then $g in "Hom" lr((F lr((x)) comma y))$ is determined uniquely as
the preimage of $f in "Hom" lr((x comma G lr((y))))$. In other words,
the object $lr((y comma f))$ has a unique morphism from
$lr((F lr((x)) comma e_x))$.

- $lr((2)) arrow.r.double lr((1))$.

Conversely, suppose $e_x colon x arrow.r G F lr((x))$ defines an initial
object $lr((F lr((x)) comma e_x))$ in $lr((x arrow.r.double G))$ for
every $x in cal(C)$. Then we are going to define a counit for the
adjunction and show it is unique.

Let $x eq G lr((y))$ and consider the comma category
$lr((G lr((y)) arrow.r.double G))$. Since
$lr((F G lr((y)) comma e_(G lr((y)))))$ is initial, we have a unique
morphism $epsilon.alt_y colon F G lr((y)) arrow.r y$ making the diagram

#block[
#box(width: textwidth, img("2023_10_29_c96760a46085980a504cg-17", width: textwidth))

]
commute.

To show that $epsilon.alt$ is a natural transformation, consider a
morphism $f colon y_1 arrow.r y_2$. We get commutative diagrams

#block[
#box(width: textwidth, img("2023_10_29_c96760a46085980a504cg-17(1)", width: textwidth))

]
and

#block[
#box(width: textwidth, img("2023_10_29_c96760a46085980a504cg-17(3)", width: textwidth))

]
We get two morphisms $F G lr((y_1)) arrow.r y_2$ making the respective
diagrams commute: $f compose epsilon.alt_(y_1)$ and
$epsilon.alt_(y_2) compose F G lr((f))$ and since
$lr((G lr((y_1)) comma e_(G lr((y_1)))))$ is an initial object of
$lr((G lr((y_1)) arrow.r.double G))$, these must be equal, i.e.
$epsilon.alt$ is a natural transformation.

By construction the composite

$ G arrow.r.double^(e compose upright(i d)) G F G arrow.r.double^(upright(i d o) rho) G $

is the identity.

The other axiom states that the composite

$ F lr((x)) arrow.r^(F lr((e_x))) F G F lr((x)) arrow.r^(epsilon.alt_(F lr((x)))) F lr((x)) $

is the identity. To prove this, consider the commutative diagram

#block[
#box(width: textwidth, img("2023_10_29_c96760a46085980a504cg-18(1)", width: textwidth))

]
where the triangle commutes due to naturality of $e$. But then we get
two morphisms from the initial object $lr((F lr((x)) comma e_x))$ to
$lr((F lr((x)) comma e_x))$ one of which is given by the identity
morphism $F lr((x)) arrow.r F lr((x))$ and the other one is
$epsilon.alt_(F lr((x))) compose F lr((e_x))$ which are, therefore,
equal.

So far we have shown that thus defined counit satisfies the required
axioms and we are left to show uniqueness. Suppose $epsilon.alt_1$ and
$epsilon.alt_2$ are two counits for the adjunction. Then we get a
commutative diagram

#block[
#box(width: textwidth, img("2023_10_29_c96760a46085980a504cg-18", width: textwidth))

]
Therefore, $epsilon.alt_(1 comma y)$ and $epsilon.alt_(2 comma y)$
define morphisms from $lr((F G lr((y)) comma e_(G lr((y)))))$ to
$lr((y comma upright(i d)))$ which by initiality must be equal.

= Lecture 7 Yoneda's Embedding

#definition[
Functor categories: let $cC, cD$ be categories. The *functor category* $Fun(cC, cD)$ have objects $F: cC -> cD$ and morphisms natural transformations. 
]

Let $cC$ be a locally small category (Set, Grp, Vectk).
Then we have for any $x in cC$, a functor 
$ Hom(C)(-, x) : cC^op -> Set $
Suppose we have $alpha: y_1 -> y_2$, then we get 
$ - oo alpha :  hom(y_2, x) -> hom(y_1, x) $

We now consider the category of *presheves* on $cC$, denote as $prshv(cC) = Fun(cC^op, Set)$ which this functor belongs to.

#remark[
Why this name? Let $X$ be a topp space and $J$ be topology on $X$, then preshef $S$ is for any U in J, S(U) in Set, if $V subset U$ then .. (see photo)

If we define $"Open"(X)$ as object: open sets in $X$, morphisms: no morphisms if $V subset.eq.not U$; if $V subset.eq U$, then one map $V arrow.hook U$.
Then a preshef $S in Fun("Open"(X)^op, Set)$.
]

#definition[
    A functor $F in prshv(cC)$ is representable if there exists $x in cC$ such that $F iso Hom(C)(-, x)$.


]

More functorially, define Yoneda functor $Y: cC -> prshv(cC)$ as $x mapsto hom(C)(0, x)$. Then $F$ is representable if $F$ in the essential image of $Y$.

(Proof of natural transformation of idkwhat, see photo)

#example[
    Take $PP in Fun(Set^op, Set)$ as $PP(A) = "power set of " A$ for $A in Set$. If $f : A-> B$, then we define $PP(f): PP(B)-> PP(A)$ as $PP(f)(S) = f^(-1)(S)$ for $S subset.eq B$. $PP$ is representable.
]

#proof[
    We claim $PP iso hom_Set (-, {0, 1}).$ Take any $T in PP(A)$, we can define 
    $ x_T = cases(1 "on" T, 0 "on" A without T) $

    Conversely, for $x : A->{0,1}$, define $T = x^(-1)(1)$.
]

#example[
    Non-example. Take $F in Fun(Grp^op, Set)$. Define $ F(G) = "the set of all subgroups of" G $ This not representable. (It is easier to prove representableness than non-.)
]

Useful "universal" property. Suppose $F iso Hom(C) (-, x)$. That means $F(x) iso hom (x, x)$ so there exists a "distinguished" element $a in F(x)$ corresponding to $id_x$. Say $eta: hom(C) (-, x) => F$ is a natural transformation, ... see photo

For every $b in F(y)$, there exists a unique $alpha : y -> x$ such that $F(alpha)(a) = b$.

Apply this to the subgroups functor. Suppose $F$ is representable, then there exists $G$ ($=x$) (representing group) and $H <= G$ (where $H = a$) such that for all groups $G'$ and every subgroups $H'$, there exists $alpha : G' -> G$, such that $F(alpha)(H) = H'$ or $alpha^(-1)(H) =H$. 

If we take $G' = ZZ$ and $H' = 0$, there exists unique $alpha : ZZ -> G$ such that $alpha^(-1)(H) = 0$. Set $beta: ZZ-> G$ such that $forall n in ZZ$, $beta(n) = alpha(2 n)$ and we also have $beta^(-1)(H) = 0$, which fails the uniqueness of $alpha$.


#proposition[
    The Yoneda functor is faithful.
]

This is a consequence of Yoneda's Lemma.

#lemma[
    $x in cC$ and $F in Fun(C^op, Set)$. The canonical restriction map: 
    $ "res": hom (Y(x), F) -> F(x) $
    is a bijection.
    
    If $eta: Y(x) => F$ is a natural transformation, then we send it to $eta_x (id_x)$. Notice $eta_x : hom(x, x) -> F(x)$ where $id_x in hom(x, x)$.
]
Lemma 2.10 in notes.
#proof[
    What can the inverse be?
    Suppose we have $a in F(x)$. We want to contruct $zeta(a): Y(x) => F$, a natural transformation. Consider its component $zeta(a)_(x')$, which we define to send every $g : x' -> x$ to $F(g)(a)$. (The only natural thing to do.)

    We need to prove $zeta(a)$ is a natural transformation.
    (See photo.) Don't forget $F$ is a contravariant functor.

    Now we need to show $zeta$ is an inverse to $"res"$. 

    For all $a in F(x)$, 
    $
        "res" oo zeta(a) = zeta(a)_x (id_x) = F(id_x)(a) = id_(F(x))(a) = a
    $

    For all $eta : Y(x) => F$, 
    $
        zeta(eta_x(id_x))_y (g: y->x) = F(g)(eta_x (id_x)) = eta_y (id_x oo g) = eta_y (g)
    $

    using def of $zeta$ and that $eta$ is a natural transformation. 
]

You just the only thing that makes sense at every step. Just write it yourself. 

= Lecture 8

#corollary[
    The Yoneda functor is fully faithful.
]

This means if you take $x, y in cC$ and $ Y: hom(C)(x, y) -> hom_prshv(cC)(Y(x), Y(y)) $ is a bijection. 

#proof[
    Specialise $F = Y(y)$ in Yoneda Lemma. Inverse $zeta: Y(y)(x) -> hom_prshv(cC)(Y(x), Y(y))$ is a bijection. Only need to check that $zeta$ is the same as $Y$ on $Hom(C)(x, y)$. 

    If $alpha in Hom(C)(x, y)$, then $zeta(alpha): Y(x) => Y(y)$ and then $ zeta(alpha)_(x') (g: x' -> x) = F(g)(alpha) = alpha oo g $
    This is the same as $Y$. 
]

#remark[
  + The natural transformations between two represtable functors correspond (1-1) to morphisms between the representing objects. 
  + If $Hom(C)(y, x_1) iso Hom(C)(y, x_2)$ for all $y in cC$ in some natural way, then we have $x_1 iso x_2$. 

    This fits into the philoshpy that objects interact with other objects in the category. You identify an object $x$ by how it interact with other objects. 
]

#example[
    $G$ group, then take the groupoid $ast over G$ and $End _(ast) = G$. 

    $prshv(ast over G) = F : (ast over G)^op -> Set$  Then $F(ast) = X$, a set. 

    $F(g oo_op h) = F(g) oo F(h)$

    Define right $G$-action on $X$: 
    $ x dot g = F(g)(x) $

    Then $prshv(ast over G) = G"-sets"$ 

    What about natural transformations? $G$-equivalent maps. $phi: X_1 -> X_2$ such that $phi(x_1 dot g) = phi(x_1) dot g$.

    By Yoneda, we know that $ast over G arrow.hook G"-sets"$ and $ast mapsto Y(ast) iso G$ (a set with right $G$-action).

    Using the res function,
    $forall G"-set" X$, we have $Hom_(G"-set")(G, X) bij X$ that $f: G-> X$ maps to $f(e_G)$

    Take $X = G$, we have $ G iso hom_(G"-set")(G, G) arrow.hook hom_Set (G, G) = "Perm"(G) $ 

    This is Cayley's Theorem in group theory.
]

#example[
    Every row operation on matrices is given by left multiplication by an $n times n$ matrix, namely the matrix obtained by applying the row operation to the identity matrix. (This is a corollary of Yoneda's Lemma in the catory of matrices. Riehl Cor 2.2.9) TODO
]

#remark[
    Contravariant Yoneda embedding. $cC -> Fun(cC, Set)^op$ that $x mapsto Hom(C)(x, -)$

    corepresentable functors

    We will use the covaraint version.
]

#definition[
Essential image of $Y$ is called *representable functors*. 

]

#example[
  If $cC$ is a category, we can define the centre of $cC$ as $End (id_cC)$. (all nat trans $id_cC => id_cC$ where $id_cC$ is the identity functor)
    + The centre of $cC$ is a comutative monoid;
    + If $cC = RMod$ where $R$ is a ring with identity. Then the centre of $cC$ is iso to $Z(R)$.
    + Can you prove 2 as a consequence of Yoneda's Lemma?
]

Formal adjoints. 

$F: cC -> cD$. Does $F$ have a right adjoint? 
The formal right adjoint of $F$ is $F^"fra": cD -> prshv(cC)$ that $y mapsto Hom(D) (F(-), y)$ and $g: y_1 -> y_2$ maps to post composition.

#proposition[
    $F$ has a right adjoint $G$ if and only if for all $y in cD$, the $F^"fra" (y) in prshv(cC)$ is representable. 
]

#proof[
    =>. If $F tack.l G$, then 
    $ Hom(D) (F(x) , y) iso Hom(C) (x, G(y)) $
    then $F^"fra" (y) iso Hom(C)(-, G(y))$ is represented by $G(y)$.

    <=. If $F^"fra" (y)$ is representable for all $y in cD$, then $F^"fra"$ lands in $prshv(cC)^"repr"$.

    A consequence of Yoneda embedding: 
    $ cC iso prshv(cC)^"repr"$

    Denote $P$ as $Y tack.l P$.

    Set $G = P oo F^"fra" : cD -> cC$ and then $Hom(C)(x, G(y))$

    (see photos)

]
#remark[
    We also know that a right adjoint, if it exists, is unique up to isomorphism. $F tack.l G_1$, $F tack.l G_2$, then $G_1 iso G_2$.

    $Y G_1 iso F^"fra" iso Y G_2 $, since $Y$ is fully faithful, $G_1 iso G_2$.
]


= Limit and Colimits

#example[
    Product. 
]

There is no binary product $k times k$ for $k$ a field. 

Suppose there is, call it $P$. Then it has to come with two maps, $p_k^i : P -> K$. We take $W = K$.

