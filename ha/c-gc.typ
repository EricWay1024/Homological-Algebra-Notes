#import "../libs/template.typ": *

= Group (Co)homology

== Definitions

#definition[
  Let $G$ be a group. A *(left) $G$-module* is an abelian group $A$ together with a left group action $rho: G times A -> A$, with $rho(g, a)$ denoted as $g dot a$, such that 
  $
    g dot (a_1 + a_2) = g dot a_1 + g dot a_2
  $
  for all $g in G$ and $a_1, a_2 in A$. 

  A *morphism* $A -> B$ of $G$-modules is a group homomorphism (i.e. $ZZ$-linear map) $phi: A -> B$ such that 
  $
    phi(g dot a) = g dot phi (a)
  $
  for all $g in G$ and $a in A$.

  The category of $G$-modules is denoted as $GMod$, where we write $hom_GMod$ as $homg$.
]

  Recall that for any group $G$, $ZZ G$ is the integral group ring which consists of formal sums of elements of $G$ with integer coefficients:
  $
    sum_(g in G) f_g g
  $
  where $f_g in ZZ$ is non-zero for only fintely many $g in G$. $ZZ G$ is a ring because the product of two elements of $ZZ G$ is well-defined.

  #lemma[
    There is an equivalence of categories $GMod iso ZGMod$.
  ]

  This indicates that $GMod$ is also an abelian category (which we love).

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
      A_G = A over angle.l g dot a - a : g in G, a in A angle.r 
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
      A^G iso hom_(ZZ G) (ZZ , A)
    $
  ]
  #proof[
 Considering $bb(Z)$ as a $bb(Z)$-$ bb(Z) G$ bimodule, the trivial module functor $ZMod -> ZGMod$ is the functor
$"Hom"_(bb(Z)) lr((bb(Z) comma minus))$. We have seen that
$bb(Z) times.circle_(bb(Z) G) -$  is its left adjoint; this functor must
agree with its other left adjoint $minus_G$. (See alternative proof in @notes[Lemma 13.9].)

For the second
equation, we use adjointness:
$A^G tilde.equiv "Hom"_(Ab) lr((bb(Z) comma A^G)) tilde.equiv$
$"Hom"_G lr((bb(Z) comma A))$.
 ]

 #remark[
    In other words, $(-_G) = (ZZ tpzg -) = (- tpzg ZZ)$ (because the ring $ZZ G$ is commutative) and $(-^G )= hom_(ZZ G) (ZZ, -)$.
 ]

#definition[
Let $A$ be a $G$-module. We define the *homology groups of
$G$ with coefficients in $A$* as the left derived functors of $(-^G)$:
$ H_ast lr((G ; A)) = L_ast lr((minus^ G)) lr((A)) tilde.equiv "Tor"_ast^(bb(Z) G) lr((bb(Z) comma A)) $ 
By definition, $H_0 lr((G semi A)) eq A_G$. 

Similarly, we define the *cohomology groups of
$G$ with coefficients in $A$* as the right derived functors of $(-_G)$:
$ H^ast lr((G semi A)) = R^ast lr((-_G)) lr((A)) tilde.equiv "Ext"_(bb(Z) G)^ast lr((bb(Z) comma A)) $ 
By definition, $H^0 (G; A) = A^G$. 
]

#example[
  #TODO
]

== First Homology with Integer Coefficients

Recall the *commutator subgroup* of a group $G$ is defined as 
$
  [G, G] := angle.l g^(-1) h^(-1) g h : g , h in G angle.r
$
and the *abelianisation* of $G$ is $G over [G, G]$.

The aim is of this section is to show that $H_1 (G; ZZ) iso G over [G, G]$ for any group $G$. 

#definition[
  The *augmentation ideal* $frak(J)$ of $ZZ G$ is defined as the kernel of the ring map 
  $
    epsilon: ZZ G  &-> ZZ  \
    sum_(g in G) f_g  g &|-> sum_(g in G) f_g  
  $
]

#remark[
  This is the start of a resolution of $ZZ$. 
]

#lemma[
  $frak(J)$ is a free $ZZ$-module with basis ${g - 1 : g in G without {1} }$ (where $1$ is the group identity of $G$).
]
#proof[
  Simply notice that $ZZ G$ as a free $ZZ$-module has a basis ${1} union {g - 1: g in G without {1}}$ and that $epsilon(g - 1) = 0$ for any $g in G$.
]

