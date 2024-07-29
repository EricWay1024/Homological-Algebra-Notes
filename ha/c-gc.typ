#import "../libs/template.typ": *

= Group (Co)homology
<group-cohomology>

== Definitions

#definition[
  Let $G$ be a group. A *(left) $G$-module* is an abelian group $A$ together with a left group action $rho: G times A -> A$, with $rho(g, a)$ denoted as $g dot a$, such that 
  $
    g dot (a_1 + a_2) = g dot a_1 + g dot a_2
  $
  for all $g in G$ and $a_1, a_2 in A$. 

  A *morphism* $A -> B$ of $G$-modules (or a *$G$-map*) is an abelian group homomorphism (i.e., $ZZ$-linear map) $phi: A -> B$ such that 
  $
    phi(g dot a) = g dot phi (a)
  $
  for all $g in G$ and $a in A$.

  The category of $G$-modules is denoted as $GMod$, where we write $hom_GMod$ as $homg$.
]

#note[
  Recall that for any group $G$, the *integral group ring* $ZZ G$ consists of formal sums of elements of $G$ with integer coefficients:
  $
    sum_(g in G) f_g g,
  $
  where $f_g in ZZ$ is non-zero for only fintely many $g in G$. $ZZ G$ is a ring because the product of two elements of $ZZ G$ is well-defined.
]
  #lemma[
    There is an equivalence of categories $GMod iso ZGMod$.
  ]

This implies that $G$-modules can be seen as a special case of $R$-modules, so all the homological algebra we have developed applies.
  // This indicates that $GMod$ is also an abelian category (which we love).

  #definition[
    A $G$-module is *trivial* if $g dot a  = a$ for all $g in G$ and $a in A$. 
    We define a functor $triv: Ab -> GMod$ by sending an abelian group $A$ to a trivial $G$-module $A$.
  ]

  #definition[
    Let $A in GMod$. Then the submodule of *invariants* of $A$ is 
    $
      A^G = {a in A : g dot a = a "for all" g in G}
    $ 
    and the module of *coinvariants* of $A$ is 
    $
      A_G = A over angle.l g dot a - a : g in G, a in A angle.r.
    $    
  ]

  #lemma[
    $-^G$ and $-_G$ are functors $GMod -> Ab$. 
  ]

  #lemma[
    We have adjunctions 
    $
      -_G tack.l triv tack.l -^G.
    $
  ]
  #proof[
    We first show 
    $
      hom_G (triv(A), B) iso hom_Ab (A, B^G)
    $
    Take any $f : triv(A) -> B$, then $f$ is a group homomorphism $A -> B$ such that $f(g dot a) = g dot f(a)$ for all $g in G$ and $a in A$. But $g dot a = a$ due to triviality and hence $f(a) = g dot f(a)$, i.e. $f(a) in B^G$ for all $a$. Then $f$ is equivalent to a group homomorphism $A -> B^G$. 

    Now we prove 
    $
      hom_Ab (A_G, B) iso homg (A, triv(B))
    $
    Take any $h : A -> triv(B)$, then $h$ is a group homomorphism $A -> B$ such that for all $g in G$ and $a in A$, $ h (g dot a) = g dot h(a) = h(a) <=> h(g dot  a - a) = 0 <=> g dot a - a in Ker(h) $
    which means $h$ is equivalent to a group homomorphism $A_G -> B$. 
  ]

  #corollary[
    The functor $-_G : GMod -> Ab$ is right exact and the functor $-^G : GMod -> Ab$ is left exact. 
  ]

  #lemma[
    Let $A$ be any $G$-module and let $ZZ$ be the trivial $G$-module. Then 
    $
      A_G iso ZZ tpzg A 
    $
    and 
    $
      A^G iso hom_(ZZ G) (ZZ , A).
    $
  ]
 #remark[
    In other words, $(-_G) = (ZZ tpzg -) = (- tpzg ZZ)$ (because the ring $ZZ G$ is commutative) and $(-^G )= hom_(ZZ G) (ZZ, -)$.
 ]
  #proof[
 We observe that the trivial module functor $triv: ZMod -> ZGMod$ can be seen as the functor
$"Hom"_(bb(Z)) lr((bb(Z) comma minus))$, where we consider $bb(Z)$ as a $bb(Z)$-$ bb(Z) G$ bimodule. By @tensor-right-exact-2, 
$(bb(Z) times.circle_(bb(Z) G) -)$  is its left adjoint, which must
agree with its other left adjoint $minus_G$. (See an alternative proof in @notes[Lemma 13.9].)

