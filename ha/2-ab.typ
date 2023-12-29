#import "../libs/template.typ": *


= Abelian Categories 

== $Ab$-enriched Categories

We have seen, for example, that in $veck$ every hom-set not only is a collection (or set) of morphisms but also has some "additional structures", i.e., a vector space. This leads to the idea of enriched categories, where enriching means equipping the hom-sets with "additional structures". The following is an instance where every hom-set is an abelian group.

#definition[
  We call a category $cC$ *$Ab$-enriched* if every $Hom(C)(X, Y)$ is a abelian group, subject to bilinear morphism composition, namely $ (f + g) compose h  = f compose h + g compose h quad "and" quad f compose (k + h) = f compose k + f compose h $
  for all $f, g : Y-> Z$ and $h, k : X->Y$. 
]
#remark[
An equivalent way to put the bilinearity is the following: the composition mappings $ c_(X Y Z): Hom(C)(X, Y) times Hom(C)(Y, Z) -> Hom(C)(X, Z), quad (f, g) mapsto g oo f $
are group homomorphisms in each variable @borceux[Definition 1.2.1]. 
]

// The abelian group structure on hom-sets means that we are allowed to add two morphisms (as above) in $Hom(C)(X, Y)$. 

#definition[
Let $cC$ be an $Ab$-enriched category and $X, Y in cC$. The *zero morphism* $0 in Hom(C)(X, Y)$ is defined as the identity of the abelian group $Hom(C) (X, Y)$.

]
However, note that an $Ab$-enriched category needs not have a zero object, so this is actually a redefinition of a zero morphism from @zero-factor. We will see later that the two definitions match when the zero object is present. Since group homomorphisms map identity to identity, we have the following:

#proposition[
  In an *Ab*-enriched category, let $X->^g Y->^f Z->^h W$. If $f$ is a zero morphism, then $f oo g$ and $h oo f$ are zero morphisms. 
]
  <zero-composition>

#endlec(3)

We can also define functors between $Ab$-enriched categories which respect the abelian group structures of the hom-set:

#definition[
  If $cC, cD$ are $Ab$-enriched, we call $F : cC -> cD$ an *additive functor* if $ Hom(C)(X, Y) -> Hom(D)(F(X), F(Y)) $ is a group homomorphism for any $X, Y in cC$.
]


#proposition[
  If $cC$ is an *Ab*-enriched category, then so is $cC^op$.
]
#proof[
  The definition is self-dual. Namely, reversing all the arrows in $cC$ breaks neither the group structure on hom-sets nor the bilinear morphism composition. 
]

 An $Ab$-enriched category needs not have a zero object. Nevertheless, once it has an initial or final object, it has a zero object, as shown below.

#proposition[Let $*$ be an object in an *Ab*-enriched category, then the followings are equivalent:
+ $*$ is a final object;
+ $*$ is an initial object;
+ $*$ is a zero object.
]
<ab-zero>

#proof[
  (3) $=>$ (1) and (3) $=>$ (2) is obvious. We only prove (1) $=>$ (3), and (2) $=>$ (3) follows from duality.

  Suppose $*$ is a terminal object and let $id_* : * -> *$ be the unique morphism in the abelian group of $Hom(C)(*, *)$, and so $id_* = 0$. 
For any object $A$ and $f : * -> A$ (because $Hom(C)(*, A) $ contains at least the zero morphism), we have $ f = f compose id_* = f compose 0 = 0 in Hom(C)(*, A) $
So there is a unique morphism from $*$ to $A$ and therefore $*$ is also initial. 
]

// This also includes the case of the empty product and coprodut, namely any final object is initial and thus zero. 

In fact, a final object is an empty product and an initial object an empty coproduct, and the previous result can be generalised. 
#proposition[
  In an *Ab*-enriched category $cC$, let $X_1, X_2$ be two objects. Then
  + If the product $X_1 times X_2$ exists, then the coproduct $X_1 union.sq X_2$ also exists and is isomorphic to $X_1 times X_2$;
  + If the coproduct $X_1 union.sq X_2$ exists, then the product $X_1 times X_2$ also exists and is isomorphic to $X_1 union.sq X_2$.'
]
  <ab-product>

#proof[@notes[Proposition 3.7], @li[Theorem 3.4.9] and @borceux[Proposition 1.2.4]. We prove statement (1) and leave (2) to duality.
  
  Suppose the product $X_1 times X_2$ exists with projections $p_k colon X_1 times X_2 arrow.r X_k$. By definition of products, there are unique morphisms $i_k colon X_k arrow.r X_1 times X_2$ such that the following diagrams commute.

// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZARgBpiBdUkANwEMAbAVxiRAA0B9YgAjwFt4PLgCYQAX1LpMufIRQAGclVqMWbLsQlSQGbHgJERy6vWatEHTmMnT9cokoUqz6y5u13ZhlMZEu1CysbFRgoAHN4IlAAMwAnCH4kJRAcCCRiWxB4xOTqNKQRLJykxABmfPTEMlVzNiwoTgAKTQBKT2yE0orUquMQACMYMCgkMpTXIIUOkrHKvJAGLDAgqDo4AAswkFNAthgADyw4HDgAQhmupAAWecR+yfrGlut24qvEW96M6iGRsYme0s03euU+dxSSxWbDWm22uzqlkOx1OPAu4go4iAA
#align(center, commutative-diagram(
  node((1, 1), [$X_1 times X_2$]),
  node((1, 0), [$X_1$]),
  node((1, 2), [$X_2$]),
  node((0, 0), [$X_1$]),
  node((2, 2), [$X_2$]),
  arr((1, 1), (1, 0), [$p_1$], label-pos: -1em),
  arr((1, 1), (1, 2), [$p_2$]),
  arr((0, 0), (1, 0), [$id_(X_1)$]),
  arr((0, 0), (1, 2), [$0$], curve: 30deg),
  arr((0, 0), (1, 1), [$exists ! i_1$], label-pos: -1em, "dashed"),
  arr((2, 2), (1, 2), [$id_(X_2)$], label-pos: -1.5em),
  arr((2, 2), (1, 0), [$0$], label-pos: -1em, curve: 30deg),
  arr((2, 2), (1, 1), [$exists ! i_2$], label-pos: -1em, "dashed"),
))

Explicitly, we have for $j, k in {1, 2}$, $ p_j oo i_k = cases(id_(X_j) quad &"if " j = k, 0 quad &"otherwise") $
// #image("imgs/16.png")

Then we have $ p_1 compose lr((i_1 p_1 plus i_2 p_2)) eq p_1 comma quad p_2 compose lr((i_1 p_1 plus i_2 p_2)) eq p_2 $

