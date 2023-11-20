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

#definition(name: "Functor categories")[
Let $cC, cD$ be categories. The *functor category* $Fun(cC, cD)$ has objects functor $F: cC -> cD$ and morphisms natural transformations. 
]

#definition[
    Given a category $cC$, a *presheaf* on $cC$ is a functor $cC^op -> Set$. All presheaves on $cC$ form a cateogry $prshv(cC) := Fun(cC^op, Set)$.
]

Let $cC$ be a locally small category (e.g. $Set, Grp, veck$).
Then we have for any $x in cC$, a functor 
$ Hom(C)(-, x) : cC^op &-> Set \
 y &mapsto Hom(C) (y, x) \
 (beta: y_1 -> y_2) &mapsto (- oo beta) :  Hom(C)(y_2, x) -> Hom(C)(y_1, x) $

We see that $Hom(C)(-, x)$ is a functor in $prshv(cC)$. Moreover, it is a special member ("representative") of this category.

#remark[
    TODO
Why this name? Let $X$ be a topp space and $J$ be topology on $X$, then preshef $S$ is for any U in J, S(U) in Set, if $V subset U$ then .. (see photo)
If we define $"Open"(X)$ as object: open sets in $X$, morphisms: no morphisms if $V subset.eq.not U$; if $V subset.eq U$, then one map $V arrow.hook U$.
Then a preshef $S in Fun("Open"(X)^op, Set)$.
]

#definition[
    A functor $F in prshv(cC)$ is *representable* if there exists $x in cC$ such that $F iso Hom(C)(-, x)$.
]

#definition[
Define *Yoneda functor* 
$ Y: cC &-> prshv(cC) = Fun(cC^op, Set) \
x &mapsto Hom(C)(-, x) \
(alpha: x_1 -> x_2) &mapsto (alpha oo -) : Hom(C)(-, x_1) => Hom(C)(-, x_2)
$
]

Notice we map a morphism in $cC$ to a morphism (which is supposed to be a natural transformation) in $Psh(cC)$ (a functor category). Here we need to verify that given $alpha: x_1 -> x_2$, $ eta := (alpha oo -) : Hom(C)(-, x_1) => Hom(C)(-, x_2) $ is indeed a natural transformation. Suppose we have $beta: y -> y'$ in $cC$, 

// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBpiBdUkANwEMAbAVxiRAAsIBbAAgAoAngHJSPAB4B9AIwBKEAF9S6TLnyEUZKVVqMWbTr0EjxEgExzFy7HgJEppLdXrNWiDt34DRk8wqUgMazU7cm1nPTcDT29pC20YKABzeCJQADMAJ24kMhAcCCQAZiddVxAAWh4ICB4AIxgcOj90rK4c6nykex0XNga6CSMZHgBeHkY0djoqmvLmkEzsxGK8gsRTEt63fokBUfGGSenqnjnLBdaujrWNnoiKmbr+hQp5IA
#align(center, commutative-diagram(
  node((0, 0), [$hom (y', x_1)$]),
  node((1, 0), [$hom (y', x_2)$]),
  node((1, 1), [$hom (y, x_2)$]),
  node((0, 1), [$hom (y, x_1)$]),
  arr((0, 0), (0, 1), [$- oo beta$]),
  arr((0, 0), (1, 0), [$eta_(y') = alpha oo -$]),
  arr((0, 1), (1, 1), [$eta_y = alpha oo -$]),
  arr((1, 0), (1, 1), [$- oo beta$]),
))

We see that $(alpha oo -) oo (- oo beta) = alpha oo - oo beta =(- oo beta) oo  (alpha oo -)$ and hence the diagram commutes. 

#proposition[
$F in Psh(cC)$ is representable if and only if $F$ in the essential image of $Y$.
]


#example[Define functor $PP in Psh(Set)$
    $ PP : Set^op &-> Set \ 
    A &|-> "power set of " A \ 
    (f : A-> B) &mapsto f^(-1) : PP(B) -> PP(A) $
    In other words, $PP(f)(S) = f^(-1)(S)$ for $S subset.eq B$. Then $PP$ is representable.
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
    $ "res": hom_(prshv(x)) (Y(x), F) &-> F(x) \ 
        (eta: Y(x) => F) &mapsto eta_x (id_x)
     $
    is a bijection.
    
   Notice the natural transformation $eta$ has $x$-component $ eta_x : hom(x, x) -> F(x) $ and $id_x in hom(x, x)$, and therefore $eta_x (id_x) in F(x)$.
]
Lemma 2.10 in notes.
#proof[
    [Constructing the inverse $zeta : F(x) -> hom_(prshv(x)) (Y(x), F)$.]
    Let $a in F(x)$. We want to construct a natural transformation $zeta(a): Y(x) => F$. Consider its $y$-component for $y in cC$ $ zeta(a)_(y) : Y(x)(y) -> F(y) $ 
    
    Notice this is a function between two sets. Also notice $Y(x)(y) equiv Hom(C)(y, x)$ by definition, hence we only need to consider what element in $F(y)$ to which we should send each $g : y -> x$. Remembering $F$ is a contravariant functor we have $ F(g): F(x) -> F(y) $
    Also $a in F(x)$. Hence we define 
    $ zeta(a)_(y) : Hom(C)(y, x) &-> F(y) \ g  &|-> F(g)(a) $ 
    
    [Showing $zeta(a)$ is a natural transformation.]
    // https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBpiBdUkANwEMAbAVxiRAAkIBbACgGEAlAAIeATwD6AJlJCAHgJABfUuky58hFAEZyVWoxZtOvQSIk65C5aux4CRMlr31mrRCABiYqVZUgMthpEOk7ULobuXuZWejBQAObwRKAAZgBO3EhkIDgQSDr6rmwAtEIQEEKMaAAWdEp+6ZmI2blI0oURIABeMDh0PHQC4t6SvqkZXPnUrYgAzGEGbt29-YPD0fXjTe0z8x1LXlW1MYpAA
#align(center, commutative-diagram(
  node((0, 0), [$Hom(C) (y_2, x)$]),
  node((0, 1), [$Hom(C) (y_1, x)$]),
  node((1, 0), [$F(y_2)$]),
  node((1, 1), [$F(y_1)$]),
  arr((0, 0), (0, 1), [$- oo alpha$]),
  arr((0, 0), (1, 0), [$zeta(a)_(y_2)$]),
  arr((0, 1), (1, 1), [$zeta(a)_(y_1)$]),
  arr((1, 0), (1, 1), [$F(alpha)$]),
))
    Let $f: y_2 -> x$. Then $zeta(a)_(y_2) (f) = F(f) (a)$ and $F(alpha)(F(f)(a)) = F(f oo alpha)(a)$. On the other hand, $zeta(a)_(y_1)(f oo alpha) = F(f oo alpha)(a)$. Hence the above diagram commutes.

    // This is the only natural thing to do. 
    // To sum up,

    // $
    //     zeta: F(x) &-> hom_(prshv(x)) (Y(x), F) \
    //     a &mapsto {(g: y-> x) mapsto F(g )(a)}_(y in cC)
    // $

    //  Don't forget $F$ is a contravariant functor.

    [Showing $zeta$ is an inverse to $"res"$.]  For all $a in F(x)$, 
    $
        "res" oo zeta(a) = zeta(a)_x (id_x) = F(id_x)(a) = id_(F(x))(a) = a
    $

    For all $eta : Y(x) => F$, we have $zeta oo "res"(eta) = zeta(eta_x (id_x)) : Y(x) => F$. For $y in cC$ and $g : y-> x$,
    $
        zeta(eta_x (id_x))_y (g: y-> x) = F(g)(eta_x (id_x)) = eta_y (id_x oo g) = eta_y (g)
    $
    where we notice since $eta$ is a natural transformation, the following commutes:

    // https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBpiBdUkANwEMAbAVxiRAAkIBbACgGEAlDwAepAATCBIAL6l0mXPkIoAjOSq1GLNp16CeAT3GSZckBmx4CRMio31mrRCABiIqbPmWlRNXeoO2s5uBh4aMFAA5vBEoABmAE7cSGQgOBBIapqObAC0YhAQYpGm8UlcSABM1OlIAMwBWk6uPJEeZonJiKm1iNXZQSAwOHQA+sKlIJ0ViFm9DQPNw2MGMhTSQA
#align(center, commutative-diagram(
  node((0, 0), [$Hom(C)(x, x)$]),
  node((0, 1), [$Hom(C)(y, x)$]),
  node((1, 0), [$F(x)$]),
  node((1, 1), [$F(y)$]),
  arr((0, 0), (0, 1), [$- oo g$]),
  arr((1, 0), (1, 1), [$F(g)$]),
  arr((0, 0), (1, 0), [$eta_x$]),
  arr((0, 1), (1, 1), [$eta_y$]),
))

    // using def of $zeta$ and that $eta$ is a natural transformation. 
]
#remark[
You just do  the only thing that makes sense at every step. Just write it yourself. 
]