For the second claim:
$A^G tilde.equiv "Hom"_(Ab) lr((bb(Z) comma A^G)) tilde.equiv$
$"Hom"_G lr((bb(Z) comma A))$.
 ]


#definition[
Let $A$ be a $G$-module. We define the *homology groups of
$G$ with coefficients in $A$* as the left derived functors of $(-^G)$:
$ H_ast lr((G , A)) = L_ast lr((minus^ G)) lr((A)) tilde.equiv "Tor"_ast^(bb(Z) G) lr((bb(Z) comma A)). $ 
By definition, $H_0 lr((G , A)) eq A_G$. 

Similarly, we define the *cohomology groups of
$G$ with coefficients in $A$* as the right derived functors of $(-_G)$:
$ H^ast lr((G , A)) = R^ast lr((-_G)) lr((A)) tilde.equiv "Ext"_(bb(Z) G)^ast lr((bb(Z) comma A)). $ 
By definition, $H^0 (G, A) = A^G$. 
]

#notation[
  @weibel uses the notations $H_ast (G; A)$ and $H^ast (G; A)$ (with a semicolon instead of a comma).
]

// #example[
//   #TODO
// ]

== First Homology

#note[
Recall the *commutator subgroup* of a group $G$ is defined as 
$
  [G, G] := angle.l g^(-1) h^(-1) g h : g , h in G angle.r
$
and the *abelianisation* of $G$ is $G over [G, G]$.
]

The aim is of this section is to show that $H_1 (G, ZZ) iso G over [G, G]$ for any group $G$. 

#definition[
  The *augmentation ideal* $frak(J)$ of $ZZ G$ is defined as the kernel of the ring map 
  $
    epsilon: ZZ G  &-> ZZ  \
    sum_(g in G) f_g  g &|-> sum_(g in G) f_g.  
  $
]

#remark[
  $epsilon$ is obviously a surjection, so $ZZ iso ZZ G over fJ$. Moreover, $epsilon$ can be considered as the start of a resolution of $ZZ$. 
]

#lemma[
  $frak(J)$ is a free $ZZ$-module with basis ${g - 1 : g in G without {1} }$ (where $1$ is the group identity of $G$).
]
<j-basis>
#proof[
  Simply notice that $ZZ G$ as a free $ZZ$-module has a basis ${1} union {g - 1: g in G without {1}}$ and that $epsilon(g - 1) = 0$ for any $g in G$.
]

#lemma[
  For any $G$-module $A$,
  $H_0(G, A) = A_G iso A over fJ A.
  $
]
#proof[
  $A_G iso ZZ tpzg A iso (ZZ G over fJ) tpzg A iso A over fJ A$, where we use the definition of $fJ$ and @tensor-ideal.
]
#example[
  Regarding $ZZ$, $ZZ G$ and $fJ$ as $G$-modules, we have $H_0 (G, ZZ) = ZZ over fJ ZZ = ZZ$, $H_0 (G, ZZ G) = ZZ G over fJ iso ZZ$, and $H_0 (G, fJ) = fJ over fJ^2$.
]
  <group-h0>

#lemma[
  $fJ over fJ^2 iso G over [G, G]$.
]
#note[
  $fJ^2$ is the free $ZZ$-module with basis ${(g -1) (h - 1) : g, h in G without {1}}$.
]
#proof[
  Define map $
  theta : G &-> fJ over fJ^2 \ 
  g &|-> g - 1 + fJ^2.
  $

  Take any $a, b in G$, then we have 
  $
    theta(a b) = a b - 1 + fJ^2 = a b - 1 - (a - 1) (b - 1) + fJ^2 = (a - 1)  + (b-1) +fJ^2  = theta(a) +theta(b),
  $
  so $theta$ is a group homomorphism. Since $fJ over fJ^2$ is abelian, we have 
  $
    theta(a b a^(-1) b^(-1)) = theta(a) + theta(b) - theta(a) - theta(b) = 0,
  $
  so $[G, G] subset.eq Ker theta$, and $theta$  descends to a homomorphism 
  $macron(theta) : G over [G, G] -> fJ over fJ^2$.

  Define group homomorphism $sigma : fJ  &-> G over [G, G]$ linearly expanded by
  $
    n(g - 1) &|-> g^n [G, G ].
  $
  Then for $a, b in G$, we have 
  $
    sigma((a - 1) (b - 1)) = sigma(a b - 1 - (a-1) - (b-1)) = a b a^(-1) b^(-1)  [G, G] = [G, G].
  $
  So $sigma$ descends to a homomorphism $macron(sigma) : fJ over fJ^2 -> G over [G, G]$. 
  The result thus follows from the obvious fact that $macron(sigma)$ and $macron(theta)$ are mutual inverses.
]



