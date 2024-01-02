#import "../libs/template.typ": *

= $Tor$ and Flatness

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
  The followings are equivalent: 
  + $B$ is flat;
  + $Tor_n^R (A, B) = 0$ for all $n > 0$ and all  $A$;
  + $Tor_1^R (A, B) = 0$ for all $A$.

  Similarly, let $A$ be a #rrm. The followings are equivalent:
  + $A$ is flat; 
  + $Tor_n^R (A, B) = 0$ for all $n > 0$ and all $B$;
  + $Tor_1^R (A, B) = 0$ for all $B$.
]
  <flat-tor>
#proof[@notes[Lemma 6.26]. We prove the first half. 

(1) $=>$ (2). Suppose that $B$ is flat. Let $F_cx arrow.r A$ be a free
resolution of $A$. Since $(minus times.circle_R B)$ is exact, the sequence
$ dots.h arrow.r F_2 times.circle_R B arrow.r F_1 times.circle_R B arrow.r F_0 times.circle_R B arrow.r A times.circle_R B arrow.r 0 $
is exact, so the homology of
$ dots.h arrow.r F_2 times.circle_R B arrow.r F_1 times.circle_R B arrow.r F_0 times.circle_R B arrow.r 0 $
vanishes in positive degree. 

(2) $arrow.r.double$ (3). Trivial.

(3) $arrow.r.double$ (1). For any short exact sequence
$0 arrow.r X arrow.r Y arrow.r A arrow.r 0$ in $ModR$, we have the long
exact sequence of $Tor$ by @tor-les,
$ 0 eq "Tor"_1^R lr((A comma B)) arrow.r X times.circle_R B arrow.r Y times.circle_R B arrow.r A times.circle_R B arrow.r 0 $
which shows that $(- tpr B)$ is exact.

Note that the second half of the claim relies on the balancing of $Tor$, but the proof is very similar.
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
  A partially ordered set (poset) $I$ is said to be *filtered* if for any $i, j in I$, there exists $k$ such that $i <= k$ and $j <= k$.
]


#proposition[
  // For any small category $I$ and any functor $I -> ModR$, we have 
  Let $I$ be a filtered poset. View $I$ as a small category. Then the functor $ colim_I: Fun(I, RMod) -> RMod $ is exact. 
]
<colim-exact>
#proof[@weibel[Theorem 2.6.15, p.57].]

#remark[
  $colim_I$ is not a exact functor in general.
]


#corollary[
  A filtered colimit of flat $R$-modules is flat. 
]
#notation[
    In case the notation in the next proof seems confusing,
    notice that in category theory we would usually write $colim_I F$, where $F : I -> RMod$ is a diagram. Here, by writing $colim_I A_i$ we indicate that $A_i = F(i)$ for all $i in I$.  
  ]
#proof[
  In $RMod$, let $A = colim_I A_i$ where $I$ is a filtered poset and $A_i$ is flat for all $i in I$. We want to show $A$ is flat. If we have #sest $ ses(B_1, B_2, B_3) $ then for all $i in I$, 
  $
    ses(A_i tpr B_1, A_i tpr B_2, A_i tpr B_3)
  $
  Taking $colim_I$, which is exact as $I$ is a filtered poset by @colim-exact, yields 
  $
    ses(colim_I (A_i tpr B_1), colim_I (A_i tpr B_2), colim_I (A_i tpr B_3))
  $
  By @tensor-right-exact, $colim_I$ commutes with tensor products, hence 
  $
    ses((colim_I A_i) tpr B_1, (colim_I A_i) tpr B_2, (colim_I A_i) tpr B_3)
  $
  which is just 
  $
    ses( A tpr B_1, A tpr B_2, A tpr B_3)
  $
  showing that $A$ is flat.
]