= Lecture 8

#corollary[
    The Yoneda functor is fully faithful.
]

This means if you take $x, y in cC$ and $ Y: Hom(C)(x, y) -> hom_prshv(cC)(Y(x), Y(y)) $ is a bijection. 

#proof[
    Specialise $F = Y(y)$ in Yoneda Lemma. 
    We know the inverse $ zeta: Y(y)(x) -> hom_prshv(cC)(Y(x), Y(y)) $ is a bijection. 
    We only need to check that $zeta$ is the same as $Y$ on $Hom(C)(x, y)$. 

    If $alpha in Hom(C)(x, y)$, then $zeta(alpha): Y(x) => Y(y)$ and then $ zeta(alpha)_(x') (g: x' -> x) = F(g)(alpha) =  Y(y)(g)(alpha) = alpha oo g $
    where for $Y(alpha) : Y(x) => Y(y)$, we also have 
    $ Y(alpha)_(x')(g: x'-> x) = alpha oo g $
    Thus $zeta = Y$ on $Hom(C)(x, y)$ and thus $Y$ is fully faithful.
]

#remark[
  + The natural transformations between two represtable functors correspond (1-1) to morphisms between the representing objects. 
  + If $Hom(C)(y, x_1) iso Hom(C)(y, x_2)$ for all $y in cC$ in some natural way, then we have $x_1 iso x_2$. 

    This fits into the philoshpy that objects interact with other objects in the category. You identify an object $x$ by how it interact with other objects. 
]


#corollary(name: "Cayley's Theorem")[
    Any group $G$ is isomorphic to a subgroup of a permutation group.
]

#proof[
    Take the groupoid $ast over G$ with $end(*) = G$. Consider $F in prshv(ast over G)$:
    $
        F : (ast over G)^op &-> Set \
        ast &mapsto X\
        g &mapsto (x |-> x dot g)
    $

    where we have composition $F(h oo g) = F(g) oo F(h)$ and define right $G$-action on $X$: 
    $ x dot g = F(g)(x) $


    Natural transformations between two such functors are $G$-equivariant maps $phi: X_1 -> X_2$ such that $phi(x_1 dot g) = phi(x_1) dot g$. Thus $Psh(ast over G)$ has objects as right $G$-sets and morphisms as $G$-equivariant maps. We use $Set_G$ to denote the category of right $G$-sets, and we see $Psh(ast over G) = Set_G$.
    // Then $prshv(ast over G) = G"-sets"$ 

    By Yoneda embedding $ C arrow.hook Psh(C)$ we have 
    $
        ast over G &arrow.hook Set_G \
        ast &mapsto Y(ast) = hom (-, ast) iso G
    $

    (Because the only possible input for $Y(ast)$ is $ast$ which produces $hom (ast, ast) = G$.) Here $G$ is seen as a right $G$-set.


    Using the $"res"$ function,
    for any right $G$-set $X$, we have $
        hom_(Set_G)(G, X) &bij X \ (f: G-> X) &|-> f(e_G)
        $

    Taking $X = G$, we have $ G iso hom_(Set_G)(G, G) attach(arrow.hook, t: "Forget") hom_Set (G, G) = "Perm"(G) $ 

    This is Cayley's Theorem in group theory.
]

#example[
    Every row operation on matrices is given by left multiplication by an $n times n$ matrix, namely the matrix obtained by applying the row operation to the identity matrix. (This is a corollary of Yoneda's Lemma in the catory of matrices. Riehl Cor 2.2.9) TODO
]

#remark[
    // Contravariant Yoneda embedding. $cC -> Fun(cC, Set)^op$ that $x mapsto Hom(C)(x, -)$
    // corepresentable functors
    // We will use the covaraint version.
    Using categorical duality one also has a contravariant Yoneda embedding