#theorem[$H_1 (G , ZZ) iso G over [G, G].$
]
<homology-1>
// #remark[
//   We can define topological space $B G$, the classifying space of $G$ (there is a simplicial object $B . G$ ...?), $H^ast (G, A) = H^ast_"sing" (B G , A)$, because $pi_1(B G, ast) = G$ and $H_1 = pi_1^Ab = G over [G, G] = G^Ab$. This is the meaning of the theorem.
// ]
#proof[
We have a short exact sequence

$ 0 arrow.r fJ arrow.r bb(Z) G arrow.r^epsilon bb(Z) arrow.r 0 $

of $G$-modules, where $ZZ$ is viewed as a trivial $G$-module. The #lest of $"Tor"_ast^(bb(Z) G)$ gives

$ H_1 lr((G , bb(Z) G)) arrow.r H_1 lr((G , bb(Z))) arrow.r fJ_G arrow.r lr((bb(Z) G))_G arrow.r^(epsilon_ast) bb(Z)_G arrow.r 0. $

Since $bb(Z) G$ is a projective and thus flat $bb(Z) G$-module, we have
$H_1 lr((G , bb(Z) G)) eq 0$ by @flat-tor. Notice that $ZZ_G = ZZ$ and 
$ (bb(Z) G)_G iso ZZ$ by @group-h0.
Since $epsilon_ast$ is a surjection, we see $epsilon_ast$ must be an isomorphism $ZZ -> ZZ$. So we have
$H_1 lr((G , bb(Z))) tilde.equiv fJ_G eq fJ slash fJ^2 tilde.equiv G slash lr([G comma G]).$
]

// $ A_G = ZZ tpzg A = Coker(fJ tpzg A -> ZZ G tpzg A) = Coker(fJ tpzg A -> A) $ so $(ZZ G)_G = ZZ G over fJ iso ZZ$. 

== Norm Element
#definition[
Let $G$ be a finite group. The *norm element* of $bb(Z) G$ is
$ N eq sum_(g in G) g in bb(Z) G. $
]
#notation[
  Somehow the convention here is to use a capital letter $N$ for a _group element_, not a group.
]
#lemma[$N$ is a central element of $ZZ G$ and $N in lr((bb(Z) G))^G$.]
#proof[
  For every $h in G$, we have $h N = sum_g h g$, but left multiplication by $h$ is nothing but a permutation of $G$ (recall Cayley's Theorem), so $h N = sum_(g') g' = N$ by reindexing. Similarly, $N h = N$. 
]

#lemma[
The subgroup
$H^0 lr((G comma bb(Z) G)) eq lr((bb(Z) G))^G $
is the two-sided ideal $bb(Z) dot N$ of $bb(Z) G$ generated by $N$, and is thus isomorphic to $ZZ$. 
]
<cohomology-zero>

#proof[
  Take $a =  sum_(g in G) n_g g in (ZZ G)^G$. Then for any $h in G$, $a = h a = sum_(g in G) n_g (h g)$. The coefficient for $g$ in $h a$ is $n_(h^(-1) g)$. Thus, for any $g, h in G$, we have $n_g = n_(h^(-1) g)$, which shows that all $n_g$ are the same. Hence $a = n N$ for some $n in ZZ$.
] 

#lemma[
  When group $G$ is finite, 
  $
    fJ = Ker(ZZ G ->^N ZZ G) = {a in ZZ G : N a  = 0} \
    ZZ dot N = IM(ZZ G ->^N ZZ G). 
  $
]
  <j-ker>
