#import "../libs/template.typ": *

= Ring Structure on $Ext$
<ring-ext>

== Reinterpreting $Ext$
Let $A, B in RMod$ with projective resolutions $P_cx -> A$ and $Q_cx -> B$. Write the total cochain complex $ Tot^Pi (hom (P, Q)) =: T$. Then @balance-ext-2 implies that
$
  Ext^n_R (A, B) iso H^n (T).
$
Recall that $T^n = product homr (P_i, Q_(i-n)) in Ab$.
If $phi in T^n$, then we can write $phi = product phi_i$ where $phi_i : P_i -> Q_(i - n)$. Therefore, an element $phi$ in $T^n$ can be seen as a chain map $P_cx -> Q_cx [-n]$ once we can show that $phi$ commutes with the differentials of $P_cx$ and $Q_cx [-n]$. We will show that this commuting condition is (almost) equivalent to $phi$ being a cocycle in $T^n$. Further, if $phi$ is a chain map $P_cx -> Q_cx [-n]$, then $phi$ being null homotopic is (almost) equivalent to $phi$ being a coboundary in $T^n$. These equivalences ultimately give rise to a new interpretation of $Ext$.

The word "almost" in the last paragraph is due to some sign issues of $phi$. To address this, we define
$
  epsilon_i = cases(1 quad& "if " i equiv 0 comma 3 quad  (mod 4), -1 quad& "if " i equiv 1 comma 2 quad  (mod 4)).
$
Then we define $tilde(phi)_i  = epsilon_(n-i) phi_i$ for each $phi_i : P_i -> Q_(i - n)$, and $tilde(phi) = product tilde(phi)_i in T^n$. The following is some simple observations of the definitions.

#lemma[ We have the following:
  - $epsilon_i^2 = 1$;
  - $epsilon_i epsilon_(i - 1) = (-1)^i$;
  - $phi_i = epsilon_(n-i) tilde(phi)_i $;
  - The map $phi |-> tilde(phi)$ is an automorphism of $T^n$.
]
<epsilon-lemma>

It turns out that we need to replace some $phi$ with $tilde(phi)$ in our previous claims, as in the following.
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
  #math.equation(
    block: true,
    numbering: "(1)",
    supplement: "Equation",
    $
      tilde(phi)_i oo d_(i+1)^((P)) = d_(i+1-n)^((Q)) oo tilde(phi)_(i+1).
    $,
  ) <phi-commute>
  Using the definition of $tilde(phi)$, @phi-commute can reduced to
  #math.equation(
    block: true,
    numbering: "(1)",
    supplement: "Equation",
    $
      phi_i oo d_(i+1)^((P)) = (-1)^(i+1-n) d_(i+1-n)^((Q)) oo phi_(i+1).
    $,
  ) <phi-commute-2>

  On the other hand, $phi in T^n$ is a cocycle, i.e., $d^((T))_n (phi) = 0$, if and only if for all $i$,
  #math.equation(
    block: true,
    numbering: "(1)",
    supplement: "Equation",
    $
      d^h (phi_i) + d^v (phi_(i+1)) = 0.
    $,
  ) <phi-commute-3>
  Using the definition of $d^h$ and $d^v$, we see that @phi-commute-3 is equivalent to @phi-commute-2.
]

