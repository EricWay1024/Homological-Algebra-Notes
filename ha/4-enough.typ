#import "../libs/template.typ": *
// == Projective and Injective Modules

// Recall $P$ is projective if $Hom(A)(P, -)$ is exact and $I$ is injective if $Hom(A)(-, I)$ is exact.

// #lemma[
//   $P$ is projective if and only if it has the lifting property (refer to earlier).

//   $I$ is injective if and only if it has the extension property.
// ]

= Enough Projectives and Injectives 

#definition[
  An abelian category $cA$ is said to *have enough projectives* (resp. *injectives*) if for any object $M$ there is an epimorphism $P-> M -> 0$ where $P$ is projective (resp. a monomorphism $0 -> M->I$ where $I$ is injective). 
]

For most of our homological algebra to work, a category needs to have enough projectives and injectives. We will show that $RMod$ has enough projectives and injectives.
== $RMod$ has Enough Projectives


#lemma[Free $R$-modules are projective.]

#proof[
Let $F eq plus.circle.big_(i in I) R x_i$ be a free $R$-module with basis
$lr({x_i colon i in I})$. Suppose $pi:A-> B$ is an epimorphism and $f : F->B$ is a morphism, as in the following diagram:
// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZARgBpiBdUkANwEMAbAVxiRACEQBfU9TXfIRQAmclVqMWbAAzdeIDNjwEi0sdXrNWiEAEE5fJYKJlp4zVJ0AxbuJhQA5vCKgAZgCcIAWyQBmajgQSGoSWmyuBiAe3sEBQYjEPG6ePoiiIIGxoZYKWJHRqf4Z8ekMWGDaIFB0cAAW9iAakpWMaLV0tlxAA
#align(center, commutative-diagram(
  node-padding: (50pt, 50pt),
  node((1, 1), [$B$]),
  node((1, 2), [$0$]),
  node((1, 0), [$A$]),
  node((0, 1), [$F$]),
  arr((0, 1), (1, 1), [$f$]),
  arr((1, 1), (1, 2), []),
  arr((1, 0), (1, 1), [$pi$]),
  arr((0, 1), (1, 0), [$alpha$], label-pos:-1em, "dashed"),
))

Since $pi$ is surjective, for each $i$ there is some $a_i in A$ with
$pi lr((a_i)) eq f lr((x_i))$. Define map
$ alpha colon F arrow.r A$ by $alpha lr((x_i)) eq a_i$ and we have $f = pi oo alpha$.
]

#proposition[$P$ is a projective $R$-module if and only if $P$ is a direct summand of a free module.
]

#proof[
  Assume $P$ is a projective. Then we can always find a free module $F=R^(ds I)$ such that $g: F -> P$ is onto. Using the lifting property,

// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBoBGAXVJADcBDAGwFcYkQAxEAX1PU1z5CKchWp0mrdgAUefEBmx4CRAExiaDFm0Qhic-kqFFRxcVqm7Z3cTCgBzeEVAAzAE4QAtkjIgcEJHJeVw9vRFE-AMRVYJB3LyQAZhp-HxpGLDAdECh6OAALOxBNSWyYAA8sOBwEWPiw5MjAku12LCgeSm4gA
#align(center, commutative-diagram(
  node-padding: (50pt, 50pt),
  node((1, 0), [$F$]),
  node((1, 1), [$P$]),
  node((1, 2), [$0$]),
  node((0, 1), [$P$]),
  arr((1, 0), (1, 1), [$g$]),
  arr((1, 1), (1, 2), []),
  arr((0, 1), (1, 0), label-pos:-1em, [$exists$], "dashed"),
  arr((0, 1), (1, 1), [$id$]),
))

So there exists a section $P-> F$ in the #sest $ ses(K, F, P) $
and hence $F iso K ds P$, where $K = Ker(g)$. This shows that $P$ is a direct summand of a free module.

// [This is equivalent to find some idempotent $p: R^(ds I) -> R^(ds I)$ such that $p^2= p$. ? ] #TODO

Now we show a direct summand of a free module is projective. 
Suppose that $P$ is a direct summand of a free module. Then there
exists some $R$-module $P^prime$ such that $P xor P^prime$ is free. Let
$pi colon A arrow.r B$ be a surjection and let $f colon P arrow.r B$ be
some map. Let $f^prime colon P xor P^prime arrow.r B$ be the map
$f^prime lr((p comma p^prime)) eq f lr((p))$. Since $P xor P^prime$ is
free, hence projective, $f^prime$ has a lift
$alpha^prime colon P xor P^prime arrow.r A$. Now define
$alpha colon P arrow.r A$ by
$alpha lr((p)) eq alpha^prime lr((p comma 0))$ and it lifts $f$, showing that $P$ is projective.

// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZARgBoAmAXVJADcBDAGwFcYkQAhEAX1PU1z5CKchWp0mrdgAYefEBmx4CRaWJoMWbRCACCc-kqFEyxcZqk6ACgAIocG1YDkBhQOXCSpaecnaQVjziMFAA5vBEoABmAE4QALZIoiA4EEjSvNFxiYhqKWmIxJkgsQlIACw0qekafuxRIDQARjBgUEgAzBnypTkdVQV5Fv5RLs2t7bnFvZ0DSTSMWGD+UPRwABYhjRJa7Exo6-RjIC1t6dPZFXOIyYvL7KsbW7W7OvuH26eTALRdF2WISr5TrcSjcIA
#align(center, commutative-diagram(
  node-padding: (50pt, 50pt),
  node((2, 1), [$B$]),
  node((2, 2), [$0$]),
  node((2, 0), [$A$]),
  node((1, 1), [$P ds P'$]),
  node((0, 1), [$P$]),
  arr((2, 0), (2, 1), [$pi$], label-pos: -1em),
  arr((2, 1), (2, 2), []),
  arr((0, 1), (2, 1), [$f$], curve: 30deg),
  arr((1, 1), (2, 1), [$f'$], label-pos: -1em),
  arr((1, 1), (2, 0), [$alpha'$], "dashed"),
  arr((0, 1), (2, 0), [$alpha$], curve: -30deg, "dashed"),
  arr((0, 1), (1, 1), [$i$], label-pos: -1em),
))
]

#corollary[
    $RMod$ has enough projectives. 
]
#proof[
  For any module $M$ we can find a free (and thus projective) module $F$ with a surjection $ F-> M-> 0 $
]


== $RMod$ has Enough Injectives

#lemma("Baer's criterion")[
  A right $R$-module $M$ is injective iff for every right ideal $I$ of $R$, every module homomorphism $I -> M$ can be extended to $R -> M$.
]

#proof[
  One direction easily follows from definition. We focus on the other.

  // https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBpiBdUkANwEMAbAVxiRAEEQBfU9TXfIRQBGclVqMWbdgHJuvEBmx4CRAExjq9Zq0QcZcnn2WCiAZk0SdbAELzjA1SjLDx2qXoCy3cTCgBzeCJQADMAJwgAWyQyEBwIJFE4uiwGNgALCAgAa3sQcKjE6nikDWTUjKzco3yI6MQyksQLcrS9TJy8gvrYpoAWLUldfK66oriExAGQBiwwYag6OHS-EEHrPUY0dLpDBW7S4snp92GtnYM1mbmFpZWoUcLmo6Rp2fm2ReXVrgouIA
