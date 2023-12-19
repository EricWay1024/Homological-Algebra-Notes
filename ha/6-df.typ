#import "../libs/template.typ": *
= Derived Functors

== Homological $delta$-functors

@weibel[Section 2.1]. The next two definitions are stated separately for clarity.
#definition[
  Let $cA, cB$ be abelian categories. A *homological $delta$-functor* $T$ from $cA$ to $cB$ 
  is a collection of additive functors  ${T_n : cA -> cB}_(n >= 0)$ such that 
  #enum(block(width: 100%)[
    $T_0$ is right exact;
  ],[
    For each #sest $ses(A, B, C)$ in $cA$, there exist morphisms 
  $delta_n : T_n (C)  -> T_(n-1)(A) $ 
  for $n >= 1$ such that $ ... -> T_(n+1)(C) ->^delta T_n (A) -> T_n (B) -> T_n (C) rgt(delta) T_(n-1)(A) -> ... $
    is a #lest in $cB$;
  ],
  [
    For each morphism of #sess from $ses(A', B', C')$ to $ses(A, B, C)$, the $delta$'s above give a commutative diagram 
    // #align(center,image("../imgs/2023-11-24-19-38-59.png",width:30%)
    // https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBpiBdUkANwEMAbAVxiRABUB9MAAgAoAwgHIAlCAC+pdJlz5CKAIzkqtRizZc+YALQKR-AIKiJUkBmx4CRMgpX1mrRB278BYydItyiS29XvqTpo6eobuKjBQAObwRKAAZgBOEAC2SGQgOBBIAEweIEmpSEqZ2YgAzPmFaYg51FlI5f5qjiCwDDh0JgnJNRkNiCUBre2dEhTiQA
#align(center, commutative-diagram(
  node-padding: (50pt, 50pt),
  node((0, 0), [$T_n (C')$]),
  node((0, 1), [$T_(n-1) (A')$]),
  node((1, 0), [$T_n (C)$]),
  node((1, 1), [$T_(n-1) (A)$]),
  arr((0, 0), (1, 0), []),
  arr((0, 1), (1, 1), []),
  arr((1, 0), (1, 1), [$delta$]),
  arr((0, 0), (0, 1), [$delta$]),
))
  ])
]

#definition[
  Let $cA, cB$ be abelian categories. A *cohomological $delta$-functor*  $T$ from $cA$ to $cB$ is a collection of additive functors  ${T^n : cA -> cB}_(n >= 0)$ such that
  

  #enum(block(width: 100%)[
    $T^0$ is left exact;
  ],
  [
    For each #sest $ses(A, B, C)$ in $cA$, there exist morphisms 
  $delta^n : T^n (C)  -> T^(n+1)(A) $
  for $n >= 0$ such that 
    $ ... -> T^(n-1)(C) ->^delta T^n (A) -> T^n (B) -> T^n (C) rgt(delta) T^(n+1)(A) -> ... $
    is a long exact sequence in $cB$;
  ],
  [
    For each morphism of #sess from $ses(A', B', C')$ to $ses(A, B, C)$, the $delta$'s above give a commutative diagram 
    // #align(center,image("../imgs/2023-11-24-19-39-14.png",width:30%))
    // https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBpiBdUkANwEMAbAVxiRABUA9MAAgAoAwgHIAlCAC+pdJlz5CKAIzkqtRizZc+YANQKR-AIKiJUkBmx4CRMgpX1mrRB278BYydItyiS29XvqTpo6eobuKjBQAObwRKAAZgBOEAC2SGQgOBBIAEweIEmpSEqZ2YgAzPmFaYg51FlI5f5qjiCwDDh0JgnJNRkNiCUBre2dEhTiQA
#align(center, commutative-diagram(
  node-padding: (50pt, 50pt),
  node((0, 0), [$T^n (C')$]),
  node((0, 1), [$T^(n+1) (A')$]),
  node((1, 0), [$T^n (C)$]),
  node((1, 1), [$T^(n+1) (A)$]),
  arr((0, 0), (1, 0), []),
  arr((0, 1), (1, 1), []),
  arr((1, 0), (1, 1), [$delta$]),
  arr((0, 0), (0, 1), [$delta$]),
))
  ])
]


#example[
  Homology gives a homological $delta$-functor
  $ 
    {H_n : Ch_(>= 0)(cA) -> cA}_(n >= 0)
  $
  where $Ch_(>=0) (cA)$ is the (full) subcategory of $Ch(cA)$ whose objects are chain complexes $C_cx$ such that $C_n = 0$ for all $n < 0$.

  Similarly, cohomology gives a cohomological $delta$-functor $ {H^n : Ch^(>= 0) (cA) -> cA}_(n >= 0) $
  where $Ch^(>= 0) (cA)$ is defined similarly.
]

#example[
   If $p$ is an integer, the collection ${T_n : Ab -> Ab}_(n>=0)$ of functors defined by
   $ T_n (A) = cases(
    A over p A quad& n = 0,
     zws_p A := brace.l a in A colon p a eq 0 brace.r quad& n = 1,
     0 quad& n >= 2
    ) $
 form a homological $delta$-functor (or a cohomological
$delta$-functor with $T^0 eq T_1$ and $T^1 eq T_0$).] 
#proof[Apply the @snake[Snake Lemma] to the commutative diagram
// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBpiBdUkANwEMAbAVxiRGJAF9T1Nd9CKAIzkqtRizYBBLjxAZseAkQBMo6vWatEIAEKzeigUQDM68VrYBhA-L5LByACznNknR26H+ylGSFibtrstgo+jiIBGhLBMl52Rr7IalEW7nqh9sYoZqlB1pmJji55MWyeYjBQAObwRKAAZgBOEAC2SCIgOBBIAGzRljpots1tSGpdPYgA7APpw-Gj7Yhmk0gAHHPBC3JLSGRriEKLLcud3eMnY4gTFytXy6t3Tg9IAKzUd72viP2H0z9Zod1j9NocAJycCicIA
#align(center, commutative-diagram(
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
))
where $A ->^p A$ is the map of multiplication by $p$ and so on, so that we 
//  #align(center,image("../imgs/2023-11-06-21-52-48.png",width:50%))
get the exact
sequence
$ 0 arrow.r zws_p A arrow.r zws_p B arrow.r zws_p C arrow.r^delta A slash p A arrow.r B slash p B arrow.r C slash p C arrow.r 0 $


  // For any integer $p$, define $T_(0)(A) = A over p A$ and $T_1(A) = p A = {a in A | p a = 0}$ and $T_n = 0$ for $n >= 2$ gives a homological $delta$-functor from $Ab -> Ab$, by the Snake Lemma,
  // TODO
]

