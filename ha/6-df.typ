#import "../libs/template.typ": *
= Derived Functors
<derived-functor>

== Homological $delta$-functors

@weibel[Section 2.1]. The next two definitions are stated separately for clarity.
#definition[
  Let $cA, cB$ be abelian categories. A *homological $delta$-functor* $T$ from $cA$ to $cB$
  is a collection of additive functors ${T_n : cA -> cB}_(n >= 0)$ such that
  #enum(
    block(width: 100%)[
      (Existence of $delta$). For each #sest $ses(A, B, C)$ in $cA$, there exist morphisms
      $delta_n : T_n (C) -> T_(n-1)(A)$
      for $n >= 1$ such that $ ... -> T_(n+1)(C) ->^delta T_n (A) -> T_n (B) -> T_n (C) rgt(delta) T_(n-1)(A) -> ... \ -> T_1 (C)   ->^delta T_0 (A)  -> T_0 (B)  -> T_0 (C) -> 0 $
      is a #lest in $cB$. In particular, $T_0$ is right exact;
    ],
    [
      (Naturality of $delta$). For each morphism of #sess from $ses(A', B', C')$ to $ses(A, B, C)$, the $delta$'s above give a commutative diagram
      // #align(center,image("../imgs/2023-11-24-19-38-59.png",width:30%)
      // https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBpiBdUkANwEMAbAVxiRABUB9MAAgAoAwgHIAlCAC+pdJlz5CKAIzkqtRizZc+YALQKR-AIKiJUkBmx4CRMgpX1mrRB278BYydItyiS29XvqTpo6eobuKjBQAObwRKAAZgBOEAC2SGQgOBBIAEweIEmpSEqZ2YgAzPmFaYg51FlI5f5qjiCwDDh0JgnJNRkNiCUBre2dEhTiQA
      #align(
        center,
        commutative-diagram(
          node-padding: (50pt, 50pt),
          node((0, 0), [$T_n (C')$]),
          node((0, 1), [$T_(n-1) (A')$]),
          node((1, 0), [$T_n (C)$]),
          node((1, 1), [$T_(n-1) (A)$]),
          arr((0, 0), (1, 0), []),
          arr((0, 1), (1, 1), []),
          arr((1, 0), (1, 1), [$delta$]),
          arr((0, 0), (0, 1), [$delta$]),
        ),
      )
    ],
  )
]

#definition[
  Let $cA, cB$ be abelian categories. A *cohomological $delta$-functor* $T$ from $cA$ to $cB$ is a collection of additive functors ${T^n : cA -> cB}_(n >= 0)$ such that


  #enum(
    block(width: 100%)[
      (Existence of $delta$). For each #sest $ses(A, B, C)$ in $cA$, there exist morphisms
      $delta^n : T^n (C) -> T^(n+1)(A)$
      for $n >= 0$ such that
      $
        0 -> T^0 (A) -> T^0 (B) -> T^0 (C) ->^delta T^1 (A) -> ... \ -> T^(n-1)(C) ->^delta T^n (A) -> T^n (B) -> T^n (C) rgt(delta) T^(n+1)(A) -> ...
      $
      is a long exact sequence in $cB$. In particular, $T^0$ is left exact;
    ],
    [
      (Naturality of $delta$). For each morphism of #sess from $ses(A', B', C')$ to $ses(A, B, C)$, the $delta$'s above give a commutative diagram
      // #align(center,image("../imgs/2023-11-24-19-39-14.png",width:30%))
      // https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBpiBdUkANwEMAbAVxiRABUA9MAAgAoAwgHIAlCAC+pdJlz5CKAIzkqtRizZc+YANQKR-AIKiJUkBmx4CRMgpX1mrRB278BYydItyiS29XvqTpo6eobuKjBQAObwRKAAZgBOEAC2SGQgOBBIAEweIEmpSEqZ2YgAzPmFaYg51FlI5f5qjiCwDDh0JgnJNRkNiCUBre2dEhTiQA
      #align(
        center,
        commutative-diagram(
          node-padding: (50pt, 50pt),
          node((0, 0), [$T^n (C')$]),
          node((0, 1), [$T^(n+1) (A')$]),
          node((1, 0), [$T^n (C)$]),
          node((1, 1), [$T^(n+1) (A)$]),
          arr((0, 0), (1, 0), []),
          arr((0, 1), (1, 1), []),
          arr((1, 0), (1, 1), [$delta$]),
          arr((0, 0), (0, 1), [$delta$]),
        ),
      )
    ],
  )
]


#example[
  Homology gives a homological $delta$-functor
  $
    {H_n : Ch_(>= 0)(cA) -> cA}_(n >= 0),
  $
  where $Ch_(>=0) (cA)$ is the (full) subcategory of $Ch(cA)$ whose objects are chain complexes $C_cx$ such that $C_n = 0$ for all $n < 0$.

  Similarly, cohomology gives a cohomological $delta$-functor $ {H^n : Ch^(>= 0) (cA) -> cA}_(n >= 0), $
  where $Ch^(>= 0) (cA)$ is defined similarly.
]

#example[
  If $p$ is an integer, the collection ${T_n : Ab -> Ab}_(n>=0)$ of functors defined by
  $
    T_n (A) = cases(
    A over p A quad& n = 0,
     zws_p A := brace.l a in A colon p a eq 0 brace.r quad& n = 1,
     0 quad& n >= 2
    )
  $
  form a homological $delta$-functor (or a cohomological
  $delta$-functor with $T^0 eq T_1$ and $T^1 eq T_0$).]
#proof[Apply the @snake[Snake Lemma] to the commutative diagram
  // https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBpiBdUkANwEMAbAVxiRGJAF9T1Nd9CKAIzkqtRizYBBLjxAZseAkQBMo6vWatEIAEKzeigUQDM68VrYBhA-L5LByACznNknR26H+ylGSFibtrstgo+jiIBGhLBMl52Rr7IalEW7nqh9sYoZqlB1pmJji55MWyeYjBQAObwRKAAZgBOEAC2SCIgOBBIAGzRljpots1tSGpdPYgA7APpw-Gj7Yhmk0gAHHPBC3JLSGRriEKLLcud3eMnY4gTFytXy6t3Tg9IAKzUd72viP2H0z9Zod1j9NocAJycCicIA
  #align(
    center,
    commutative-diagram(
      node-padding: (50pt, 50pt),
      node((0, 0), [$0$]),
      node((0, 1), [$A$]),
      node((0, 2), [$B$]),
      node((0, 3), [$C$]),
      node((0, 4), [$0$]),
      node((1, 0), [$0$]),
      node((1, 1), [$A$]),
      node((1, 2), [$B$]),
      node((1, 3), [$C$]),
      node((1, 4), [$0$]),
      arr((0, 1), (1, 1), [$p$]),
      arr((0, 2), (1, 2), [$p$]),
      arr((0, 3), (1, 3), [$p$]),
      arr((0, 0), (0, 1), []),
      arr((0, 1), (0, 2), []),
      arr((0, 2), (0, 3), []),
      arr((0, 3), (0, 4), []),
      arr((1, 0), (1, 1), []),
      arr((1, 1), (1, 2), []),
      arr((1, 2), (1, 3), []),
      arr((1, 3), (1, 4), []),
    ),
  )
  where $A ->^p A$ is the map of multiplication by $p$ and so on, so that we
  //  #align(center,image("../imgs/2023-11-06-21-52-48.png",width:50%))
  get the exact
  sequence
  $
    0 arrow.r zws_p A arrow.r zws_p B arrow.r zws_p C arrow.r^delta A slash p A arrow.r B slash p B arrow.r C slash p C arrow.r 0.
  $


  // For any integer $p$, define $T_(0)(A) = A over p A$ and $T_1(A) = p A = {a in A | p a = 0}$ and $T_n = 0$ for $n >= 2$ gives a homological $delta$-functor from $Ab -> Ab$, by the Snake Lemma,
  // TODO
]

#let dftor = [$delta$-functor]

#definition[
  A *morphism* $f: S->T$ of homological (resp. cohomological) $delta$-functors is a collection of natural transformations ${f_n : S_n -> T_n}_(n>=0)$ (resp. ${f^n : S^n -> T^n}_(n>=0)$) which commutes with $delta$. ]
#remark[
  This definition is equivalent to saying that there is a commutative "ladder diagram" connecting
  the long exact sequences for $S$ and $T$ associated to any short exact
  sequence in $cA$.
]
#definition[
  A homological $delta$-functor $T = {T_n}$ is *universal* if, given any other homological $delta$-functor $S = {S_n}$ and a natural transformation $f_0: S_0 -> T_0$, there exists a unique morphism $ f = {f_n : S_n -> T_n}_(n>=0) : S-> T $ extending $f_0$.

  // A cohomological #dftor $T$ is *universal* if given $S$ and $f^0 : T^0 -> S^0$, there exists a unique extension $T->S$.

  A *universal* cohomological $delta$-functor $T$ is similarly defined.
]