By definition of products, $id_(X_1 times X_2) $ is the unique morphism $h : X_1 times X_2 -> X_1 times X_2$ with $p_k compose h eq p_k$ for each $k$, so $i_1 p_1 plus i_2 p_2 eq id_(X_1 times X_2)$. We claim that
$ X_1 rgt(i_1) X_1 times X_2 lft(i_2) X_2 $ is a universal cocone and thus a coproduct. Suppose 
$X_1 rgt(f_1) A lft(f_2) X_2 $
is another cocone. Then we have a map
$ phi eq f_1 compose p_1 plus f_2 compose p_2 colon X_1 times X_2 arrow.r A $
such that for $k = 1, 2$, $phi oo i_k = f_k $.
This gives a commutative diagram
#align(center,image("../imgs/2023-10-29-11-34-35.png",width:30%))

It remains to show that $phi$ is unique. To see this, note that for any
such $phi$ we have $ phi & eq phi compose id_(X_1 times X_2)\
 & eq phi compose lr((i_1 p_1 plus i_2 p_2))\
 & eq phi i_1 compose p_1 plus phi i_2 compose p_2\
 & eq f_1 compose p_1 plus f_2 compose p_2 dot.basic $
]


#definition[
  Let $cC$ be an $Ab$-enriched category and let $X_1, X_2 in cC$. The *biproduct* of $X_1$ and $X_2$ is an object $X_1 xor X_2$ with morphisms $p_k : X_1 xor X_2 -> X_k$ and $i_k : X_k ->  X_1 xor X_2 $ for $k = 1, 2$, such that 
  - $p_k oo i_k = 1_(X_k)$;
  - $p_j oo i_k = 0 $ for  $k != j$;
  - $i_1 oo p_1 + i_2 oo p_2 = 1_(X_1 xor X_2)$.
  // - $X_1 xor X_2$ with $(p_1, p_2)$ is a product of $X_1$ and $X_2$;
  // - $X_1 xor X_2$ with $(i_1, i_2)$ is a coproduct of $X_1$ and $X_2$.
  // If $X$ and $Y$ has a product (or a coproduct) in $cC$, then it is called the *biproduct* of $X$ and $Y$, denoted as $X xor Y$.
]

#corollary[
In an $Ab$-enriched category, a binary biproduct is both a product and a coproduct, and a binary product (or a binary coproduct) is a biproduct.
]
#proof[
  This follows from the proof of @ab-product.
]

// We can show that $x union.sq y iso x times y$ and we use the notation of a biproduct $x ds y$ to denote both. 

#remark[This extends to all _finite_ products and coproducts but
   does not extend to _infinite_ products or coproducts. 
]

#lemma[
  In an $Ab$-enriched category, an additive functor preserves biproducts. 
]
<additive-preserve-biproduct>
#proof[
  Notice that an additive functor preserves identity morphisms, zero morphisms, morphism compositions and morphism additions, and they are all we need in the definition of biproducts.
]

Being able to add and subtract parallel morphisms means we can rephrase the definitions for a monomorphism and epimorphism.

#proposition[
  In an $Ab$-enriched category $cC$, $f : B-> C$ is a monomorphism if and only if  $f oo u = 0$ implies $u = 0$ for all $u : A -> B$. 

  Dually, $f : B -> C$ is an epimorphism if and only if $v oo f = 0$ implies $v = 0$ for all $v : C -> D$. 
]
  <ab-mono>
#proof[
  if $f : B -> C$ is a monomorphism, then in
  $
    A arrows.rr_(u_1)^(u_2) B ->^f C
  $
  whenever $f oo u_1 = f oo u_2$, we have $u_1 = u_2$. This is equivalent to saying whenever $f oo (u_1 - u_2) = 0$, we have $u_1 - u_2 = 0$. On the one hand, take $u_1 = u$ and $u_2 = 0$ gives the "only if" direction; on the other, take $u = u_1 - u_2$ gives the "if" direction.
]

== Additive Categories

Inspired by @ab-zero and @ab-product, we naturally define the following:

#definition[
  An $Ab$-enriched category $cC$ is *additive* if it has all finite coproducts.
]

Hence an additive category has all finite biproducts, including the zero object which can be considered as the empty biproduct. Now we can reconcile the two definitions we have had for zero morphisms.

#proposition[
  In an additive category $cC$, let $f: A->B$. Then $f$ is the identity of $Hom(C) (A, B)$ if and only if it can be factored as $A -> 0 -> B$.
]
#proof[
  Since $Hom(C) (A, 0)$ has an unique element $h$, it must be the identity of the group. Similarly, $Hom(C) (0, B)$ contains only the identity $g$. The composition $g oo h$ is the identity of $Hom(C) (A, B)$ by @zero-composition.
]



#proposition[
  In an additive category, if a monomorphism $i : A-> B$ is a zero morphism, then $A$ is the zero object. 
  
  Dually, if an epimorphism $p : C -> D$ is a zero morphism, then $D$ is the zero object.
]
  <additive-mono-zero>
#proof[
  Take any $X$ and $u : X -> A$, we have
  $
    X arrow^u A ->^i B
  $
  $i = 0$, so $i oo u = 0$; but since $i$ is monic, $u = 0$ by @ab-mono.
  Therefore there is a unique (zero) morphism from any $X$ to $A$, so $A$ is final and thus zero.
]

#proposition[@rotman[Proposition 5.89]. 
Let $f colon A arrow.r B$ be a morphism in an additive
category $cal(C)$. If $ker f$ exists, then $f$ is monic if and only if $ker f eq 0$.

Dually, if  $coker f$ exists, then $f$ is epic if and only  $coker f eq 0$.
]
<additive-ker>
#proof[
Let $ker f$ be $i : K -> A$. Suppose $i = 0$. Since we know a kernel is a monomorphism, by @additive-mono-zero, $K = 0$. To show that $f$ is monic, take any $u : X -> A$ such that $f oo u = 0$. Then by the universal property of a kernel, there exists a unique morphism $h : X -> K$ such that $u = i oo h$. Thus $u$ factors through $K = 0$, so $u = 0$, proving $f$ is monic by @ab-mono. 
// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBpiBdUkANwEMAbAVxiRAGkQBfU9TXfIRQBGclVqMWbAILdeIDNjwEiAJjHV6zVohAAhOXyWCiZYeK1TdADW7iYUAObwioAGYAnCAFskAZmocCCQyEAYsMB0QKDo4AAsHEE1JKLjDEE8ff0DgxFEJbTYmdMzfPJykdQKrDJKvMtCgpHzLKKw7LiA
#align(center, commutative-diagram(
  node-padding: (50pt, 50pt),
  node((0, 0), [$K$]),
  node((0, 1), [$A$]),
  node((0, 2), [$B$]),
  node((1, 0), [$X$]),
  arr((1, 0), (0, 0), [$h$], label-pos: 1em, "dashed"),
  arr((1, 0), (0, 1), [$u$], label-pos: -1em),
  arr((0, 1), (0, 2), [$f$]),
  arr((0, 0), (0, 1), [$i$]),
))

