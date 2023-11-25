#import "libs/template.typ": *
#import "libs/var.typ": *
#import "libs/commute.typ": node, arr, commutative-diagram

= Tensor products

#TODO probably delete this section. this is only introductory and we could have worked on modules directly instead of vector spaces


Let $k$ be a field and let $veck$ denote the category of $k$-vector spaces. Let $V, W, L in veck$, denote by $"Bilin"(V, W; L)$ the set of bilinear transformations $V times W -> L$. Let $T in "Bilin"(V, W; L)$, then can we write $T$ in terms of linear algebra?

Denote
$ "Hom"_k (V, W) := "Hom"_veck (V, W) $ as the set of linear transformations $V -> W$, and it is a $k$-vector space (in a natural way).
//  We denote the same set by $#underline("Hom") (V, W)$ to emphasise the vector space structure. 

We see that

$
"Bilin"(V, W; L) tilde.eq homk (V, homk (W, L)) tilde.eq homk(V, homk(V, L))
$

#remark[This is currying in computer science.]

Is $"Bilin"(V, W; -): veck -> bd("Set")$ _representable_? In other words, is there a $k$-vector space $V times.circle_k W$ with a _natural_ isomorphism $ "Bilin"(V, W; -) tilde.eq homk (V times.circle_k W, -) $
where naturality means that the isomorphism is compatible with changes in $L$: if there is a linear map $T: L -> L'$ then this isomorphism should be compatible with $T$.

Also equivalent to: is there a vector space $V times.circle_k W$ with a bilinear map $V times W -> V times.circle_k W$ which is universal? We want to find bilinear map $V times W -> V times.circle_k W$ such that for any blinear map $V times W -> L$, there exists a unique linear map $V times.circle_k W -> L$ such that the diagram commutes:

// #image("imgs/1.png", width: 50%)

// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBoBGAXVJADcBDAGwFcYkQA1AAjwFt4uAdRABfUuky58hFOQrU6TVuwAyo8SAzY8BInOIKGLNok480AayGiFMKAHN4RUADMAThF5IyIHBCTkYq4eXog+fkgATEEg7p5RNBGIciCMWGAmIFD0cAAWdiA0RsqmMAAeWHA4cFwAhDYiQA
#align(center, commutative-diagram(
  node((1, 0), [$V times W$]),
  node((1, 1), [$L$]),
  node((0, 1), [$V tpk W$]),
  arr((1, 0), (1, 1), []),
  arr((1, 0), (0, 1), []),
  arr((0, 1), (1, 1), [$exists !$], "dashed"),
))


Remark: it is also equivalent to asking for an adjoint functor.

For any $(v, w) in V times W$ we want to find $v times.circle w in V tpk W$. This is a bilinear map, so for example:

$
(v+v') tp w = v tp w + v' tp w
$

#definition[
   For any set $X$, let $k[X]$ denote the vector space spanned by $X$: $ sum_(x in X) a_x x $ where $a_x = 0$ for almost all $x in X$.
]

Now we look at $k[V times W]$ (a free vector space). This is large: even if $V$ and $W$ have finite dimensions this vector space has infinite. We look at the subspace spanned by the relations $ M = "span"{(v + v', w) - (v, w) - (v', w) \ (v, w + w') - (v, w) - (v, w') \ c(v, w) - (c v, w) \ c(v, w) - (c w, v)} $ TODO

for all $v, v' in V$ and $w, w' in W$ and $c in k$. Then we have 
$
homk (k[V times W] \/ M, L) tilde.eq "Bilin"(V, W; L)
$
due to the first isomorphism theorem. We see that if $T in homk (k[V times W] \/ M, L)$ then $T$ is a linear transformation $k[V times W] -> L$ such that $T(M) = 0$. For any $(v, w) in V times W$:

$ V times W -> k[V times W] -> k[V times W] \/ M \
(v, w) |-> (v, w) |-> (v, w) + M $

We can thus define $V tpk W := k[V times W] \/ M$.