#align(center, commutative-diagram(
  node-padding: (50pt, 50pt),
  node((0, 0), [$A$]),
  node((0, 1), [$A'$]),
  node((0, 2), [$A''$]),
  node((0, 3), [$B$]),
  node((1, 0), [$M$]),
  arr((0, 0), (0, 1), [], "inj"),
  arr((0, 1), (0, 2), [], "inj"),
  arr((0, 2), (0, 3), [], "inj"),
  arr((0, 0), (1, 0), [$f$]),
  arr((0, 1), (1, 0), [$alpha'$], "dashed"),
  arr((0, 2), (1, 0), [$alpha''$], curve: 10deg, "dashed"),
  arr((0, 3), (1, 0), [], curve: 30deg, "dashed"),
))

  Fix some injection $i colon A arrow.r B$ of
$R$-modules, and some map $f colon A arrow.r M$. Without loss of
generality, assume that $A subset.eq B$ and $i$ is the inclusion. 


[Construction of $A'$ and $alpha' : A' -> M$.] Let
$Sigma$ be the set whose elements are $R$-module maps
$alpha^prime colon A^prime arrow.r M$, where
$A subset.eq A^prime subset.eq B$ and $alpha^prime$ extends $f$. We may give this set a partial order by
saying that $alpha^prime lt.eq alpha^(prime prime)$ when
$A^prime subset.eq A^(prime prime)$ and $alpha^(prime prime)$ extends
$alpha^prime$. Suppose that $alpha_1 lt.eq alpha_2 lt.eq dots.h$ is an
ascending chain in $Sigma$, with corresponding modules
$A_1 subset.eq A_2 subset.eq dots.h$. Let $A^prime eq union A_n$, and
define $alpha^prime colon A^prime arrow.r M$ by
$alpha^prime lr((a)) eq alpha_i lr((a))$ for $a in A_i$. It is easy to
check that $alpha^prime$ is a well-defined element of $Sigma$, and it is
an upper bound on the chain \(n.b. we are really just taking the colimit
of the chain).
Since $Sigma$ is a partially ordered set in which every ascending chain
has an upper bound, by Zorn’s Lemma it has a maximal element,
which we call $alpha^prime colon A^prime -> M$. 

To show that $M$
is injective, we need to show that $A^prime eq B$, since we then have an
extension $alpha$ of $f$ to $B$. 

[Construction of $phi : R-> M$.] Suppose that $A^prime eq.not B$. Let $b in B without A^prime$, and
define 
$ A^(prime prime) eq A^prime plus R b = {a + r b : a in A', r in R} subset.eq B $ Let
$I eq brace.l r in R$ : $b r in A^prime}$. Then $I$ is a right ideal of
$R$, and we have a map
$ I arrow.r M comma quad r arrow.r.bar alpha^prime lr((b r)) $

By assumption, this extends to a map $phi colon R arrow.r M$. 

[Construction of $alpha'' : A'' -> M$.] We
claim that there is a well-defined map
$ alpha^(prime prime) colon A^(prime prime) arrow.r M comma quad a plus b r arrow.r.bar alpha^prime lr((a)) plus phi lr((r)) comma $
where $a in A^prime$ and $r in R$. To see that this is well-defined,
suppose that $a plus b r eq a^prime plus b r^prime$
where $a, a' in A'$ and $r, r' in R$.
Then
$ a minus a^prime eq b lr((r^prime minus r)) in A^prime sect b R dot.basic $

From this we see $r - r' in I$, and then we have
$ phi lr((r^prime minus r))
 = alpha^prime lr((b lr((r^prime minus r)))) = alpha^prime lr((a minus a^prime)) $

Therefore, it follows that
$alpha^prime lr((a)) plus phi lr((r)) eq alpha^prime lr((a^prime)) plus phi lr((r^prime))$
so $alpha^(prime prime)$ is well-defined. But then $alpha^(prime prime)$
strictly extends $alpha^prime$, contradicting maximality of
$alpha^prime$. Hence $A^prime eq B$.

See @notes[Theorem 5.8] and @rotman[Theorem 3.30].]

#definition[
  Let $R$ be an integral domain. A $R$-module $M$ is called *divisible* if, for all $r in R without {0}$, every element $m$ of $M$ can be \"divided\"
by $r$, in the sense that there is an element $m^prime$ in $M$ such that
$m eq r m^prime$. 
]
This condition can be reformulated by saying that the
multiplication by $r$ defines a surjective map from $M$ to $M$.

#corollary[
  If $R$ is a PID, then an $R$-module $M$ is injective if
  and only if it is divisible.
]

That is, for all $m in M$ and
  $r in R without brace.l 0 brace.r$ there exists $m' in M$ such that
  $m eq r m'$. Also recall that a PID is an integral domain in which every ideal is principal, i.e., can be generated by a single element.

  // [Unfortunately the notations are confusing, because we use $I$ to represent an ideal in the last theorem but the same letter for an $R$-module here.]

// The details of the proof can get in the way of the intuitive idea, which
// is quite simple. Maybe try proving it yourself before reading on \(use
// Baer’s Criterion).

#proof[
Let $M$ be an injective $R$-module, and let $m in M$ and
$r in R without brace.l 0 brace.r$. Set $J eq r R$ (which is an ideal of $R$) and define
$f colon J arrow.r M$ by $f lr((r)) eq m$. By Baer’s Criterion, we may
extend $f$ to a homomorphism $tilde(f) colon R arrow.r M$. Then
$ m eq f lr((r)) = tilde(f)(r)eq tilde(f) lr((r dot.op 1)) eq r dot.op tilde(f) lr((1)) $
So taking $m' eq tilde(f) lr((1))$, we see that $M$ is divisible.

Suppose conversely that $M$ is a divisible $R$-module. Let $J$ be an
ideal of $R$ and let $f colon J arrow.r M$ be a module homomorphism. If
$J$ is the zero ideal, then trivially we may extend $f$ to the zero
homomorphism $R arrow.r M$. Assume that $J$ is nonzero.
Since $R$ is a PID, we have $J eq R r$ for some nonzero $r in J$. Let
$m eq f lr((r))$. Then since $M$ is divisible, there is some $m' in M$
such that $m eq r m'$. Define $tilde(f) colon R arrow.r M$ by
$tilde(f) lr((1)) eq m'$. Clearly $tilde(f)$ is an extension of $f$, so
$M$ is injective by Baer’s Criterion.

See @rotman[Corollary 3.35] and @notes[Corollary 5.9].]

#example[
  In $Ab = ZZ hyph Mod$, we have that $QQ, ZZ_(p^ infinity) = ZZ[1 / p] over ZZ, QQ over ZZ$ are injective.

  Every injective abelian group $I = I_"tor" ds I_"free"$, where $I_"free"$ is a $QQ$-vector space and $I_"tor"$ (torsion part) is a direct sum copies of $ZZ_(p^ infinity)$.
]