On the other hand, suppose $f$ is monic. Then $ker f = 0$ directly follows from @ab-mono.
// We refer to the diagrams in the definitions of kernel and
// cokernel. Let ker $u$ be $iota colon K arrow.r A$, and assume that
// $iota eq 0$. If $g colon X arrow.r A$ satisfies $u g eq 0$, then the
// universal property of kernel provides a morphism
// $theta colon X arrow.r K$ with $g eq iota theta eq 0$ \(because
// $iota eq 0$). Hence, $u$ is monic. Conversely, if $u$ is monic,
// consider $ K arrows.rr^iota_0 A arrow.r^u B dot.basic $
// Since $u iota eq 0 eq u 0$, we have $iota eq 0$. The proof for
// epimorphisms and cokers is dual. 
// #TODO modify
]

== Pre-abelian Categories

Now inspired by @additive-ker, we define the following:

#definition[
  An additive category $cC$ is *pre-abelian* if any morphism has a kernel and a cokernel. 
]

#corollary[
  Let $f$ be a morphism in a pre-abelian category. $f$ is monic if and only if $ker f$ = 0. Dually, $f$ is epic if and only if $coker f = 0$. 
]
  <pre-add-mono>

In fact, we get more than just kernels and cokernels:

#proposition[
  A pre-abelian category has all finite limits and colimits.
]
#proof[
  Let $cC$ be a pre-abelian category. Since
$Eq(f, q) = ker(f - g)$, $cC$ has all equalisers and coequalisers, and thus it has all finite limits or colimits (by category theory, because it also has products and coproducts) @li[Corollary 2.8.4]. #TODO
]

#proposition[
    If $cC$ is pre-abelian, for every morphism $f : X-> Y$, there exists a unique morphism $G -> D$ as shown below. 

// // https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBpiBdUkANwEMAbAVxiRAGsYAnAAgAoAZgEoQAX1LpMufIRQBGclVqMWbABpiJIDNjwEiAJkXV6zVohABNTZN0yiAZmPKzbAMYROXQSPG3p+vKkckqmqhYeXnxRwr5aOgGyyEYhJirmHNx8kVmxYkowUADm8ESgAlwQALZIZCA4EEhyfiAV1U3UDUhGLuGtNq2VNYg9XYgOLW3DCvWNiAAsk0NIAKydcwZL7Qvrq9QMWGAZUHRwABaFIGmuFjAAHlhwOHA8AIT5okA
// #align(center, commutative-diagram(
//   node-padding: (50pt, 50pt),
//   node((0, 0), [$ker (f)$]),
//   node((0, 1), [$X$]),
//   node((0, 2), [$Y$]),
//   node((0, 3), [$coker(f)$]),
//   node((1, 1), [$coker(ker(f))$]),
//   node((1, 2), [$ker(coker(f))$]),
//   arr((0, 0), (0, 1), []),
//   arr((0, 1), (0, 2), [$f$]),
//   arr((0, 2), (0, 3), []),
//   arr((0, 1), (1, 1), []),
//   arr((1, 2), (0, 2), []),
//   arr((1, 1), (1, 2), [$exists !$], "dashed"),
// ))
// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBpiBdUkANwEMAbAVxiRAGkQBfU9TXfIRQBGclVqMWbABrdeIDNjwEiAJjHV6zVohABNOXyWCiAZg0TtbAMKGF-ZUOSjh4rVN0BxO4oEqU6q6akjogACLc4jBQAObwRKAAZgBOEAC2SGQgOBBIopYeIADWMMkAFIkAlHYp6XnUOUjqBaGJNakZiM2NiOYtbADGECXlVe11iPk9ACzBVrpDIwAEZcsVldU8SR1IAKwNuV1zhSNli6Xrm-K1nbPZh-sgDFhgoVB0cAAW0SDHoTAADywcBwcCWAEJIlwgA
#align(center, commutative-diagram(
  node((0, 0), [$K$]),
  node((0, 1), [$X$]),
  node((0, 2), [$Y$]),
  node((0, 3), [$C$]),
  node((1, 1), [$G$]),
  node((1, 2), [$D$]),
  arr((0, 0), (0, 1), [$ker(f)$]),
  arr((0, 1), (0, 2), [$f$]),
  arr((0, 2), (0, 3), [$coker(f)$]),
  arr((0, 1), (1, 1), [$coker (ker (f))$], label-pos: -3.5em),
  arr((1, 2), (0, 2), [$ker(coker(f))$], label-pos: -3.5em),
  arr((1, 1), (1, 2), [$exists !$], "dashed"),
))
]
<pre-ab-morphism>
#proof[
  Since $coker(f) oo f = 0$, by the universal property of kernel, there exists $c : X -> D$ such that $f = ker(coker(f)) oo c$. Since $f oo ker(f) = 0$, we have $ker(coker(f)) oo c oo ker(f) = 0$. Now notice $ker(coker(f))$ is monic, and hence by @pre-add-mono, $ker(ker(coker(f))) = 0$. By the universal property of kernel again, there exists $d : K -> 0$ such that $c oo ker(f) = ker(ker(coker(f))) oo d$. Thus $c oo ker(f)$ factors through the zero object and thus is $0$.  The desired morphism is obtained from the universal property of cokernel.
  #align(center, commutative-diagram(
  node((0, 0), [$K$]),
  node((0, 1), [$X$]),
  node((0, 2), [$Y$]),
  node((0, 3), [$C$]),
  node((1, 1), [$G$]),
  node((1, 2), [$D$]),
  node((2, 2), [$0$]),
  arr((0, 0), (0, 1), [$ker(f)$]),
  arr((0, 1), (0, 2), [$f$]),
  arr((0, 2), (0, 3), [$coker(f)$]),
  arr((0, 1), (1, 1), [$coker (ker (f))$], label-pos: 0),
  arr((1, 2), (0, 2), [$ker(coker(f))$], label-pos: -3.5em),
  arr((1, 1), (1, 2), [$exists !$], "dashed"),
  arr((0, 1), (1, 2), [$c$]),
  arr((2, 2), (1, 2), [$ker(ker(coker(f)))$], label-pos: -4.5em),
  arr((0, 0), (2, 2), [$d$], curve: -40deg)
))
]

