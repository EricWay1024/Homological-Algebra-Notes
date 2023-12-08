#import "../libs/template.typ": *

= $Tor$ and Flatness

== Flat Modules

#definition[
  A #lrm $B$ is *flat* if $ - tpr B$ is exact. A #rrm $A$ is *flat* if $  A tpr -$ is exact. 
]

#remark[
  #TODO link to algebraic geometry, algebraic continunity
//   In some sense flatness gives "continuity". It appears in algebraic geometry.
// Assume $R$ is commutative, and let $M$ be an $R$-module. Then $tilde(M)$ quasi- ?? sheaf on $"Spec"(R)$.
]

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
  + $Tor_n^R (A, B) = 0$ for all $n > 0$ and all $A$;
  + $Tor_1^R (A, B) = 0$ for all $A$.
]
  <flat-tor>
#proof[@notes[Lemma 6.26].
(1) $=>$ (2). Suppose that $B$ is flat. Let $F_cx arrow.r A$ be a free
resolution of $A$. Since $minus times.circle_R B$ is exact, the sequence
$ dots.h arrow.r F_2 times.circle_R B arrow.r F_1 times.circle_R B arrow.r F_0 times.circle_R B arrow.r A times.circle_R B arrow.r 0 $
is exact, so the homology of
$ dots.h arrow.r F_2 times.circle_R B arrow.r F_1 times.circle_R B arrow.r F_0 times.circle_R B arrow.r 0 $
vanishes in positive degree. 

The implication \(2) $arrow.r.double lr((3))$
is trivial.

Finally, \(3) $arrow.r.double$ \(1) follows from the long
exact sequence of $Tor$, since for any short exact sequence
$0 arrow.r X arrow.r Y arrow.r Z arrow.r 0$, we have that
$ 0 eq "Tor"_1^R lr((Z comma B)) arrow.r X times.circle B arrow.r Y times.circle B arrow.r Z times.circle B arrow.r 0 $
is exact. 
]

#corollary[Every projective module is flat. In particular, every free module is flat.]
#proof[
If $P$ is projective, then $0 arrow.r P$ is a projective
resolution, so $"Tor"_n^R lr((A comma P)) eq 0$ for all $A$ and all
$n gt.eq 1$.
]
Another way to prove the corollary is found @rotman[Propositin 3.46].

  Recall that since the tensor product is left adjoint, it commutes with all colimits. Thus $ (colim_I A_i) tpr B iso colim_I (A_i tpr B) $

  #remark[
    In case the notation seems confusing,
    notice that in cateogry theory we would usually write $colim_I F$, where $F : I -> RMod$ is a functor. Here by $colim_I A_i$ we indicate that $A_i = F(i)$ for all $i in I$.  
  ]



#proposition[
  // For any small category $I$ and any functor $I -> ModR$, we have 
  Let $I$ be a filtered poset (for any $i, j in I$ there exists $k$ such that $i <= k$ and $j <= k$). View $I$ as a small category. Then the functor $ colim_I: Fun(I, RMod) -> RMod $ is exact. 
]
#proof[#TODO Ref: category theory.]

#remark[
  $colim_I$ is not a exact functor in general.
]

#corollary[
  A filtered colimit of flat $R$-modules is flat. 
]
#proof[
  Let $A = colim_I A_i$ where $I$ is a filtered poset and $A_i$ are flat for all $i in I$. We want to show $A$ is flat. If we have #sest $ ses(B_1, B_2, B_3) $ then for all $i in I$, 
  $
    ses(A_i tpr B_1, A_i tpr B_2, A_i tpr B_3)
  $
  Taking $colim_I$, which is exact as $I$ is a filtered poset, yields 
  $
    ses(colim_I (A_i tpr B_1), colim_I (A_i tpr B_2), colim_I (A_i tpr B_3))
  $
  $colim_I$ commutes with tensor products, hence 
  $
    ses((colim_I A_i) tpr B_1, (colim_I A_i) tpr B_2, (colim_I A_i) tpr B_3)
  $
  which is just 
  $
    ses( A tpr B_1, A tpr B_2, A tpr B_3)
  $
  showing $A$ is flat.
]

