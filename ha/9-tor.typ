#import "../libs/template.typ": *

= $Tor$ and Flatness
<tor-flat>

== Flat Modules

#definition[
  A #lrm $B$ is *flat* if $ (- tpr B)$ is exact. A #rrm $A$ is *flat* if $  (A tpr -)$ is exact.
]

// #remark[
//   #TODO link to algebraic geometry, algebraic continunity
// //   In some sense flatness gives "continuity". It appears in algebraic geometry.
// // Assume $R$ is commutative, and let $M$ be an $R$-module. Then $tilde(M)$ quasi- ?? sheaf on $"Spec"(R)$.
// ]

// #proposition[
//   Free modules are flat.
// ]
// #proof[
//   Take free module $plus.circle.big _I R$ and any module $M$, then
//   $
//     M tpr plus.circle.big _I R iso plus.circle.big_I M tpr R iso plus.circle.big_I M
//   $
//   The functor $plus.circle.big_I$ is exact.
// ]

// #proposition[
//   Projective modules are flat.
// ]
// #proof[
//   Let $P$ be a projective module, then there exists module $Q$ such that $P xor Q$ is free. #TODO @rotman[Propositin 3.46]
// ]

// #remark[
//   We already used that projective modules are flat. First we have free modules are flat. Second, if $P xor Q$ is free (i.e. $P$ is projective) then $- tpr P$ is exact.
// ]

#proposition[
  Let $B$ a #lrm.
  The following are equivalent:
  + $B$ is flat;
  + $Tor_n^R (A, B) = 0$ for all $n > 0$ and all $A$;
  + $Tor_1^R (A, B) = 0$ for all $A$.

  Similarly, let $A$ be a #rrm. The following are equivalent:
  + $A$ is flat;
  + $Tor_n^R (A, B) = 0$ for all $n > 0$ and all $B$;
  + $Tor_1^R (A, B) = 0$ for all $B$.
]
<flat-tor>
#proof[@notes[Lemma 6.26]. We prove the #lrm case.

  (1) $=>$ (2). Suppose that $B$ is flat. Let $F_cx arrow.r A$ be a free
  resolution of $A$. Since $(minus times.circle_R B)$ is exact, the sequence
  $
    dots.h arrow.r F_2 times.circle_R B arrow.r F_1 times.circle_R B arrow.r F_0 times.circle_R B arrow.r A times.circle_R B arrow.r 0
  $
  is exact, so the homology of
  $
    dots.h arrow.r F_2 times.circle_R B arrow.r F_1 times.circle_R B arrow.r F_0 times.circle_R B arrow.r 0
  $
  vanishes in positive degree.

  (2) $arrow.r.double$ (3). Trivial.

  (3) $arrow.r.double$ (1). For any short exact sequence
  $0 arrow.r X arrow.r Y arrow.r A arrow.r 0$ in $ModR$, we have the long
  exact sequence of $Tor$ by @tor-les,
  $
    0 eq "Tor"_1^R lr((A comma B)) arrow.r X times.circle_R B arrow.r Y times.circle_R B arrow.r A times.circle_R B arrow.r 0,
  $
  which shows that $(- tpr B)$ is exact.

  Note that the #rrm case uses the balancing of $Tor$, but the proof is very similar.
]

#corollary[Every projective module is flat. In particular, every free module is flat. #footnote[We have already proven this claim in @projective-flat-1, because we needed it for the balancing of $Tor$ (@balance-tor). This second proof actually relies on the balancing of $Tor$ so we could not use it previously, but it is presented here regardless.]]
<projective-flat-2>
#proof[
  If a left $R$-module $P$ is projective, by @balance-tor and @projective-left-zero, $"Tor"_n^R lr((A comma P)) iso L_n (A tpr -) (P) eq 0$ for all $A$ and all
  $n gt.eq 1$. Then applying @flat-tor gives the result. The case where $P$ is a projective #rrm is similar.
]
// Another way to prove the corollary is found @rotman[Propositin 3.46].