#definition[In a pre-abelian category, we define the *coimage* of a morphism $f$ as $ coim (f) = coker(ker(f)) $ and *image* of $f$ as $ im(f) = ker(coker(f)) $ Continuing with @ker-notation, we have $G = Coim(f)$ and $D = IM(f)$ in the above diagram.
// #image("imgs/17.png")
// [See Definition 1.2.4, Li-2]

We call $f$ *strict* if the map $Coim (f) -> IM f$ is an isomorphism. 
]
== Abelian Categories



#definition[
  A pre-ablian category is *abelian* if all morphisms are strict. 
]
#corollary[
In an abelian category, every morphism $f : X-> Y$ has a factorisation 
$
  X ->^g IM (f) ->^h Y
$
where $g$ is an epimorphism and $h$ is a monomorphism.
]
#proof[
  Notice $g = coker(ker(f)) = coim(f)$ and $h = ker(coker(f)) = im(f)$.
]

We can always write $f = im(f) oo coim(f)$ and consider $im(f)$ as a subobject of $Y$. 


#remark[
  The followings are two equivalent definitions of an abelian category:
  - A pre-abelian category where every monomorphism is a kernel and every epimorphism is a cokernel;
  - A pre-abelian category where every monomorphism is the kernel of its cokernel and every epimorphism is the cokernel of its kernel.
]

We prove part of the equivalence:

#proposition[
  In an abelian category, every monomorphism is the kernel of its cokernel, and every epimorphism is the cokernel of its kernel.
]
#proof[
  Use the diagram in the proof of @pre-ab-morphism. Let $f$ be a monomorphism, then $ker(f) = 0$ and $K = 0$. It is not to hard to find $G = X$ and $coker(ker(f)) = id_X$. Since $D$ and $G$ are isomorphic, we see that $X$ is isomorphic to $D$ and thus $f = ker(coker(f))$.
]


#remark[
Now it is time to give a list of properties that abelian categories have, packing everything we have picked up along the way:
- Every hom-set is an abelian group subject to bilinear morphism composition;
- It has a zero object and has a zero morphism between any two objects, which is the identity of the abelian group and factors through $0$;
- It has all limits and colimits;
- Any finite product and coproduct coincide as the biproduct;
- $f$ is monic if and only if $f oo u = 0$ implies $u = 0$, and $g$ is epic if and only if $v oo g = 0$ implies $v = 0$;
- $f$ is monic and $f = 0$ implies the domain of $f$ is $0$, and $g$ is epic and $g = 0$ implies the codomain of $g$ is $0$;
- $f$ is monic if and only if $ker f = 0$, and $g$ is epic if and only if $coker g = 0$;
- $Coim(f) -> IM(f)$ is an isomorphism;
- Any $f$ can be factorised as $f = ker(coker(f)) oo coker(ker(f)) = im(f) oo coim(f)$;
- $f$ is monic if and only if $f = im(f)$, and $g$ is epic if and only if $g = colim(g)$.
]

// Remark. This is equivalent to:  (The converses are always true in any category.) This is equivalent to every mono is the kernel of its cokernel and every epi is the cokernel of its kernel. (? TODO)

We now introduce the most important member in the family of abelian categories.

#proposition[
  For any ring $R$, the category $RMod$ is an abelian category. In particular, $Ab$ is an abelian category.
]
#proof[
  ($RMod$ is $Ab$-enriched.) For any $A, B in RMod$, the set $homr(A, B)$ of module homomorphisms $A -> B$ can be naturally seen as an abelian group under pointwise addition. It is easy to check that the composition is bilinear.

  ($RMod$ is additive.) We know that the direct sum exists as a coproduct for any finite family of modules $(M_i)_(i in I)$ in $RMod$.


  ($RMod$ is pre-abelian.) Let $f : A -> B$ be a morphism in $RMod$. Then 
  $
    Ker(f) = {a in A : f(a) = 0}
  $
  with $ker(f) : Ker(f) -> A$ being the inclusion map, is a categorical kernel. Also,
  $
    Coker(f) = B over IM(f)
  $
  where $IM(f) = {f(a) in B : a in A}$, with $coker(f) : B -> Coker(f)$ being the quotient map, is a categorical cokernel. 

  ($RMod$ is abelian.) We find 
  $
    Coker(ker(f)) = A over Ker(f) iso IM(f)
  $
  by the First Isomorphism Theorem and 
  $
    Ker(coker(f)) = IM(f)
  $
  by construction. Hence the image and coimage coincide up to isomorphism, i.e., any $f$ is strict.
]

#remark[
  Note that the product and coproduct of a family $(M_i)_(i in I)$ coincide when $I$ is finite but differ when $I$ is infinite:
$ union.sq.big _(i in I) M_i = plus.circle.big_(i in I) M_i = {(m_i) _(i in I) | m_i in M_i, m_i = 0 "for almost all" i} $
  $ product _( i in I) M_i = {(m_i) _(i in I) | m_i in M_i} $
]

#proposition[
  In $RMod$, a monomorphism is equivalent to an injective homomorphism and an epimorphism is equivalent to a surjective homomorphism.
]


#example[If $cA$ is an abliean category and $cC$ is any small category and then the category of functors $Fun(cC, cA)$ is abelian. [TODO]]

$Fun(cC^op, cA)$ are presheaves from $cC$ to $cA$.

#example[
  Non-example. Banach spaces over $RR$. We have $V attach(arrow.r.hook, t: i) W$ which are open. Then $coker i = W \/ overline(V)$. Then $ker coker i = overline(V) != V$. (The closure of $V$.)
This is an example of quasi-abelian categories. 
]


== Exact Sequences and Functors

#note[
  All discussions in this section are limited to an abelian category.
]

We have trekked a long way to establish abelian categories.
The key element that we seek from an abelian category is the notion of exactness:

#definition[
  In an abelian category, a sequence of maps $A attach(->, t: f) B attach(->, t: g) C $ is called *exact* at $B$ if $ker g = im f$ (as equivalent subobjects of $B$).
]

#definition[
  In an abelian category, a *short exact sequence* $0 -> A attach(->, t: f) B attach(->, t: g) C -> 0$ is exact at $A$, $B$ and $C$, or "exact everywhere". 
]

#lemma[
  $im (0 -> A) = 0$ and $im(A -> 0) = 0$.
]

#proposition[
  $0 -> A attach(->, t: f) B attach(->, t: g) C -> 0$ is a #sest if and only if $f$ is monic, $g$ is epic, and $ker g = im f$. 
]
#proof[
  - Exactness at $A$ $<=>$ $ker f = im (0 -> A) = 0$ $<=>$ $f$ is monic.
  - Exactness at $B$ $<=>$ $ker g = im f$.
  - Exactness at $C$ $<=>$ $im g = ker (C -> 0) = id_C$ $<=>$ $g = coim (g )$ $<=>$ $g$ is epic.
]