#proof[
  Take $a = sum_(g in G) n_g g in ZZ G$ and write $N = sum_(h in G) h$. We have 
  $
    N a = (sum_(h in G) h) (sum_(g in G) n_g g) = sum_(h in G) sum_(g in G) n_g (h g) = sum_(g' in G) sum_(g in G) n_g g' \ = sum_(g' in G) (sum_(g in G) n_g) g' = (sum_(g in G) n_g) (sum_(g' in G) g') = (sum_(g in G) n_g) N
  $
  Therefore $N a = 0$ if and only if $sum_(g in G) n_g = 0$ or $a in fJ$. 
  The image of $ZZ G ->^N ZZ G$ is also clear from above, since $(sum_(g in G) n_g)$ can take all values in $ZZ$.
]

#corollary[
  For every finite group $G$, there is a #sest 
  $
    ses(fJ, ZZ G, ZZ dot N, g: N).
  $
]
  <ses-norm>

== Finite Cyclic Groups
<finite-cyclic-groups>
Let $C_m eq ⟨sigma colon sigma^m eq 1⟩$ be the cyclic group of order
$m$ generated by $sigma$. Then the norm element of $C_m$ is

$ N = sum_(i = 0)^(m-1) sigma^i = 1 plus sigma plus dots.h plus sigma^(m minus 1) $

We observe

$ 0 eq sigma^m minus 1 eq lr((sigma minus 1)) N $

#remark[
  The group ring can be also viewed as $ZZ [sigma] over (sigma ^ m - 1)$.
]
// #lemma[
// ]
// #proof[
  // In view of @j-ker, we only have to verify that $IM(ZZ C_m ->^N ZZ C_m) = ZZ dot N$. Take $a = sum_(j = 0)^(m-1) n_j sigma^j in ZZ C_m$, we compute 
  // $
  //   N a = (sum_(i = 0)^(m-1) sigma^i) (sum_(j = 0)^(m-1) n_j sigma^j) = sum_(i = 0)^(m-1) sum_(j = 0)^(m-1) n_j sigma^(i + j) = sum_(k = 0)^(m-1)
  // $
// ]

#lemma[
  There is a #sest 
  $
  0 arrow.r bb(Z) dot N arrow.r bb(Z) C_m arrow.r^(sigma minus 1) fJ arrow.r 0.
  $
]
  <ses-cyclic>
#proof[
  We calculate the image and kernel of the map $bb(Z) C_m arrow.r^(sigma minus 1) ZZ C_m$.
  Take $a = sum_(j = 0)^(m-1) n_j sigma^j in ZZ C_m$. Then setting $n_(-1) = n_(m-1)$, we have
   $
    (sigma - 1) a = sum_(j = 0)^(m-1) n_j sigma^(j + 1) - sum_(j = 0)^(m-1) n_j sigma^j = sum_(j = 0)^(m-1) (n_(j-1) - n_j) sigma^(j).
   $
  Since 
   $
    epsilon((sigma- 1)a) = sum_(j=0)^(m-1) (n_(j -1) - n_j) = 0,
   $
   we see that $(sigma - 1) a in fJ$. On the other hand, for any $b = sum_(k=0)^(m-1) f_k sigma^k in fJ$ such that $sum_(k=0)^(m-1) f_k = 0$, we can find $a$ such that $n_j = - sum_(k=0)^j f_k$ for $j = 0, ..., m-1$ (notice that $n_(m-1) = n_(-1) = 0$) so that $n_(j-1) - n_j = f_j$, or $(sigma - 1)a = b$. This shows that $IM(bb(Z) C_m arrow.r^(sigma minus 1) ZZ C_m) = fJ$.
   
  For the kernel, $(sigma - 1) a = 0$ if and only if $n_(j-1) = n_j$ for all $j$, if and only if all $n_j$ are equal, #iff $a in ZZ dot N$. 
]
#lemma[
The chain complex

$ dots.h arrow.r bb(Z) C_m arrow.r^(sigma minus 1) bb(Z) C_m arrow.r^N bb(Z) C_m arrow.r^(sigma minus 1) bb(Z) C_m arrow.r^epsilon bb(Z) arrow.r 0 $

is a projective resolution for $bb(Z)$ as a $bb(Z) C_m$-module.
]
#proof[
  This is obtained by splicing the sequences from @ses-norm and @ses-cyclic together.
]

#theorem[
  Let $A$ be a $G$-module, where $G = C_m$. Then

$  H_n lr((C_m , A)) eq cases(
  A slash lr((sigma minus 1)) A quad &"if " n eq 0 comma,
  A^(G ) slash N A quad &"if " n eq 1 comma 3 comma 5 comma dots.h comma,
brace.l a in A colon N a eq 0 brace.r slash lr((sigma minus 1)) A quad &"if " n eq 2 comma 4 comma 6 comma dots.h
)