// Recall that since the tensor product is left adjoint, it commutes with all colimits. Thus $ (colim_I A_i) tpr B iso colim_I (A_i tpr B) $


#definition[
  A category $I$ is called *filtered* if
  + $I$ is non-empty;
  + For any $i, j in I$, there exists $k in I$ with morphisms $f : i -> k$ and $g : j -> k$;
  + For any $i, j in I$ with a pair of morphisms $u, v : i -> j$, there exists $k in I$ with morphism $w : j -> k$ such that $w oo u = w oo v$.
]


#example[
  A non-empty partially ordered set (poset) $I$, viewed as a small category, is *filtered* if for any $i, j in I$, there exists $k$ such that $i <= k$ and $j <= k$. This is because condition (3) above is automatically satisifed, as there is at most one morphism $i -> j$ for any $i, j in I$.
]



#proposition[
  // For any small category $I$ and any functor $I -> ModR$, we have
  Let $I$ be a filtered category. Then the functor $ colim_I: Fun(I, RMod) -> RMod $ is exact.
]
<colim-exact>
#proof[@weibel[Theorem 2.6.15, p.57].]

#remark[
  $colim_I$ is not a exact functor in general if $I$ is not filtered.
]

#notation[
  Let $I$ be a small category and $A : I -> RMod$ be a diagram. We denote $A_i = A(i)$ for each $i in I$ and we would write $colim_I A_i$ to mean $colim_I A$.
]

#corollary[
  Let $I$ be a filtered category and $A : I -> ModR$ be a diagram. Let $B in RMod$. Then $Tor_n^R (colim_I A_i, B) iso colim_I Tor_n^R (A_i, B)$. In other words, filtered colimits commute with $Tor$.
]
<filter-tor>
#proof[
  Let $P_cx -> B$ be a projective resolution. Then
  $
    Tor_n^R (colim_I A_i , B ) &= H_n ((colim_I A_i) tpr P)
    \ &iso H_n (colim_I (A_i tpr P)) \
    &iso colim_I H_n (A_i tpr P) \
    &= colim_I Tor_n^R (A_i, B),
  $
  where at each step we respectively use the definition of $Tor$, that colimits commute with tensor products, that $colim_I$ is exact and thus commutes with homology, and the definition of $Tor$ again.
]

#corollary[
  Let $I$ be a filtered category and $A : I -> ModR$ be a diagram. Suppose $A_i$ is flat for all $i in I$. Then $colim_I A_i$ is also flat.
  In other words, a filtered colimit of flat $R$-modules is flat.
]
<filtered-flat-flat>
#proof[
  Take any $B in RMod$.
  Since each $A_i$ is flat, we know that $Tor_1 (A_i , B) = 0$ by @flat-tor. Then
  $
    Tor_1 (colim_I A_i, B) = colim_I Tor_1 (A_i, B) = 0
  $
  by @filter-tor, so $colim_I A_i$ is also flat by @flat-tor again.
]