#proposition[
  If $ses(A, B, C, f:f, g:g)$ is a #sest, then $f = ker g$ and $g  = coker f$. 
]
#proof[
  $f$ is monic, so $f = im(f) = ker(g)$. $g$ is epic, so $g = coim(g) = coker(ker(g)) = coker(f)$.
]

#corollary[
  $ses(A, B, C, f:f, g:g)$ can be rewritten as 
  $
    ses(IM(f), B, Coker(f), f:f, g:coker(f))
  $ or 
  $
    ses(Ker(g), B, Coim(g), f:ker(g), g:g)
  $
]

#proposition[
  If $A->^f B->C->D->^g E$ is an exact sequence, then 
  $
    ses(Coker(f), C, Ker(g))
  $
  is a #sest.
]
<five-to-ses>

#definition[
  A #sest $ses(A, B, C)$ is *split* if $B$ is isomorphic to $A ds C$. 
  // #image("imgs/19.png")
]
// #lemma[
//   An additive functor preserves split short exact sequences.
// ]
// <additive-preserve-split>
// #proof[
//   This follows from @additive-preserve-biproduct.
// ]

#lemma("Splitting Lemma")[
  Let $ses(A, B, C, f:f, g:g)$ be a short exact sequence. The followings are equivalent:
  + The short exact sequence is split;
  + There exists a *retraction*#footnote[The terms "retraction" and "section" come from algebraic topology, but for our purpose they are nothing more than certain morphisms.] $r: B->A$ such that $r oo f = id_A$;
  + There exists a *section* $s : C -> B$ such that $g oo s = id_C$.
]
    <splitting-lemma>

#proof[#TODO https://math.stackexchange.com/questions/748699/abstract-nonsense-proof-of-the-splitting-lemma] 


#corollary[
  #TODO rotman 2.24
]
<split-sub>
#definition[
  An additive functor $F: cC -> cD$ is called *right exact* if for every #sest $0-> A-> B-> C-> 0$ the sequence $ F(A) -> F(B) -> F(C) ->  0 $ is exact; $F$ is called *left exact* if   $ 0 -> F(A) -> F(B) -> F(C) $ is exact; $F$ is called *exact* if $F$ is both right and left exact, or
  $
    ses(F(A), F(B), F(C))
  $
  is exact.
]

#remark[
  By definition, _right exactness preserves cokernels_, since $C$ is the cokernel of the map $A -> B$ and $F(C)$ is the cokernel of the map $F(A) -> F(B)$. Similarly, _left exactness preserves kernels_. 
]


#lemma[
  Let $cA$ be an abelian category. Let $M in cA$. The functor $ Hom(A)(M, -): cA -> Ab $ is left exact. 
]
  <hom-left-exact>

#proof[
  Let $ses(A, B, C, f: f, g: g)$ be a #sest in $cA$, then we want to prove 
$ 0 -> Hom(A)(M, A) ->^(f oo -) Hom(A)(M, B) ->^(g oo -) Hom(A)(M, C) $
is exact in $Ab$.

  Exactness at $Hom(A) (M, A)$ is equivalent to $(f oo -) $ being monic, so let us calculate $Ker(f oo -)$. Let $u in Hom(A)(M, A)$ such that $(f oo  -) (u) = 0$, i.e., $f oo u  = 0$. But $f$ is monic, so $u = 0$, and thus $Ker(f oo -) = 0$ and $(f oo -)$ is monic.

  Exactness at $Hom(A) (M, B)$ is equivalent to $Ker(g oo -) = IM(f oo -)$. Let $ v in Ker(g oo -)$, in other words $v in Hom(A) (M, B)$ such that $(g oo -) (v) = 0$, i.e., $g oo v = 0$. Then by universal property of kernel, there exists $h : M -> Ker(g)$ such that $v = ker(g) oo h$. But $Ker(g) = IM(f)$ by exactness and $ker(g) = f$, so we have $v = f oo h = (f oo -)(h) in IM(f oo -)$. Hence $Ker(g oo -) subset.eq IM(f oo -)$. The other direction of the inclusion can be similarly proven. Hence $Ker(g oo -) = IM(f oo -)$. 
]


#TODO how to understand $f oo -$

#remark[
  The functor $Hom(A) (M, -)$ fails to be exact in general because it does not necessarily send an epimorphism to an epimorphism. For a counterexample, let $cA = Ab$ (where an epimorphism is equivalent to a surjective homomorphism) and $M = ZZ over 2 ZZ$. The quotient map $h: ZZ -> ZZ over 4 ZZ $ is an surjective homomorphism. On the other hand, for any abelian group $A$, an element in $hom_Ab (ZZ over 2 ZZ, A)$ (i.e., a group homomorphism $ZZ over 2ZZ -> A$) is uniquely determined by an element in $A$ with order $2$. Hence $hom_Ab ( ZZ over 2 ZZ, ZZ) = 0$ and $hom_Ab ( ZZ over 2 ZZ, ZZ over 4ZZ) = ZZ over 2ZZ$, and we see the induced map $ (h oo -) : hom_Ab ( ZZ over 2 ZZ, ZZ) -> hom_Ab ( ZZ over 2 ZZ, ZZ over 4ZZ) $ cannot be surjective. 
]

#corollary[Dually, $Hom(A) (-, M): cA^op -> Ab$ is also left exact. ]   <hom-left-exact-2>


#endlec(4)

== Projective and Injective Objects


#definition[
   Let $cA$ be an abelian category. An object $P$ is called *projective* if $Hom(A) (P, -)$ is exact. 
   
   Dually, an object $I$ is called *injective* if $Hom(A) (-, I)$ is exact. 
]

In other words, $P$ is projective if for any #sest $ses(X, Y, Z)$ in $cA$, $ ses(Hom(A)(P, X), Hom(A)(P, Y), Hom(A)(P, Z)) $ is a #sest.
Thanks to @hom-left-exact, the only special part of the definition is that $Hom(A)(P, Y) -> Hom(A)(P, Z)$ is surjective. 

#proposition[
  $P$ is *projective* if and only if for any epimorphism $h: Y->Z$ and any $f: P->Z$, there exists (not necessarily unique) $g: P->Y$ such that the following commutes (which we refer to as the *lifting property*): 
// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZARgBoAGAXVJADcBDAGwFcYkQAFEAX1PU1z5CKAEyli1Ok1btyPPiAzY8BImQk0GLNohAAtef2VCi5cZK0zdATR6SYUAObwioAGYAnCAFskZkDgQSGJS2uxuhiCePsE0gUjEvO5evogAzHFBiCGWOiAAFpHRqf7x6TSMWGB5UPRw+Q4gmtJ5MAAeWHA4CNyU3EA
#align(center, commutative-diagram(
  node((0, 1), [$P$]),
  node((1, 2), [$0$]),
  node((1, 1), [$Z$]),
  node((1, 0), [$Y$]),
  arr((0, 1), (1, 1), [$f$]),
  arr((1, 1), (1, 2), []),
  arr((1, 0), (1, 1), [$h$]),
  arr((0, 1), (1, 0), [$exists g$], "dashed"),
))
// #image("imgs/20.png", width: 30%)
]

#proof[
  By definition, $P$ is projective if and only if for any epimorphism $h: Y->Z$, we have $ (h oo -) : Hom(A)(P, Y) -> Hom(A)(P, Z) $ is surjective, which means for any $f : P->Z$, there exists $g: P-> Y$ such that $f = h oo g$.
]

#corollary[
  $P$ is a projective object, #iff any #sest 
  $
    ses(A, B, P)
  $
  splits.
]
<projective-split>
#proof[
// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZARgBpiBdUkANwEMAbAVxiRAEEQBfU9TXfIRQAmclVqMWbAELdeIDNjwEiAZjHV6zVohAAFOXyWCiAFg0TtbAAyGF-ZUOTWLWqbts8jAlSnXXxNx19bnEYKABzeCJQADMAJwgAWyQAVmocCCRRS3cQLCgAfQMvEATkpDIQTOzNSWCIu3KUxHTqrMQqhiwwYKg6OAALcJA6q10EUuakc3akaynElpc5zsWKxByaxFUuCi4gA
#align(center, commutative-diagram(
  node-padding: (50pt, 50pt),
  node((1, 1), [$A$]),
  node((1, 2), [$B$]),
  node((1, 3), [$P$]),
  node((1, 4), [$0$]),
  node((1, 0), [$0$]),
  node((0, 3), [$P$]),
  arr((0, 3), (1, 3), [$id_P$]),
  arr((1, 2), (1, 3), [$g$]),
  arr((0, 3), (1, 2), [$s$], label-pos: -1em, "dashed"),
  arr((1, 0), (1, 1), []),
  arr((1, 1), (1, 2), []),
  arr((1, 3), (1, 4), []),
))
  Suppose $P$ is projective. Since $g : B-> P$ is an epimorphism, we can always find $s : P -> B$ such that $g oo s= id_P$ by the lifting property. Then just recall @splitting-lemma. 
  
  The converse should also be clear.
]

#corollary[Dually, $I$ is injective #iff for any monomorphism $h: X->Y$ and any $f: X->I$, there exists $g: Y->I$ such that the following commutes (which we refer to as the *extension property*):
// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZARgBpiBdUkANwEMAbAVxiRAEkQBfU9TXfIRQAGUsKq1GLNsO68QGbHgJEy46vWatEIABpy+SwUQBMYiZuk6AmtwkwoAc3hFQAMwBOEALZIzIHAgkUUktNjcDEE8fJDIAoMQTHncvX0TqQKQAZg0pbRAAC0jotJz44OoGLDB8qDo4AocQXLCdGAAPLDgcOAACRzsuIA
#align(center, commutative-diagram(
  node((1, 1), [$I$]),
  node((0, 0), [$0$]),
  node((0, 1), [$X$]),
  node((0, 2), [$Y$]),
  arr((0, 1), (1, 1), [$f$]),
  arr((0, 0), (0, 1), []),
  arr((0, 1), (0, 2), [$h$]),
  arr((0, 2), (1, 1), [$exists g$], "dashed"),
))

Also, $I$ is injective #iff any #sest 
$
  ses(I, A, B )
$
splits.
]



== Categories of Modules


#proposition[
  Ring $R$ viewed as an object in $RMod$ is projective. 
]

#proof[ It is equivalent to say the functor $ homr (R, -)$ is exact.  In fact,
  $homr (R, M) = M $ because any module morphism $phi : R -> M $ is entirely determined by $phi(1_R)$. Given any #sest $ses(M, M', M'') $, if we apply $homr (R, -)$, we get the same #sest, which is exact. 
]

#corollary[
Any free module $R^(ds I)$ is projective. 
]

#proof[
  The proof is similar as above. #TODO
]
#note[In $RMod$, we have
$ homr (R, plus.circle.big_(i in I) M_i) = plus.circle.big_(i in I) M_i = plus.circle.big_(i in I) homr (R, M_i) $
This does not follow from the universal property of the direct sum; this is because $R$ is special. 
]

#definition[
  Let $cA$ be an additive category. We call an object $C$ *compact* if the canonical morphism $ product.co_(i in I) Hom(A) (C, G_i) -> Hom(A)(C, product.co_(i in I) G_i) $
  is an isomorphism for any family ${G_i}_(i in I)$ of objects in $cA$ such that $product.co_(i in I) G_i$ exists. 
]

#remark[
You might find different definitions for an arbitrary category (not necessarily additive), but they are equivalent under the additive context. 
]


#definition[
  In a category $cC$ with coproducts, an object $G$ is called a *generator* if for any $X in cC$, there is an epimorphism 
  $product.co_I G -> X -> 0$.
]

#lemma[
  $R$ is a generator of $RMod$.
]
#proof[
Recall @module-generator.
]



#lemma[
  In an abelian category $cA$, any hom-set 
  $hom_cA (X, Y)$ can be seen as a right module over ring $End(A)(X)$, or equivalently a left module over $End(A)(X)^op$.
]
#proof[
  First notice $End(A)(X)$ is indeed a ring with composition as multiplication.
  Take any $m in Hom(A)(X, Y)$ and $r in End(A)(X)$.
  Define the multiplication $m r$ as $m oo r in Hom(A)(X, Y)$. It is easy to verify that this makes $Hom(A) (X, Y)$ a right module over $End(A)(X)$.
]

#theorem("Morita's Theorem")[
  Let $cA$ be an abelian category. Assume $cA$ has (small) coproducts. Assume that $P$ is a compact, projective generator. Let ring $R = End(A) (P)$, then the functor $ Hom(A)(P, -) : cA -> ModR $ is an equivalence of categories. 
]


#note[
If $cA = SMod$ for some ring $S$, we have observed that $S$ (as an object of $SMod$) is a compact, projective generator. In this case, $R = end_S (S)$. We observe that any module homomorphism $phi: S -> S$ is uniquely determined by $phi(1) in S$ with $phi(s) = s phi(1)$, and the composition of two homomorphisms $phi_1 , phi_2 : S-> S$ is in the opposite direction of multiplication in $S$: $ phi_1 (phi_2(s)) = s phi_2(1) phi_1(1) $
Therefore, $R = end_S (S) = S^op$. Thus, indeed, we have $SMod$ is equivalent to $ModR$, which is $Mod$-$S^op$.
]