$ cal(C) arrow.r "Fun"lr((cal(C) comma Set))^op $

given by sending $x arrow.r.bar "Hom"_(cal(C)) lr((x comma minus))$.
Functors in the essential image of the contravariant Yoneda functor are
known as *corepresentable functors*.
]

// #definition[
// The essential image of $Y$ is called *representable functors*. 

// ]

#example[
  If $cC$ is a category, we can define the centre of $cC$ as $End (id_cC)$. (all nat trans $id_cC => id_cC$ where $id_cC$ is the identity functor)
    + The centre of $cC$ is a comutative monoid;
    + If $cC = RMod$ where $R$ is a ring with identity. Then the centre of $cC$ is iso to $Z(R)$.
    + Can you prove 2 as a consequence of Yoneda's Lemma?
]

== Formal adjoints
Let
$"Fun"lr((cal(C)^(o p) comma Set))^"repr" arrow.r.hook "Fun"\(cal(C)^(o p)$,
Set $paren.r$ be the subcategory of representable functors, i.e. the
essential image of the Yoneda functor. Combining Yoneda lemma with
Theorem 1.13(TODO) we see that the functor
$cal(C) arrow.r "Fun"lr((cal(C)^(o p) upright(", Set ")))^"repr"$ is
an equivalence and so there is a functor

$ P colon "Fun"lr((cal(C)^(o p) comma upright(" Set ")))^"repr" arrow.r cal(C) $
such that $Y tack.l P$ forms an adjoint equivalence. 


// $F: cC -> cD$. Does $F$ have a right adjoint? 
#definition[
The *formal right adjoint* of a functor $F : cC -> cD $ is  a functor
    $ F^"fra": cD &-> prshv(cC) \ y &mapsto Hom(D) (F(-), y) \ (g: y_1 -> y_2) &mapsto g oo - $ 
]

#proposition[
    $F$ has a right adjoint $G$ if and only if for all $y in cD$, the $F^"fra" (y) in prshv(cC)$ is representable. 
]
#proof[
    $=>$.
We have a natural isomorphism
$"Hom"_(cal(D)) lr((F x comma y)) tilde.equiv "Hom"_(cal(C)) lr((x comma G y))$
for every $x in cal(C)$ and $y in cal(D)$. Therefore, the functor
$F^"fra" lr((y))$ is representable by the functor
$"Hom"_(cal(C)) lr((minus comma G y))$. 

$arrow.l.double$. We define the right adjoint $G$ to be the composite
$G eq P compose F^"fra"$, where
$P colon "Fun"lr((cal(C)^(o p) comma "Set"))^"repr" arrow.r cal(C)$
is the inverse to the Yoneda embedding $Y$.

To show that $F tack.l G$, we have to construct an isomorphism
$"Hom"_(cal(D)) lr((F x comma y)) tilde.equiv "Hom"_(cal(C)) lr((x comma G y))$
natural in $x$ and $y$. It is constructed in the following way:

$ "Hom"_(cal(C)) lr((x comma G y)) & eq "Hom"_(cal(C)) lr((x comma P F^"fra" y))\
 & tilde.equiv "Hom"_(prshv(cC)) lr((Y x comma F^"fra" y))\
 & tilde.equiv F^"fra" lr((y)) lr((x))\
 & eq "Hom"_(cal(D)) lr((F x comma y)) comma $

where in the second line we have used the adjoint equivalence
$Y tack.l P$ and in the third line we applied the Yoneda lemma.
]
// #proof[
//     =>. If $F tack.l G$, then 
//     $ Hom(D) (F(x) , y) iso Hom(C) (x, G(y)) $
//     then $F^"fra" (y) iso Hom(C)(-, G(y))$ is represented by $G(y)$.

//     <=. If $F^"fra" (y)$ is representable for all $y in cD$, then $F^"fra"$ lands in $prshv(cC)^"repr"$.

//     A consequence of Yoneda embedding: 
//     $ cC iso prshv(cC)^"repr"$

//     Denote $P$ as $Y tack.l P$.

//     Set $G = P oo F^"fra" : cD -> cC$ and then $Hom(C)(x, G(y))$

//     (see photos)

// ]

In other words, adjoints can be thought of as factorizations of the
diagram

#block[
#box(width: textwidth, img("2023_10_29_c96760a46085980a504cg-22(1)", width: textwidth))

]
More precisely, a right adjoint consists of a functor
$G colon cal(D) arrow.r cal(C)$ and a natural isomorphism
$Y G tilde.equiv F^"fra"$. Using Yoneda lemma one can
give an easier proof of Theorem 2.4 (TODO):

#theorem[
A right adjoint, if it exists, is unique up to isomorphism.
] 

#proof[
Indeed, suppose $G_1$ and $G_2$ are two right adjoints. Then we have
isomorphisms

$ Y G_1 tilde.equiv F^"fra" tilde.equiv Y G_2 $

Since the Yoneda embedding is fully faithful, a natural isomorphism
$Y G_1 tilde.equiv Y G_2$ is equivalently a natural isomorphism
$G_1 tilde.equiv G_2$.
]
// #remark[
//     We also know that . $F tack.l G_1$, $F tack.l G_2$, then $G_1 iso G_2$.

//     $Y G_1 iso F^"fra" iso Y G_2 $, since $Y$ is fully faithful, $G_1 iso G_2$.
// ]


= Limit and Colimits

#example[
    Product. 
]

There is no binary product $k times k$ for $k$ a field. 

Suppose there is, call it $P$. Then it has to come with two maps, $p_k^i : P -> K$. We take $W = K$.

#example[
    $I$ is a set, $X_i$ for $i in I$ are objects in $cC$. The product is an object $product_(i=I) X_i$ together with morphisms (projections) $ p_j: product_(i=I) X_i -> X_j $ such that if $W in cC$ has morphisms $h_j : X-> X_j$, then there exists unique $alpha: W -> product_(i=I) X_i$ such that $h_j = p_j oo alpha$. 
]

#example[
    A final object is a product over an empty set. $ast in cC$ is final if for every $W in cC$ there exists unique $alpha : W -> ast$.
]

#example[
    Equalisers. Suppose we have $f, g: x-> y$ in $cC$. Then $E in cC$ with a morphism $i : E-> x$ such that $ f oo i = g oo i $ such that for all $W in cC$ with $h : W-> X$ such that $f oo h = g oo h$, there exists unique $alpha: W -> E$ such that $h = i oo alpha$.
]