// #proof[
//   In $RMod$, let $A = colim_I A_i$ where $I$ is a filtered poset and $A_i$ is flat for all $i in I$. We want to show $A$ is flat. If we have #sest $ ses(B_1, B_2, B_3) $ then for all $i in I$,
//   $
//     ses(A_i tpr B_1, A_i tpr B_2, A_i tpr B_3)
//   $
//   Taking $colim_I$, which is exact as $I$ is a filtered poset by @colim-exact, yields
//   $
//     ses(colim_I (A_i tpr B_1), colim_I (A_i tpr B_2), colim_I (A_i tpr B_3))
//   $
//   By @tensor-right-exact, $colim_I$ commutes with tensor products, hence
//   $
//     ses((colim_I A_i) tpr B_1, (colim_I A_i) tpr B_2, (colim_I A_i) tpr B_3)
//   $
//   which is just
//   $
//     ses( A tpr B_1, A tpr B_2, A tpr B_3)
//   $
//   showing that $A$ is flat.
// ]
#example[
  Let $s in R$ be a central element of ring $R$, then the localisation $R[s^(-1)]$ is a flat $R$-module. To generalise, for a central multiplicatively closed set $S subset Z(R)$, we can form $R[S^(-1)]$, which is a flat $R$-module as well.
]
#proof[
  @weibel[Theorem 3.2.2, p.69].
]
We now take a look at the case $Ab$ and we shall show that a module in $Ab$ is flat if and only if it is torsion-free.
#lemma[
  Let $B in Ab$ and $p in ZZ$. Then
  $Tor_0^ZZ (ZZ over p ZZ, B) = B over p B$ and $Tor_1 ^ZZ (ZZ over p ZZ, B) = {b in B : p b = 0}.$
]
#proof[
  Use the definition of $Tor$, the projective resolution $0 -> ZZ ->^p ZZ -> ZZ over p ZZ -> 0$, and $B tpz ZZ iso B$.
]
#lemma[
  An abelian group is a filtered colimit of its finitely generated subgroups.
]
#proof[
  $A = union A_i = colim_I A_i $ where $I$ is a filtered poset representing the inclusion relations of the finitely generated subgroups of $A$.
  // Hence torsion-free abelian groups are flat.
]
#lemma[
  Let $A, B in Ab$.
  Then $Tor_1^ZZ (A, B)$ is a torsion abelian group.
]
#remark[
  This is likely why $Tor$ is called $Tor$.
]
#proof[
  By writing $A = colim_I A_i$ for finitely genreated subgroups $A_i$ of $A$, we see that it suffices to show that each $Tor^ZZ_1 (A_i, B)$ is torsion. We can write $A_i$ as a direct sum of its torsion part and free part using the classification theorem for finitely generated abelian groups, i.e. $A_i = ZZ over p_1 ZZ ds ZZ over p_2 ZZ  ds ... ds ZZ over p_m ZZ  ds ZZ^r$. Notice that $Tor$ commutes with direct sums and the free part $ZZ^r$ vanishes with $Tor$, so
  $
    Tor_1^ZZ (A_i, B) iso plus.circle.big_(k=1)^m Tor_1^ZZ (ZZ over p_k ZZ, B) iso plus.circle.big_(k=1)^m B over p_k B,
  $
  which is clearly a torsion abelian group.
]

#lemma[
  Let $B in Ab$. Then $Tor_1 ^ZZ (QQ over ZZ, B)$ is the torsion subgroup of $B$, i.e. ${b in B : "there exists" n in ZZ "such that" n b = 0 }.$
]
#proof[
  $QQ over ZZ$ can be written as the filtered colimit $QQ over ZZ iso colim_I ZZ over p ZZ$, where $I$ is the poset representing the divisibility of natural numbers. Then
  $
    Tor_1^ZZ (QQ over ZZ, B) iso Tor_1^ZZ ( colim_I ZZ over p ZZ, B) iso colim_I Tor_1^ZZ (ZZ over p ZZ, B) iso colim_I {b in B : p b = 0},
  $
  which is the torsion subgroup of $B$.
]

// #example[
//   A torsion-free abelian group is a flat $ZZ$-module.
// ]
// #proof[
//   // @weibel[Poposition 3.1.4, p.67].
//   Let $A$ be a torsion-free abelian group, then $A = union A_i$ where $A_i$ are finitely generated subgroups of $A$, so  by
// ]
#proposition[
  A $ZZ$-module is flat if and only if it is torsion-free.
]
#proof[
  Let $A$ be a torsion-free abelian group, then $A = union A_i$ where $A_i$ are finitely generated subgroups of $A$. Then each $A_i$ is free and hence flat. By @filtered-flat-flat, $A$ is also flat.

  On the other hand, if $A$ is flat, then $Tor_1^ZZ (-, A) = 0$; in particular, $Tor_1 ^ZZ (QQ over ZZ, A) = 0$, so the torsion subgroup of $A$ is trivial.
]