// #remark[
//   Using the definition of equivalence, you want to construct another functor in the opposite direction and show their composites are natural isomorphic to identity functors. Alternatively, you might also prove that the functor is fully faithful and essentially surjective, if you can.
// ]

#proof[
@rotman[Theorem 5.55] and @pareigis[p. 211].
// https://cornellmath.wordpress.com/2008/04/10/abelian-categories-and-module-categories/
Denote $ F:=Hom(A)(P, -) : cA -> ModR$.
Using the definition of categorical equivalence, we want to construct another functor $G : ModR -> cA$ and show $F G$ and $G F$ are naturally isomorphic to identity functors. We see that in this way $G$ should be left adjoint to $F$, so $G$ must preserves colimits and in particular be right exact.

Inspired by the discussion above, we define $G$ in the following way. We first set $G(R) = P$ and $G(R^(ds I)) = P^(ds I)$. Any morphism $f: R^(ds J) -> R^(ds I)$ can be represented by a (possibly infinite) matrix with entries $a_(i j) in R$ for all $i in I$ and $j in J$. However, notice that $R = End(A) (P)$ by definition and thus the same matrix $(a_(i j))_(i in I, j in J)$ can also be seen as a morphism $P^(ds J) -> P^(ds I)$, which is defined to be $G(f)$. 
Now, for any $R$-module $M$, we can find a presentation 
$
  R^(ds J) ->^f R^(ds I) -> M -> 0 
$
Under $G$, this becomes 
$
  P^(ds J) ->^(G(f)) P^(ds I) -> G(M) -> 0 
$
where we define $G(M) = Coker(G(f))$.

#TODO It can be verified that $G$ is a functor.

Since $P$ is a projective object, $F$ is exact and preserves cokernels; since $P$ is compact, $F$ preserves direct sums. On the other hand, $G$ is right exact and preserves direct sums by construction. Hence the composites $F G$ and $G F$ are right exact and preserves direct sums. 
Now we check $F G$ and $G F$ are naturally isomorphic to identity functors. 

For $F G : ModR -> ModR$, we have $ F G (R) = F (P) = hom_cA (P, P) = R $
and hence $F G(R^(ds I)) = R^(ds I)$. Now for any $M in ModR$, there is a commutative diagram 
// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBpiBdUkANwEMAbAVxiRACUA9ACijgAIAUgEoQAX1LpMufIRQBGclVqMWbLrwEBJURKnY8BIgCYl1es1aIQAWXGSQGA7KJl5yi2usAxfgHF+bn4NPiFhfl0HJxkjBVJ3c1UrEF8A7hDtYUj9GLlkUwSVSzZUwJtsx2lDPIBmMyKvEGJ7HOqiOsLPZOaxZRgoAHN4IlAAMwAnCABbJDIQHAgkGr0QCemkRXnFxAAWFbWZxFMtpABWfcnDuYWNi-XETZuju8Pjp4A2F6XqJ72HA6QOx+23O-0uZ2BSAA7L0xEA
#align(center, commutative-diagram(
  node-padding: (50pt, 50pt),
  node((0, 0), [$R^(ds J)$]),
  node((0, 1), [$R^(ds I)$]),
  node((0, 2), [$M$]),
  node((1, 0), [$F G ( R^(ds J) )$]),
  node((1, 1), [$F G (R^(ds I))$]),
  node((1, 2), [$F G (M)$]),
  node((0, 3), [$0$]),
  node((1, 3), [$0$]),
  arr((0, 0), (1, 0), []),
  arr((0, 1), (1, 1), []),
  arr((0, 2), (1, 2), []),
  arr((0, 0), (0, 1), []),
  arr((0, 1), (0, 2), []),
  arr((0, 2), (0, 3), []),
  arr((1, 0), (1, 1), []),
  arr((1, 1), (1, 2), []),
  arr((1, 2), (1, 3), []),
))
Since $F G$ preserves cokernels, we see that $F G(M) iso M$. Hence $F G$ is naturally isomorphic to the identity functor of $ModR$.

For $G F: cA -> cA$, we have 
$G F (P) = G( R) = P
$,
so $ G F (P^(ds I)) =P^( ds I)$. Now take any $X in cA$, since $P$ is a generator, we can find 
$
  P^(ds J) -> P^(ds I) -> X -> 0
$
A similar argument as before gives the result. #TODO review 
]

#remark[
$cA$ can have more than one compact, projective generator, say $P_1$ and $P_2$. Then $A = End(A) (P_1)^op hyph Mod = End(A) (P_2)^op hyph Mod$, where rings $End(A) (P_1)$ and $End(A) (P_2)$ are not necessarily isomorphic. This is *Morita equivalence* of rings. 

Consider $veck$ for some field $k$. Then $k$ and $k^n$ are both compact, projective generators of $veck$. Then $k$ and $M_n (k)$ ($n times n$ matrices over $k$) both are equivalent to $veck$ as categories. #TODO
]



#theorem("Freyd-Mitchell Embedding Theorem")[
  If $cA$ is a small abelian category, there is a ring $R$ and an exact, fully faithful embedding $cA -> RMod$.
]

#proof[
// Using Yoneda embeddings. $cA -> Fun(cA^op, Ab)$. (?) 
#TODO
]

This theorem indicates that we can embed an abstract category into a concrete one. From a practical perspective, we can prove any reasonable statements for $RMod$ and they will also hold for abelian categories. An example is the following.


#lemma("Snake Lemma")[
 Suppose we have a commutative diagram of objects in an abelian category or $RMod$ 

 // https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZARgBpiBdUkANwEMAbAVxiRAEEQBfU9TXfIRQAmclVqMWbAELdeIDNjwEiAZjHV6zVohABhOXyWCiZAAzitU3ewDkhhf2VDkoi5sk6Q0+zyMCVFHV3CW02PV95RQCXABZSEKsvMwdo5yIzDVDrEBSucRgoAHN4IlAAMwAnCABbJHUQHAgkTOyvcocq2qR4xubEMja2Is7qusQAVmompFEh3QALUe7EBpnEXqS2LEiKsZ7p-qn5hV2QLvHj9YA2P3P9xAB2Q5a7i5aXgY8w3Sxl8cG6zmW10aBA1AYWDAXjgEEhUG4FC4QA
