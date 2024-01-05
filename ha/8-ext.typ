#import "../libs/template.typ": *

= Ring Structure on $Ext$
 == Reinterpreting $Ext$
Let $A, B in RMod$  with projective resolutions $P_cx -> A$ and $Q_cx -> B$. Write the total cochain complex $ Tot^Pi (hom (P, Q)) =: T$. Then @balance-ext-2 implies that 
$
  Ext^n _R (A, B) iso H^n (T)
$
Recall that $T^n = product homr (P_i, Q_(i-n)) in Ab$.
If $phi in T^n$, then we can write $phi = product phi_i$ where $phi_i : P_i -> Q_(i - n)$. Therefore, an element $phi$ in $T^n$ can be seen as a chain map $P_cx -> Q_cx [-n]$ once we can show that $phi$ commutes with the differentials of $P_cx$ and $Q_cx [-n]$. We will show that this commuting condition is (almost) equivalent to $phi$ being a cocycle in $T^n$.  Further, if $phi$ is a chain map $P_cx -> Q_cx [-n]$, then $phi$ being null homotopic is (almost) equivalent to $phi$ being a coboundary in $T^n$. These equivalences ultimately give rise to a new interpretation of $Ext$.

The word "almost" in the last paragraph is due to some sign issues of $phi$. To address this, we (magically) define
$
  epsilon_i = cases(1 quad& "if " i equiv 0 comma 3 quad  (mod 4), -1 quad& "if " i equiv 1 comma 2 quad  (mod 4))
$
Then we define $tilde(phi)_i  = epsilon_(n-i) phi_i$ for each $phi_i : P_i -> Q_(i - n)$, and $tilde(phi) = product tilde(phi)_i in T^n$. The following is some simple observations of the definitions.

#lemma[ We have the following:
  - $epsilon_i^2 = 1$;
  - $epsilon_i epsilon_(i - 1) = (-1)^i$;
  - $phi_i = epsilon_(n-i) tilde(phi)_i $;
  - The map $phi |-> tilde(phi)$ is an automorphism of $T^n$.
]
<epsilon-lemma>

It turns out that we need to replace some $phi$ with $tilde(phi)$ in our previous claims, such as the following.
// i.e., $T^n iso tilde(T^n)$, where an arbitrary element of $tilde(T^n)$ is $tilde(phi) = product tilde(phi)_i = product epsilon_(n-i) phi_i$.

#proposition[
  // The map $phi |-> tilde(phi)$ restricts to an isomorphism 
  // $
  //   Z^n (T) iso hom_(Ch(RMod)) (P_cx, Q_cx [-n])
  // $
  // where the left hand side is the cocycles in degree $n$ and the right hand side denotes chain maps $P_cx -> Q_cx [-n]$.
  $phi in T^n$ is a cocycle in $Z^n (T)$ if and only if $tilde(phi)$ can be seen as a chain map $P_cx -> Q_cx [-n]$.
]
#proof[
  As discussed above, the latter is equivalent to $tilde(phi)$ commuting with the differentials, i.e., for all $i$,
  #math.equation(block: true, numbering: "(1)", supplement: "Equation",
  $
    tilde(phi)_i oo d_(i+1)^((P)) = d_(i+1-n)^((Q)) oo tilde(phi)_(i+1)
  $) <phi-commute>
  Using the definition of $tilde(phi)$, @phi-commute can reduced to 
  #math.equation(block: true, numbering: "(1)", supplement: "Equation",
  $
    phi_i oo d_(i+1)^((P)) = (-1)^(i+1-n) d_(i+1-n)^((Q)) oo phi_(i+1)
  $) <phi-commute-2>
  
  On the other hand, $phi in T^n$ is a cocycle, i.e., $d^((T))_n (phi) = 0$, if and only if for all $i$,
  #math.equation(block: true, numbering: "(1)", supplement: "Equation",
  $
    d^h (phi_i) + d^v (phi_(i+1)) = 0
  $) <phi-commute-3>
  Using the definition of $d^h$ and $d^v$, we see that @phi-commute-3 is equivalent to @phi-commute-2.
]

#proposition[
  $phi in Z^n (T)$ is a coboundary in $B^n (T)$ if and only if the chain map $tilde(phi) : P_cx -> Q_cx [-n]$ is null homotopic. 
]
#proof[
  "$=>$". Suppose $phi$ is a coboundary. Then $phi = d (psi)$ for some $psi = product psi_i in T^(n-1)$, where $psi_i : P_i -> Q_(i - n +1)$. We also write $tilde(psi_i) = epsilon_(i -n +1) psi_i$.
  // https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZARgBoAGAXVJADcBDAGwFcYkQALCAWwH0AKAAq8spAAQBFAVgC0YANTEAlEpABfUuky58hFGWLU6TVuy7cxQkeKn9ZYFes0gM2PASLlShmgxZtETh4rOxllG2k5RzUjGCgAc3giUAAzACceJAAmGhwIJDJjf3Z+MKUAPVCHMTgAR2Z6NJgxCAgxKBFKoWjndMzELxA8gt8TAJAOqsUK-n4JFRa2uoam9Uo1IA