#example[
  A torsion-free abelian group is flat (as a $ZZ$-module). 
]
#proof[
  // @weibel[Poposition 3.1.4, p.67].
  Let $A$ be a torsion-free abelian group, then $A = union A_i$ where $A_i$ are finitely generated subgroups of $A$, so each $A_i$ is free and hence flat.  $ A = union A_i = colim_I A_i $ where $I$ is a filtered poset representing the inclusion of finitely generated subgroups of $A$. Hence torsion-free abelian groups are flat. 
]

#example[
  Let $s in R$ be a central element of ring $R$, then the localisation $R[s^(-1)]$ is a flat $R$-module. To generalise, for a central multiplicatively closed set $S subset Z(R)$, we can form $R[S^(-1)]$, which is a flat $R$-module as well.
]
#proof[
  @weibel[Theorem 3.2.2, p.69].
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
    Tor_ast^R (A, B) iso H_ast (F_cx tpr B )
  $
  Similarly, if $F'_cx -> B$ is a flat resolution, then 
  $
    Tor_ast^R (A, B) iso H_ast (A tpr F'_cx)
  $
]
<flat-resolution>
#proof[
  By induction. 
  When $n = 0$, we need to show that $A tpr B iso H_0 (F_cx tpr B)$. We see that $ H_0 (F_cx tpr B) = (F_0 tpr B) / IM(F_1 tpr B) = Coker(F_1 tpr B -> F_0 tpr B) $ On the other hand, $A = Coker(F_1 -> F_0)$, and since $(- tpr B)$ is right exact and preserves cokernels, we get the result. 
  
  When $n >= 1$, we have the short exact sequence
  $
    ses(K, F_0, A, f:ker(epsilon), g:epsilon)
  $  If we write $E_cx = (... -> F_2 -> F_1 -> 0)$, then $E_cx ->^(d_1) K$ is a flat resolution of $K$, where $d_1 : F_1 -> F_0$ has $IM(d_1) = Ker(epsilon) = K$ by the exactness at $F_0$ of the resolution $F_cx -> A$. Now we can write the #lest induced by $Tor$: 
  $
    ... ->  Tor_n (F_0 , B) -> Tor_n (A , B) -> Tor_(n-1) (K , B) -> Tor_(n-1) (F_0 , B) -> ...
  $
  But $Tor_n (F_0, B) = 0$ for $n >= 1$ by @flat-tor. 
  Thus, 
  $
    Tor_n (A, B) iso cases(Ker (K tp B -> F_0 tp B) quad &n = 1, Tor_(n-1) (K, B) quad &n >= 2)
  $
  For $n=1$, notice that $K tpr B iso H_0 (E_cx tpr B) = (F_1 tpr B) over IM(F_2 tpr B)$ by applying the case $n = 0$ to $E_cx -> K$, and hence we have
  $
    Tor_1 (A, B) iso Ker (K tp B -> F_0 tp B) = Ker ((F_1 tp B) / IM(F_2 tp B) -> F_0 tp B) = H_1 (F_cx tp B)
  $
  For $n >= 2$, 
  $
    Tor_n (A, B) iso Tor_(n-1) (K, B) iso H_(n-1) (E_cx tp B) = H_n (F_cx tp B)
  $
  by applying the induction hypothesis to $E_cx -> K$.
]

#remark[
  Why have we not defined $Tor$ with flat resolutions in the first place? The problem is that we have to show it is well defined regardless of the choice of flat resolutions. This may not be as convenient as using projective resolutions. Nevertheless, now we are free to use flat resolutions, a larger class than projective resolutions, for calculations.
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

How is the homology of $P_cx$ related to the homology of $P_cx tp M$?