$ $ H^n lr((C_m , A)) eq cases(
A^G quad &"if " n eq 0 comma,
brace.l a in A colon N a eq 0 brace.r slash lr((sigma minus 1)) A quad &"if " n eq 1 comma 3 comma 5 comma dots.h comma,
A^G slash N A quad &"if " n eq 2 comma 4 comma 6 comma dots.h 
)
$
]
// #proof[
//   Take the resolution obtained from the previous lemma, delete $ZZ$, apply $- tpzg A$ and $homg (-, A)$, and take homology.
// ]

#corollary[
   We have
$  & H_n lr((C_m , bb(Z))) eq cases(bb(Z) quad & "if " n eq 0, bb(Z) slash m  quad & "if " n gt.eq 1 "is odd " comma, 0 quad & "else. ")\
 & H^n lr((C_m , bb(Z))) eq cases(bb(Z) quad& "if " n eq 0, bb(Z) slash m quad & "if " n gt.eq 2 "is even, ", 0  quad & "else. ") $]

//  #remark[
//   Galois homology? Tate homology?
//  ]

 == Free Groups
@weibel[p. 169].

#proposition[
Let $G$ be the free group on the set $X$, and consider
the augmentation ideal $frak(J)$ of $bb(Z) G$. Then $frak(J)$ is a free
$bb(Z) G$-module with basis the set
$X minus 1 eq brace.l x minus 1 colon x in X brace.r$.
]

#proof[
Every
$g in$ $G$ may be written uniquely as a reduced word in the symbols
$lr({x comma x^(minus 1) colon x in X})$; write $G lr((x))$ \(resp.
$G lr((x^(minus 1)))$ ) for the subset of all $g in G$ ending in the
symbol $x$ \(resp. in $x^(minus 1)$ ) so that

$
  G minus brace.l 1 brace.r = {G(x)}_(x in X) union.sq {G(x^(-1))}_(x in X).
$

By @j-basis, $frak(J)$ is a free abelian group with
$bb(Z)$-basis $brace.l g minus 1 colon g in G$, $g eq.not 1 brace.r$.
Now we claim that the $ZZ$-basis $brace.l g minus 1 : g in G, g eq.not 1 brace.r$ can be uniquely rewritten in terms of the set $brace.l g lr((x minus 1))  : g in G, x in X brace.r$. We prove this by induction on word length of $g$. When the word length is $1$, either $g = x$ or $g = x^(-1)$ for some $x in X$, so the claim is trivial. When the word length is $n$, then we can write either $g = g' x$ (if $g in G(x)$) or $g = g' x^(-1)$ (if $g in G(x^(-1))$), where the word length of $g'$ is $(n-1)$. In the first case,  
$ g -1 = g 'x minus 1 & eq g' lr((x minus 1)) plus lr((g' minus 1)), $
and in the second case,
$
g - 1 = g' x^(minus 1) minus 1 & eq minus lr((g' x^(minus 1))) lr((x minus 1)) plus lr((g' minus 1)).  $
Hence in both cases, the claim follows from the induction hypothesis. We can similarly prove that we can uniquely rewrite ${g(x-1)}$ in terms of ${g-1: g!=1}$.
Therefore
$brace.l g lr((x minus 1))$ : $g in G comma x in X brace.r$ is another
$bb(Z)$-basis of $frak(J)$, and
$X minus 1 eq brace.l x minus 1 colon x in X brace.r$ is a
$bb(Z) G$-basis.
]

#corollary[
 If $G$ is a free group on $X$, then $bb(Z)$ has the free
resolution
$ 0 arrow.r frak(J) arrow.r bb(Z) G arrow.r bb(Z) arrow.r 0 dot.basic $

Consequently, 
$H_n lr((G , A)) eq H^n lr((G , A)) eq 0$ for
$n eq.not 0 comma 1$. 

Moreover, when $A = ZZ$,
$ H_0 lr((G , bb(Z))) tilde.equiv H^0 lr((G , bb(Z))) tilde.equiv bb(Z) $
$ H_1 lr((G , bb(Z))) tilde.equiv xor.big_(x in X) bb(Z) \ H^1 lr((G , bb(Z))) tilde.equiv product_(x in X) bb(Z) $
]