#example[
  If $F : cA -> cB$ is an exact functor, then $T_0 = F$ and $T_n = 0$ for $n != 0$ defines a universal homological #dftor $T : cA -> cB$.
]

// How to construct a universal #dftor? In categories with enough projectives or injectives, derived functors work.


== Derived Functors


The main object of this section is to show that in an abelian category with enough projectives, left derived functors, defined as follows, are homological $delta$-functors.
#definition[
  Let $cA$ and $cB$ be two abelian categories and
  let $F : cA -> cB$ be a right exact functor. Assume that $cA$ has enough projectives. For any $A in cA$, pick a projective resolution $P_(cx) -> A$ by @enough-resolution. Then $L_i F$ given by $ L_i F(A) := H_i (F(P))  $ is called the *$i$-th left derived functor*.
]
<left-derived-functor>

#remark[ @rotman[p. 344].
  To elaborate, given $F : cA -> cB$ and $A in cA$, to calculate $L_i F(A)$ we need the following steps:
  + #fw[Find a projective resolution of $A$ in $cA$:
      $
        ... -> P_2 -> P_1 -> P_0 -> A -> 0;
      $
    ]
  + Delete $A$ to form the *deleted projective resolution*, i.e., the chain complex $ ... -> P_2 -> P_1 -> P_0 -> 0, $ (which is not exact at $P_0$ unless $A = 0$);
  + Apply $F$ to form a chain complex in $cB$: $ ... -> F(P_2) -> F(P_1) -> F(P_0) -> 0; $
  + Calculate the $i$-th homology $H_i (F (P))$ of this chain complex.
  // Now let $f: A -> B$ be a morphism in $cA$. To find $L_i F (f)$, we can find projective resolutions $P_cx -> A$ and $Q_cx -> B$, and by the @comparison[Comparison Theorem], there exists a chain map $f_cx : P_cx -> Q_cx$ lifting $f$. Then $L_i F (f) := H_i (F(f_cx))$, obtained in a similar fashion as above.
]
In fact, our definition of the "functor" $L_i F$ is still incomplete as we have not defined how it maps the morphisms in $cA$. However, we first need to show that for any object $A in cA$, our definition of $L_i F (A)$ is independent of the choice of projective resolution $P_cx -> A$. The following implies the case when $i = 0$.
#lemma[
  $L_0 F(A) iso F(A)$.
]