#let dftor = [$delta$-functor]

#definition[
  A *morphism* $f: S->T$ of homological (resp. cohomological) $delta$-functors is a collection of natural transformations ${f_n : S_n -> T_n}_(n>=0)$ (resp. ${f^n : S^n -> T^n}_(n>=0)$) which commutes with $delta$.  ]
  #remark[
    This definition is equivalent to saying that there is a commutative ladder diagram connecting
the long exact sequences for $S$ and $T$ associated to any short exact
sequence in $cA$.
  ]
#definition[
   A homological  $delta$-functor $T = {T_n}$ is *universal* if, given any other homological $delta$-functor $S = {S_n}$ and a natural transformation $f_0: S_0 -> T_0$, there exists a unique morphism $ f = {f_n : S_n -> T_n}_(n>=0) : S-> T $  extending $f_0$. 

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
  let $F : cA -> cB$ be a right exact functor. Assume that $cA$ has enough projectives. For any $A in cA$, pick a projective resolution $P_(cx) -> A$ by @enough-resolution. Define $ L_i F(A) := H_i (F(P))  $ as the *$i$-th left derived functor*.
]
<left-derived-functor>

Since $F(P_1) -> F(P_0) arrow F(A) -> 0$ is exact, we always have $L_0 F(A) iso F(A)$.

#remark[   @rotman[p. 344].
  To elaborate, given $F : cA -> cB$ and $A in cA$, to calculate $L_i F(A)$ we need the following steps: 
  + #fw[Find a projective resolution of $A$ in $cA$:
  $
    ... -> P_2 -> P_1 -> P_0 -> A -> 0
  $
  ]
  + Delete $A$ to form the *deleted projective resolution*, i.e., the  chain complex $ ... -> P_2 -> P_1 -> P_0 -> 0 $ (which is not exact at $P_0$ unless $A = 0$);
  + Apply $F$ to form a chain complex in $cB$: $ ... -> F(P_2) -> F(P_1) -> F(P_0) -> 0 $ 
  + Calculate the $i$-th homology $H_i (F (P))$ of this chain complex.

  Now let $f: A -> B$ be a morphism in $cA$. To find $L_i F (f)$, we can find projective resolutions $P_cx -> A$ and $Q_cx -> B$, and by the @comparison[Comparison Theorem], there exists a chain map $f_cx : P_cx -> Q_cx$ lifting $f$. Then $L_i F (f) := H_i (F(f_cx))$, obtained in a simiar fashion as above.
]

Now we show that the choice of projective resolutions in the definition does not matter.

#lemma[ Let $cA, cB, F, A$ be defined as in @left-derived-functor.
  If $P_cx -> A$ and $Q_cx -> A$ are two projective resolutions, then there is a canonical isomorphism 
  $ H_i (F(P_cx)) bij H_i (F(Q_cx)) $
]