// #proof[
//   $R[s^(-1)]$ is the universal ring where $s$ is invertible, which is $colim(R->^s R ->^s R-> ...)$.
// ]

#endlec(12)

== Flat Resolutions

#definition[
  A resolution $F_cx -> A$ is a *flat resolution* of $A$ if $F_n$ is a flat module for each $n$.
]

#lemma("Flat Resolution Lemma")[
  Let $F_cx -> A$ be a flat resolution of $A$. Then
  $
    Tor_ast^R (A, B) iso H_ast (F_cx tpr B ).
  $
  Similarly, if $F'_cx -> B$ is a flat resolution, then
  $
    Tor_ast^R (A, B) iso H_ast (A tpr F'_cx).
  $
]
<flat-resolution>
#proof[
  By induction.
  When $n = 0$, we need to show that $A tpr B iso H_0 (F_cx tpr B)$. We see that $ H_0 (F_cx tpr B) = (F_0 tpr B) / IM(F_1 tpr B) = Coker(F_1 tpr B -> F_0 tpr B). $ On the other hand, $A = Coker(F_1 -> F_0)$, and since $(- tpr B)$ is right exact and preserves cokernels, we get the result.

  When $n >= 1$, we have the short exact sequence
  $
    ses(K, F_0, A, f:ker(epsilon), g:epsilon).
  $ If we write $E_cx = (... -> F_2 -> F_1 -> 0)$, then $E_cx ->^(d_1) K$ is a flat resolution of $K$, where $d_1 : F_1 -> F_0$ has $IM(d_1) = Ker(epsilon) = K$ by the exactness at $F_0$ of the resolution $F_cx -> A$. Now we can write the #lest induced by $Tor$:
  $
    ... -> Tor_n (F_0 , B) -> Tor_n (A , B) -> Tor_(n-1) (K , B) -> Tor_(n-1) (F_0 , B) -> dots.
  $
  But $Tor_n (F_0, B) = 0$ for $n >= 1$ by @flat-tor.
  Thus,
  $
    Tor_n (A, B) iso cases(Ker (K tp B -> F_0 tp B) quad &n = 1\,, Tor_(n-1) (K, B) quad &n >= 2.)
  $
  For $n=1$, notice that $K tpr B iso H_0 (E_cx tpr B) = (F_1 tpr B) over IM(F_2 tpr B)$ by applying the case $n = 0$ to $E_cx -> K$, and hence we have
  $
    Tor_1 (A, B) iso Ker (K tp B -> F_0 tp B) = Ker ((F_1 tp B) / IM(F_2 tp B) -> F_0 tp B) = H_1 (F_cx tp B).
  $
  For $n >= 2$,
  $
    Tor_n (A, B) iso Tor_(n-1) (K, B) iso H_(n-1) (E_cx tp B) = H_n (F_cx tp B)
  $
  by applying the induction hypothesis to $E_cx -> K$.
]

#remark[
  Why have we not defined $Tor$ with flat resolutions in the first place? The problem is that we have to show it is well defined, independent of the choice of flat resolutions. This may not be as convenient as using projective resolutions. Nevertheless, now we are free to use flat resolutions, a larger class than projective resolutions, for calculations.
]

A generalisation to flat modules is the following.
#definition[
  If $F$ is a right exact functor, an object $Q$ is *$F$-acyclic* if $L_i F(Q) = 0$ for all $i != 0$.
]
#proposition[
  If $Q_cx -> A$ is a resolution where $Q_n$ is $F$-acyclic for all $n$, then $L_i F(A) = H_i (F (Q_cx))$.
]
#proof[
  The proof is exactly the same as above.
]