#example[
  Let $A$ be a torsion free abelian group. Then $A = union A_i$ where $A_i$ are finitely generated subgroups of $A$, so $A_i$ is free and hence flat.  $ A = union A_i = colim A_i $  Hence torsion free abelian groups are flat. #TODO
]

#example[
  Let $s in R$ be a central element of $R$. We can localise $s$ to get $R[s^(-1)]$ (this is the universal ring where $s$ is invertible, which is $colim(R->^s R ->^s R-> ...)$), so this flat $R$-module.

  To generalise, for a set $S$, we form $R[S^(-1)]$, and this is flat as well. #TODO
]

#endlec(12)

== Flat Resolutions

#definition[
  $F_cx -> A$ is a *flat resolution* of $A$ if $F_n$ are flat modules for all $n$.
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
  By induction. As $- tpr B$ is right exact, we get the result for $n = 0$. Let 
  $
    ses(K, F_0, A)
  $ be a short exact sequence.   If we write $E_cx = (... -> F_2 -> F_1 -> 0)$, then $E_cx -> K$ is a flat resolution of $K$. 

  We can write the #lest induced by $Tor$: 
  $
    ... ->  Tor_n (F_0 , B) -> Tor_n (A , B) -> Tor_(n-1) (K , B) -> Tor_(n-1) (F_0 , B) -> ...
  $
  But $Tor_n (F_0, B) = 0$ for $n >= 1$ by (the dual of) @flat-tor. 
  Thus, 
  $
    Tor_n (A, B) iso cases(ker (K tp B -> F_0 tp B) quad &n = 1, Tor_(n-1) (K, B) quad &n >= 2)
  $
  For $n=1$, 
  $
    Tor_1 (A, B) = ker (K tp B -> F_0 tp B) = ker ((F_1 tp B) / im(F_2 tp B) -> F_0 tp B) = H_1 (F tp B)
  $
  For $n >= 2$, 
  $
    Tor_n (A, B) iso Tor_(n-1) (K, B) iso H_(n-1) (E tp B) = H_n (F tp B)
  $
  by induction.
]

#remark[
  Why not define $Tor$ with flat resolutions in the first place? The problem is that we have to show it is well defined regardless of the choice of flat resolutions. This may not be as convenient as using projective resolutions. Nevertheless, now we are free to use flat resolutions, a larger class than projective resolutions, for calculations.
]

#definition[
If $F$ is a right exact functor, an object $Q$ is *$F$-acyclic* if $L_i F(Q) = 0$ for all $i != 0$.  
]
#proposition[
If $Q_cx -> A$ is a resolution where $Q_n$ is $F$-acyclic for all $n$, then $L_i F(A) = H_i (F (Q_cx))$. 
]
#proof[
  The proof is exactly the same as above.
]

#remark[#TODO Quillen model structures, fibrations and cofibrations.]

== Universal Coefficient Theorem

How is the homology of $P_cx$ related to the homology of $P_cx tp M$?