#proposition[
  $phi in Z^n (T)$ is a coboundary in $B^n (T)$ if and only if the chain map $tilde(phi) : P_cx -> Q_cx [-n]$ is null homotopic.
]
#proof[
  "$=>$". Suppose $phi$ is a coboundary. Then $phi = d (psi)$ for some $psi = product psi_i in T^(n-1)$, where $psi_i : P_i -> Q_(i - n +1)$. We also write $tilde(psi_i) = epsilon_(i -n +1) psi_i$.
  // https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZARgBoAGAXVJADcBDAGwFcYkQALCAWwH0AKAAq8spAAQBFAVgC0YANTEAlEpABfUuky58hFGWLU6TVuy7cxQkeKn9ZYFes0gM2PASLlShmgxZtETh4rOxllG2k5RzUjGCgAc3giUAAzACceJAAmGhwIJDJjf3Z+MKUAPVCHMTgAR2Z6NJgxCAgxKBFKoWjndMzELxA8gt8TAJAOqsUK-n4JFRa2uoam9Uo1IA
  #align(
    center,
    commutative-diagram(
      node-padding: (90pt, 50pt),
      node((0, 1), [$hom (P_i, Q_(i-n+1))$]),
      node((1, 1), [$hom (P_i, Q_(i-n))$]),
      node((1, 0), [$hom(P_(i-1), Q_(i-n))$]),
      arr((1, 0), (1, 1), [$(-1)^(i-n) square oo d_i^((P))$]),
      arr((0, 1), (1, 1), [$d_(i-n+1)^((Q)) oo square$]),
    ),
  )
  Considering each $phi_i$, we see that
  $
    phi_i = d^h (psi_(i-1)) + d^v (psi_i) = (-1)^(i-n) psi_(i-1) oo d_i^((P)) + d_(i-n+1)^((Q)) oo psi_i.
  $
  Using @epsilon-lemma, we can reduce this to
  $
    tilde(phi)_i = (-1)^(i-n) tilde(psi)_(i-1) oo d_i^((P)) + (-1)^(i-n+1) d_(i-n+1)^((Q)) oo tilde(psi)_i.
  $
  Then we see that $(-1)^(i-n+1) tilde(psi)_i : P_i -> Q_(i - n +1)$ is a chain homotopy between $tilde(phi)$ and $0$.

  "$arrow.l.double$". Suppose that $h_i : P_i -> Q_(i - n +1)$ is a chain homotopy between $tilde(phi)$ and $0$ for each $i$, so that
  $
    tilde(phi)_i = h_(i-1) oo d_i^((P)) + d_(i-n+1)^((Q)) oo h_i.
  $
  Then we can define for each $i$, $ tilde(psi)_i &= (-1)^(i-n+1) h_i, quad psi_i &= epsilon_(i-n+1) tilde(psi)_i, $ which gives $psi &= product psi_i in T^(n-1)$. Again with @epsilon-lemma, we can reveal that $d(psi) = phi$, so $phi$ is a coboundary.
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
  $ ⌣ : Ext_R^i (A, B) times Ext_R^j (B, C) -> Ext^(i+j)_R (A, C), $
  which is associative and biadditive.
]

#proof[
  Write projective resolutions $P_cx -> A$, $ Q_cx -> B$, $ T_cx-> C$.
  Take $x in Ext^i_R\(A, B)$ and $y in Ext^j_R\(B, C)$.
  By @ext-homotopy,
  we see that $x$ (resp. $y$) corresponds to some $[phi]$ (resp. $[psi]$) which is a chain homotopy class (of chain maps) $P_cx -> Q_cx [-i]$ (resp. $Q_cx -> T_cx [-j]$).
  Note that $ hom(Q_cx, T_cx [-j]) iso hom(Q_cx [-i], T_cx [-i - j]) $ because the translation functor is an isomorphism on $Ch(RMod)$ and preserves chain homotopy.
  Hence $[psi]$ can be also viewed as a chain homotopy class $Q_cx [-i] -> T_cx [-i - j]$. Since chain homotopy commutes with composition, we can obtain $[psi oo phi] = [psi] oo [phi]$, which is a chain homotopy class $P_cx -> T_cx [-i-j]$. Then we define $x ⌣ y in Ext^(i+j)_R (A, C)$ to be the corresponding element of $[psi oo phi]$.
  We can see that $⌣$ is associative and biadditive because the composition of chain maps is associative and biadditive.
]

// #remark[
// We have shown $D^- (RMod) iso K^- ("Proj" RMod)$.
// ]

#corollary[For any $A, B in RMod$,
  $
    Ext_R^ast (A, A) = plus.circle.big_i Ext_R^i (A, A)
  $ is a graded ring, and $ Ext_R^ast (A , B) = plus.circle.big_i Ext^i (A, B) $ is a graded module over $Ext_R^ast (A, A)$.
]