#align(center, commutative-diagram(
  node-padding: (50pt, 50pt),
  node((1, 1), [$A$]),
  node((1, 2), [$B$]),
  node((1, 3), [$C$]),
  node((0, 1), [$A'$]),
  node((0, 2), [$B'$]),
  node((0, 3), [$C'$]),
  node((0, 4), [$0$]),
  node((1, 0), [$0$]),
  arr((0, 1), (1, 1), [$f$]),
  arr((0, 2), (1, 2), [$g$]),
  arr((0, 3), (1, 3), [$h$]),
  arr((0, 1), (0, 2), [$i'$]),
  arr((0, 2), (0, 3), [$p'$]),
  arr((0, 3), (0, 4), []),
  arr((1, 0), (1, 1), []),
  arr((1, 1), (1, 2), [$i$]),
  arr((1, 2), (1, 3), [$p$]),
))
// #image("imgs/23.png")

such that the rows are exact, then there is an exact sequence 
$ ker f -> ker g -> ker h attach(->, t: diff)  coker f -> coker g -> coker h $

Further, if $A' -> B'$ is monic, so is $ker f -> ker g$.
If $B -> C$ is epic, so is $coker g -> coker h$.
]
<snake>
#proof[
  [See https://faculty.etsu.edu/gardnerr/5410/notes/Snake-Lemma.pdf.]
We have the following commutative diagram: 
#v(20pt)
// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZARgBoAmAXVJADcBDAGwFcYkQBBEAX1PU1z5CKchWp0mrdgCEefEBmx4CRAMxiaDFm0QgAwnP5KhRMsXFapujgHJDCgcuHJR5zZJ0hpd3kcEqUdTcJbXY9H3lFf2cyAAYLD3YAaxgAJwACADN7KKciUXj3UN0UjIBzHMcTQNJCkKsQUvSAC0rjAJJSVQTikABjCCbs3wd251FuooaBpoqR3OrkdUn6zxm0lrboogAWUmDLT1itvJRYjVX2Y+5xGCgy+CJQTNSIAFskADYaHAgkVRGL3e-x+f0Q50uumG8iBH3BoKQAE5Aa84QB2BGIHYo4FYzFkSEgOYw1FIAm-MmxHFwgAcmIArNSkPTMaJCa0mYg2RTEMRiJz1CAeXtCVgIs9SXihWCWYS0OKQLDmfjyJziIKeVSSbiITyCYd2Fh7Ereaypp40CAaIwsGBPFB6HBmndjZK6dKkdbbfbHc6oFaQAAjGBgf2IAC0aP52rhiPxWoluOIurBfM53w9iDRnIxmZpN24QA
#align(center, commutative-diagram(
  node-padding: (50pt, 50pt),
  node((2, 1), [$A$]),
  node((2, 2), [$B$]),
  node((2, 3), [$C$]),
  node((1, 1), [$A'$]),
  node((1, 2), [$B'$]),
  node((1, 3), [$C'$]),
  node((0, 1), [$ker f$]),
  node((0, 2), [$ker g$]),
  node((0, 3), [$ker h$]),
  node((3, 1), [$coker f$]),
  node((3, 2), [$coker g$]),
  node((3, 3), [$coker h$]),
  node((1, 4), [$0$]),
  node((2, 0), [$0$]),
  arr((0, 1), (1, 1), []),
  arr((1, 1), (2, 1), [$f$]),
  arr((2, 1), (3, 1), []),
  arr((0, 2), (1, 2), []),
  arr((1, 2), (2, 2), [$g$]),
  arr((2, 2), (3, 2), []),
  arr((0, 3), (1, 3), []),
  arr((1, 3), (2, 3), [$h$]),
  arr((2, 3), (3, 3), []),
  arr((1, 1), (1, 2), [$i'$]),
  arr((1, 2), (1, 3), [$p'$]),
  arr((1, 3), (1, 4), []),
  arr((2, 0), (2, 1), []),
  arr((2, 1), (2, 2), [$i$]),
  arr((2, 2), (2, 3), [$p$]),
  arr((0, 3), (3, 1), [$diff$], curve: -68deg, "dashed"),
  arr((3, 1), (3, 2), [$j$]),
  arr((3, 2), (3, 3), [$q$]),
  arr((0, 1), (0, 2), [$j'$]),
  arr((0, 2), (0, 3), [$q'$]),
))

  In the first row, consider map $j' := i'|_(ker f) : ker f -> B'$. We claim that $j' : ker f -> ker g$. Indeed, take any $a' in ker f subset.eq A'$, we have 
  $ g(j'(a')) = g(i'(a')) = i(f(a')) = i(0) = 0 $
  Then $j'(a') in ker g$ and thus $j' : ker f -> ker g$. Similarly, $q' := p'|_(ker g) : ker g -> ker h$. We then see the first row is exact because of the exactness of $A' -> B' -> C'$.

  In the last row, define $j : coker(f) -> coker(g)$ as $a + im(f) |-> i(a) + im(g)$ for any $a in A$. We claim that this map is well-defined. If $a_1, a_2 in A$ such that $a_1 + im(f) = a_2 + im(f)$, then $a_1 - a_2 in im(f)$, thus there exists $a' in A'$ so that $a_1 - a_2 = f(a')$. Then 

  $ i(a_1 - a_2) = i(f(a')) = g(i'(a')) in im(g) $

  Then 
  $ j(a_1 + im(f)) = i(a_1) + im(g) = i(a_2) + im(g) = j(a_2 + im(f)) $

  So $j$ is well-defined. Similarly, we can define $q : coker g -> coker h$ and show the exactness of the last row.

  Now all arrows except $diff$, which we call the *connecting homomorphism*, are clear. 
  Pick any $c' in ker h subset.eq C'$. 
  Since $p'$ is surjective, there exists $b' in B'$ so that $p'(b') = c'$. 
  Now $ 0 = h(c') = h(p'(b')) = p(g(b')) $ so $g(b') in ker p = im i$, and there exists unique $a in A$ such that $i(a) = g(b')$. 
  We thus define $diff: ker h -> coker f$ as $ diff(c') = a + im(f) $ 
  We claim this is a well-defined function. 
  Then it suffices to show for any two choices $b'_1, b'_2$ of $b'$ and corresponding choices $a_1, a_2$ of $a$, $diff (c')$ gives the same value. Since $p'(b'_1) = p'(b'_2) = c'$, we have $b'_1 - b'_2 in ker(p') = im(i')$. Thus we can write $b'_1 - b'_2 = i'(a')$ for some $a' in A'$. Then 
  $ i(a_1 - a_2) = g(b'_1 - b'_2) = g(i'(a')) = i (f (a'))  $
  but $i$ is injective, and hence $a_1 - a_2 = f(a') in im f$. In other words, we could define $ diff(c') = i^(-1) g p'^(-1) (c') + im(f) $
  where $p'^(-1)$ means finding some element $b' in B'$ such that $p'(b') = c'$ and so on. 

  We still need to verify this is exact. TODO
  
  See @li[Theorem 6.8.6].
]

#endlec(5)