#proof[
$H_ast lr((G , A))$ is the homology of
$0 arrow.r frak(J) times.circle_(bb(Z) G) A arrow.r A arrow.r 0$, and
$H^ast lr((G , A))$ is the cohomology of
$0 arrow.r A arrow.r "Hom"_G lr((frak(J) comma A)) arrow.r 0$. For
$A eq bb(Z)$, $H_0 (G, ZZ)$ and $H^0 (G, ZZ)$ come from @group-h0 and @cohomology-zero, respectively. $H_1 (G, ZZ) iso G over [G, G]$ by @homology-1, where $G over [G, G]$ is the free abelian group over $X$. We finally see that the differential $ZZ arrow.r "Hom"_G lr((frak(J) comma ZZ))$ must be zero, hence $H^1 (G, ZZ) = homg (fJ, ZZ) tilde.equiv product_(x in X) bb(Z)$.
]

// #TODO change the notation $H_ast (G, A)$ (comma not semicolon.)
== Derivations
<crossed-homomorphisms>
// Historically, the maps we are interested in are called \"crossed
// homomorphisms\". In these notes, however, we will adopt the more modern
// term \"derivations\". Many of the proofs from now on are omitted; we
// have opted just to define the objects and sketch the theory. The proofs
// can all be found in Weibel.

#definition[
Let $G$ be a group and $A$ be a left $G$-module. A
*derivation* of $G$ in $A$ is a set map $D colon G arrow.r A$ with
$ D lr((g h)) eq g D lr((h)) plus D lr((g)) $ for all $g comma h in G $.
Write $"Der"lr((G comma A))$ for the set of derivations of $G$ in $A$.
]

#remark[
In general, if $R$ is a ring and $A$ is an $R$-$R$-bimodule, a derivation of $R$ in $A$ is an abelian group homomorphism $D : R -> A$ such that  

$ D lr((r s)) eq r D lr((s)) plus D lr((r)) s.  $

Here for $R = ZZ G$, we have
$D lr((g)) h eq D lr((g))$ because we are viewing $A$ as a $ZZ G$-$ZZ G$-bimodule with
 trivial $G$-action on the right. 
]

#lemma[
$"Der"lr((G comma A))$ is an abelian group under pointwise addition.
]

#definition[
  For $a in A$, let $D_a colon G arrow.r A$ be the map
  $D_a lr((g)) eq g a minus a$. A derivation of the form $D_a$ is a *principal
derivation*. Write $"PDer"lr((G comma A))$ for the set of principal derivations of $G$ in $A$.
]

#lemma[
$D_a plus D_b eq$ $D_(a plus b)$ and $"PDer"lr((G comma A))$ is a subgroup of $"Der"lr((G comma A))$.
]
#lemma[
  $PDer(G, A) iso A over A^G$.
]
<pder-ag>

#definition[
Let
$phi colon fJ arrow.r A$ be a $G$-map. Define
$D_phi colon G arrow.r A$ by
$D_phi lr((g)) eq phi lr((g minus 1)). $
]
#lemma[
The map $phi arrow.r.bar D_phi : "Hom"_G lr((fJ comma A)) arrow.r "Der"lr((G comma A))$ is a natural isomorphism of abelian groups.
]
#proof[@weibel[Lemma 6.4.4].
  First we show that $D_phi : G-> A$ is indeed a derivation: 
  $
    D_phi (g h) = phi (g h - 1) = phi (g h - g) + phi (g - 1) = g D_phi (h) + D_phi (g)
  $
  The map $phi arrow.r.bar D_phi$ is obviously a natural group homomorphism, so it remains to verify that it is an isomorphism. 
  
  Suppose $D_phi = 0$, i.e., $D_phi (g) = phi (g - 1) =  0$ for all $g in G$. Since ${g-1 : g!=1}$ forms a basis for $fJ$, we see that $phi = 0$. Hence the map $phi arrow.r.bar D_phi$ is an injection.

  Take any $D in Der(G, A)$. Define $phi : fJ -> A$ by $phi(g - 1) = D(g)$ for all $g != 1$. This extends to an abelian group homomorphism since ${g-1 : g!=1}$ forms a basis of $fJ$. It is easy to show that $phi$ is a $G$-map and $D_phi = D$, so the map $phi arrow.r.bar D_phi$ is also a surjection.
]

#theorem[
$ H^1 lr((G comma A)) iso "Der"lr((G comma A)) over "PDer"lr((G comma A))$.
]
<h1ga>
#proof[@weibel[Theorem 6.4.5].
The short exact sequence

$ 0 arrow.r fJ arrow.r bb(Z) G arrow.r bb(Z) arrow.r 0 $

of $bb(Z) G$-modules gives a long exact sequence beginning with