// #remark[#TODO Quillen model structures, fibrations and cofibrations.]

== Universal Coefficient Theorem

Let $P_cx$ be a chain complex of right $R$-modules and let $M$ be a left $R$-module.
In this section, we investigate how the homology of $P_cx$ is related to the homology of $P_cx tp M$, under certain flatness assumptions about $P_cx$.
We first need an auxiliary result.
#lemma[
  Let $ses(X, Y, Z)$ be a #sest in $ModR$ such that $Y$ and $Z$ are flat, then $X$ is also flat.
]
<two-flats>
#proof[
  Let $B in RMod$.
  Write the #lest induced by $Tor$:
  $
    ... -> Tor_(n+1)^R (Z, B) -> Tor_n^R (X, B) -> Tor_n^R (Y, B) -> dots.
  $
  Since $Y$ and $Z$ are flat, $Tor_n^R (Y, B) = Tor_n^R (Z, B) = 0$ when $n >= 1$ by @flat-tor. So $Tor_n^R (X, B) = 0$ for any $n >= 1$ and $X$ is also flat.
]
The main result is the following.
#theorem("Künneth Formula")[
  Let $P_cx$ be a chain complex of flat right $R$-modules such that each submodule $d(P_n)$ of $P_(n-1)$ is also flat. Then for every $n$ and every left $R$-module $M$, there is a #sest

  $
    ses(H_n (P) tpr M, H_n (P_cx tpr M), Tor_1^R (H_(n-1)(P), M)).
  $
]
<kunneth>
#proof[@rotman[Theorem 7.55], @weibel[Theorem 3.6.1].
  Let $Z_n = Ker (P_n ->^d P_(n-1))$, then we have a #sest
  #math.equation(
    block: true,
    numbering: "(1)",
    supplement: "Short Exact Sequence",
    $
      ses(Z_n, P_n, d(P_n)).
    $,
  ) <zpdp>

  // The associated #lest in $Tor$ shows that $Z_n$ is also flat, as $ Tor_k (P_n, M) = Tor_k (d(P_n), M) = 0 $ for all $k >= 1$. (#TODO In general, if two terms in a #sest are flat then the third one is also flat. )
  Since $P_n$ and $d(P_n)$ are both flat, @two-flats shows that $Z_n$ is also flat.
  Also, since $d(P_n)$ is flat,
  $Tor_1^R (d(P_n), M) = 0
  $ by @flat-tor,
  so a long exact sequence induced by @zpdp gives
  $
    ses(Z_n tp M, P_n tp M, d(P_n) tp M),
  $
  from which we yield a #sest of chain complexes
  $
    ses(Z_cx tp M , P_cx tp M, d(P)_cx tp M).
  $
  We now look at the #lest induced by homology:
  #math.equation(
    block: true,
    numbering: "(1)",
    supplement: "Long Exact Sequence",
    $
      ... -> H_(n+1) (d(P)_cx tp M ) ->^diff H_n (Z_cx tp M) \ -> H_n (P_cx tp M) -> H_n (d(P)_cx tp M) ->^diff H_(n-1) (Z_cx tp M) -> ....
    $,
  ) <eq1>
  Note that the differentials on the chain complexes $Z_cx$ and $d(P)_cx$ are all zero, and hence the differentials on $Z_cx tp M$ and $d(P)_cx tp M$ are also all zero, which gives
  $
    H_n (d(P)_cx tp M) = d(P_n) tp M quad "and" quad H_n (Z_cx tp M ) = Z_n tp M.
  $
  // #TODO A theorem saying differential zero gives homology equals chain complex.
  Hence @eq1 now becomes
  $
    ... -> d(P_(n+1)) tp M ->^(diff_(n+1)) Z_n tp M -> H_n (P_cx tp M) -> d(P_(n)) tp M ->^(diff_n) Z_(n-1) tp M -> ....
  $
  Apply @connecting and we can find the connecting homomorphism $diff_(n+1) = i_n tp id_M$, where $i_n : d(P_(n+1)) -> Z_n$ is the inclusion map.
  By @five-to-ses, we have a #sest
  #math.equation(
    block: true,
    numbering: "(1)",
    supplement: "Short Exact Sequence",
    $
      ses(Coker(i_n tp id_M), H_n (P_cx tp M), Ker(i_(n-1) tp id_M)).
    $,
  ) <ses-1>
  Now it remains to calculate the two flanking terms of @ses-1.
  Note that we have a flat resolution for $H_n (P_cx)$:
  $
    ses(d(P_(n+1)), Z_n, H_n (P_cx), f: i_n).
  $
  By @flat-resolution, $Tor_ast^R (H_n (P_cx), M)$ is the homology of the following chain complex:
  $
    D_cx = (... -> 0 -> d(P_(n+1)) tp M ->^(i_n tp id_M) Z_n tp M -> 0).
  $
  Hence
  $
    H_n (P_cx) tp M = Tor_0 (H_n (P_cx), M) = H_0 (D) = Coker (i_n tp id_M)
  $ and
  $
    Tor_1^R (H_n (P_cx), M) = H_1 (D) = Ker (i_n tp id_M).
  $
  Combining the last two equations with @ses-1 gives the result.
]
#remark[
  This theorem and its proof demonstrates how the long exact sequences and derived functors that we have developed are put into use. The Künneth Formula and the Universal Coefficient Theorem that follows are important results heavily used in algebraic topology. As Kobi put it in the lecture,
  "_These are the games you play with the machine._"
]