#proof[ Consider the projective resolution of $A$:
  $
    ... P_1 ->^(d_1) P_0 -> A -> 0
  $

  By definition, $L_0 F(A) = H_0(F(P)) iso Coker(F(d_1))$. Since $F$ is right exact, it preserves cokernels, so $Coker(F(d_1)) iso F(Coker(d_1)) = F(A)$.
]

// Notice that the previous lemma indicates that the choice of $P_cx$ does not affect $L_0 F $. This in fact holds in general for all $L_i F$, which indicates that $L_i F$ is well-defined.

#lemma[ Let $cA, cB, F, A$ be defined as in @left-derived-functor.
  If $P_cx -> A$ and $Q_cx -> A$ are two projective resolutions, then there is a canonical isomorphism
  $ H_i (F(P)) iso H_i (F(Q)) $
]

#proof[
  By the @comparison[Comparison Theorem], there is a chain map $f: P_cx -> Q_cx$ lifting the identity $id_A : A->A$, which gives $f_ast : H_i F(P) -> H_i F(Q)$. Notice that any other lift $f' : P_cx -> Q_cx$ is chain homotopic to $f$ so $f_ast = f'_ast$,
  so $f_ast$ is canonical.
  We can also lift $id_A$ to a map $g: Q_cx -> P_cx$ and get $g_ast : H_i F(Q) -> H_i F(P)$.

  Notice $g oo f : P_cx -> P_cx$ and $id_P : P_cx -> P_cx$ are both chain maps lifting $id_A$, and by the @comparison[Comparison Theorem] they are chain homotopic. Therefore
  $g_* oo f_* = (g oo f)_* = (id_P)_*.$
  Similarly,
  $f_* oo g_* = (id_Q)_*,$
  which gives an isomorphism $H_i (F(P)) iso H_i (F(Q)) $.
]

#corollary[
  If $A$ is projective, then $L_i F (A) = 0$ for $i != 0$.
]
<projective-left-zero>