#example[
    In $Set$, an equaliser of $f, g: X-> Y$ is the set $ {a in X : f(a) = g(a)} $ together with the inclusion map.
]

#example[
    Fibre product (pullback). With $f : X-> Z$ and $g: Y->Z$, the fibre product $X times_Z Y$ in an object that comes with morphisms $q_X, q_Y$ to $X, Y$ respectively such that 
    $ f oo q_X = g oo q_Y $
    satisfying the universal property (which you can guess).
]

#example[In $Set$, 
    $ X times_Z Y = {(x, y) : f(x) = g(y) } $
    and $q_X$ (resp. $q_Y$) is the projection onto the first (resp. second) entry.
]

#remark[
    $ X times_Z Y = Eq(f oo p_X, g oo p_Y : X times Y -> Z) $

    Suppose $cC$ has an final object $ast$, then $ X times Y = X times_ast Z $ (?)
]


#definition[
    Let $cC$ be a category. A functor $F : I -> C$ where $I$ is a small category is called a *diagram* of *shape* $I$. A *limit* of $F$ in $cC$ is an object $lim_I F in cC$ together with morphisms $p_i : lim_I F -> F(i)$ for all $i in I$, such that
    - $forall g : i-> j in I$, we have $p_j = F(g) oo p_i$;
    - Universal property, in the following sense: $forall W in cC$ and $h_i : W -> F(i)$ such that $F(g) oo h_i = h_j$, there exists a unique $h: W -> lim_I F$ such that $h_i = p_i oo h$. 
]

#example[ How do the previous examples fit in the definition?
    - Product. We regard $I in Set$ as a discrete category. 
    - Final object. Take $I$ as the empty category.
    - Equaliser. Take $I = 0 arrows.rr 1$.
]

A better way of organising the definition is to introduce the notion of cones.

#definition[
    Given $F: I-> cC$, a *cone* on $F$ is an object $W in cC$ with morphisms $h_i : W-> F(i) $ in $cC$ for all $i in I$ such that $F(g) oo h_i = h_j$ for all $g : i -> j$ in $I$.
]
#let Cone = [$bd("Cone")$]

Category of cones. The objects are cones $(W, (h_i))$; morphism from $(W, (h_i))$ to $(W', (h'_i))$ is a morphism $alpha : W-> W' in cC$ such that $h_i = h'_i oo alpha$ for all $i$. 


#definition[
    $lim_I F$ is a final object in $Cone(F)$. 
]

In particular, if a limit exists, it is unique up to unique isomorphism.

#definition[
    A category is *complete* if it has all limits. 
]

#proposition[
    The category $Set$ has all limits. ($Set$ is complete.)
]
#proof[
    $Set$ has products (Cartesian products).

    For diagram $F : I-> Set$, define $
        lim_I F := {(a_i) in product_(i in I) F(i) : forall g : i->j, a_j = F(g) (a_i)}
    $
    with the projections $p_i$ as projection onto the $i$-th factor. Check the universal property yourself.
]

Generalisation.

#theorem[
    // $cC$ is complete if and only if $cC$ has products and equalisers.
A category $cal(C)$ is complete iff it has products and equalizers. 
]

#proof[Clearly, if a category has limits, then it has products and
equalizers. Conversely, suppose the category $cal(C)$ has products and
equalizers and consider a diagram $F colon I arrow.r cal(C)$. 
// We want to
// repeat the construction of limits in Set in $cal(C)$. 
For every morphism
$f colon i arrow.r j$ we define a pair of morphisms
$ phi_f, psi_f: product_(k in I) F lr((k)) arrow.r F lr((j)) $ as follows. We define $phi_f$ simply as the projection
$product_(k in I) F lr((k)) arrow.r F lr((j))$ on the component
$k eq j$. On the other hand, the morphism $psi_f$ is given by the composite
$ product_(k in I) F lr((k)) arrow.r F lr((i)) arrow.r^(F lr((f))) F lr((j)) $
where the first arrow is the projection on the component $k = i$.

We thus get maps $phi = (phi_f)_((f : i->j) in I)$ and $psi = (psi_f)_((f : i->j) in I)$ such that
$ product_(k in I) F lr((k)) arrows.rr^(phi)_(psi) product_(lr(( f: i arrow.r j)) in I ) F lr((j)) $

by the universal property of the product (on the right-hand side).
#footnote[Alternatively, we can write $i->j in upright(F u n) lr((lr([1]) comma I))$, where $"Fun"lr((lr([1]) comma I))$ is the category of arrows in $I$,
i.e. pairs of objects $i comma j in I$ together with a morphism
$i arrow.r j$.]

Take any object $C$ with morphism $h: C -> product_(k in I) F lr((k))$, where we can write $h= (h_k)_(k in I)$ for $h_k : C->F(k)$. 
We see that $C$ is a cone if and only if for every $(f: i-> j) in I $, $F(f) oo h_i = h_j$, but this is exactly $psi oo h = phi oo h$. 

Now we claim that the equaliser $E$ of $phi$ and $psi$ is the limit of $F$.
The universal property of the equaliser claims that for any $C$ such that $phi oo h = psi oo h$, there exists a unique morphism $C -> E$. Equivalently, for any cone $C$, there exists a unique morphism $C -> E$, and this is exactly the universal property of the limit.
// Indeed, the universal property of the equalizer is that for any morphism
// $W arrow.r product_(k in I) F lr((k))$, i.e. for any collection of morphisms $W arrow.r F lr((k))$, such that the composite
// $W arrow.r F lr((i)) arrow.r^(F lr((f))) F lr((j))$ coincides with
// $W arrow.r F lr((j))$ for every $f colon i arrow.r j$, there is a unique
// morphism $W arrow.r E$. But this is exactly the universal property of
// the limit.
// 000
//     Take $F: I->cC$ and $g: i-> j$.
//     We can think of the cone condition as (\*)
//     $
//         product_(k in I) F(k) arrows.rr^(p_j)_(F(g) oo p_i) F(j)
//     $
//     $p_j$ is the projection.
//     Consider $Fun([1], I)$, this is the category of all arrows in $I$, and thus $g: i-> j in Fun([1], I) =: J$.
//     Define $tilde(F): J-> C$, where $tilde(F) (g: i->j) = F(j)$. Thus (\*) is a cone on $tilde(F)$. Because the products exist, there exists unique maps 
//     $
//         product_(k in I) F(k) -> product_(g in J) F(j) = lim_J tilde(F)
//     $
//     using the universal property of $lim_J tilde(F)$. 
//     Then set $lim_I F$ to be the equaliser of this diagram.
//     (Not well explained...)
]