#lemma[
  For any $G$-module $A$,
  $
    H_0(G; A) = A_G iso A over fJ A
  $
]
#proof[
  $A_G iso ZZ tpzg A iso (ZZ G over fJ) tpzg A iso A over fJ A$, where we use the definition of $fJ$ and @tensor-ideal.
]
#example[
  Regarding $ZZ$, $ZZ G$ and $fJ$ as $G$-modules, we have $H_0 (G; ZZ) = ZZ over fJ ZZ = ZZ$, $H_0 (G; ZZ G) = ZZ G over fJ iso ZZ$, and $H_0 (G; fJ) = fJ over fJ^2$.
]
  <group-h0>

#lemma[
  $ fJ over fJ^2 iso G over [G, G] $ where $fJ^2$ is the free $ZZ$-module with basis ${(g -1) (h - 1) : g, h in G without {1}}$.
]
#proof[
  Define map $
  theta : G &-> fJ over fJ^2 \ 
  g &|-> g - 1 + fJ^2
  $

  Take any $a, b in G$, then we have 
  $
    theta(a b) = a b - 1 + fJ^2 = a b - 1 - (a - 1) (b - 1) + fJ^2 = (a - 1)  + (b-1) +fJ^2  = theta(a) +theta(b)
  $
  so $theta$ is a group homomorphism. Since $fJ over fJ^2$ is abelian, we have 
  $
    theta(a b a^(-1) b^(-1)) = theta(a) + theta(b) - theta(a) - theta(b) = 0
  $
  so $[G, G] subset.eq Ker theta$, and $theta$  descends to a homomorphism 
  $macron(theta) : G over [G, G] -> fJ over fJ^2$.

  Define group homomorphism $sigma : fJ  &-> G over [G, G]$ linearly expanded by
  $
    g - 1 &|-> g +[G, G ]
  $
  Then for $a, b in G$, we have 
  $
    sigma((a - 1) (b - 1)) = sigma(a b - 1 - (a-1) - (b-1)) = a b a^(-1) b^(-1) + [G, G] = [G, G]
  $
  So $sigma$ descends to a homomorphism $macron(sigma) : fJ over fJ^2 -> G over [G, G]$. 
  The result thus follows from the obvious fact that $macron(sigma)$ and $macron(theta)$ are mutual inverses.
]



#theorem[
  As promised, we have 
  $
    H_1 (G ; ZZ) iso G over [G, G]
  $

]
#remark[
  We can define topological space $B G$, the classifying space of $G$ (there is a simplicial object $B . G$ ...?), $H^ast (G, A) = H^ast_"sing" (B G , A)$, because $pi_1(B G, ast) = G$ and $H_1 = pi_1^Ab = G over [G, G] = G^Ab$. This is the meaning of the theorem.
]
#proof[
We have a short exact sequence

$ 0 arrow.r fJ arrow.r bb(Z) G arrow.r^epsilon bb(Z) arrow.r 0 $

of $G$-modules, where $ZZ$ is viewed as a trivial $G$-module. Since $"Tor"_ast^(bb(Z) G)$ is a homological
$delta$-functor, we obtain an exact sequence

$ H_1 lr((G ; bb(Z) G)) arrow.r H_1 lr((G ; bb(Z))) arrow.r fJ_G arrow.r lr((bb(Z) G))_G arrow.r^(epsilon_ast) bb(Z)_G arrow.r 0 $

Since $bb(Z) G$ is a projective $bb(Z) G$-module, we have
$H_1 lr((G ; bb(Z) G)) eq 0$. Notice that $ZZ_G = ZZ$ and 
$ (bb(Z) G)_G iso ZZ$ by @group-h0.
Since $epsilon_ast$ is a surjection, we see $epsilon_ast$ must be an isomorphism $ZZ -> ZZ$. So we have

$ H_1 lr((G ; bb(Z))) tilde.equiv fJ_G eq fJ slash fJ^2 tilde.equiv G slash lr([G comma G]) $
]

$ A_G = ZZ tpzg A = coker(fJ tpzg A -> ZZ G tpzg A) = coker(fJ tpzg A -> A) $ so $(ZZ G)_G = ZZ G over fJ iso ZZ$. 

== Norm Element
#definition[
Let $G$ be a finite group. The *norm element* of $bb(Z) G$ is
$ N eq sum_(g in G) g in bb(Z) G $
]
#notation[
  Somehow the convention here is to use a capital letter $N$ for a group _element_, not a group.
]
#lemma[$N$ is a central element of $ZZ G$ and $N in lr((bb(Z) G))^G$.]
#proof[
  For every $h in G$, we have $h N = sum_g h g$, but left multiplication by $h$ is nothing but a permutation of $G$ (recall Cayley's Theorem), so $h N = sum_(g') g' = N$ by reindexing. Similarly, $N h = N$. 
]