#proof[
  By the @comparison[Comparison Theorem], there is a chain map $f: P_cx -> Q_cx$ lifting the identity $id_A : A->A$, unique up to homotopy, giving $f_ast : H_i F(P_cx) -> H_i F(Q_cx)$. Any other lift $f' : P_cx -> Q_cx$ is chain homotopic to $f$ so $f_ast = f'_ast$.
  (TODO)
  So $f_ast$ is canonical. We can also lift the identity to a map $g: Q_cx -> P_cx$, so we get $g_ast : H_i F(Q) -> H_i F(P)$. Notice we can compose the two maps and $g oo f : P_cx -> P_cx$ and $id_P : P_cx -> P_cx$ are both lifts of the identity. Then we apply the @comparison[Comparison Theorem] to $P$ itself, so $ g_* f_* = (g f)_* = (id_P)_* $ and similarly 
  $ f_* g_* = (id_Q)_* $
]

#corollary[
  If $A$ is projective, then $L_i F (A) = 0$ for $i != 0$.
]

#lemma[
  If $f : A' -> A$ a morphism in $cA$, then there is a natural map $ L_i F(f) : L_i F(A') -> L_i F(A) $ 
]
#proof[
  Let $P'_cx -> A'$ and $P_cx -> A$ be chosen resolutions. So $f$ lifts to a map $tilde(f) : P'_cx -> P_cx$. This gives a map $tilde(f_ast) : H_i F(P'_cx) -> H_i F(P_cx)$ as any other lift is homotopic to $tilde(f)$, the map $tilde(f_ast)$ is independent of the lift. 
]

#proposition[
  $L_i F$ is an additive functor from $cA$ to $cB$. 
]
#proof[
  It is the same again. $id_P$ lifts $id_A$. So $L_i F(id_A) = id_(L_i F(A))$. Given $A' rgt(f) A rgt(g) A''$ and lifts $tilde(f), tilde(g)$, then $tilde(g) oo tilde(f )$ is a lift of $g oo f$, so $g_ast oo f_ast = (g f)_ast$.  So $L_i F$ is a functor. 
  
  If $f_1, f_2 : A' -> A$ with lifts $tilde(f_1), tilde(f_2)$, then $tilde(f_1) + tilde(f_2)$ lifts $f_1 -> f_2$, so $f_(1 ast) + f_(2 ast) = (f_1 + f_2)_ast$. So $L_i F$ is additive.
] 

#theorem[
  ${L_i F}$ form a homological #dftor. They form a universal homological #dftor.
]
We never use the fact that it is unviersal. Check the book for proof.
#proof[
  Given a #sest $ ses(A', A, A'') $ and projective resolutions $P' -> A'$ and $P'' -> A''$, there is a projective resolution $P-> A$ such that $ses(P', P, P'')$ is a #sest of resolutions and $ses(P'_n, P_n, P''_n)$ is split (being split is important!) by the Horseshoe Lemma. As $F$ is additive, $
    ses(F(P'_n), F(P_n), F(P''_n))
  $
  is still exact in $cB$. Hence 
  $
    ses(F(P'), F(P), F(P''))
  $
  is a #sest of complexes. Hence we have the connecting maps and it gives a #lest.
]
#endlec(9)
#definition[
  Let $F : cA  -> cB$ be a left exact functor between two abelian categories. Assume $cA$ has enough injectives and for any $A in cA$ we have injective resolution $A -> I^cx$. Then the *$i$-th right derived functor*  is
  $ R^i F (A) := H^i (F (I^cx)) $
]
// If $F : cA  -> cB$ is left exact, we can define the right derived functor $R^i F(A) = H^i F(I)$ for $A -> I^cx$.

Note: $R^i F(A) = (L_i F^op)^op (A)$.
== Defining $Ext$ and $Tor$ 

#definition[
  Let $cA$ be an abelian category.
Recall that $Hom(A)(A, -): cA -> Ab$ is left exact.
  If $cA$ has enough injectives, we can define 
  $ Ext_cA^i (A, B):= R^i Hom(A)(A, -)(B) = H^i (Hom(A) (A, I^cx)) $
  where $B -> I^cx$ is an injective resolution.
]
#proposition[
  We have the following equivalences:
  - $B$ is injective;
  - $Hom(A)(-, B)$ is exact;
  - $Ext_cA^i (A, B) = 0$ for $i !=0$ and all $A$;
  - $Ext_cA^1 (A, B) = 0$ for all $A$.

  Similarly,
  - $A$ is projective;
  - $Hom(A)(A, -)$ is exact;
  - $Ext_cA^i (A, B) = 0$ for $i !=0$ and all $B$;
  - $Ext_cA^1 (A, B) = 0$ for all $B$.
]
#proof[
  We need to prove $
    Ext^*_cA (A, B) iso R^ast Hom(A) (-, B)(A)
  $
]

#definition[
  Let $R$ be a ring and $B$ be a left $R$-module. $- tpr B : ModR -> Ab$ is right exact, so we can define  
  $ Tor_n^R (A, B) = L_n (- tpr B) (A) $
]


We will prove: 

$ L_n (- tpr B) (A) iso L_n (A tpr -) (B) $

This is called the balancing of $Tor$. We need two new tools to prove this: mapping cones and double complexes. 

#TODO #lest induced by $Tor$ and $Ext$