#theorem("Künneth Formula")[
  Let $P_cx$ be a chain complex of flat, right $R$-modules such that each submodule $d(P_n)$ of $P_(n-1)$ is also flat. Then for every $n$ and every left $R$-module $M$ there is a #sest 
  
  $
    ses(H_n (P) tpr M, H_n (P_cx tpr M), Tor_1^R (H_(n-1)(P), M))
  $
  
]
#proof[@rotman[Theorem 7.55].
  Let $Z_n = ker (P_n ->^d P_(n-1))$. 
  We have a #sest 
  $
    ses(Z_n, P_n, d(P_n))
  $
  The associated #lest in $Tor$ shows that $Z_n$ is also flat, as $ Tor_k (P_n, M) = Tor_k (d(P_n), M) = 0 $ for all $k >= 1$. (#TODO In general, if two terms in a #sest are flat then the third one is also flat. ) Since 
  $Tor_1^R (d(P_n), M) = 0
  $,
  we have that
  $
    ses(Z_n tp M, P_n tp M, d(P_n) tp M)
  $
  is a #sest for every $M$, so we get a #sest of complexes 
  $
    ses(Z_cx tp M , P_cx tp M, d(P)_cx tp M)
  $
  We now look at the #lest induced by homology: 
  #math.equation(block: true, numbering: "(1)", supplement: "long exact sequence",
  $
    H_(n+1) (d(P)_cx tp M ) ->^diff H_n (Z_cx tp M) \ -> H_n (P_cx tp M) -> H_n (d(P)_cx tp M) ->^diff H_(n-1) (Z_cx tp M) 
  $) <eq1>
  Note that the differentials on the complexes  $Z_cx$ and $d(P)_cx$ are all zero, and hence the differentials on $Z_cx tp M$ and $d(P)_cx tp M$ are also all zero, which gives 
  $
    H_n (d(P)_cx tp M) = d(P_n) tp M quad "and" quad H_n (Z_cx tp M ) = Z_n tp M
  $
  #TODO A theorem saying differential zero gives homology equals chain complex.

  Hence @eq1 now becomes 
  $
    d(P_(n+1)) tp M ->^(diff_(n+1)) Z_n tp M -> H_n (P_cx tp M) -> d(P_(n)) tp M ->^(diff_n) Z_(n-1) tp M
  $
  Here we can calculate the connecting homomorphism $diff_(n+1) = i_n tp M$, where $i_n : d(P_(n+1)) -> Z_n$ is the inclusion map.
  According to a theorem regarding exact sequences #TODO, we have a #sest
  $
    ses(coker(i_n tp M), H_n (P_cx tp M), ker(i_(n-1) tp M))
  $
  On the other hand, we have a flat resolution for $H_n (P_cx)$ 
  $
    ses(d(P_(n+1)), Z_n, H_n (P_cx), f: i_n)
  $
  By @flat-resolution, $Tor_ast^R (H_n (P_cx), M)$ is the homology of 
  $
    0 -> d(P_(n+1)) tp M ->^(i_n tp M) Z_n tp M -> 0
  $
  Hence 
  $
    H_n (P_cx) tp M = Tor_0 (H_n (P_cx), M) = H_0 = coker (i_n tp M)
  $ and 
  $
    Tor_1^R (H_n (P_cx), M) = H_1 = ker (i_n tp M)
  $
  replacing $n$ with $n-1$ in the last equation gives the result.
] 
#remark[
  These are the games you play with the machine.
]
#theorem("Universal Coefficient Theorem")[
  Let $P$ be a chain complex of free abelian groups, then for every $n$ and every $M$, the Künneth #sest splits, so $ H_n (P tp M) = H_n (P) tp M ds Tor_1^ZZ (H_(n-1) (P), M) $
  The split is not canonical.
]
#proof[
  #TODO
  Note: $P_n -> d(P_n)$ splits. 
]

Recall if $P_cx, Q_cx$ are complexes, we define $P_cx tpr Q_cx$.

#theorem("Full Künneth Formula")[
  If $P_n$ and $d(P_n)$ are flat for each $n$, then there is a #sest 
  $
    ses(plus.circle.big _(i+j=n) H_i (P) tp H_j (Q), H_n (P tpr Q), plus.circle.big_(i+j = n-1) Tor_1^R (H_i (P), H_j (Q)))
  $
]

#example[
  In topology, 
  $
    H_n (X times Y) = (plus.circle.big_(p=1)^n H_p (X) tp H_(n-p) (Y)) xor (plus.circle.big_(p=1)^n Tor_1^ZZ (H_(p-1) (X), H_(n-p) (Y)))
  $
]
#endlec(12)