#corollary[
A category $cal(C)$ has finite limits iff it has binary products, final object and equalizers.
]
#proof[
    The same proof shows that a category has finite limits iff it has finite
products and equalizers. But any finite product is a final object \(if
the indexing set is empty), the identity functor \(if the indexing set
has a single element) or can be constructed as an iterated application
of binary products.
]
// Suppose a category $cC$ has all limits of shape $I$.  Then we can think of $lim_I$ as a functor
// $
//     lim_I : Fun(I, cC) &-> cC \
//     F &mapsto lim_I F \
//     eta: F_1 => F_2 &mapsto ("TODO")
// $

// Tmr:

// $lim_I$ has a left adjoint which is $ Delta: cC -> Fun(I, cC) $ diagonal functor. 

= Lecture 10

Suppose $cC$ has all limits of shape $I$. $
    lim_I : Fun(I, cC) &-> cC \
    F &mapsto lim_I F \
    eta: F_1 => F_2 &mapsto lim_I eta: lim_I F_1 -> lim_I F_2
$

Define diagonal functor $
    Delta = Delta_I: cC &-> Fun(I, cC)  \
    x  &|-> Delta_x : I -> cC quad cases(Delta_x (i) = x, Delta_x (g: i-> j) = id_x)  \
    f: x-> y &mapsto  eta_f : Delta_x => Delta_y quad eta_(f, i) = f
$

#theorem[ Suppose $cC$ has all limits of shape $I$. Then 
    $ Delta_I tack.l lim_I $
]
#remark[
    You can use this to construct $lim_I$ by finding the right adjoint of $Delta_I$ if that exists. 
]

#proof[
    We want to show $
        hom_(Fun(I, cC)) (Delta_x , F) iso Hom(C) (x, lim_I F)
    $   

    Quite easy, TODO
]

#example[
    Let $cC = Set$ and let $I$ be a discrete category. Denote $B_i = F(i)$ which is some set, then $F : I -> cC$ correspond to ${B_i}_(i in I)$, a collection of sets and $ lim_I F = product_(i in I) B_i $
    Let $A in Set$, then we have 
    $
        hom_Fun(I, Set) (Delta_A, F) iso hom_Set (A, product_(i in I) B_i)
    $

    LHS is maps $ (A)_(i in I) -> (B_i)_(i in I) $ $ (a)_(i in I) -> (b_i)_(i in I) $ and RHS is $ a -> (b_i)_(i in I) $ 
    
]

#remark[
    In $Set$, we can use $A iso hom_Set (ast, A)$. Hence $
        lim_I F = hom_Set (ast, lim_I F) = hom_Fun(I, Set) (Delta(ast), F)
    $
    This could be the definition of $lim_I F$. 
]

== Swap limits "Fubini"

Let $I, J$  be categories. Then $I times J$ is a category where the objects are ordered pairs $(i, j)$ for $i in I, j in J$ and morphisms are pairs of morphisms $i->i' in I, j-> j' in J$.

#theorem[
    Suppose $cC$ has limits of shape $I$ and $J$. Then it has limits of shape $I times J$ and 
    $
        lim_(I times J) F iso lim_I (lim_J F) iso lim_J (lim_I F)
    $
]

For every $F : I times J -> C$, for every $i in I$, define $F^i : J -> cC$ such that $F^i (j) = F(i, j)$. Then we can get a functor $I -> cC$ such that $i |-> lim_J F^i$ (TODO: what about the morphisms?) and we can take $lim_I$ of this functor, yielding $lim_I (lim_J F)$.

#proof[
    $
        Hom(C)(x, lim_I (lim_J F)) &iso hom_Fun(I, cC) (Delta_I (x), lim_J F) \

        &iso hom_Fun(J, Fun(I, cC)) (Delta_((I), J) (Delta_I (x)), F) \

        &iso hom_Fun(I times J, cC) (Delta_(I times J) (x), F)
    $

    where $Delta_((I), J): Fun(I, cC) -> Fun(J, Fun(I, cC))$.

    This means that $lim_I lim_J F = lim _(I times J) F$.
]

#proposition[
    $Fun(J, Fun(I, cC)) iso Fun(I times J, cC)$
]

We proved $cC$ is complete if and only if it has arbitary products and equalisers. 

#definition[
    A category $I$ is *cofiltered* if 
    - $I != emptyset$;
    - For all $ i, j in I$, there exist $k in I$ and morphisms $k -> i$ and $k -> j$;
    - For all $i, j in I $ and morphisms $i arrows.rr^u_v j$, there exists $k in I$ and a morphism such that  $k -> i arrows_v^u j$ commutes.
] 

#proposition[
A category is cofiltered if and only if it has cones for every finite diagram.
]
#proof[Informally, the definition is just asking for "non-universal final object" (which is _any_ object), "non-universal binary products" and "non-universal equalisers", so we get "non-universal limits", i.e. cones, for finite diagrams.
]

#definition[
    A category $I$ is *filtered* if (unsurprisingly) $I^op$ is cofiltered.
]


#example[
    The category $(NN, <=)$ has objects $n in NN$ and morphisms $n -> m$ if $n <= m$. Then $NN$ is filtered and $NN^op = (NN, >=)$ is cofiltered.
]

#proof[
    A cone for a finite diagram in $NN^op$ is just an upper bound for a finite subset of $NN$, which always exists.
]

#definition[
    A limit over a cofiltered diagram is a *cofiltered limit*.
]

#example[
    Let $I = NN^op$ and $
        F: NN^op &-> cC \
        n &mapsto F(n) \
        n->m &mapsto F(n) -> F(m) quad "whenver " n >= m
    $
    Then $F$ is equivalent to a chain in $cC$: 
    $ ... -> F(3) -> F(2) -> F(1) $
    The limit is the inverse limit, denoted as $lim_(<-) F(n)$.
]

#example[
    In Rings, $lim_(<-) ZZ over p^n = ZZ_p$, the $p$-adic integers.
]


#theorem[
    $cC$ is complete if and only if it has finite limits and cofiltered limits. 
]