#lemma[
The subgroup

$ H^0 lr((G comma bb(Z) G)) eq lr((bb(Z) G))^G $

is the two-sided ideal $bb(Z) dot N$ of $bb(Z) G$ generated by $N$, and is thus isomorphic to $ZZ$. 
]

#proof[
  Take $a =  sum_(g in G) n_g g in (ZZ G)^G$. Then for any $h in G$, $a = h a = sum_(g in G) n_g (h g)$. The coefficient for $g$ in $h a$ is $n_(h^(-1) g)$. Thus, for any $g, h in G$, we have $n_g = n_(h^(-1) g)$, which shows that all $n_g$ are the same. Hence $a = n N$ for some $n in ZZ$.
] 

#lemma[
  When group $G$ is finite, 
  $
    fJ = Ker(ZZ G ->^N ZZ G) = {a in ZZ G : N a  = 0} \
    ZZ dot N = IM(ZZ G ->^N ZZ G) 
  $
]
  <j-ker>
#proof[
  Take $a = sum_(g in G) n_g g$ and write $N = sum_(h in G) h$. We have 
  $
    N a = (sum_(h in G) h) (sum_(g in G) n_g g) = sum_(h in G) sum_(g in G) n_g (h g) = sum_(g' in G) sum_(g in G) n_g g' \ = sum_(g' in G) (sum_(g in G) n_g) g' = (sum_(g in G) n_g) (sum_(g' in G) g') = (sum_(g in G) n_g) N
  $
  Therefore $N a = 0$ if and only if $sum_(g in G) n_g = 0$ or $a in fJ$. 
  
  The image of the given map is also clear from above.
]

#corollary[
  For every finite group $G$, there is a #sest 
  $
    ses(fJ, ZZ G, ZZ dot N, g: N)
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
  0 arrow.r bb(Z) dot N arrow.r bb(Z) C_m arrow.r^(sigma minus 1) fJ arrow.r 0
  $
]
  <ses-cyclic>
#proof[
  We calculate the image and kernel of the map $bb(Z) C_m arrow.r^(sigma minus 1) ZZ C_m$.
  Take $a = sum_(j = 0)^(m-1) n_j sigma^j in ZZ C_m$. Then setting $n_(-1) = n_(m-1)$, we have
   $
    (sigma - 1) a = sum_(j = 0)^(m-1) n_j sigma^(j + 1) - sum_(j = 0)^(m-1) n_j sigma^j = sum_(j = 0)^(m-1) (n_(j-1) - n_j) sigma^(j)
   $
  Since 
   $
    epsilon((sigma- 1)a) = sum_(j=0)^(m-1) (n_(j -1) - n_j) = 0
   $
   we see that $(sigma - 1) a in fJ$. On the other hand, for any $b = sum_(k=0)^(m-1) f_k sigma^k in fJ$ such that $sum_(k=0)^(m-1) f_k = 0$, we can find $a$ such that $n_j = - sum_(k=0)^j f_k$ for $j = 0, ..., m-1$ (notice that $n_(m-1) = n_(-1) = 0$) so that $n_(j-1) - n_j = f_j$, or $(sigma - 1)a = b$. This shows that $IM(bb(Z) C_m arrow.r^(sigma minus 1) ZZ C_m) = fJ$.
   
  For the kernel, $(sigma - 1) a = 0$ if and only if $n_(j-1) = n_j$ for all $j$, which means that all $n_j$ are equal, and thus $(sigma - 1) a in ZZ dot N$. 
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

$  H_n lr((C_m ; A)) eq cases(
  A slash lr((sigma minus 1)) A quad &"if " n eq 0 comma,
  A^(G ) slash N A quad &"if " n eq 1 comma 3 comma 5 comma dots.h comma,
brace.l a in A colon N a eq 0 brace.r slash lr((sigma minus 1)) A quad &"if " n eq 2 comma 4 comma 6 comma dots.h
)

$ $ H^n lr((C_m ; A)) eq cases(
A^G quad &"if " n eq 0 comma,
brace.l a in A colon N a eq 0 brace.r slash lr((sigma minus 1)) A quad &"if " n eq 1 comma 3 comma 5 comma dots.h comma,
A^G slash N A quad &"if " n eq 2 comma 4 comma 6 comma dots.h 
)
$
]
#proof[
  Take the resolution obtained from the previous lemma, delete $ZZ$, apply $- tpzg A$ and $homg (-, A)$, and take homology.
]