#lemma[
  Let $ses(X, Y, Z)$ be a #sest in $ModR$ such that $Y$ and $Z$ are flat, then $X$ is also flat. 
]
<two-flats>
#proof[
  Let $B in RMod$.
  Write the #lest induced by $Tor$: 
  $
    ... -> Tor_(n+1)^R (Z, B) -> Tor_n^R (X, B) -> Tor_n^R (Y, B) -> ...
  $
  Since $Y$ and $Z$ are flat, $Tor_n^R (Y, B) = Tor_n^R (Z, B) = 0$ when $n >= 1$ by @flat-tor. So $Tor_n^R (X, B) = 0$ for any $n >= 1$ and $X$ is also flat.
]
#theorem("Künneth Formula")[
  Let $P_cx$ be a chain complex of flat right $R$-modules such that each submodule $d(P_n)$ of $P_(n-1)$ is also flat. Then for every $n$ and every left $R$-module $M$, there is a #sest 
  
  $
    ses(H_n (P) tpr M, H_n (P_cx tpr M), Tor_1^R (H_(n-1)(P), M))
  $
]
<kunneth>
#proof[@rotman[Theorem 7.55].
  Let $Z_n = Ker (P_n ->^d P_(n-1))$, then we have a #sest 
  #math.equation(block: true, numbering: "(1)", supplement: "Short Exact Sequence",
  $
    ses(Z_n, P_n, d(P_n))
  $) <zpdp>
  
  // The associated #lest in $Tor$ shows that $Z_n$ is also flat, as $ Tor_k (P_n, M) = Tor_k (d(P_n), M) = 0 $ for all $k >= 1$. (#TODO In general, if two terms in a #sest are flat then the third one is also flat. ) 
  Since $P_n$ and $d(P_n)$ are both flat, @two-flats shows that $Z_n$ is also flat.
  Also, since $d(P_n)$ is flat,
  $Tor_1^R (d(P_n), M) = 0
  $ by @flat-tor,
  so the long exact sequence induced by @zpdp gives
  $
    ses(Z_n tp M, P_n tp M, d(P_n) tp M)
  $
  from which we yield a #sest of chain complexes 
  $
    ses(Z_cx tp M , P_cx tp M, d(P)_cx tp M)
  $
  We now look at the #lest induced by homology: 
  #math.equation(block: true, numbering: "(1)", supplement: "Long Exact Sequence",
  $
    ... -> H_(n+1) (d(P)_cx tp M ) ->^diff H_n (Z_cx tp M) \ -> H_n (P_cx tp M) -> H_n (d(P)_cx tp M) ->^diff H_(n-1) (Z_cx tp M) -> ...
  $) <eq1>
  Note that the differentials on the chain complexes  $Z_cx$ and $d(P)_cx$ are all zero, and hence the differentials on $Z_cx tp M$ and $d(P)_cx tp M$ are also all zero, which gives 
  $
    H_n (d(P)_cx tp M) = d(P_n) tp M quad "and" quad H_n (Z_cx tp M ) = Z_n tp M
  $
  // #TODO A theorem saying differential zero gives homology equals chain complex.
  Hence @eq1 now becomes 
  $
    ... -> d(P_(n+1)) tp M ->^(diff_(n+1)) Z_n tp M -> H_n (P_cx tp M) -> d(P_(n)) tp M ->^(diff_n) Z_(n-1) tp M -> ...
  $
  Apply @connecting and we can find the connecting homomorphism $diff_(n+1) = i_n tp id_M$, where $i_n : d(P_(n+1)) -> Z_n$ is the inclusion map.
  By @five-to-ses, we have a #sest
  #math.equation(block: true, numbering: "(1)", supplement: "Short Exact Squence",
  $
    ses(Coker(i_n tp id_M), H_n (P_cx tp M), Ker(i_(n-1) tp id_M))
  $) <ses-1>
  Now we are about to calculate the flanking terms of @ses-1.
  Note that we have a flat resolution for $H_n (P_cx)$:
  $
    ses(d(P_(n+1)), Z_n, H_n (P_cx), f: i_n)
  $
  By @flat-resolution, $Tor_ast^R (H_n (P_cx), M)$ is the homology of the following chain complex:
  $
    D_cx = (0 -> d(P_(n+1)) tp M ->^(i_n tp id_M) Z_n tp M -> 0)
  $
  Hence 
  $
    H_n (P_cx) tp M = Tor_0 (H_n (P_cx), M) = H_0 (D) = Coker (i_n tp id_M)
  $ and 
  $
    Tor_1^R (H_n (P_cx), M) = H_1 (D) = Ker (i_n tp id_M)
  $
  Combining the last two equations with @ses-1 gives the result.
] 
#remark[
  These are the games you play with the machine.
]
#theorem("Universal Coefficient Theorem")[
  Let $P_cx$ be a chain complex of free abelian groups, then for every $n$ and every $M$, the Künneth #sest splits, so $ H_n (P_cx tp M) = (H_n (P) tp M) ds Tor_1^ZZ (H_(n-1) (P), M) $
  The split is not canonical.
]