#proof[
    An equaliser is a finite limit. We still need to show that $cC$ has arbitrary products. Take set $I$ and think of it as a discrete category. Let $I^+$ be the category of finite subsets of $I$ where the morphisms are inclusions. Then $(I^+)^op$ is cofiltered. 

    Let $F : I -> cC$ be a functor. Define $ F^+ : (I^+)^op &-> cC \
    J &mapsto lim_J (F|_J)
    $
    We know $lim_J (F|_J)$ exists because $J$ is finite. 

    Exercise:
    $ product_(i in I) F(i) := lim_((I^+)^op) F^+ $
]

Colimit. coproduct.
$
    colim_I tack.l Delta_I tack.l lim_I
$

Warning: limits and colimits do not commute in general. In $Set$, coproudct of $A, B$ is the disjoint union $A product.co B$ but 
$
    (A product.co B) times (C product.co D) != (A times C) product.co (B times D)
$

= Lecture 11: Adjoint functors and limits/colimits

Let $F : cC -> cD$ and diagram $J : I -> cC$. If $(x, (f_i))$ is a cone on $J$, then $F(x)$ is a cone on $F oo J$. 

#definition[
    $F$ *preserves limits* (or $F$ is *continuous*) if whenever $lim_I J$ exists in $cC$, the limit $lim_I F oo J$ exists in $cD$ and $lim_I F oo J iso F (lim_I J)$.
]

// #remark[
//     This is the categorical version of a continuous function, if you want.
// ]

#theorem[Let $cC$ be a locally small category and $x in cC$. Then 
  $Hom(C) (x, -) : cC -> Set$ preserves limits. 
]

#proof[
    Let $J : I -> cC$. Suppose $lim_I J$ exists in $cC$ with maps $f_i$. Then $(Hom(C) (x, lim_I J), (f_i oo -)_(i in I))$ is a cone on $Hom(C)(x, -) oo J = Hom(C)(x, J(-))$, where $ f_i oo - : Hom(C) (x, lim_I J) -> Hom(C)(x, J(i)) $

    Let $(W, (h_i)_(i in I))$ be another cone, where 
    $h_i : W -> Hom(C)(x, J(i))$.
    Let $g: i -> j in I$, which is sent to $J(g) oo - : Hom(C)(x, J(i)) -> Hom(C)(x, J(j))$ by $Hom(C)(x, J(-))$. Then by definition of cone, $h_j = J(g) oo h_i$, thus for all $w in W$ (remember $W$ is a set), $h_j (w) = J(g) oo h_i (w)$. 
    Notice that $h_i (w) : x -> J(i)$, and thus $(x, (h_i(w))_(i in I))$ is a cone in $cC$. So there exists a unique $alpha(w): x -> lim_I J$ such that $h_i (w) = f_i oo alpha(w)$. Now define $alpha: W -> Hom(C) (x, lim_I J)$ as $w mapsto alpha(w)$ and we see $h_i = f_i oo alpha$, which shows $Hom(C) (x, lim_I J)$ is a limit.
    // We have to verify the universal property. TODO See photo
]

// Theorem 4.3. Suppose $cal(C)$ is a locally small category. Then the Hom
// functor

// $ "Hom"_(cal(C)) lr((x comma minus)) colon cal(C) arrow.r upright(" Set ") $

// preserves limits for any $x in cal(C)$.
An alternative proof for the same theorem is given below, taken from the notes.
#proof[
Suppose $J colon I arrow.r cal(C)$ is a diagram with a limit in
$cal(C)$ and consider an object $x in cal(C)$.

Let us start with the following observation:

$ "Hom"_("Fun"lr((I comma cal(C)))) lr((Delta lr((x)) comma J)) tilde.equiv "Hom"_(upright("Fun")lr((I comma Set))) lr((Delta lr((ast)) comma "Hom"_(cal(C)) lr((x comma J)))) $ where $ast$ is the singleton set.
Indeed, a morphism on the left is a compatible family of morphisms
$x arrow.r J lr((i))$ while a morphism on the right is a compatible
family of morphisms
$ast arrow.r "Hom"_(cal(C)) lr((x comma J lr((i))))$.

We get the following chain of isomorphisms natural in $x$ :

$ "Hom"_(upright("Set ")) lr((ast comma "Hom"_(cal(C)) lr((x comma lim_I J)))) & tilde.equiv "Hom"_(cal(C)) lr((x comma lim_I J))\
 & tilde.equiv "Hom"_(upright("Fun")lr((I comma cal(C)))) lr((Delta lr((x)) comma J))\
 & tilde.equiv "Hom"_(upright("Fun")lr((I comma "Set"))) lr((Delta lr((ast)) comma "Hom"_(cal(C)) lr((x comma J)))) $

Therefore, $"Hom"_(cal(C)) lr((x comma J))$ has a limit which is
isomorphic to $"Hom"_(cal(C)) lr((x comma lim_I J))$.
]
 


#example[ Product is a limit, so
    $ Hom(C) (X, product_(i in I) X_i) = product_(i in I) Hom(cC) (X, X_i) $
]

#example[
    $Hom(C) (-, x) : cC^op -> Set$ preserves limits. This means $Hom(C) (-, x)$ takes colimits in $cC$ to limits in $Set$. For example, 

        $ Hom(C) (product.co_(i in I) X_i, X) = product_(i in I) Hom(cC) (X_i, X) $

    In $veck$, in particular,
    $ hom (plus.circle.big_(i in I) V_i, V) iso product_i hom (V_i, V) $ and 
    $ (plus.circle.big V_i)^ast iso product_i V_i^ast $
]

#definition[
    Colimits, cocones.
]
#remark[
    $ colim_I F = lim_(I^op) F $
]
#example[
    #list(
        box(width: 100%)[
            Coproducts. $product.co$
        ], [
            Coequalisers. In $Set$, $ Coeq(X arrows^f_g Y) = Y over tilde $ where $f(x) tilde g(x)$ for all $x in X$. In $Grp$, $ Coeq(G arrows^f_1 H) = coker(f) = H over "normal subgroup generated by" im(f) $
        ], [
            Pushouts.
        ], [
            Direct limit:  diagram of shape $(NN, <=)$ (a filter category) in $cC$ is a sequence; in particular, in $Set$ the union is a filter colimit (with the functions inclusions).  TODO The names are strange.
        ]
    )
]

#theorem[
    Suppose $F: cC arrows.lr cD : G$ and $F tack.l G$. Then $G$ preserves limits and $F$ preserves colimits. 
]