In particular, we can consider the case of $Ab$, where we have the following:

#theorem("Universal Coefficient Theorem")[
  Let $P_cx$ be a chain complex of free abelian groups, then for every $n$ and every $M$, the Künneth #sest splits, so $ H_n (P_cx tp M) = (H_n (P) tp M) ds Tor_1^ZZ (H_(n-1) (P), M). $
  The split is not canonical.
]

#proof[
  @rotman[Corollary 7.56, p. 450], @weibel[Theorem 3.6.2, p. 87].
  Since each $P_n$ is a free abelian group, its subgroup
  $d (P_n)$ is also free abelian by @sub-pid. Therefore $d (P_n)$ is projective, so the short exact
  sequence

  $ 0 arrow.r Z_n arrow.r^(i_n) P_n arrow.r d( P_n) arrow.r 0 $

  splits by @projective-split. Applying $(- tp M)$ (which commutes with direct sums), we see that the #sest
  $
    0 arrow.r Z_n tp M arrow.r^(i_n tp id_M) P_n tp M arrow.r d( P_n) tp M arrow.r 0
  $
  also splits, so $Z_n tp M$ is a direct summand of $P_n tp M$. Now notice we have the inclusions
  $
    IM (d_(n+1) tp id_M) subset.eq IM (i_n tp id_M) subset.eq Ker (d_n tp id_M) subset.eq P_n tp M.
  $
  By @split-sub, $Z_n tp M$ is a direct summand of $Ker (d_n tp id_M)$. Modding out by $IM (d_(n+1) tp id_M)$ on both of them, again by @split-sub, we see that
  #math.equation(
    block: true,
    numbering: "(1)",
    supplement: "Equation",
    $
      H_n (P) tp M= (Z_n tp M) / IM(d_(n+1) tp id_M)
    $,
  ) <hnptpm>
  is a direct summand of $  H_n (P_cx tp M) = Ker(d_n tp id_M) / IM(d_(n+1) tp id_M).  $

  To see why @hnptpm holds, let $j_n : d(P_(n+1)) -> Z_n$ be the inclusion map, and by the proof of @kunneth, $ H_n (P) tp M &= Coker (j_n tp id_M : d(P_(n+1)) tp M -> Z_n tp M) \ &= (Z_n tp M) / (IM (j_n tp id_M)) = (Z_n tp M) / IM(d_(n+1) tp id_M). $

  Since each $P_n$ and $d(P_n)$ are projective and thus flat, by @kunneth we have a #sest
  $
    0 arrow.r H_n lr((P)) times.circle M arrow.r H_n lr((P_cx times.circle M)) arrow.r "Tor"_1^ZZ lr((H_(n minus 1) lr((P)) comma M)) arrow.r 0,
  $
  which is therefore split.
  // #TODO
  // Note: $P_n -> d(P_n)$ splits.
]