#proof[
  @rotman[Corollary 7.56, p. 450], @weibel[Theorem 3.6.2, p. 87].
  Since each $P_n$ is a free abelian group, its subgroup
$d (P_n)$ is also free abelian by @sub-pid. Therefore $d (P_n)$ is projective, so the short exact
sequence

$ 0 arrow.r Z_n arrow.r^(i_n) P_n arrow.r d( P_n) arrow.r 0 $

splits by @projective-split. Applying $(- tp M)$ (which commutes with direct sums), we get that
$ 0 arrow.r Z_n tp M arrow.r^(i_n tp id_M) P_n tp M arrow.r d( P_n) tp M arrow.r 0 $
also splits, so $Z_n tp M$ is a direct summand of $P_n tp M$. Now notice we have the inclusions 
$
  IM (d_(n+1) tp id_M) subset.eq IM (i_n tp id_M) subset.eq Ker (d_n tp id_M) subset.eq P_n tp M
$
By @split-sub, $Z_n tp M$ is a direct summand of $Ker (d_n tp id_M)$. Modding out by $IM (d_(n+1) tp id_M)$ on both of them, again by @split-sub, we see that 
#math.equation(block: true, numbering: "(1)", supplement: "Equation",
$
  H_n (P) tp M=  (Z_n tp M) / IM(d_(n+1) tp id_M) 
$) <hnptpm>
 is a direct summand of $  H_n (P_cx tp M) = Ker(d_n tp id_M) / IM(d_(n+1) tp id_M)  $

To see why @hnptpm holds, let $j_n : d(P_(n+1)) -> Z_n$ be the inclusion map, and by the proof of @kunneth, $ H_n (P) tp M &= Coker (j_n tp id_M : d(P_(n+1)) tp M -> Z_n tp M) \ &= (Z_n tp M) / (IM (j_n tp id_M)) = (Z_n tp M) / IM(d_(n+1) tp id_M) $

Since each $P_n$ and $d(P_n)$ are projective and thus flat, by @kunneth we have a #sest
$ 0 arrow.r H_n lr((P)) times.circle M arrow.r H_n lr((P_cx times.circle M)) arrow.r "Tor"_1^ZZ lr((H_(n minus 1) lr((P)) comma M)) arrow.r 0 $
which is therefore split.
  // #TODO
  // Note: $P_n -> d(P_n)$ splits. 
]


Now it can be helpful to recall @tp-dc, the tensor product double complex, as well as @homology-double.
#theorem("Full Künneth Formula")[
  Let $P_cx$ and $Q_cx$ be right and left $R$-modules, respectively.  
  If $P_n$ and $d(P_n)$ are flat for each $n$, then there is a #sest 
  $
    ses(plus.circle.big _(i+j=n) H_i (P) tp H_j (Q), H_n (P tpr Q), plus.circle.big_(i+j = n-1) Tor_1^R (H_i (P), H_j (Q)))
  $
]

#example[
  If $X$ and $Y$ are two topological spaces, 
  $
    H_n (X times Y) = (plus.circle.big_(p=1)^n H_p (X) tp H_(n-p) (Y)) xor (plus.circle.big_(p=1)^n Tor_1^ZZ (H_(p-1) (X), H_(n-p) (Y)))
  $
]
#endlec(12)