For example, $"Forget": Grp -> Set$ and $Grp -> veck$ etc preserves limits but doe not preserve colimits in general. Easy way to see is through initial objects; $"Forget": Ab -> Grp$ doesn't preserve coproducts. In general, $"Forget"$ do not have right adjoints.  TODO

#proof[
    We will show $G : cD-> cC$ preserves limits. Let $J : I -> cD$ be a diagram and suppose $lim_I J in cD$ exists with $f_i : lim_I J -> J(i)$ for all $i in I$. Then $G(lim_I cD)$ is a cone on $G oo J$. We want to show this is universal.
    
    Suppose we have another cone $ (W, (h_i : W -> G J(i))_(i in I)) in cC $ 
    Let $g : i -> j in I$, then $h_j =  G J (g) oo h_i$. Transpose this using the natural bijection between homsets
    $ Hom(C) (W, G J (i)) iso Hom(D) (F(W), J(i)) $
    we have $tilde(h_j) = J (g) oo tilde(h_i)$ in $cD$. (This holds because of the naturality of the bijection!)
    Then $(F W, (tilde(h_i)))$ is a cone on $J$. Due to the universality of $lim_I J$, there exists unique $tilde(alpha) : F W -> lim_I J$ and then transpose to get unique $alpha : W -> G(lim_I J)$ such that $h_i = f_i oo alpha$ for all $i$, yielding the univerality of $G(lim_I J)$.

    // (Emily's book has beautiful diagrams.)

    Formally,
    $ lim_I Hom(C) (W, G oo J(-)) 
    &= lim_I Hom(D) (F W , J (-)) \ 
    &= Hom(D) (F W, lim_I J) \ 
    &iso Hom(C)(W, G (lim_I J)) $
]

== Related notions

#definition[
    $F : cC -> cD$ *reflects limits* if whenever $x in cC$ is a cone on $J : I -> cC$ such that $F(x) in cD$ is a limit on $F oo J : I -> cD$ then $x = lim_I J$. 
]

#proposition[
    Every fully faithful functor reflects any limit/colimit that exists in the codomain. 
]
#proof[
    It is very easy. TODO
]

#definition[
    $F$ *creates limits* if whenver $F oo J$ has a limit in $cD$, there exists a unique cone $x$ (up to isomorphism) in the preimage of it and $x$ is universal.
]
#proposition[
    - Any equivalence of categories preserves, reflects, creates any limit and colimit that exist.
    - Suppose limits of shape $I$ exists in $cD$ and $F$ creates then. Then limits of shape $I$ exists in $cC$ and $F$ preserves and reflects them.
]
#proof[
    Should be easy. TODO
]

= Lecture 12

== Limits in functor categories

Motivation: remember from metric spaces, $X$, $Y$ are metric spaces and $C(X, Y)$ are continuous functions. If $Y$ is complete then $C(X, Y)$ is complete. 

#theorem[
    If $cD$ is (co)complete and then $Fun(cC, cD)$ is (co)complete.
]
We can use this on the presheve category.


For category $cC, cD$, consider the functor category $Fun(cC, cD)$ with natural transformations as morphisms. 

#remark[
    $Fun(cC, cD)$ is locally small if $cC$ is small. 
]

#theorem[
    Suppose $cD$ has limits of shape $I$. Let $lim_I ^cD : Fun(I, cD) -> cD$ be the limit functor. Then 

    + $Fun(cC, cD)$ has limits of shape $I$.
    + #fw[
        The limits can be computed "pointwise", i.e. $ Fun(I, Fun(cC, cD)) iso Fun(I times cC, cD) iso Fun(cC, Fun(I, cD)) ->^(lim_I cD) Fun(cC, cD) $
    ]

    Similarly for colimits. 
]
#proof[
    The limit functor is right adjoint to the diagnoal functor: 
    $ Delta_I^cD tack.l lim_I^cD $
]

#theorem[
Suppose $cal(D)$ has limits of shape $I$ and denote by
$lim_I colon "Fun"lr((I comma cal(D))) arrow.r cal(D)$ the limit
functor. Then the composite

$ "Fun"lr((I comma "Fun"lr((cal(C) comma cal(D))))) tilde.equiv "Fun"lr((cal(C) comma "Fun"lr((I comma cal(D))))) arrow.r "Fun"lr((cal(C) comma cal(D))) $

is the limit functor. In other words, limits in
$"Fun"lr((cal(C) comma cal(D)))$ are computed pointwise.

Dually, if $cal(D)$ has colimits of shape I, colimits in
$"Fun"lr((cal(C) comma cal(D)))$ are computed pointwise.
]

#proof[
Consider the adjunction $lim_I tack.r Delta$ between categories
$"Fun"lr((I comma cal(D))) arrows.lr cal(D)$. We claim that it induces
an adjunction

$ "Fun"lr((cal(C) comma "Fun"lr((I comma cal(D))))) arrows.lr "Fun"lr((cal(C) comma cal(D))) $

Indeed, it is easy to write the unit and counit for the adjunction on
the functor categories from the one on the ordinary categories.

Next we claim that the composite

$ "Fun"lr((cal(C) comma cal(D))) arrow.r "Fun"lr((cal(C) comma "Fun"lr((I comma cal(D))))) tilde.equiv "Fun"lr((I comma "Fun"lr((cal(C) comma cal(D))))) $

where the first functor comes from the constant functor
$Delta colon cal(D) arrow.r "Fun"lr((I comma cal(D)))$ coincides with
the constant functor

$ "Fun"lr((cal(C) comma cal(D))) arrow.r "Fun"lr((I comma "Fun"lr((cal(C) comma cal(D))))) $

Indeed, a functor $A colon cal(C) arrow.r cal(D)$ is sent under $Delta$
to the functor

$ x in cal(C) arrow.r.bar lr((i in I arrow.r.bar A lr((x)))) $

Viewed as a functor $I arrow.r "Fun"lr((cal(C) comma cal(D)))$ this is

$ i in I arrow.r.bar lr((x in cal(C) arrow.r.bar A lr((x)))) $

i.e. the constant functor.

But then the functor
$"Fun"lr((cal(C) comma "Fun"lr((I comma cal(D))))) arrow.r "Fun"lr((cal(C) comma cal(D)))$
is right adjoint to the constant functor and is hence the limit functor.

The dual statement is proved similarly.]