#lemma[
    Direct sums of projectives are projectives, and   products of injectives are injectives. 
]

#proof[
  The first half is easily seen from 
  $ Hom (ds P_i, -) = product Hom (P_i, -) $
  The second half is dual.
]
#proposition[
  $Ab$ has enough injectives. 
]

#proof[
  For any $A in Ab$, define a map $I : Ab -> Ab$ by $ I(A) := product_(Hom_Ab (A, QQ over ZZ)) QQ over ZZ $

  The RHS is injective as a product of injectives $QQ over ZZ$.

  Consider canonical map $e_A: A -> I(A)$, where (because $I(A)$ is a product) we need to define for each $phi  in hom_Ab (A, QQ over ZZ)$ the component $e_(a, phi) : A -> QQ  over ZZ$, which we just define to be $phi$ itself. Explicitly, for any $a in A$, 
  $ e_A (a) = (phi(a))_(phi in hom_Ab (A, QQ over ZZ)) $

  We claim that $e_A$ is injective. We need to show that for any $0 != a in A$ there exists $phi in Hom_Ab (A, QQ over ZZ)$ such that $phi(a) != 0$.
  //  (using that $QQ over ZZ$ is injective). 

  - If $a$ has an infinite order, then set $phi(a)$ as any nonzero element of $QQ over ZZ$ and we obtain a group homomorphism $phi$ such that $phi(a) != 0$;
  - If $a$ has order $m$ for some integer $m > 1$, then we set $phi(a) = 1/m + ZZ$ and this is a well defined group homomorphism. 

  [See https://math.stackexchange.com/questions/4071941/category-of-abelian-groups-has-enough-injectives.]
]

#endlec(6)

// = injective and projective and adjoints 

#proposition[
  If an additive functor $R: cB -> cA$ between abelian categories is right adjoint to an exact functor and $I$ is injective in $cB$, then $R(I)$ is injective in $cA$. 
  
  Dually, if an additive functor $L: cA -> cB$ is left adjoint to an exact functor and $P$ is projective in $cA$, then $L(P)$ is projective in $cB$. 
]
#proof[
  We want to show that 
  $ Hom(A)(-, R(I)) $ is exact. 
  We have
  $ Hom(A)(-, R(I)) iso Hom(B)(L(-), I ) $
  but $L$ is exact and $Hom(B)(-, I)$ is exact, so $Hom(B)(L(-), I )$ is a composition of exact functors and thus exact.

  See @notes[Lemma 5.25] and @weibel[Proposition 2.3.10].
]
With this proposition, we can construct adjunctions to prove if there is enough proj/inj.

#corollary[
  If $I$ is an injective abelian group, then $hom_Ab (R, I)$ is an injective #rrm.
]
#proof[
  // Notice that $hom_Ab (R, A)$ is a #lrm.
Assume $R$ is a ring and $M$ is a #rrm. $ hom_Ab ("Forget"(M), A) bij hom_Ab (M tpr R, A ) bij hom_ModR (M, hom_Ab (R, A)) $
using hom-tensor adjunction, where $"Forget": ModR -> Ab$ is the forgetful functor and we view $R$ as a left $R$-module here (instead of an $R, R$-bimodule). 

This shows that $"Forget"$ is left adjoint to $hom_Ab (R, -)$. The forgetful functor is clearly exact.
]

#example[
  $hom_Ab (R, QQ over ZZ)$ is injective.
]

#proposition[
  $RMod$ has enough injectives. 
]

#proof[
  Let $M$ be a left $R$-module. 
  We define
  $ I(M) = product_(homr(M, hom_Ab (R, QQ over ZZ))) hom_Ab (R, QQ over ZZ) $
  $I(M)$ is injective as a product of injectives, and there is a canonical morphism $e_M : M -> I(M)$. We only need to construct $ e_(M, phi) : ModR ->hom_Ab (R, QQ over ZZ), quad M mapsto phi(M) $ for all $phi in homr(M, hom_Ab (R, QQ over ZZ))$.

  // Exercise: $e_M$ is one-to-one (mono). (like what we did before.) [TODO]

  We only need to show that for any $0 != m in M$, there exists $phi : M -> hom_Ab (R, QQ over ZZ)$ such that $phi(m) != 0$. Notice that we have $ phi in homr(M, hom_Ab (R, QQ over ZZ)) iso hom_Ab (M, QQ over ZZ) $
  Hence we only need to find some $phi : M -> QQ over ZZ$ in $Ab$ so that $phi(m) != 0$. This is the same case as before.
]