Note: $V tpk W$ is defined up to a unique isomorphism. This follows from the universal property (ref. category theory). 

// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBoBGAXVJADcBDAGwFcYkQA1AAjwFt4uAdRABfUuky58hFOVLFqdJq3bccaANZDR4kBmx4CROQCZFDFm0ScemgOTaRimFADm8IqABmAJwi8kMhAcCCRyMW8-AMQgkKQTCJBff3iaOMQ5EEYsMCsQKHo4AAsXEBoAIxgwKCQAZiCLFWsYAA8sOBw4LgBCHUiUjLTQxBMKqprEepps3PYC4tKaRrzW9s6e0UoRIA
#align(center, commutative-diagram(
  node((1, 0), [$V times W$]),
  node((0, 1), [$V tpk W$]),
  node((2, 1), [$V tpk' W$]),
  arr((1, 0), (0, 1), []),
  arr((1, 0), (2, 1), []),
  arr((2, 1), (0, 1), [$exists !$], curve: 30deg, "dashed"),
  arr((0, 1), (2, 1), [$exists !$], curve: 30deg, "dashed"),
))

// #image("imgs/2.png")

== Properties of tensor product

$"Bilin"(V, W; -) tilde.eq "Bilin"(W, V; -)$ in a canonical way and hence $V tpk W tilde.eq W tpk V$. Also $k tpk W tilde.eq W$.

$ "Trilin"(V_1, V_2, V_3; L) tilde.eq "Bilin"(V_1 tpk V_2, V_3; L)  tilde.eq  "Bilin"(V_1,  V_2 tpk V_3; L) $
and hence $ (V_1 tpk V_2) tpk V_3 tilde.eq V_1 tpk (V_2 tpk V_3) $

It is obviously hard to verify these properties using the definition directly (but good exercise?).

More generally, let $sigma in S_n$ (symmetric group),

$ ( ... (V_1 tpk V_2) tpk ... tpk V_n) tilde.eq ( ... (V_sigma(1) tpk V_sigma(2)) tpk ... tpk V_sigma(n)) $

Remark: in category theory, we think of things by their properties not their definition.

Remark: we now have $(veck, - tpk -)$ which also preserves liner maps. If we have $T: V-> V'$ and $S: W-> W'$ then $T tpk S: V tpk W -> V' tpk W$. (This is heavily used in quntum computing.) This is a symmetric monoidal category.

#definition[
  A $k$-algebra is a monoid object in $(veck, tpk)$; namely, $A in veck$ with multiplication $m: A tpk A -> A$ and a unit $i: k -> A$ which are associative and unital. Namely, $m$ is a multiplication that takes two elements in $A$ and is bilinear; $i$ just sends $1 in K$ to $i(1)$ which is the unit element in $A$. Associativity of $m$ is shown in commuting diagram:

  #image("imgs/3.png")
]



== Non-linear version

In the category of $bd("Set")$, 
$ hom(X times Y, Z) = hom(X, hom (Y, Z)) $ 
This is Cartesian category (?)

#endlec(1)

== More discussions

$ dim (V ds W) = dim V + dim W $
$ dim (V tp W) = dim V dot dim W $

An alternative definition of the tensor product: let $V$ be a vector space with basis ${v_i}_(i in I)$ and $W$ with ${w_j}_(j in J)$ and define $V tpk W$ to have basis ${v_i tp w_j}_(i in I, j in J)$. When we change basis this can be problematic.

Remark: Categorification. If we discuss a category $(C, ds, tp)$ then this is similar to categorifying some underlying structure of a ring. Active field of research.

We were discussing $V tpk W$ for $k$ a field. To generalise, for a ring $R$ and left $R$-modules $M, N$, we can define $M tpr N$.

Note: if $R$ is a non-commutative ring, $M$ is a right $R$-module and $N$ is a left $R$-module, then $M tpr N$ is (only) an abelian group. There would be a problem moving the scalars $r in R$ from side to side in the definition (using free modules), i.e. we can only have things like $m r tp n - m tp r n$.