$
  0 arrow.r homg lr((bb(Z) comma A)) arrow.r homg lr((bb(Z) G comma A)) arrow.r homg lr((fJ comma A)) arrow.r Ext_(ZZ G)^1 (ZZ, A) arrow.r Ext_(ZZ G)^1 (ZZ G, A) 
$
which reduces to
$ 0 arrow.r A^G arrow.r A arrow.r Der(G, A) arrow.r H^1 lr((G , A)) arrow.r 0 $

The result then follows from @pder-ag.
]

#corollary[
Let $A$ be a trivial $G$-module. Then

$ H^1 lr((G comma A)) iso "Der"lr((G comma A)) tilde.equiv "Hom"_Grp lr((G comma A)). $
]

// #theorem([Hilbert Theorem 90])[
// Let $L slash K$ be a finite Galois
// extension with Galois group $G$. Let $L^ast.basic$ be the unit group of
// $L$. Then $L^ast.basic$ is naturally a $G$-module, and

// $ H^1 lr((G comma L^ast.basic)) eq 0 $
// ]



== Bar Complexes
<bar-complex>
Throughout this section, $bb(Z)$ is a trivial $G$-module.

#definition[
The *unnormalised bar complex* is the chain complex

$ dots.h arrow.r B_2^u arrow.r B_1^u arrow.r B_0^u arrow.r^epsilon bb(Z) arrow.r 0 $

with $B_0^u eq bb(Z) G$ and $B_n^u$ is the free $ZZ G$-module on the set of all symbols $[g_1 tp ... tp g_n]$ with $g_i in G$ for $n >=1$.
The differential $d colon B_n^u arrow.r B_(n minus 1)^u$ is given by

$ d eq sum_(i eq 0)^n lr((minus 1))^i d_i, $

where

$   d_0 lr(([g_1 times.circle dots.h times.circle g_n])) &eq g_1 [g_2 times.circle dots.h times.circle g_n] \
  d_i lr(([g_1 times.circle dots.h times.circle g_n])) &eq [g_1 times.circle dots.h times.circle g_i g_(i plus 1) times.circle dots.h times.circle g_n] quad upright(" for ") 1 lt.eq i lt.eq n minus 1 \
  d_n lr(([g_1 times.circle dots.h times.circle g_n])) &eq [g_1 times.circle dots.h times.circle g_(n minus 1)].  $
]

#definition[
The *normalised bar complex* is

$ dots.h arrow.r B_2 arrow.r B_1 arrow.r B_0 arrow.r^epsilon.alt bb(Z) arrow.r 0, $

where $B_0 eq bb(Z) G$, and for $n gt.eq 1$, the group $B_n$ is the free $ZZ G$-module on the set of all symbols
$[g_1 lr(|dots.h|) g_n]$ with $g_i in G without brace.l 1 brace.r $.
The differential $d colon B_n arrow.r B_(n minus 1)$ is
$d eq sum_(i eq 0)^n lr((minus 1))^i d_i$, where

$ d_0 ([g_1 lr(|dots.h|) g_n]) & eq g_1  [g_2 lr(|dots.h|) g_n] \
d_i lr(([g_1 lr(|dots.h|) g_n])) & eq [g_1 lr(|dots.h|) g_i g_(i plus 1) lr(|dots.h|) g_n] quad upright(" for ") 1 lt.eq i lt.eq n minus 1\
d_n lr(([g_1 lr(|dots.h|) g_n])) & eq [g_1 lr(|dots.h|) g_(n minus 1)] $

We write $[]$ for $1 in B_0 eq bb(Z) G$. If any of the $g_i$ is 1 , we
write $lr([dots.h lr(|g_i|) dots.h])$ for $0 in B_n$.
]


#example[
We have

$ d lr((lr([g|h]))) &eq g lr([h]) minus lr([g h]) plus lr([g]), \
 d lr((lr([f|g|h]))) &eq f lr([g|h]) minus lr([f g|h]) plus lr([f|g h]) minus lr([f|g]). $]
  
#theorem[
The normalised and unnormalised bar complexes are free
resolutions of $bb(Z)$ as a $bb(Z) G$-module.
]
#proof[
  @weibel[Theorem 6.5.3]. We only give the proof for the normalised bar complexes, as the unnormalised case is the same. By @null-homotopic-acyclic, we only need to show that there exist abelian group homomorphisms $s_(-1): ZZ -> B_0$ and $s_n : B_n -> B_(n+1)$ for $n >= 0$ such that $d s + s d = 1$. The desired construction is given as 
  $s_(-1) (1) = [ ]$
  and 
  $
    s_n (g_0[g_1|...|g_n]) = [g_0|g_1|...|g_n]
  $
  for $n >=0$. 
]