#example[
  Let $k$ be a field and $R = k[x] over (x^2)$. View $k$ as the $R$-module $R over x R$. We now calculate the graded ring structure of $Ext_R^ast (k, k)$.

  First, observe that we have a projective resolution of $k$:
  $
    ... ->^x R ->^x R ->^x R -> k -> 0,
  $
  which we denote as $P_cx -> k -> 0$. If we apply $hom_R (-, k)$ to $P_cx$, then $hom_R (R, k) iso k$ and all differentials vanish, so we can quickly use the balancing of $Ext$ to reveal that $Ext_R^n (k, k) iso k$ for all $n >= 0$. We however need to find the generator explicitly for the ring structure.

  Now by @ext-homotopy, $Ext_R^n (k, k)$ is isomorphic to the chain homotopy classes of chain maps $P_cx -> P_cx [-n]$. A chain map $P_cx -> P_cx [-n]$ is a collection of $R$-homomorphisms $f_i : R-> R$ for $i >= n$ such that the following diagram commutes:
  // https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZARgBoAGAXVJADcBDAGwFcYkQAlEAX1PU1z5CKAEwVqdJq3Zde-bHgJEAzOJoMWbRJx58QGBUKIAWNZM0zd8wUpQBWMxunaAdG6v6Bi4cnKOpWiBuLh4GNj6qxBJOgbJ6Yd5EYlHqAZZynoa2JKQp5s46GQlGKKZ5MezkoV4lvrnRaa7u3BIwUADm8ESgAGYAThAAtkhiIDgQSABsqRbaPQD6hBn9Q0hkYxOIAOwzBQsAFGAA1MQAlB4rw4h+G0gAHLuBB8ci58sDVzfja4-sAB4XD4-W6IUYVbQA96rUE0b6IVT5QKQvSXJAIuHGKFXaYggCcWKQOxBOPBIGRvSBiAeIKJpPJIFRiAcIJudMB0OIX021LZLW4QA
  #align(
    center,
    commutative-diagram(
      node-padding: (50pt, 30pt),
      node((0, 1), [$R$]),
      node((0, 2), [$R$]),
      node((0, 3), [$R$]),
      node((0, 4), [$R$]),
      node((0, 5), [$...$]),
      node((0, 0), [$...$]),
      node((1, 3), [$R$]),
      node((1, 2), [$R$]),
      node((1, 1), [$R$]),
      node((1, 4), [$0$]),
      node((1, 0), [$...$]),
      arr((0, 3), (1, 3), [$f_n$]),
      arr((0, 2), (1, 2), [$f_(n+1)$]),
      arr((0, 1), (1, 1), [$f_(n+2)$]),
      arr((0, 1), (0, 2), [$x$]),
      arr((0, 2), (0, 3), [$x$]),
      arr((0, 3), (0, 4), [$x$]),
      arr((0, 4), (0, 5), []),
      arr((1, 3), (1, 4), []),
      arr((1, 2), (1, 3), [$x$]),
      arr((1, 1), (1, 2), [$x$]),
      arr((0, 0), (0, 1), [$x$]),
      arr((1, 0), (1, 1), [$x$]),
    ),
  )
  Note that each $f_i$ is uniquely determined by $f_i (1) in R$. We write $f_i (1) = a_i + b_i x$ for $a_i, b_i in k$ and then we only need to look at $a_i, b_i$ for each $i$. The commutativity of the above diagram indicates that $x (a_i + b_i x) = x (a_(i+1) + b_(i+1) x)$ for each $i$, i.e. $a_i = a_(i+1)$, so all the $a_i$'s are equal.

  We now consider when the chain map $f_ast$ is null homotopic. By definition, that is when there is a collection of $R$-homomorphisms $h_i : R -> R$ for $i >= n-1$ such that $f_i = h_(i-1) oo x + x oo h_i$.
  // https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZARgBoAGAXVJADcBDAGwFcYkQAlEAX1PU1z5CKAEwVqdJq3Zde-bHgJEAzOJoMWbRJx58QGBUKIAWNZM0zd8wUpQBWMxunaAdG6v6Bi4cnKOpWiBuLh4GNj6qxBJOgbJ6Yd5EYlHqAZZynoa2JKQp5s46GQlGKKZ5MezkoV4lvrnRaa7u3BIwUADm8ESgAGYAThAAtkhiIDgQSABsqRbaPQD6hBn9Q0hkYxOIAOwzBQsAFGAA1MQAlB4rw4h+G0gAHLuBB8ci58sDVzfja4-sAB4XD4-W6IUYVbQA96rUE0b6IVT5QKQvSXJAIuHGKFXaYggCcWKQOxBOPBIGRvSBiAeIKJpPJIFRiAcIJudMB0OIX021LZBMQ6zh1MYWDAgSg9DgAAs2iBftpJfNDic3ijKaM4UThaL2OKpTK5SAFYcVRToejNjitWKJdKoLLEewjWAALRnHiUbhAA
  #align(
    center,
    commutative-diagram(
      node-padding: (60pt, 50pt),
      node((0, 1), [$R$]),
      node((0, 2), [$R$]),
      node((0, 3), [$R$]),
      node((0, 4), [$R$]),
      node((0, 5), [$...$]),
      node((0, 0), [$...$]),
      node((1, 3), [$R$]),
      node((1, 2), [$R$]),
      node((1, 1), [$R$]),
      node((1, 4), [$0$]),
      node((1, 0), [$...$]),
      arr((0, 3), (1, 3), [$f_n$]),
      arr((0, 2), (1, 2), [$f_(n+1)$]),
      arr((0, 1), (1, 1), [$f_(n+2)$]),
      arr((0, 1), (0, 2), [$x$]),
      arr((0, 2), (0, 3), [$x$]),
      arr((0, 3), (0, 4), [$x$]),
      arr((0, 4), (0, 5), []),
      arr((1, 3), (1, 4), []),
      arr((1, 2), (1, 3), [$x$]),
      arr((1, 1), (1, 2), [$x$]),
      arr((0, 0), (0, 1), [$x$]),
      arr((1, 0), (1, 1), [$x$]),
      arr((0, 2), (1, 1), [$h_(n+1)$], "dashed"),
      arr((0, 3), (1, 2), [$h_(n)$], "dashed"),
      arr((0, 4), (1, 3), [$h_(n-1)$], "dashed"),
    ),
  )
  In particular, this indicates that $a_i + b_i x = f_i (1) = h_(i-1) (x) + x h_i (1) = x (h_(i-1) (1) + h_(i) (1))$, and thus $a_i = 0$ for all $i$.

  We claim that $a_i = 0$ for all $i$ is a sufficient condition for $f_ast$ to be null homotopic. In this case, $f_i (1) = b_i x$ for each $i >= n$. We construct $h_i: R -> R$ for $i >= n-1$ as follows: $h_(n-1) = 0$ and $h_i (1) = b_i - h_(i-1) (1)$ for all $i >= n$. Then $f_ast$ is null homotopic via $h$.

  Therefore $f_ast$ is null homotopic if and only if $f_i (1) equiv 0 space (mod x)$ for all $i$. So "chain maps modulo homotopy" is the same as "chain maps modulo $x$". In other words, two chain maps $f_ast, g_ast: P_cx -> P_cx [-n]$ are chain homotopic if and only if $f_i (1) equiv g_i (1) space (mod x)$ for all $i$. But we have established that $f_i (1)$'s are all equal modulo $x$. So $Ext_R^ n (k, k) iso k dot f_ast^((n))$, where $f_ast^((n))$ is the chain map $P_cx -> P_cx [-n]$ with $f_i ^((n)) (1)  = 1$ for all $i >= n$.

  It is clear that $f_ast ^((m)) oo f_ast ^((n)) = f_ast ^((m+n))$, so the Yoneda product gives $f_ast ^((m)) ⌣ f_ast ^((n)) = f_ast ^((m+n))$. Set $y = f_ast^((1))$, then for each $n$, $f_ast^((n)) = y^n$ (using Yoneda product) and thus $Ext^n_R (k, k) iso k dot y^n$. So as a graded ring, $Ext_R^ast (k, k) iso k[y]$ where $y$ has degree $1$.
]



// #TODO alternative definition of Yoneda product, "gluing sequences"