#corollary[
    Since $Set$ is complete and cocomplete, $ Psh(cC) = Fun(cC^op, Set) $ is complete and cocomplete.
]

Recall Yoneda Funcor $Y : cC -> Psh(cC)$ is fully faithful. Essential image $Psh(cC)^"repr"$ representable functors.
For all $x in cC$, $Y(x): cC^op -> Set$ preserves limits (colimits in $cC$ sent to limits in $Set$). It does not preserve colimits. 

#example[
    In $Set$, $ hom(X, A_1 product.co A_2) != hom(X, A_1) product.co hom(X, A_2) $
    Suppose finite, then LHS has cardinality $(abs(A_1) + abs(A_2))^abs(X)$ while RHS has cardinality $abs(A_1)^abs(X) + abs(A_2)^abs(X)$. 
]

We have $Y(x_1 product.co x_2) != Y(x_1) product.co Y(x_2)$. $Y$ does not preserve colimits.

#theorem[
    // Let $cC$ be a small category. There exists an equivalence of categories 
Let $cal(C)$ be a small category and $cal(D)$ a category
which has small colimits. Then we have an equivalence of categories

$ "Fun"^("colim") lr((Psh(cal(C)) comma cal(D))) tilde.equiv "Fun"lr((cal(C) comma cal(D))) comma $

where the category on the left is the full subcategory of functors which
preserve small colimits.
]

#proof[
    Step 1. Every preshef is a colimit of representable functors. Every $Gamma: cC^op -> Set$ is $Gamma iso colim_(epsilon(Gamma)) P_Gamma$ where $P_Gamma : epsilon(Gamma) -> Psh(cC)^"repr"$.

    Step 2. Let $F: cC->cD$. Want to construct $hat(F): Psh(cC) -> cD$ which preserves colimits. 

    $Gamma in Psh(cC)$, $Gamma iso colim_(epsilon(Gamma)) P_Gamma mapsto $

    TODO See notes Corollary 4.10.
]

== Adjoint functor theorems

Assumption $alpha$: $F: cC -> cD$ preserves colimits (is cocontinous). $cC, cD$ are small and $cC$ is cocomplete. 

Under some further condition, $F$ has a right adjoint. 

The general theorem: Freyd's adjoint functor theorem. Proof in the lecture notes, not examinable.
#theorem[
Under assumption $alpha$, 
$F$ has a right adjoint iff for all $y in cD$, the comma category $(F=>y)$ satisfies the solution set condition. 
]

#definition[
    A category $cal(E)$ satisfies the *solution set condition* if there exists a set $I$ and objects $x_i in cal(E)$ for all $i in I$ such that for all $x in cal(E)$, there exists an arrow $x_i -> x$ for some $i$. 
]

Dual statement: $cC$ is complete, $F$ preserves limits (is continuous). $F$ has a left adjoint if and only if for all $x$, $(x => F)$ satisfies the solution set condition.

#example[
    $ "Forget": Grp -> Set$ creates limits. (MacLane) So it is continuous. $Grp$ is complete because $Set$ is. TODO
]

#endlec(12)

= Monads

This is the lecture you've all been waiting for.

#definition[
    A *monad* on a category $cC$ is an endofunctor $T: cC -> cC$ together with natural transformations:
    - multiplication: $mu: T^2 => T$ and
    - unit: $eta: id_cC => T$,
    such that diagrams commute:
    - associativity #TODO,
    - unit #TODO.
]

#example[
    Let $A$ be a unital associative $k$-algebra (for example, $A = M_(n times n)(k)$). Let $T : veck -> veck $ be $V mapsto A tpk V$. $A$ has multiplication $mu_A : A tp A -> A$ such that $a tp b mapsto a dot b$ and $eta_A : k -> A$ such that $1 mapsto e_A$. 

    Monad on $T$. $mu$:
    $
        T^2(V) = A tp (A tp V) = (A tp A) tp V -->^(mu_a tp id_V) A tp V = T(V)
    $
    $eta_V$:
    $
        V = k tpk V -->^(eta_A tp id_V) A tp V = T(V)
    $
    Verify the axioms #TODO
]
#example[
    Power sets. 
    $
        P : Set &-> Set \
        P(A) &= "power set of" A\
        P(f: A-> B) &= f_* : P(A) -> P(B)
    $
    where  for $S subset.eq A$, $f_ast (S) = f(S)$.
    
    Multiplication. 
    $
        mu_A: P^2(A) &-> P(A) \
        { S_i subset.eq A : i in I} &mapsto union.big_i S_i 
    $
    Unit. 
    $
        eta_A : A &-> P(A) \
        a &mapsto {a} 
    $
    #TODO verify the axioms
    
]

#definition[
    A *comonad* is a monad on $cC^op$, which has $T: cC -> cC$ with 
    - comultiplication $Delta : T => T^2$ and
    - counit $epsilon : T => id_cC$.
    Axioms as above but flip all the arrows.
]

#example[
    A coalgebra. Group algebra. Universal enveloping algebra of $a$. don't really know what he's talking about
    #TODO
]

#proposition[
    $F: cC arrows.lr cD : G$ and $F tack.l G$. Then $G F : cC -> cC$ is a monad and $F G : cD -> cD$ is a comonad, where $eta : id_cC => G F$ (the unit of adjunction) and $mu : G (F G) F ==>^(id_G oo epsilon oo id_F) F G F$ make the monad; $epsilon: F G => id_cD$ and $Delta: F G ==>^(id_F oo eta oo id_G) F (G F ) G$ make the comonad.
]
#proof[
    Take the first triangle and compose on the left with $id_G$...
    #TODO read the lecture notes
]

#example[
    $Set arrows.lr^"Forget"_"Free" Ab$ with $F = "Free" tack.l "Forget" = G$. Monad $T = G F : Set -> Set$. 
    
    $F(S)$ is finite formal $ZZ$-linear combination of elements of $S$, i.e. $F(S) = sum k_s s$, where $s in S$ and $k_s in ZZ$, only finitely many of which are nonzero. This is an abelian group with pointwise addition.

    On the other hand, $T(S)$ is the set of $sum k_s s$, forgetting the group structure. 

    $epsilon_A$ for $"Free" oo "Forget"$ is the evaluation. (?) #TODO
]

#example[ Interesting...
    Giry monad (probablity) 
    - Michele Giry "Categorical Probablity Theory" 
    - Tom Avery "Codensity and the Giry monad"
]

#endlec(13)