#corollary[
 $H^ast lr((G comma A))$ is the
cohomology of either the chain complex $"Hom"_G lr((B_ast^u comma A))$
or $"Hom"_G lr((B_ast comma A))$.
]


This allows us to give an explicit description of group cohomology.

#definition[
Define an *$n$-cochain* as a function $f colon G^n arrow.r A$. An
$n$-cochain $phi$ is *normalised* if
$phi lr((g_1 comma dots.h comma g_n)) eq 0$ whenever there exists some $g_i = 1$. 
Define the differential $d$ of an $n$-cochain $phi$ as an $(n+1)$-cochain $d phi$ given by

$ (d phi) lr((g_1 comma dots.h comma g_(n+1))) eq g_1 phi lr((g_2 comma dots.h comma g_(n+1))) plus sum_(i eq 1)^(n) lr((minus 1))^(i) phi lr((dots.h comma g_i g_(i plus 1) comma dots.h)) plus lr((minus 1))^(n+1) phi lr((g_1 comma dots.h comma g_(n))). $

If $phi$ is an $n$-cochain such that $d phi eq 0$, then $phi$ is an *$n$-cocycle*. If $phi'$ is an $(n-1)$-cochain, then the
$n$-cochain $d phi'$ is an *$n$-coboundary*. Write $Z^n lr((G comma A))$ and
$B^n lr((G comma A))$ for the abelian groups of $n$-cocycles and
$n$-coboundaries respectively.
]

From the definition, we see that 
$"Hom"_G lr((B_n^u comma A))$ consists of all $n$-cochains, 
while $"Hom"_G lr((B_n comma A))$ consists of all normalised $n$-cochains. 
#corollary[
$ H^n lr((G comma A)) eq Z^n lr((G comma A)) slash B^n lr((G comma A))$.
]

#example[
$ H^1 lr((G comma A)) eq "Der"lr((G comma A)) slash "PDer"lr((G comma A))$.
] 
#proof[
  @weibel[Example 6.5.6]. This is a direct proof of @h1ga using bar resolutions.  A $0 $-cochain is a map $1 arrow.r A$, that is, an element
of $A$. If $a in A$, then $d a$ is the map $G arrow.r A$ sending $g$ to
$g a - a$, which is a principal derivation by definition. Therefore, $phi in B^1 (G, A)$ #iff there exists $a in A$ such that $phi = d a$, #iff $phi in PDer(G, A)$. So $B^1 (G, A) = PDer(G, A)$.

On the other hand, $phi in Z^1 (G, A)$ #iff $d phi = 0$, #iff for all $g, h in G$, 
$
  0 = (d phi) (g, h) = g phi(h) - phi (g h) + phi(g)
$
#iff $phi in Der(G, A)$. Thus $Z^1 (G, A) = Der(G, A)$.
]

== Group Extensions
<group-extensions>
#definition[
Let $A$ be an abelian group and let $G$ be a group. An *extension* of $G$
by $A$ is a short exact sequence

$ 0 arrow.r A arrow.r E arrow.r^pi G arrow.r 1. $

The extension *splits* if $pi$ has a section, i.e., if there is a group
homomorphism $s colon G arrow.r E$ such that $pi compose s eq id_G$.
Extensions

$ 0 arrow.r A arrow.r E_i arrow.r^pi G arrow.r 1, $

for $i eq 1 comma 2$ are *equivalent* if there is a group isomorphism
$E_1 arrow.r E_2$ such that the obvious diagram commutes.
]

#theorem[ There is a natural bijection between $H^2 lr((G comma A))$ and the equivalence classes of extensions of $G$ by $A$.]
#proof[@weibel[Classification Theorem 6.6.3].]

// == The Bar Resolution

// We have adjunction
// $
//   ZZ G tp_ZZ - ： Ab arrows.lr ZGMod : "Forget"
// $


// $
//   ... -> B^n_2 -> B^n_1 -> B^n_0 -> ZZ -> 0
// $
// $B^n_n$ is the free $ZZ G$-module on basis $[g_1 tp ... tp g_n]$ for $g_i in G$. 

// $d: B^n_n -> B^n_(n-1)$

// #theorem[
//   The bar complexes form a free resolution of the $ZZ G$-module $ZZ$.
// ]