#proof[
  Simply notice that $... -> 0 -> A -> A -> 0 $
  is a projective resolution of $A$.
]

Now we complete the definition of $L_i F$ and prove that it is indeed a functor.

#lemma[
  If $f : A' -> A$ a morphism in $cA$, then there is a natural map $ L_i F(f) : L_i F(A') -> L_i F(A) $
]
#proof[
  Let $P'_cx -> A'$ and $P_cx -> A$ be projective resolutions. By the @comparison[Comparison Theorem], $f$ lifts to a chain map $tilde(f) : P'_cx -> P_cx$, which gives a map $tilde(f_ast) : H_i F(P') -> H_i F(P)$. As any other lift is chain homotopic to $tilde(f)$, the map $tilde(f_ast)$ is independent of the lift.
]

#proposition[
  $L_i F : cA -> cB$ is an additive functor.
]
#proof[
  Let $A in cA$ and $P_cx -> A$ be a projective resolution.
  The chain map $id_P$ lifts $id_A$, so $L_i F(id_A) = id_(L_i F(A))$.
  Given $A' rgt(f) A rgt(g) A''$ in $cA$ and projective resolutions $P'_cx -> A'$, $P_cx -> A$, and $P''_cx -> A''$, we obtain lifts $tilde(f) : P'_cx -> P_cx$ and $ tilde(g) : P_cx -> P''_cx$. Then the composition $tilde(g) oo tilde(f ) : P' -> P''$ is a lift of $g oo f$, so $g_ast oo f_ast = (g f)_ast : H_i F(P') -> H_i F(P'')$. Therefore, $L_i F$ is a functor.

  If chain maps $tilde(f_1), tilde(f_2) : P'_cx -> P_cx$ lift $f_1, f_2 : A' -> A$, then the chain map $tilde(f_1) + tilde(f_2)$ lifts $f_1 + f_2$, so $f_(1 ast) + f_(2 ast) = (f_1 + f_2)_ast : H_i F(P') -> H_i F(P)$. Therefore, $L_i F$ is an additive functor.
]

#theorem[
  Let $F : cA -> cB$ be a right exact functor, then
  ${L_i F}_(i >= 0)$ forms a universal homological #dftor.
]
// We never use the fact that it is universal. Check the book for proof.
#proof[
  @weibel[Theorem 2.4.6 and Theorem 2.4.7].
  First notice that $L_0 F = F$ is right exact.
  Given a #sest $ ses(A', A, A'') $ and projective resolutions $P'_cx -> A'$ and $P''_cx -> A''$, by the @horseshoe[Horseshoe Lemma], there is a projective resolution $P_cx -> A$ such that $ses(P'_cx, P_cx, P''_cx)$ is a #sest of chain complexes and for each $n$, $ses(P'_n, P_n, P''_n)$ is split. Since $F$ is additive, by @additive-preserve-biproduct, $F$ preserves biproducts and thus preserves split exact sequences, so $
    ses(F(P'_n), F(P_n), F(P''_n))
  $
  is split exact in $cB$. (Notice that $F$ is not necessarily an exact functor, so $ses(P'_n, P_n, P''_n)$ being split is crucial.) Hence
  $
    ses(F(P'_cx), F(P_cx), F(P''_cx))
  $
  is a #sest of chain complexes. Hence applying homology gives the connecting homomorphisms and a #lest

  $
    ... -> L_(n+1) F(A'') ->^delta L_n F(A') -> L_n F(A) -> L_n F(A'') ->^delta L_(n-1) F(A') -> ...
  $

  by @connecting.

  We omit the proofs that $delta$'s are natural and that ${L_i F}_(i >= 0)$ is universal.
]

#endlec(9)
#definition[
  Let $cA$ and $cB$ be two abelian categories and
  let $F : cA  -> cB$ be a left exact functor. Assume that $cA$ has enough injectives and for any $A in cA$ we have an injective resolution $A -> I^cx$. Then the *$i$-th right derived functor* $R^i F$ is defined as
  $ R^i F (A) := H^i (F (I^cx)) $
]
// If $F : cA  -> cB$ is left exact, we can define the right derived functor $R^i F(A) = H^i F(I)$ for $A -> I^cx$.

#note[ $R^i F(A) = (L_i F^op)^op (A)$.]

#corollary[
  Let $F: cA -> cB$ be a left exact functor, then ${R^i F}_(i >= 0)$ forms a universal cohomological $delta$-functor.
]