#align(center, commutative-diagram(
  node-padding: (90pt, 50pt),
  node((0, 1), [$hom (P_i, Q_(i-n+1))$]),
  node((1, 1), [$hom (P_i, Q_(i-n))$]),
  node((1, 0), [$hom(P_(i-1), Q_(i-n))$]),
  arr((1, 0), (1, 1), [$(-1)^(i-n) square oo d_i^((P))$]),
  arr((0, 1), (1, 1), [$d_(i-n+1)^((Q)) oo square$]),
))
  Considering each $phi_i$, we see that
  $
    phi_i = d^h (psi_(i-1)) + d^v (psi_i) = (-1)^(i-n) psi_(i-1) oo d_i^((P)) + d_(i-n+1)^((Q)) oo psi_i
  $
  Using @epsilon-lemma, we can reduce this to 
  $
    tilde(phi)_i = (-1)^(i-n) tilde(psi)_(i-1) oo d_i^((P)) + (-1)^(i-n+1) d_(i-n+1)^((Q)) oo tilde(psi)_i
  $
  Then we see that $(-1)^(i-n+1) tilde(psi)_i : P_i -> Q_(i - n +1)$ is a chain homotopy between $tilde(phi)$ and $0$.

  "$arrow.l.double$". Suppose that $h_i : P_i -> Q_(i - n +1)$ is a chain homotopy between $tilde(phi)$ and $0$  for each $i$, so that 
  $
    tilde(phi)_i = h_(i-1) oo d_i^((P)) +  d_(i-n+1)^((Q)) oo h_i
  $
  Then we can define for each $i$, $ tilde(psi)_i &= (-1)^(i-n+1) h_i \ psi_i &= epsilon_(i-n+1) tilde(psi)_i $ which gives $psi &= product psi_i in T^(n-1) $. Again with @epsilon-lemma, we can reveal that $d(psi) = phi$, so $phi$ is a coboundary.
]

#corollary[
  $Ext_R^n (A, B)$ is isomorphic to the chain homotopy classes of chain maps $P_cx -> Q_cx [-n]$.
]
<ext-homotopy>
#proof[ $Ext_R^n (A, B) iso H^n (T) = Z^n (T) over B^n (T)$, but now $Z^n (T)$ is isomorphic to the group of chain maps $P_cx -> Q_cx [-n]$ and $B^n (T)$ is isomorphic to the subgroup of null homotopic chain maps.
]
// A detailed proof can be seen @notes[Section 9.1]. 
// To see this intuitively, notice a chain map $P_cx -> Q_cx [-n]$ is a collection of 
// $hom (P_p, Q_(p - n))
// $ for all suitable index $p$, subject to commuting with the differentials. 
// Hence, it is an element of $[Tot^Pi (hom_R (P_cx, Q_cx))]^n =: T^n$.
// One can show that the commuting condition for a chain map is equivalent to being a cycle in $T^n$. 
// Further, the chain map is null homotopic if and only if it is a boundary in $T^n$.


 == Yoneda Product

#proposition[
Given left $R$-modules $A, B, C$, for any $i, j$, there is a well-defined map, called the *Yoneda product*, 
$ ⌣ :  Ext_R^i (A, B) times Ext_R^j (B, C) -> Ext^(i+j)_R (A, C) $ 
which is associative and biadditive. 
]

#proof[
  Write projective resolutions $P_cx -> A$, $ Q_cx -> B$, $ T_cx-> C$.
  Take $x in Ext^i_R\(A, B)$ and $y in Ext^j_R\(B, C)$. 
  By @ext-homotopy,
  we see that $x$ (resp. $y$) corresponds to some $[phi]$ (resp. $[psi]$) which is a chain homotopy class (of chain maps) $P_cx -> Q_cx [-i]$ (resp. $Q_cx -> T_cx [-j]$). 
  Note that $ hom(Q_cx, T_cx [-j]) iso hom(Q_cx [-i], T_cx [-i - j]) $ because the translation functor is an isomorphism on $Ch(RMod)$ and preserves chain homotopy. 
  Hence $[psi]$ can be also viewed as a chain homotopy class  $Q_cx [-i] -> T_cx [-i - j]$. Since chain homotopy commutes with composition, we can obtain $[psi oo phi] = [psi] oo [phi]$, which is a chain homotopy class $P_cx -> T_cx [-i-j]$. Then we define $x ⌣ y in Ext^(i+j)_R (A, C)$ to be the corresponding element of $[psi oo phi]$.
  We can see that $⌣$ is associative and biadditive because the composition of chain maps is associative and biadditive.
]

// #remark[
// We have shown $D^- (RMod) iso K^- ("Proj" RMod)$.
// ]

#corollary[For any $A, B in RMod$,
$ Ext_R^ast (A, A) = plus.circle.big_i Ext_R^i (A, A) $ is a graded ring, and $ Ext_R^ast (A , B) = plus.circle.big_i Ext^i (A, B) $ is a graded module over $Ext_R^ast (A, A)$. 
]


// #TODO what is even a graded ring 

// #TODO alternative definition of Yoneda product, "gluing sequences"