#corollary[
   We have
$  & H_n lr((C_m ; bb(Z))) eq cases(bb(Z) quad & "if " n eq 0, bb(Z) slash m  quad & "if " n gt.eq 1 "is odd " comma, 0 quad & "else. ")\
 & H^n lr((C_m ; bb(Z))) eq cases(bb(Z) quad& "if " n eq 0, bb(Z) slash m quad & "if " n gt.eq 2 "is even, ", 0  quad & "else. ") $]

 #remark[
  Galois homology? Tate homology?
 ]

 == Free Groups
@weibel[p. 169].

#proposition[
Let $G$ be the free group on the set $X$, and consider
the augmentation ideal $frak(J)$ of $bb(Z) G$. Then $frak(J)$ is a free
$bb(Z) G$-module with basis the set
$X minus 1 eq brace.l x minus 1 colon x in X brace.r$.
]

#proof[
We have seen that $frak(J)$ is a free abelian group with
$bb(Z)$-basis $brace.l g minus 1 colon g in G$, $g eq.not 1 brace.r$. We
claim that another $bb(Z)$-basis is
$brace.l g lr((x minus 1)) colon g in G comma x in X brace.r$. Every
$g in$ $G$ may be written uniquely as a reduced word in the symbols
$lr({x comma x^(minus 1) colon x in X})$; write $G lr((x))$ \(resp.
$G lr((x^(minus 1)))$ ) for the subset of all $g in G$ ending in the
symbol $x$ \(resp. in $x^(minus 1)$ ) so that
$G minus brace.l 1 brace.r$ is the disjoint union \(over all $x in X$ )
of the sets $G lr((x))$ and $G lr((x^(minus 1)))$. The formulas
$ lr((g x minus 1)) & eq g lr((x minus 1)) plus lr((g minus 1)) quad upright(" if ") g x in G lr((x))\
lr((g x^(minus 1) minus 1)) & eq minus lr((g x^(minus 1))) lr((x minus 1)) plus lr((g minus 1)) quad upright(" if ") g x^(minus 1) in G lr((x^(minus 1))) $
and induction on word length allow us to uniquely rewrite the basis
$brace.l g minus 1$ : $g eq.not 1 brace.r$ in terms of the set
$brace.l g lr((x minus 1)) brace.r$, and vice versa. Therefore
$brace.l g lr((x minus 1))$ : $g in G comma x in X brace.r$ is a
$bb(Z)$-basis of $frak(J)$, and
$X minus 1 eq brace.l x minus 1 colon x in X brace.r$ is a
$bb(Z) G$-basis.
]

#corollary[
 If $G$ is a free group on $X$, then $bb(Z)$ has the free
resolution
$ 0 arrow.r frak(J) arrow.r bb(Z) G arrow.r bb(Z) arrow.r 0 dot.basic $

Consequently, 
$H_n lr((G semi A)) eq H^n lr((G semi A)) eq 0$ for
$n eq.not 0 comma 1$. Moreover,
$H_0 lr((G semi bb(Z))) tilde.equiv H^0 lr((G semi bb(Z))) tilde.equiv bb(Z)$,
while
$ H_1 lr((G semi bb(Z))) tilde.equiv xor.big_(x in X) bb(Z) quad upright(" and ") quad H^1 lr((G semi bb(Z))) tilde.equiv product_(x in X) bb(Z) dot.basic $
]

#proof[
$H_ast lr((G semi A))$ is the homology of
$0 arrow.r frak(J) times.circle_(bb(Z) G) A arrow.r A arrow.r 0$, and
$H^ast lr((G semi A))$ is the cohomology of
$0 arrow.r A arrow.r "Hom"_G lr((frak(J) comma A)) arrow.r 0$. For
$A eq bb(Z)$, the differentials are zero.
]

#TODO change the notation $H_ast (G, A)$ (comma not semicolon.)

== The Bar Resolution

We have adjunction
$
  ZZ G tp_ZZ - ： Ab arrows.lr ZGMod : "Forget"
$


$
  ... -> B^n_2 -> B^n_1 -> B^n_0 -> ZZ -> 0
$
$B^n_n$ is the free $ZZ G$-module on basis $[g_1 tp ... tp g_n]$ for $g_i in G$. 

$d: B^n_n -> B^n_(n-1)$

#theorem[
  The bar complexes form a free resolution of the $ZZ G$-module $ZZ$.
]