We also demonstrate a more general result, known as the Full Künneth Formula. Now it can be helpful to recall @tp-dc, the tensor product double complex, as well as @homology-double.
#theorem("Full Künneth Formula")[
  Let $P_cx$ and $Q_cx$ be right and left $R$-modules, respectively.
  If $P_n$ and $d(P_n)$ are flat for each $n$, then there is a #sest
  $
    ses(plus.circle.big _(i+j=n) H_i (P) tp H_j (Q), H_n (P tpr Q), plus.circle.big_(i+j = n-1) Tor_1^R (H_i (P), H_j (Q))).
  $
]

#proof[
  @weibel[Theorem 3.6.3]. Modify the proof of @kunneth.
]

It is worth mentioning that there is also a version of the Universal Coefficient Theorem for cohomology that involves $Ext$ and $hom$:

#theorem("Universal Coefficient Theorem for Cohomology")[
  Let $P_cx$ be a chain complex of projective $R$-modules such that each $d(P_n)$ is also projective. Then for any $n$ and every $R$-module $M$, there is a non-canonically split exact sequence
  $
    0 -> Ext_R^1 (H_(n-1) (P), M) -> H^n (homr (P, M)) -> homr (H_n (P), M) -> 0.
  $
]
#proof[
  @weibel[Theorem 3.6.5].
]

These results yield important consequences in algebraic topology, as briefly discussed below. More can be seen in the Algebraic Topology course.

#example[ @weibel[Application 3.6.4].
  Let $X$ be a topological space.
  Let $C_cx (X)$ be the singular chain complex of $X$, then each $C_n (X)$ is a free abelian group. Let $M$ be an abelian group, then we define the $n$-th (singular) homology of $X$ with _coefficients_ in $M$ as
  $
    H_n (X ; M) := H_n (C_cx (X) tp M).
  $
  In particular, $H_n (X) = H_n (X ; ZZ)$. Then the Universal Coefficient Theorem gives
  $
    H_n (X; M) iso (H_n (X) tp M )ds Tor_1^ZZ (H_(n-1) (X), M).
  $
  For cohomology, we could make a similar definition, i.e.
  $
    H^n (X; M) := H^n (hom_ZZ (C_cx (X), M))
  $
  with $H^n (X) = H^n (X; ZZ)$,
  and the Universal Coefficient Theorem would indicate that
  $
    H^n (X; M) iso hom_ZZ (H_n (X), M) ds Ext_ZZ^1 (H_(n-1) (X), M).
  $
  (If we further assume that $M = ZZ$ and that each $H_n (X)$ is finitely generated such that $H_n (X) iso F_n ds T_n$ with free part $F_n$ and torsion part $T_n$, then we can show that
  $H^n (X) iso F_n ds T_(n-1).$)

  Let $Y$ be another topological space with singular chain complex $C_cx (Y)$. By Eilenberg–Zilber theorem, $H_n (X times Y) iso H_n (C_cx (X) tp C_cx (Y))$. Then the Full Künneth Formula indicates that
  $
    H_n (X times Y) iso (plus.circle.big_(p=1)^n H_p (X) tp H_(n-p) (Y)) xor (plus.circle.big_(p=1)^n Tor_1^ZZ (H_(p-1) (X), H_(n-p) (Y))).
  $
]

#endlec(12)
