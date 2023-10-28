#import "template.typ": *
#import "var.typ": *
#import "commute.typ": node, arr, commutative-diagram

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

    In this case we denote $F tack.l G$ and we say that $F$ is adjoint to $G$ and $G$ is right adjoint to $F$. 
]

#image("2023-10-27-18-55-27.png")

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