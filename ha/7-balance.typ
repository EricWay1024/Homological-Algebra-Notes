#import "../libs/template.typ": *
= Balancing $Ext$ and $Tor$
<balancing-ext-tor>
== Defining $Ext$ and $Tor$ 

#definition[
  Let $cA$ be an abelian category. Let $A, B in cA$ and let $B -> I_cx$ be an injective resolution.
Recall that $Hom(A)(A, -): cA -> Ab$ is left exact by @hom-left-exact.
  If $cA$ has enough injectives, we define the right derived functor $Ext_cA^i (A, -)$ of $Hom(A)(A, -)$ as
  // #footnote[While $Ext_cA^i (A, -)(B)$ (as well as $Ext_cA^i (-, B)(A)$ defined below) is not a common way of writing, it emphasizes the asymmetry of the construction.]
  $ Ext_cA^i (A, B) = Ext_cA^i (A, -)(B) := R^i Hom(A)(A, -)(B) = H^i (Hom(A) (A, I^cx)). $
  In particular, $Ext_cA^0 (A, B) = Hom(A) (A, B)$.
]

Notice that the contravariant functor $Hom(A)(-, B): cA^op -> Ab$ is also left exact by @hom-left-exact-2. Assume that $cA$ has enough projectives, so $cA^op$ has enough injectives. Let $P_cx -> A$ be an projective resolution in $cA$, which can be seen as an injective resolution in $cA^op$. We can thus define another right derived functor $Ext_cA^i (-, B)$, given by
$
  Ext_cA^i (-, B)(A) := R^i Hom(A)(-, B) (A) = H^i (Hom(A)(P_cx, B)).
$

The above two constructions are in fact isomorphic, i.e., $Ext_cA^i (A, -)(B) iso Ext_cA^i (-, B)(A)$, or
$
  Ext_cA^i (A, B) := R^i Hom(A)(A, -)(B) iso R^i Hom(A)(-, B) (A).
$
This isomorphism is called the *balancing of $Ext$*. Before proving the balancing of $Ext$, we present some properties of $Ext$ that it gives.

#proposition[
  Let $ses(K, L, M)$ be a short exact sequence in $cA$ and let $A, B in cA$. Then we have the induced long exact sequences
  $
    0 -> Hom(A) (A, K) ->  Hom(A) (A, L) ->  Hom(A) (A, M) -> \ Ext_cA^1 (A, K) ->  Ext_cA^1 (A, L) ->  Ext_cA^1 (A, M) -> ...
  $
  and 
  $
    0 -> Hom(A) (M, B) ->  Hom(A) (L, B) ->  Hom(A) (K, B) -> \ Ext_cA^1 (M, B) ->  Ext_cA^1 (L, B) ->  Ext_cA^1 (K, B) -> ...
  $
]
#proof[
  Simply notice that ${Ext_cA^i (A, -)}_(i>=0)$ and ${Ext_cA^i (-, B)}_(i>=0)$ form two cohomological $delta$-functors.
]

#proposition[
  The followings are equivalent:
  + $B$ is injective;
  + $Hom(A)(-, B)$ is exact;
  + $Ext_cA^i (A, B) = 0$ for $i !=0$ and all $A$;
  + $Ext_cA^1 (A, B) = 0$ for all $A$.]
<ext-injective>
#proof[
  (1) $<=>$ (2) by the definition of injective objects.

  (1) $=>$ (3) by applying the dual of @projective-left-zero to $Ext_cA^i (A, -)$. 

  (3) $=>$ (4) is trivial.

  (4) $=>$ (2). Let $ses(A', A, A'')$ be a short exact sequence in $cA$, which induces the #lest 
  $
    0 -> Hom(A) (A', B) -> Hom(A) (A, B) -> Hom(A) (A'', B) -> Ext^1_cA (A', B) -> ...
  $
  Since $Ext^1_cA (A', B) = 0$ by assumption,  $Hom(A) (-, B)$ is an exact functor.
]
#proposition[
  The followings are equivalent:
  + $A$ is projective;
  + $Hom(A)(A, -)$ is exact;
  + $Ext_cA^i (A, B) = 0$ for $i !=0$ and all $B$;
  + $Ext_cA^1 (A, B) = 0$ for all $B$.
]
// #proof[
//   Similar as above.
// ]

#example[
  Let $m, n in ZZ$. 
  Let us calculate $Ext_ZZ^1 (ZZ over m, ZZ over n)$ in two different ways. 

  We may use the injective resolution of $ZZ over n$: 
  $
    0 -> ZZ over n -> QQ over ZZ ->^n QQ over ZZ -> 0.
  $
  Now delete $ZZ over n$, apply $hom_ZZ (ZZ over m, -)$, and use $hom_ZZ (ZZ over m , QQ over ZZ) iso ZZ over m$, we get 
  $
    0 -> ZZ over m -> ^n ZZ over m -> 0.
  $
  Calculating the first cohomology of this sequence reveals that $Ext_ZZ ^ 1 (ZZ over m , ZZ over n) = H^1 = Coker (ZZ over m -> ^n ZZ over m) iso ZZ over gcd(m, n)$.

  On the other hand, we may invoke the balancing of $Ext$ and use the projective resolution of $ZZ over m$: 
  $
    0 -> ZZ ->^m ZZ -> ZZ over m -> 0.
  $
  Now delete $ZZ over m$, apply $hom_ZZ (-, ZZ over n)$ (which is a contravariant functor), and use $hom_ZZ (ZZ, ZZ over n) iso ZZ over n$, we get 
  $
    0 -> ZZ over n -> ^m ZZ over n -> 0.
  $
  Again the first cohomology of the sequence gives $ZZ over gcd(m, n)$. 
  
]
#definition[
  Let $R$ be a ring and $B$ be a left $R$-module. Since $(- tpr B) : ModR -> Ab$ is right exact by @tensor-right-exact and $RMod$ has enough projectives, we can define the left derived functor $Tor_i^R (-, B)$:
  $ Tor_i^R (A, B) = Tor_i^R (-, B)(A) := L_i (- tpr B) (A). $
]

Similarly, let $A$ be a right $R$-module, and $(A tpr - ): RMod -> Ab$ is right exact by @tensor-right-exact-2. We can thus define the left derived functor $Tor_i^R (A, -)$: 
$
  Tor_i^R (A, -)(B) := L_i (A tpr -) (B).
$

The two constructions are again isomorphic, i.e., 

$ Tor_i^R (A, B) := L_i (- tpr B) (A) iso L_i (A tpr -) (B). $

This isomorphism is called *the balancing of $Tor$*, which gives the following property.

#proposition[
  Let $ses(K, L, M)$ be a #sest in $ModR$ and let $B in RMod$. Then we have the induced long exact sequence 
  $
    ... -> Tor_1^R (K, B) -> Tor_1^R (L, B) ->  Tor_1^R (M, B) -> K tpr B -> L tpr B -> M tpr B -> 0.
  $
  
  If $ses(K, L, M)$ is instead a #sest in $RMod$ and let $A in ModR$, then we have the induced #lest 
  $
    ... -> Tor_1^R (A, K) -> Tor_1^R (A, L) ->  Tor_1^R (A, M) -> A tpr K -> A tpr L -> A tpr M -> 0.
  $
]
<tor-les>

In order to prove the balancing of $Ext$ and $Tor$, we need two new tools: mapping cones and double complexes, introduced in the following sections.

// #TODO #lest induced by $Tor$ and $Ext$

== Mapping Cones
// #remark[
// In topology,  let $f: X-> Y  $ be a continuous map between two topological spaces. 

//   The *topological mapping cylinder* $M_f$ of $f : X-> Y$ is the quotient
//   $ ((X times I) product.co Y) over tilde $
//   where the equivalence relation $tilde$ is generated by $ (x, 1) tilde f(x)$ for all $x in X$. That is, the mapping cylinder is obtained by gluing one end of $X times I$ to $Y$ via the map $f$. It is often denoted as $(X times I) union.sq_f Y$.

//   The *topological mapping cone* $C_f$ of $f : X-> Y$ is the quotient space of the mapping cylinder $(X times I) union.sq_f Y$ with respect to the equivalence relation $(x, 0) tilde (x', 0)$ for all $x, x' in X$. That is, the end of $X times I$ that is not glued to $Y$ is identified as a point.
//   #align(center,image("../imgs/Mapping_cone.svg",width:30%))
// ]


#definition[Let $f : B_cx -> Ccx$ be a chain map.
 Define the *mapping cone* of $f$ as the chain complex $cone(f)_cx$, given by $ cone(f)_n = B_(n-1) plus.circle C_n $ 
 with differential#footnote[In @tot-cone there is an explanation for this definition.] $ d(b, c) = (-d(b), d(c) - f(b)) $ for $b in B_(n-1)$ and $c in C_n$.
We could also write the differential in the form of a matrix:
$
mat(-d_B, 0; -f, d_C) : vec(B_(n-1), C_n) -> vec(B_(n-2), C_(n-1))
$

Dually, let $g : B^cx -> C^cx$ be a cochain map, then the mapping cone of $g$ is the cochain complex $cone(g)^cx$ given by 
$
  cone(g)^n = B^(n+1) plus.circle C^n
$
with differential $ d(b, c) = (-d(b), d(c) - f(b)) $ for $b in B^(n+1)$ and $c in C^n$.
]

#lemma[
  Let $f: B_cx -> C_cx$ be a chain map. Then there is a long exact sequence in homology
  $ 
 ... -> H_(n+1) (cone(f)) ->  H_n (B) ->^diff H_n (C) -> H_n (cone(f)) -> ...
$
  where the connecting morphism 
  $diff = f_ast $.
  // Dually, let $g : B^cx -> C^cx$ be a cochain map, then there is a #lest in cohomology 
  // $
  //   ... -> H^(n-1) (cone(f)) ->  H^n (B) ->^diff H^n (C) -> H^n (cone(f)) -> ...
  // $
  // with $diff = g^ast$.
  
]
#proof[
There is a #sest of chain complexes:
$ ses(C, cone(f), B[-1], f: i, g: pi), $
where $i: c mapsto (0, c)$ and $pi : (b, c) |-> -b$. Notice that $H_(n+1)(B[-1]) = H_n (B)$, so we get the corresponding #lest in homology as above by @connecting.

  Further, we have $diff = i^(-1) d_(cone(f)) pi^(-1)$ by @connecting.
  Let $b in B_n$ be a cycle. We can lift it to $(-b, 0)$ in $cone(f)$. Apply the differential of $cone(f)$ to get $d_(cone(f)) ( -b, 0) = (d (b), f (b)) = (0, f (b))$. Thus $diff[b] = [f (b)] = f_ast [b]$.
]

The following is the main function of the mapping cone.
#corollary[
  A chain map $f: B_cx -> C_cx$ is a quasi-isomorphism if and only if $cone(f)$  is acyclic.
]
   <cone-qi>
#proof[
  "$=>$". If $f$ is a quasi-isomorphism, then $f_ast : H_n (B) -> H_n (C)$ is an isomorphism for all $n$. Then we have an exact
sequence
$ H_n (B) arrow.r^(f_ast) H_n (C) arrow.r^(i_ast) H_n ("cone"(f)) arrow.r^(pi_ast) H_(n - 1) (B) arrow.r^(f_ast) H_(n - 1) (C).  $

By exactness at $H_n (C)$,  we have that
$ Ker (i_ast) = IM(f_ast) = H_n (C)$. So $i_ast = 0$ and $IM(i_ast) = 0$. 
By exactness at $H_(n - 1) (B)$, we have that
$ "Im"(pi_ast) = Ker(f_ast) = 0$, so $pi_ast = 0$ and $ Ker (pi_ast) = H_n ("cone"(f))$. 

By exactness at $H_n ("cone"(f))$, we
have $ 0 = IM(i_ast) = Ker (pi_ast) = H_n ("cone"(f)), $ so
$cone(f)$ is acyclic.

"$arrow.l.double$". If cone $(f)$ is
acyclic, then $H_n ("cone"(f)) = 0$ and we have an exact sequence
$ 0 arrow.r H_n (B) arrow.r^(f_ast) H_n ("cone"(f)) arrow.r 0,  $
which indicates that $f_ast$ is an isomorphism.
]

#remark[
  The same result can be obtained for cochain maps. 
]

There is a similar construction called the mapping cylinder, although we do not use it in these notes.
#definition[
  The *mapping cylinder* of a chain map $f: B_cx -> C_cx$ is defined as the chain complex $cyl(f)_n = B_n xor B_(n-1) xor C_n$. The differential can be represented by the matrix 
  $
    mat(d_B, id_B, 0;0, -d_B, 0; 0, -f, d_C).
  $
]

#remark[
  The reader is directed to @weibel[Section 1.5] for some topological remarks on mapping cones and mapping cylinders.
]
// #remark[
// Let $0->B->^f C->^g D-> 0$ be a #sest of complexes. Then $phi: cone(f) -> D$ has $phi(b, c)-> g(c)$.#align(center,image("../imgs/2023-11-10-12-30-40.png",width:50%)) You can prove $cyl(f)-> C$ is a quasi-isomorphism and also $phi$ is quasi-isomorphism. (This is non-examinable.)
// ]
== Double and Total Complexes
Recall that if $cA$ is an abelian category,  $Ch(cA)$ is also an abelian category. Then to define a "two-dimensional" complex, one may be tempted to consider the category $Ch(Ch(cA))$. However, what we define next is slightly different from that.
#definition[
  A *double complex* (or *bicomplex*) $C = C_(cx cx)$ in an abelian category $cA$ is a family ${C_(p, q)}$ of objects in $cA$ with maps $d^h_(p, q) : C_(p, q) -> C_(p-1, q)$ and $d^v_(p, q) : C_(p, q) -> C_(p, q-1)$ such that $ (d^h)^2 = (d^v)^2 = 0, quad d^v d^h + d^h d^v = 0. $
  The *total degree* of a term $C_(p, q)$ is defined as $p + q$.
]

In other words, a double complex is an infinite two-dimensional grid of objects where each row (resp. each column) is a chain complex, and the horizontal and vertical differentials _anticommute_. A diagram for a double complex is shown as below; this is not a commutative (but an anticommutative) diagram.

// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZARgBpiBdUkANwEMAbAVxiRAGEB9ACjQFoyAAgCOAamIBKEAF9S6TLnyEUAJnJVajFmy69SI8VNnzseAkQDM66vWatEHHmnH6xkmXJAZTSomRUattoOuvxCwkae3ormqqQBNlr2jnoikSYxyshWCZp2Ok4uaR4ZZllkFoFJBbwCrgLpXgplRGqVifkhTvXuxk0+sdmk7XnBKc7hDSX9mUQALNajyQB0q9PRLSgLuUEra30bvlvDVZ0gq8vrzUdDc6djF1cDWWp3HQ-7UdeDZG9LbI8Dt8sgAGE7vPaXIHPIhgnbVByAr4wlBgygQgGfUo3Kwg+6Qp6zOJ4jGIrEzTYkUgk-5kqEaGBQADm8CIoAAZgAnCAAWyQCxAOAgSAA7KSQFAAHo0aZc3lIMiC4WIAW7NhSmV9OV8xBgpVIKy0iXS2XcnWGoVIABs4o1pvliDU+sQAFZbSatWakG7nQAOd2azzahXUS2690AC3tOqdYcVaocUqjnodAE5Q8qVCmdcQ9WGXdnvRn+ZHoyXnYaE8bk0GvYgxc6bUak2XEP7nQ2qy3C4hiIqw76e+241naw6G3GLD2m3G5tPi72C2PzQviFae3nlcQRT3iMPM7v087iD2VJukCDpBRpEA
#align(center, commutative-diagram(
  node-padding: (50pt, 50pt),
  node((1, 1), [$C_(p-1, q+1)$]),
  node((1, 2), [$C_(p, q+1)$]),
  node((1, 3), [$C_(p+1, q+1)$]),
  node((2, 1), [$C_(p-1, q)$]),
  node((2, 2), [$C_(p, q)$]),
  node((2, 3), [$C_(p+1, q)$]),
  node((3, 1), [$C_(p-1, q-1)$]),
  node((3, 2), [$C_(p, q-1)$]),
  node((3, 3), [$C_(p+1, q-1)$]),
  node((1, 4), [$...$]),
  node((2, 4), [$...$]),
  node((3, 4), [$...$]),
  node((4, 3), [$...$]),
  node((4, 2), [$...$]),
  node((4, 1), [$...$]),
  node((3, 0), [$...$]),
  node((2, 0), [$...$]),
  node((1, 0), [$...$]),
  node((0, 3), [$...$]),
  node((0, 2), [$...$]),
  node((0, 1), [$...$]),
  arr((2, 2), (3, 2), [$d^v$]),
  arr((1, 2), (2, 2), [$d^v$]),
  arr((1, 1), (2, 1), [$d^v$]),
  arr((2, 1), (3, 1), [$d^v$]),
  arr((1, 3), (2, 3), [$d^v$]),
  arr((2, 3), (3, 3), [$d^v$]),
  arr((1, 2), (1, 1), [$d^h$]),
  arr((1, 3), (1, 2), [$d^h$]),
  arr((1, 4), (1, 3), []),
  arr((2, 4), (2, 3), []),
  arr((2, 3), (2, 2), [$d^h$]),
  arr((2, 2), (2, 1), [$d^h$]),
  arr((3, 2), (3, 1), [$d^h$]),
  arr((3, 3), (3, 2), [$d^h$]),
  arr((3, 4), (3, 3), []),
  arr((3, 3), (4, 3), []),
  arr((3, 2), (4, 2), []),
  arr((3, 1), (4, 1), []),
  arr((3, 1), (3, 0), []),
  arr((2, 1), (2, 0), []),
  arr((1, 1), (1, 0), []),
  arr((0, 3), (1, 3), []),
  arr((0, 2), (1, 2), []),
  arr((0, 1), (1, 1), []),
))

// #align(center,image("../imgs/2023-11-12-16-01-47.png",width:50%))
#remark[
  Because the differentials anticommute, $d^v$ cannot be seen as chain maps between rows. 
  We need to replace $d^v_(p, q)$ by $f_(p, q) := (-1)^p d^v_(p, q)$ (so that the signs alternate for adjacent columns) to make the squares commute. For example, the following is a commutative diagram:
// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBoBGAXVJADcBDAGwFcYkQBhAfQAoziAlCAC+pdJlz5CKchWp0mrdtx6zBIsSAzY8BIgCY5NBizaJOvQ+tHidUov3kml5lWXJCbWibunI1TopmnKoUnpraknooVoGmypZhGrZRfgDMpMRxLhY8GR7J3nbRyPnZwSoZ1vIwUADm8ESgAGYAThAAtkgALDQ4EEgZCvHmUAB6ABaFbZ1IAKx9A4i9wznjU14zXYiyIP1IZKvB69Pt24Z7S7vOx5Ons4hD+4iHN+zjtPfbK8-XQewAWg+X3miyQFzeozGn02ZyQADYwYgFkd3ndYQ8AOxIiH-KEbTRbBFI7Go8xA6EiSjCIA
#align(center, commutative-diagram(
  node-padding: (50pt, 50pt),
  node((1, 0), [$C_(0,0)$]),
  node((1, 1), [$C_(1,0)$]),
  node((1, 2), [$C_(2,0)$]),
  node((0, 0), [$C_(0,1)$]),
  node((0, 1), [$C_(1,1)$]),
  node((0, 2), [$C_(2,1)$]),
  node((0, 3), [$C_(3,1)$]),
  node((1, 3), [$C_(3,0)$]),
  arr((0, 1), (0, 0), [$d^h$]),
  arr((0, 2), (0, 1), [$d^h$]),
  arr((1, 1), (1, 0), [$d^h$]),
  arr((1, 2), (1, 1), [$d^h$]),
  arr((0, 0), (1, 0), [$d^v$]),
  arr((0, 1), (1, 1), [$-d^v$]),
  arr((0, 2), (1, 2), [$d^v$]),
  arr((0, 3), (0, 2), [$d^h$]),
  arr((1, 3), (1, 2), [$d^h$]),
  arr((0, 3), (1, 3), [$-d^v$]),
))
Therefore, $f_(cx, q) : C_(cx, q) -> C_(cx, q-1)$ is a chain map between two adjacent rows.
This also gives an isomorphism between the category of bicomplexes in $cA$ and $Ch(Ch(cA))$.] <sign-trick>

#definition[
  Let $C_(bullet bullet)$ be a double complex. We say that
$C_(bullet bullet)$ is an *upper half-plane complex* if there is some
$q_0$ such that $C_(p, q) eq 0$ for all $q lt q_0$. Similarly,
$C_(bullet bullet)$ is a *right half-plane complex* if there is some $p_0$
such that $C_(p, q) eq 0$ for all $p lt p_0$.
]

#definition[
  Given $C = {C_(p, q)}$, we can define the *total complex* $Tot^Pi (C)$, given by
  $ Tot^Pi (C)_n = product_(p + q = n) C_(p, q). $
  That is, the $n$-th term of $Tot^Pi (C)$ is the product of all terms in $C$ which has total degree $n$.
  When for each $n$, only finitely many terms in $C$ has total degree $n$, we also define $ Tot^xor (C)$, given by
  $ Tot^xor (C)_n = plus.circle.big _(p+q=n) C_(p, q). $
  $Tot^Pi (C)$ and $ Tot^xor (C)$ both have differential $ d = d^h + d^v. $
]
<total-complex>
#notation[
  If $C$ is a double complex, sometimes we write $H_n (C)$ to mean $H_n (Tot^Pi (C))$ or $H_n (Tot^xor (C))$. 
]
<homology-double>

#lemma[
  In a total complex, we have that $d^2 = 0$, so the total complex is indeed a chain complex. 
]
#proof[
  @rotman[Lemma 10.5]. 
  $
    d^2 = (d^h + d^v) (d^h + d^v) = (d^h)^2 + (d^h d^v + d^v d^h) + (d^v)^2 = 0.
  $
  (This is why we have defined double complexes in the anticommuting way.)
]
The total complex is illustrated by the colours in the following diagram; each “diagonal
slice” is given a different colour. For example, $Tot(C_(cx cx))_0$ is the product of all the
blue terms. This diagram also helps explain how the differential of the total complex works. For example, take $ c = (..., c_(-1, 1), c_(0, 0), c_(1, -1), ...) in product_(p in ZZ) C_(-p, p) = Tot(C)_0. $
Then 
$ d (c) = ( ...,  
underbrace(d^v (c_(-1, 1)) + d^h (c_(0,0)), in C_(-1, 0)) , 
underbrace(d^v (c_(0, 0)) + d^h (c_(1, -1)), in C_(0, -1)), ... ) in Tot(C)_(-1). $
// #align(center,image("../imgs/2023-11-12-16-04-08.png",width:50%))

// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZARgBpiBdUkANwEMAbAVxiRAGEB9ACgFoyABMQCUIAL6l0mXPkIoATOSq1GLNl24AGcqIlTseAkQDMS6vWatEHHmRHjJIDAdlEy85RbXWN-Upt1HZxkjBVIPc1UrGy1-QP0QuWRTCJVLdVs4hwTDJLJjTyiMvkF+eKdpXKJFAsj0nx5tATLsipdQ5NJatO8Y0vs9NsSiABYzHuiAOmnW4KqUMdSvKZnBudcFrsL6kGnJ2cqNzpHt3r2D9qTFE7qz1aDDjrIbibZztcek7W7lt-uco7aJZFazvB6XIjaSi3Fb7D4QlCmTSnWEXYZhZEwv5w8Hokj+FHY8TKGBQADm8CIoAAZgAnCAAWyQYxAOAgSAA7FjrFAAHo0Vp0xlIMis9mIFm-Hn8wX0pmIbRipCmV7SgWDIXylVspAANm5ID56scmqQiiViAArAajbLhVbqDrEAAOG0yjVykWO8WKqWG3kACzt8vNTtFfr5QY99oAnN6zdH5cRFU7LYmkNaLZKQf6oybPRL44gVRHA8HOUX9arc+WXUWudXI7XiKKnc703WLcR5B2G2HjB2q2GRoOi8Q0-n7drxcRdR2UzOOR3iK6LT3J0m412O-IF0hNGIKGIgA
#align(center, commutative-diagram(
  node-padding: (50pt, 50pt),
  node((1, 1), text(blue)[$C_(-1, 1)$]),
  node((1, 2), text(orange)[$C_(0,1)$]),
  node((1, 3), text(navy)[$C_(1,1)$]),
  node((2, 1), text(red)[$C_(-1,0)$]),
  node((2, 2), text(blue)[$C_(0,0)$]),
  node((2, 3), text(orange)[$C_(1,0)$]),
  node((3, 1), text(green)[$C_(-1, -1)$]),
  node((3, 2), text(red)[$C_(0, -1)$]),
  node((3, 3), text(blue)[$C_(1, -1)$]),
  node((1, 4), [$...$]),
  node((2, 4), [$...$]),
  node((3, 4), [$...$]),
  node((4, 3), [$...$]),
  node((4, 2), [$...$]),
  node((4, 1), [$...$]),
  node((3, 0), [$...$]),
  node((2, 0), [$...$]),
  node((1, 0), [$...$]),
  node((0, 3), [$...$]),
  node((0, 2), [$...$]),
  node((0, 1), [$...$]),
  arr((2, 2), (3, 2), [$d^v$]),
  arr((1, 2), (2, 2), [$d^v$]),
  arr((1, 1), (2, 1), [$d^v$]),
  arr((2, 1), (3, 1), [$d^v$]),
  arr((1, 3), (2, 3), [$d^v$]),
  arr((2, 3), (3, 3), [$d^v$]),
  arr((1, 2), (1, 1), [$d^h$]),
  arr((1, 3), (1, 2), [$d^h$]),
  arr((1, 4), (1, 3), []),
  arr((2, 4), (2, 3), []),
  arr((2, 3), (2, 2), [$d^h$]),
  arr((2, 2), (2, 1), [$d^h$]),
  arr((3, 2), (3, 1), [$d^h$]),
  arr((3, 3), (3, 2), [$d^h$]),
  arr((3, 4), (3, 3), []),
  arr((3, 3), (4, 3), []),
  arr((3, 2), (4, 2), []),
  arr((3, 1), (4, 1), []),
  arr((3, 1), (3, 0), []),
  arr((2, 1), (2, 0), []),
  arr((1, 1), (1, 0), []),
  arr((0, 3), (1, 3), []),
  arr((0, 2), (1, 2), []),
  arr((0, 1), (1, 1), []),
))

#endlec(10)

#example[
  Let $f_cx : B_cx -> C_cx$ be a chain map, then the following diagram forms a (two-column) double complex. The reader is welcome to verify that the total complex of this double complex is exactly $cone(f)$, which in particular helps explain why we have defined the differential of $cone(f)$ in that way.
// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBoBGAXVJADcBDAGwFcYkQBhAfUIF9T0mXPkIpyFanSat2AIR4h+g7HgJEyAJkkMWbRJy4AKMAFpyASkUCQGFSKLitNHTP3zjZy0ptDVokqQAzNrSegYeGl7WtsJqYkEhunJGppFWyrH+ZMSJriAAdIXpPnZxyOI5zqHshfnFMX7qpAAsuWG19b728a1VSfodvJIwUADm8ESgAGYAThAAtkiBNDgQSBp9eVMpnsWzC0gArCtriM2bYdsRUdNzi4jiIKtLF+wmUADkCt7798tPp2OUn6IHeXw8Fj2dyQZAB61e+ig32sv3hcLOCJASIhNxAqIeJxhmO2fBR0MQADZCYhiD9yQB2ankOkHDHogAcLPuQOeiAAnENeEA
#align(center, commutative-diagram(
  node-padding: (40pt, 40pt),
  node((1, 0), text(blue)[$C_n$]),
  node((1, 1), [$B_n$]),
  node((2, 0), text(red)[$C_(n-1)$]),
  node((2, 1), text(blue)[$B_(n-1)$]),
  node((3, 0), [$C_(n-2)$]),
  node((3, 1), text(red)[$B_(n-2)$]),
  node((0, 0), [$...$]),
  node((0, 1), [$...$]),
  node((4, 0), [$...$]),
  node((4, 1), [$...$]),
  arr((2, 1), (2, 0), [$-f$]),
  arr((3, 1), (3, 0), [$-f$]),
  arr((1, 1), (2, 1), [$-d$]),
  arr((2, 1), (3, 1), [$-d$]),
  arr((1, 0), (2, 0), [$d$]),
  arr((2, 0), (3, 0), [$d$]),
  arr((1, 1), (1, 0), [$-f$]),
  arr((0, 0), (1, 0), []),
  arr((0, 1), (1, 1), []),
  arr((3, 0), (4, 0), []),
  arr((3, 1), (4, 1), []),
))
]
<tot-cone>

#lemma("Acyclic Assembly Lemma")[
  Let $C = {C_(p, q)}$ be a double complex. If
  + $C$ is an upper half-plane complex with exact columns, or
  + $C$ is a right half-plane complex with exact rows,
  then $Tot^Pi (C)$ is acyclic.
  If 
  3. $C$ is an upper half-plane complex with exact rows, or
  4. $C$ is a right half-lane complex with exact columns,

  then $Tot^xor (C)$ is acyclic.
]
  <aal>
#proof[@weibel[Lemma 2.7.3] explains why proving (1) is sufficient to prove all four conditions, so we work on (1) only.
  Let $C$ be an upper half-plane bicomplex with exact columns, where we assume $C_(p, q) = 0$ when $q < 0$ (by translating $C$ up or down). It is sufficient to show that 
  $ H_0 (Tot^Pi (C)) = 0, $
  since by translating $C$ left and right, this will indicate that $H_n (Tot^Pi (C)) = 0$ for all $n$.
  
  Let $ c = (..., c_(-2, 2), c_(-1, 1), c_(0, 0)) in product C_(-p, p) = Tot^Pi (C)_0 $ be a $0$-cycle, i.e., $d(c) = 0$.
  We will use induction to find elements $b_(-p, p+1) in C_(-p, p+1)$ for $p >= -1$ such that $ d^v (b_(-p, p+1)) + d^h (b_(-p+1, p)) = c_(-p, p). $

  For the base case, let $b_(1,0) = 0$ for $p = -1$. Since the $0$-th column is exact, there exists $b_(0,1) in C_(0,1)$ such that $d^v (b_(0,1)) = c_(0,0)$. 
  // https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBpiBdUkANwEMAbAVxiRAGEB9ACjIEYAlCAC+pdJlz5CKflVqMWbLr3JDR47HgJE+pPnPrNWiDj13E1YkBk1SiZAEwGFxkMRFyYUAObwioADMAJwgAWyRdEBwIJABmakNFEygAPRoRK2CwpDIomMRIxNdU9PUQLPDEB2poiISXNlSACw9hIA
#align(center, commutative-diagram(
  node-padding: (50pt, 50pt),
  node((0, 0), [$C_(0,1)$]),
  node((1, 0), [$C_(0,0)$]),
  node((1, 1), [$C_(1,0)$]),
  node((2, 0), [$0$]),
  arr((1, 0), (2, 0), [$d^v$]),
  arr((0, 0), (1, 0), [$d^v$]),
  arr((1, 1), (1, 0), [$d^h$]),
))
  By induction, suppose we have found $b_(-p+1, p)$ and want to find $b_(-p, p+1)$.
  // https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBpiBdUkANwEMAbAVxiRAGEB9ACgFo1SAAjQBqAIwBKEAF9S6TLnyEUZMVVqMWbLnwFops+djwEiY0mur1mrRBx79xpfTLkgMxpUTIAmdda07HX5ncQN1GCgAc3giUAAzACcIAFskcxAcCCQAZitNWxAoAD0aVwTktMQyTOzEDIDCkrLDECTUpB9qLPT8mzYSgAsZCmkgA
#align(center, commutative-diagram(
  node-padding: (50pt, 50pt),
  node((0, 0), [$C_(-p, p+1)$]),
  node((1, 0), [$C_(-p,p)$]),
  node((1, 1), [$C_(-p+1,p)$]),
  node((2, 0), [$C_(-p,p-1)$]),
  arr((1, 0), (2, 0), [$d^v$]),
  arr((0, 0), (1, 0), [$d^v$]),
  arr((1, 1), (1, 0), [$d^h$]),
))

 We compute that 
$ d^v lr((c_(minus p comma p) minus d^h lr((b_(minus p plus 1 comma p))))) & eq d^v lr((c_(minus p, p))) plus d^h d^v lr((b_(minus p plus 1 comma p)))\
 & eq d^v lr((c_(minus p, p))) plus d^h lr((c_(minus p plus 1 comma p minus 1))) minus d^h d^h \(b_(minus p plus 2 comma p minus 1 )) \
 & eq 0, $

 where $d^v lr((c_(minus p, p))) plus d^h lr((c_(minus p plus 1 comma p minus 1))) = 0$ because $d(c) = 0$. Thus 
 $ c_(minus p comma p) minus d^h lr((b_(minus p plus 1 comma p))) in Ker(d^v : C_(-p, p) -> C_(-p, p-1)) = IM (d^v : C_(-p, p+1) -> C_(-p, p)), $
 
 since the $(minus p)$-th  column is exact. So there exists
$b_(minus p comma p plus 1)$ such that
$ d^v lr((b_(minus p comma p plus 1))) eq c_(minus p comma p) minus d^h lr((b_(minus p plus 1 comma p))) $
as desired. Now assembling all $b_(-p, p+1)$ gives 

$ b = (..., b_(-1, 2), b_(0, 1), b_(1, 0)) in product C_(-p, p+1) = Tot^Pi (C)_(1) $ such that $d (b) =  c$, which proves that $H_0 (Tot^Pi (C)) = 0$. 
]

#remark[
  This lemma is also a consequence of spectral sequences. 
]

A variant of the above lemma is the following, whose proof is similar @notes[Lemma 8.8]. 
#lemma[
  Let $C$ be a double complex such that for every $n$, there exist only finitely many pairs $(p, q)$ such that $p + q = n$ and $C_(p, q) != 0 $. If $C$ has exact rows (or if $C$ has exact columns), then $Tot^(xor) (C)$ is acyclic. 
]
  <aal-2>


== Balancing $Tor$
#definition[
Suppose $(P_cx, d^((P)))$ is a chain complex in $ModR$ and $(Q_cx, d^((Q)))$ is a chain complex in $RMod$. We can form a double complex of abelian groups which we call the *tensor product double complex*, denoted as $P_cx tpr Q_cx$, where the $(p, q)$ term is $P_p tpr Q_q$ and $d^h_(p, q) = d^((P))_p tp 1$ and $d^v_(p, q) = (-1)^p tp d^((Q))_q$. 
It has the *tensor product total complex*, $Tot^xor (P_cx tpr Q_cx)$.
// The sign trick is to make this anticommute. 
]
<tp-dc>

#lemma[
  The differentials of $P_cx tpr Q_cx$ anticommute, so $P_cx tpr Q_cx$ is a double complex. 
]
#proof[
  Notice that $(d^((P)) tp 1) oo (1 tp d^((Q))) = d^((P)) tp d^((Q)) = (1 tp d^((Q))) oo (d^((P)) tp 1)$ by @tp-composition, and alternating the signs for adjacent columns makes each square anticommute. 
]
#lemma[
  If $P$ is a projective right $R$-module, then the functor $(P tpr -) : RMod -> Ab$ is exact. If $Q$ is a projective left $R$-module, then $(- tpr Q) : ModR -> Ab$ is exact.  #footnote[This lemma is the same as saying "every projective module is flat", but we have yet to define flat modules. We will revisit this claim in @projective-flat-2.]
]
<projective-flat-1>
#proof[
  @rotman[Proposition 3.46, p. 132]. We (very concisely) work on the #rrm case. First notice that $(R tpr -)$ is an isomorphism by @r-tpr, so the functor $(R tpr -)$ is exact. Then tensor product preserves direct sums by @tensor-right-exact, so for a family of right $R$-modules $M_i$, $((plus.circle.big M_i) tpr -)$ is exact, if and only if $plus.circle.big (M_i tpr -)$ is exact, if and only if each $(M_i tpr -)$ is exact. Now any free module $F$, being a direct sum of $R$'s, must have that $(F tpr -)$ is exact. Finally, $P$ is projective, hence $P$ is a direct summand of some free module by @projective-summand, which indicates that $(P tpr -)$ is also exact.
]
#theorem([Balancing of $Tor$])[ Let $A in ModR$ and $B in RMod$. For all $n$,
  $ Tor_n^R (A, B) := L_n (- tpr B)(A) iso L_n (A tpr -)(B).  $ 
]
<balance-tor>
#proof[ @weibel[Theorem 2.7.2].
  // #align(center,image("../imgs/2023-11-23-03-00-04.png",width:80%))
  (We drop the dots for chain complexes in this proof.) 
  Choose a projective resolution $P_cx rgt(epsilon) A$ in $ModR$ and a project resolution $Q_cx rgt(eta) B$ in $RMod$. 
  We can view $A, B$ as chain complexes concentrated in degree $0$. Now consider the double complexes $P tpr Q$, $A tpr Q$ and $P tpr B$, and we have _bicomplex morphisms_ (where it might be helpful to recall the diagram in @resolution-qi):  $ epsilon tp id_Q: P tpr Q -> A tpr Q \ id_Q tp eta: P tpr Q -> P tpr B $ which induce chain maps on the total complexes:
  $ f : Tot^xor (P tpr Q) -> Tot^xor (A tpr Q) = A tpr Q \
   g : Tot^xor (P tpr Q) -> Tot^xor (P tpr B) = P tpr B $
  We claim that $f$ and $g$ 
  are quasi-isomorphisms, which would give isomorphisms on homology and thus prove the result, i.e.

  $ H_ast (Tot^xor (P tpr Q)) iso H_ast (A tpr Q) = L_ast (A tpr - ) (B) $ 
  $ H_ast (Tot^xor (P tpr Q)) iso H_ast (P tpr B) = L_ast (- tpr B ) (A) $  

  Now we form a double complex $C$, obtained from $P tpr Q$ by adding $A tpr Q$ in the column $p = -1$ using the augmentation $epsilon: P_0 -> A$,
  
// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZARgBpiBdUkANwEMAbAVxiRAAUB9ABgAIc0vAIqdiIAL6l0mXPkIoyAJiq1GLNlz4DhPCVJAZseAkUWll1es1aIOo-oJHc90o3KIBmcyqvrbXRQcdZ0lXWRMUM0pLNRs7YiCRMVCDGWN5ZC9o1WsNTkDtJJdUtwiSUm4fWLytR3ziw3CMs0qY3P97QvqUxvSibnIq9pAAQUTRBrT3FAHWnL9R8cVJ0oyBi3m4sa6Q-V7pzIqhhYCliRUYKABzeCJQADMAJwgAWyQAdmocCCQANjaFlBOOwgsl9E9XkgACxfH6IAabNhAkHaMEPZ5vRAAVlh0IBcWRoOKEMxZhA3yQZERtkJqOJGKQXnJcLJvgJwKJKRJSARFMQVLZbAS2iBQnpkMQMOZSFZ1VsAFphYJReLMTjpYgmYLbEreCquQzEP8NQjtSBdfrwYbPhqpWbFUFLeiJQBOXGIAAc+KFjs4YoNEuIVL5NrNtMEaJA3P5wbh6rNFr9qqQXo1xFNcvNvv9Volxr5bpADCwYAJdDgAAtLiBvbYYGhsAwCJzc5jeXDU8XS0jy1WoDXqSB643m3SA5jY5SEV2y5Xq7Whw2sE2wJyKOIgA
#align(center, commutative-diagram(
  node-padding: (50pt, 50pt),
  node((1, 1), [$P_0 tp Q_1$]),
  node((2, 1), [$P_0 tp Q_0$]),
  node((2, 2), [$P_1 tp Q_0$]),
  node((2, 3), [$P_2 tp Q_0$]),
  node((1, 2), [$P_1 tp Q_1$]),
  node((1, 3), [$P_2 tp Q_1$]),
  node((0, 1), [$P_0 tp Q_2$]),
  node((0, 2), [$P_1 tp Q_2$]),
  node((1, 0), [$A tp Q_1$]),
  node((0, 0), [$A tp Q_2$]),
  node((2, 0), [$A tp Q_0$]),
  node((0, 3), [$P_2 tp Q_2$]),
  arr((0, 2), (0, 1), [$d_P tp 1$]),
  arr((1, 2), (1, 1), [$d_P tp 1$]),
  arr((1, 3), (1, 2), [$d_P tp 1$]),
  arr((2, 2), (2, 1), [$d_P tp 1$]),
  arr((2, 3), (2, 2), [$d_P tp 1$]),
  arr((1, 1), (2, 1), [$1 tp d_Q$]),
  arr((1, 2), (2, 2), [$-1 tp d_Q$]),
  arr((1, 3), (2, 3), [$1 tp d_Q$]),
  arr((0, 1), (1, 1), [$1 tp d_Q$]),
  arr((0, 2), (1, 2), [$-1 tp d_Q$]),
  arr((0, 0), (1, 0), [$-1 tp d_Q$]),
  arr((0, 3), (0, 2), [$d_P tp 1$]),
  arr((0, 3), (1, 3), [$1 tp d_Q$]),
  arr((1, 0), (2, 0), [$-1 tp d_Q$]),
  arr((0, 1), (0, 0), [$epsilon tp 1$], "dashed"),
  arr((1, 1), (1, 0), [$epsilon tp 1$], "dashed"),
  arr((2, 1), (2, 0), [$epsilon tp 1$], "dashed"),
))
  where $C_(-1, q) = A tp Q_q$ and $C_(p, q) = P_p tp Q_q$ for any $p, q >= 0$.
  Then 
  $
    (Tot^xor (C)[-1])_n  = Tot^xor (C)_(n-1) = Tor^xor (P tpr Q)_(n-1) xor  (A tp Q_(n)) 
  $
  
  Meanwhile, the mapping cone of $f : Tot^xor (P tpr Q) -> A tpr Q $ has
  $
    cone(f)_n = Tot^xor (P tpr Q)_(n-1) xor (A tp Q_(n)).
  $
  Also $ d_(cone(f)) = (-(d^((P)) tp 1 + (-1)^p tp d^((Q))), 1 tp d^((Q)) - epsilon tp 1) = -d_(Tot^xor (C)[-1]), $
  hence $cone(f) iso Tot^xor (C)[-1]$.
  To show that $f$ is a quasi-isomorphism, we need to show $cone(f)$ is acyclic by @cone-qi. As any $Q_p$ is projective, $(- tpr Q_p)$ is exact  by @projective-flat-1. Since $P_cx -> A$ is a resolution, every row of $C$ is exact. Since $C$ is upper half-plane, $Tot^xor (C)$ is acyclic by @aal. So $f$ is a quasi-isomorphism. 
  
  Similarly, we can show that $g$ is a quasi-isomorphism by forming a double complex $C'$ obtained from adding $B tpr P$ in the row $q = -1$ of $P tpr Q$.
  // ($Q$ means $id_Q$ in proper places)
]

== Balancing $Ext$

#definition[
Given a chain complex $(P_cx, d^((P)))$ and a cochain complex $(I^cx, d_((I)))$, we can form the *Hom double complex* $ hom(P_cx, I^cx) = {hom (P_p, I^q)}_(p, q) $
with differentials#footnote[Here we alternate the signs for adjacent rows (instead of adjacent columns, as in the tensor product double complex). This sign convention, following @notes[p. 76], is different from that in @weibel[p. 62].]
 $ d^h_(p, q) (f)  &= (-1)^q f oo d^((P))_(p+1) in hom ( P_(p+1) , I^q)  \ d^v_(p, q) (f) &=  d_((I))^q oo f in hom (P_p, I^(q+1)) $
for $f in hom ( P_p , I^q )$.

Then we define the *Hom cochain complex*#footnote[@weibel[p. 62] writes this as $Tor^Pi (hom (P, I))$, but as we will see in this case any diagonal slice has only finite terms, so their product and direct sum are the same.] as

  $ Tot^xor (hom(P, I)) $
]

An (anticommutative) diagram for the Hom double complex is as follows. The placeholder in function compositions is written as $square$ (instead of $-$ as in most parts of these notes) so that it is not confused with the minus sign. Note particularly the signs and indices in the horizontal differentials. Also note that each row and each column is a cochain complex.

// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBoBmAXVJADcBDAGwFcYkQALCAWwAIAKAAoB9MrwCSAPWIBKEAF9S6TLnyEUZAEzU6TVuy58ho0hMkBGOYuXY8BImXM6GLNok48BIsVM1WlIBi2akTmpE40Lvruhl7CYWZ+CgFBqvYoYdqRem4eRiIJUpbJNmnqyGFU2a4GnsaF0v6lduWaFM45tfnCbWayJYEqLURtWbo1MXUivUVNg8HpyG0R49F5cTOSSdbzZQ6kxB0TIAB0ZwOpwxkHR2tnJxdDIShth9V35zuXz8jk4be5e6PBblP5jKKAz4pJ6LP5VVaQh7yHQwKAAc3gRFAADMAE48JBkEA4CBIACs71ycAAjsx6LiYLwIBBeFBJPwhDIZPEBniCYgKcTSYgAGyU9g0ukMpkstkcwRcnq8-HcQk0ElIMII9hQYQc8Rc6Qy3iS+lsHZ81UC9XCgAs4vcuv1huIxtNDOV-LFQqQAHYHSAnfwDTIjcyTbSzZ6rVqNYg2trHXrg4bzG7Ix6LSqkAm439EyB3Yzw3LOdzzNGkPm4wAOANF42lhXczSVxD2n2IfMQnXJkMWdNS80BS1+m1IOsFoP9tPhott2N2gMAWgbJfZZZ5Wf5Hbj-oLq4zxdlG+bSu3VtzwoAnBeq+PEOZiHfEJO4+ZzC+38LzJoX-v33IF9vXfW1kXkIA
#align(center, commutative-diagram(
  node-padding: (60pt, 60pt),
  node((3, 0), text(green)[$hom (P_0, I^0)$]),
  node((2, 0), text(red)[$hom (P_0, I^1)$]),
  node((1, 0), text(blue)[$hom (P_0, I^2)$]),
  node((1, 1), text(orange)[$hom (P_1, I^2)$]),
  node((2, 1), text(blue)[$hom (P_1, I^1)$]),
  node((3, 1), text(red)[$hom (P_1, I^0)$]),
  node((3, 2), text(blue)[$hom (P_2, I^0)$]),
  node((2, 2), text(orange)[$hom (P_2, I^1)$]),
  node((1, 2), text(navy)[$hom (P_2, I^2)$]),
  node((0, 0), [$...$]),
  node((0, 1), [$...$]),
  node((0, 2), [$...$]),
  node((1, 3), [$...$]),
  node((2, 3), [$...$]),
  node((3, 3), [$...$]),
  arr((3, 0), (3, 1), [$square oo d^((P))_1$]),
  arr((3, 1), (3, 2), [$square oo d^((P))_2$]),
  arr((3, 0), (2, 0), [$d_((I))^0 oo square$]),
  arr((3, 1), (2, 1), [$d_((I))^0 oo square$]),
  arr((3, 2), (2, 2), [$d_((I))^0 oo square$]),
  arr((2, 0), (1, 0), [$d_((I))^1 oo square$]),
  arr((1, 0), (1, 1), [$square oo d^((P))_1$]),
  arr((1, 1), (1, 2), [$square oo d^((P))_2$]),
  arr((2, 1), (1, 1), [$d_((I))^1 oo square$]),
  arr((2, 2), (1, 2), [$d_((I))^1 oo square$]),
  arr((2, 0), (2, 1), [$-square oo d^((P))_1$]),
  arr((2, 1), (2, 2), [$-square oo d^((P))_2$]),
  arr((1, 0), (0, 0), []),
  arr((1, 1), (0, 1), []),
  arr((1, 2), (0, 2), []),
  arr((1, 2), (1, 3), []),
  arr((2, 2), (2, 3), []),
  arr((3, 2), (3, 3), []),
))
#remark[
  There are a few technicalities to be addressed here. They are not conceptually difficult but can be bewildering when first encountered. 

  Notice that in our original definition of a double complex, we would draw the arrows pointing downwards and to the left, which we refer to as a *canonical ordering*. However, when we draw the diagram for a Hom double complex, the arrows point upwards and to the right.
//   // https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBoBmAXVJADcBDAGwFcYkQALCAWwAIAKAAoB9MrwCSAPWIBKEAF9S6TLnyEUZAEzU6TVuy58ho0hMma5i5djwEiZAIw6GLNok48BIsVIsKlIBg2akQOpE40Lvruhl7CYWZ+VoEqturIYdqRem4eRiIJUg6WAUGqdihhVNmuBp7GhdIl1uXpmhTOOXX5wu1msv4taUTtWbq1MfUifUXNKcEVyO0R49F5cTPmc2XDGqTEnRMgAHSng-OtofuHa6fH5zshKO0HNbdnyY+L5OE3uXcPVJPZA-MZRf4fUpA74dN4Q+7yHQwKAAc3gRFAADMAE48JBkEA4CBIACsyRxeMQJJoRKQADZybjuPiacTEA5GZTqYS2QAWTnMxB01lIADsAqQYR5SE0EsQ7WliHIcp+ioAHHLeSKlXLRdqNQEKYKpbTEPzDUykFrFeKLZSFaaAJwq7UOYhytWujl2wWexUOWU+sWu5VBoWu-mUeRAA
// #align(center, commutative-diagram(
//   node-padding: (50pt, 50pt),
//   node((3, 0), text(green)[$hom (P_0, I^0)$]),
//   node((2, 0), text(red)[$hom (P_0, I^1)$]),
//   node((1, 0), text(blue)[$hom (P_0, I^2)$]),
//   node((1, 1), text(orange)[$hom (P_1, I^2)$]),
//   node((2, 1), text(blue)[$hom (P_1, I^1)$]),
//   node((3, 1), text(red)[$hom (P_1, I^0)$]),
//   node((3, 2), text(blue)[$hom (P_2, I^0)$]),
//   node((2, 2), text(orange)[$hom (P_2, I^1)$]),
//   node((1, 2), text(navy)[$hom (P_2, I^2)$]),
//   node((0, 0), [$...$]),
//   node((0, 1), [$...$]),
//   node((0, 2), [$...$]),
//   node((1, 3), [$...$]),
//   node((2, 3), [$...$]),
//   node((3, 3), [$...$]),
//   arr((3, 0), (3, 1), []),
//   arr((3, 1), (3, 2), []),
//   arr((3, 0), (2, 0), []),
//   arr((3, 1), (2, 1), []),
//   arr((3, 2), (2, 2), []),
//   arr((2, 0), (1, 0), []),
//   arr((1, 0), (1, 1), []),
//   arr((1, 1), (1, 2), []),
//   arr((2, 1), (1, 1), []),
//   arr((2, 2), (1, 2), []),
//   arr((2, 0), (2, 1), []),
//   arr((2, 1), (2, 2), []),
//   arr((1, 0), (0, 0), []),
//   arr((1, 1), (0, 1), []),
//   arr((1, 2), (0, 2), []),
//   arr((1, 2), (1, 3), []),
//   arr((2, 2), (2, 3), []),
//   arr((3, 2), (3, 3), []),
// ))
Thus this is, strictly speaking, neither a upper half-plane complex nor a right half-plane complex, because if we would like to turn the diagram into a canonically ordered one, we would need to reflect it to the "third quadrant". This ordering matters mainly because in this case, it would be more convenient to apply @aal-2 instead of @aal[Acyclic Assembly Lemma].

Another confusion that can easily arise from a non-canonical ordering is how to form the corresponding total complex. 
Apart from converting the diagram to a canonically ordered one by reflection, a simple method is to select any object $A$ in the grid and draw a line $l$ connecting the arrowheads of the two arrows departing from $A$. Then every "diagonal slice", whose direct sum is a term of the total complex, must be parallel to this line $l$. This is simply because each arrow must point from one diagonal slice to another. For example, each diagonal slice of the Hom double complex has a distinct colour in the above diagram, and hence we see 
$
  Tot^xor (hom (P, I))^n = plus.circle.big_(p + q = n) hom(P_p, I^q)
$
This total complex is a _cochain_ complex#footnote[In fact, whether a total complex is a chain complex or a cochain complex can seem arbitrary, because this actually depends on how we index the diagonals. Here we see the Hom total complex as a cochain complex because it is more convenient in later proofs.
// because later on we would like to establish an isomorphism between the total complex and the cone complex of a cochain map (which is a cochain complex).
] because the differentials point from $Tot^xor (hom (P, I))^n$ to $Tot^xor (hom (P, I))^(n+1)$.
]

// #remark[If $C, D$ are chain complexes and we reindex $D$ to be a cochain complex. Then $H^n Tot^Pi hom (C, D)$ is the group of chain homotopy eq classes of morphisms $C -> D[-n]$.] (shown in the next section)

#remark[
  Let $I^cx$ be a cochain complex of abelian groups and let $P_cx$ (resp. $Q_cx$) be a chain complex of right (resp. left) $R$-modules, then there is a natural isomorphism
$ hom_Ab (Tot^xor (P tp Q), I) iso hom_R (P , Tot^Pi (hom_Ab (Q, I))). $
]


#endlec(11)

#theorem([Balancing of $Ext$])[ For all $n$,
  $ Ext^n_R (A, B) = R^n hom_R (A, -) (B) iso R^n hom_R (-, B) (A) $
] 
<balance-ext>
#proof[@weibel[Theorem 2.7.6, p.63].
  // #align(center,image("../imgs/2023-11-23-03-27-44.png",width:80%))
  Take projective resolution $P_cx ->^epsilon A$ and injective resolution $B ->^eta I^cx$. We can view $A$ and $B$ as complexes concentrated at degree $0$. We can form double cochain complexes $hom(P, I)$, $hom(A, I)$ and $hom(P, B)$. As in the proof of @balance-tor,  we need to show the maps on Hom cochain complexes
  $ f: hom(A, I) -> Tot^xor ( hom(P, I)) \ g: hom(P, B) -> Tot^xor (hom(P, I)) $ are quasi-isomorphisms. This is equivalent to $cone(f)$ and $cone(g)$ being acyclic by (the dual of) @cone-qi. 

  Let $C$ be the double complex $hom(P, I)$ with $hom(A, I)$ added to the column $p=-1$ using $epsilon : P_0 -> A$. We make it so that every added differential has a minus sign, as shown in the diagram.
// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZARgBoBmAXVJADcBDAGwFcYkQALCAWwAIAKAAoB9AAyleASQB6ogJQgAvqXSZc+QijIAmanSat2XPkLESZxBctXY8BImWJ6GLNok48BI8VOnarKiAYthpE2qRONC6G7sZewmS+-kqBwer2KOG6UQZuHiYiiRYBNumayOFUOa5GnqZFsiVBanbl5BTOubUFwuG+8imlrUTt2fo1sXUifcWDzSEZyO2R4zH58TN+TWnDWqSinRMgAHSnczuhmfuHa6fH5y2XS9fVt2fW82VEACwRN3l3B4Lcq-MbRAHvVKPRa-KqrCH3D4XRbiOHg7r8ACC5kaQK+KHEYK6k24WJxljxu2Q4hW6JJZKS22h5XEB1eCKUehgUAA5vAiKAAGYAJx4SHEIBwECQAFZ2ew4ABHZj0YUwXgQCC8KDSfhCORyBJzEVixByyXSxAANnl7iVKrVGq1Or1ggNvWNou44poUqQZHh7Cgwj1kgNsidvHtqrYHxN3rNvstv0D7mDofDokj0bVntNNotSAA7LaQOn+GG5BHNVHlTG8wmA37EOFU2WQxXw8Rs3Xc3GvUhW832m2c+qay79YbiA2kCPmwAOUtjyOTt2G7SzxAp4el8uV6TdmtjrclwuIJdt-ddnsO2OBeP+pNIFN0kAAWhXE91U6N-dNO6Wmeb6fr247Oj+64ev+CZDpaACcMFzs+iDEKISEXihxDEBhl7NsQ2gYWe+HkBhBb4d8GHEOa+EFm+15Vlmx5gVuxDkZaxDAcS7YZlWR5aieVHERxC5CShrZvl+WowGg2CMPYNCMFgYB5FA9BwBw3KsexT5tqBd6RjJckKSASkqUG6maVArE0ZaEqSWBhmyVg8mEIolCKEAA
#align(center, commutative-diagram(
  node-padding: (50pt, 50pt),
  node((3, 1), [$hom (P_0, I^0)$]),
  node((2, 1), [$hom (P_0, I^1)$]),
  node((1, 1), [$hom (P_0, I^2)$]),
  node((1, 2), [$hom (P_1, I^2)$]),
  node((2, 2), [$hom (P_1, I^1)$]),
  node((3, 2), [$hom (P_1, I^0)$]),
  node((3, 3), [$hom (P_2, I^0)$]),
  node((2, 3), [$hom (P_2, I^1)$]),
  node((1, 3), [$hom (P_2, I^2)$]),
  node((0, 1), [$...$]),
  node((0, 2), [$...$]),
  node((0, 3), [$...$]),
  node((1, 4), [$...$]),
  node((2, 4), [$...$]),
  node((3, 4), [$...$]),
  node((3, 0), [$hom(A, I^0)$]),
  node((2, 0), [$hom(A, I^1)$]),
  node((1, 0), [$hom(A, I^2)$]),
  node((0, 0), [$...$]),
  arr((3, 1), (3, 2), [$square oo d^((P))_1$]),
  arr((3, 2), (3, 3), [$square oo d^((P))_2$]),
  arr((3, 1), (2, 1), [$d_((I))^0 oo square$]),
  arr((3, 2), (2, 2), [$d_((I))^0 oo square$]),
  arr((3, 3), (2, 3), [$d_((I))^0 oo square$]),
  arr((2, 1), (1, 1), [$d_((I))^1 oo square$]),
  arr((1, 1), (1, 2), [$square oo d^((P))_1$]),
  arr((1, 2), (1, 3), [$square oo d^((P))_2$]),
  arr((2, 2), (1, 2), [$d_((I))^1 oo square$]),
  arr((2, 3), (1, 3), [$d_((I))^1 oo square$]),
  arr((2, 1), (2, 2), [$-square oo d^((P))_1$]),
  arr((2, 2), (2, 3), [$-square oo d^((P))_2$]),
  arr((1, 1), (0, 1), []),
  arr((1, 2), (0, 2), []),
  arr((1, 3), (0, 3), []),
  arr((1, 3), (1, 4), []),
  arr((2, 3), (2, 4), []),
  arr((3, 3), (3, 4), []),
  arr((3, 0), (2, 0), [$-d_((I))^0 oo square$]),
  arr((2, 0), (1, 0), [$-d_((I))^1 oo square$]),
  arr((1, 0), (0, 0), []),
  arr((1, 0), (1, 1), [$-square oo epsilon$], "dashed"),
  arr((2, 0), (2, 1), [$-square oo epsilon$], "dashed"),
  arr((3, 0), (3, 1), [$-square oo epsilon$], "dashed"),
))
  We observe that $cone(f) iso Tot^xor (C)$ (both their terms and differentials match). Every $hom(-, I^q)$ is exact, so every row of $C$ is exact, then we can see that $Tot^xor (C)$ is acyclic by @aal-2. Similarly, we can show that $cone(g)$ is acyclic. 
   Then applying cohomology yields

  $ R^ast hom(A, -) (B) &= H^ast hom (A, I) \ &iso H^ast Tot^xor ( hom(P, I))  \ &iso H^ast hom(P, B) = R^ast hom(-, B) (A). $
]

// #TODO Tot and everything should be cochain instead of chain complex !!! => so that we can take cohomology...
// #TODO mapping cone of a *cochain* complex

Now that we have gained some experience with non-canonically ordered double complexes, we introduce another form of a Hom double complex. 
#definition[
  Given two chain complexes $(P_cx, d^((P)))$ and $(Q_cx, d^((Q)))$, we can form  the *Hom double complex* 
  $
    hom (P_cx, Q_cx) = { hom(P_p, Q_q) }_(p, q)
  $
  with differentials 
   $ d^h_(p, q) (f)  &= (-1)^q f oo d^((P))_(p+1) in hom ( P_(p+1) , Q_q)  \ d^v_(p, q) (f) &=  d^((Q))_q oo f in hom (P_p, Q_(q-1)) $
for $f in hom ( P_p , Q_q )$.
Then we define the *Hom cochain complex* as
  $Tot^Pi (hom(P, Q)). $
]

We draw the (non-canonically ordered) double complex $hom (P, Q)$ as follows. Note that each row is a cochain complex, while each column is a chain complex. 

// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBoBmAXVJADcBDAGwFcYkQALCAWwAoAFAPpkABAEVhAShABfUuky58hFAEYK1Ok1bsufIevFTZ8kBmx4CRAEwaaDFm0SceAwbaPFpchReVEya00HHWc9N1EJVW9TcyUrNVIg+20nF31BQyiY33iVZFtkrUddVyEPbJNcy3yyVWDU0ozI9xyzRRqidXqUkrCyzNIjaza4zpRbHuLQ9LcK1qr2vwSSUmIGvpAAOh3Fsf9E9d6Zna29joOCtY2T3Z8lvKJyUimQtNPz5fznorf2D-u+xWzyox3ed00MCgAHN4ERQAAzABOPCQZBAOAgSHU0zScAAjsx6EiYCIIBARFAAHq8ASSSSZRbI1GIHGYpC2XHsAlEklkinU2n8enuJko7hIZ4YrGIAAsYPYAFoecTSeTKTS6QzVGKWfLpUgAKw0Rj0ABGMEY-AuCRAjBgCJwIAVzmVhNV-I1QpF1l1EsQADYaOzEAB2F0gFV89WCrWM+7M-3hg2IAAcEajaoFmuFDN9CfFSCDKalf2csbEPs9mb9kuDMvRZZAFZFqmr7pJtbD9aQ+qbLbz7d5bALep7rIjA8yQ9VXfTKeNXPLmsrg-VNdH-sXIc5-ZXrZnnc3SAAnOOA8fWeiQ6HL6o2TLU5f5yHVNZL9uZapyJfOa-ZTIlAyEAA
#align(center, commutative-diagram(
  node-padding: (60pt, 60pt),
  node((3, 0), text(blue)[$hom(P_0, Q_0)$]),
  node((3, 1), text(red)[$hom(P_1, Q_0)$]),
  node((3, 2), text(green)[$hom(P_2, Q_0)$]),
  node((2, 0), text(orange)[$hom(P_0, Q_1)$]),
  node((2, 1), text(blue)[$hom(P_1, Q_1)$]),
  node((2, 2), text(red)[$hom(P_2, Q_1)$]),
  node((1, 0), text(navy)[$hom(P_0, Q_2)$]),
  node((1, 1), text(orange)[$hom(P_1, Q_2)$]),
  node((1, 2), text(blue)[$hom(P_2, Q_2)$]),
  node((0, 0), [$...$]),
  node((0, 1), [$...$]),
  node((0, 2), [$...$]),
  node((1, 3), [$...$]),
  node((2, 3), [$...$]),
  node((3, 3), [$...$]),
  arr((3, 0), (3, 1), [$square oo d^((P))_1$]),
  arr((3, 1), (3, 2), [$square oo d^((P))_2$]),
  arr((2, 0), (2, 1), [$-square oo d^((P))_1$]),
  arr((2, 1), (2, 2), [$-square oo d^((P))_2$]),
  arr((1, 0), (1, 1), [$square oo d^((P))_1$]),
  arr((1, 1), (1, 2), [$square oo d^((P))_2$]),
  arr((1, 0), (2, 0), [$d^((Q))_2 oo square$]),
  arr((2, 0), (3, 0), [$d^((Q))_1 oo square$]),
  arr((1, 1), (2, 1), [$d^((Q))_2 oo square$]),
  arr((2, 1), (3, 1), [$d^((Q))_1 oo square$]),
  arr((1, 2), (2, 2), [$d^((Q))_2 oo square$]),
  arr((2, 2), (3, 2), [$d^((Q))_1 oo square$]),
  arr((0, 0), (1, 0), []),
  arr((0, 1), (1, 1), []),
  arr((0, 2), (1, 2), []),
  arr((1, 2), (1, 3), []),
  arr((2, 2), (2, 3), []),
  arr((3, 2), (3, 3), []),
))
// #align(center,image("../imgs/2023-11-23-22-22-07.png",width:80%))
// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBoBmAXVJADcBDAGwFcYkQALCAWwAoAFAPpkABAEVhAShABfUuky58hFAEYK1Ok1bsufIevFTZ8kBmx4CRAEwaaDFm0SceAwbaPFpchReVEya00HHWc9N1EJVW9TcyUrNVIg+20nF31BQyiY33iVZFtkrUddVyEPbJNcy3yyVWDU0ozI9xyzRRqidXqUkrCyzNIjaza4zpRbHuLQ9LcK1qr2vwSSUmIGvpAAOh3Fsf9E9d6Zna29joOCtY2T3Z8lvKJyUimQtNPz5fznorf2D-u+xWzyox3ed00MCgAHN4ERQAAzABOPCQZBAOAgSFU92RqMQ6gxWMQ1lxKO4SGeRKQABYyfiaTRMUgAKz0imIABsTOJAHZ2UheTykAAOAVc4WIcjiqnMxDEcVC6mIOmmPEcxnKnFq8miyVsnX4lmS0mGjkATklnPFqnRcv5ZuxhLlYsdiBFktUpsRusQxq10rdti1dMoMiAA
// #align(center, commutative-diagram(
//   node-padding: (50pt, 50pt),
//   node((3, 0), text(blue)[$hom(P_0, Q_0)$]),
//   node((3, 1), text(red)[$hom(P_1, Q_0)$]),
//   node((3, 2), text(green)[$hom(P_2, Q_0)$]),
//   node((2, 0), text(orange)[$hom(P_0, Q_1)$]),
//   node((2, 1), text(blue)[$hom(P_1, Q_1)$]),
//   node((2, 2), text(red)[$hom(P_2, Q_1)$]),
//   node((1, 0), text(navy)[$hom(P_0, Q_2)$]),
//   node((1, 1), text(orange)[$hom(P_1, Q_2)$]),
//   node((1, 2), text(blue)[$hom(P_2, Q_2)$]),
//   node((0, 0), [$...$]),
//   node((0, 1), [$...$]),
//   node((0, 2), [$...$]),
//   node((1, 3), [$...$]),
//   node((2, 3), [$...$]),
//   node((3, 3), [$...$]),
//   arr((3, 0), (3, 1), []),
//   arr((3, 1), (3, 2), []),
//   arr((2, 0), (2, 1), []),
//   arr((2, 1), (2, 2), []),
//   arr((1, 0), (1, 1), []),
//   arr((1, 1), (1, 2), []),
//   arr((1, 0), (2, 0), []),
//   arr((2, 0), (3, 0), []),
//   arr((1, 1), (2, 1), []),
//   arr((2, 1), (3, 1), []),
//   arr((1, 2), (2, 2), []),
//   arr((2, 2), (3, 2), []),
//   arr((0, 0), (1, 0), []),
//   arr((0, 1), (1, 1), []),
//   arr((0, 2), (1, 2), []),
//   arr((1, 2), (1, 3), []),
//   arr((2, 2), (2, 3), []),
//   arr((3, 2), (3, 3), []),
// ))

The $n$-th term of the total cochain complex is 
$
  [Tot^Pi (hom (P_cx, Q_cx))]^n = product_(p >= max{0, n}) hom (P_p, Q_(p - n)),
$
which is the product of infinitely many terms. 

It turns out that this construction leads to a further way to compute $Ext$:

#theorem[
  Let $P_cx -> A$ and $Q_cx -> B$ be projective resolutions, then
  $
    Ext^n_R (A, B) iso H^n Tot^Pi (hom_R (P, Q)).
  $
]
<balance-ext-2>
#proof[
  @notes[Lemma 8.16]. The proof is similar to previous ones, so we present it briefly here.
  // https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBoBmAXVJADcBDAGwFcYkQALCAWwAoAFAPpkABAEVhAShABfUuky58hFAEYK1Ok1bsufIevFTZ8kBmx4CRAEwaaDFm0SceAwbaPFpchReVEya00HHWc9N1EJVW9TcyUrNVIg+20nF31BQyiY33iVZFtkrUddVyEPbJNcy3yyVWDU0ozI9xyzRRqidXqUkrCyzNIjaza4zpRbHuLQ9LcK1qr2vwSSUmIGvpAAOh3Fsf9E9d6Zna29joOCtY2T3Z8lvKJyUimQtNPz5fznorf2D-u+xWzyox3ed1iFxWZAALDc0noRBEhgAhUZQ-LqOFgppIgyo9FfGykbHTBE8PHuAmfR4oZ6kv7OWSaGBQADm8CIoAAZgAnHhIMggHAQJDqMnsOAAR2Y9F5MBEEAgIigAD1eAJJJJMos+QLEOKRUhbBLnNLZfLFcq1Rr+Fr3Lr+dwkM9haLEDCcc4ALTmuUKpUq9Wa7WqR36z1upAAVhojHoACMYIx+Bj2IwYNycCAvSBfTL-Vag7b7dZw87EAA2GhGxAAdlzfstgZtIZ19z1FYbUcQAA5GwXm9bg3btWWO06kNWe67GSBW2JS0Wm2wJ-rXbWhXOF-bVMvB6vTJ2kN3a5Ht8HF2P9xbDzzJx6a+7xReNVfMjf-eWkP2e7HTfOl5LoGK7fog-61iar68O+e4gQeYEAJxPlOa4VqoQq1nWaFioa7q9jhfYoQa1iERBz7kIRJq1qoMKEZhz7-owWBgGkUD0HAHCsjmAEwDg9CfvKYF4WK07Max7DsZx3G5nxAnwbeYHUc+3biWxHFcVAPFznJgl3iAx4GuRom5vmt5Fq2o7tkeD6qNONHdnOZmFi2I6lsJp7PgRlAyEAA
#align(center, commutative-diagram(
  node-padding: (50pt, 50pt),
  node((3, 0), [$hom(P_0, Q_0)$]),
  node((3, 1), [$hom(P_1, Q_0)$]),
  node((3, 2), [$hom(P_2, Q_0)$]),
  node((2, 0), [$hom(P_0, Q_1)$]),
  node((2, 1), [$hom(P_1, Q_1)$]),
  node((2, 2), [$hom(P_2, Q_1)$]),
  node((1, 0), [$hom(P_0, Q_2)$]),
  node((1, 1), [$hom(P_1, Q_2)$]),
  node((1, 2), [$hom(P_2, Q_2)$]),
  node((0, 0), [$...$]),
  node((0, 1), [$...$]),
  node((0, 2), [$...$]),
  node((1, 3), [$...$]),
  node((2, 3), [$...$]),
  node((3, 3), [$...$]),
  node((4, 0), [$hom (P_0, B)$]),
  node((4, 1), [$hom (P_1, B)$]),
  node((4, 2), [$hom (P_2, B)$]),
  node((4, 3), []),
  arr((3, 0), (3, 1), [$square oo d^((P))_1$]),
  arr((3, 1), (3, 2), [$square oo d^((P))_2$]),
  arr((2, 0), (2, 1), [$-square oo d^((P))_1$]),
  arr((2, 1), (2, 2), [$-square oo d^((P))_2$], label-pos: left),
  arr((1, 0), (1, 1), [$square oo d^((P))_1$]),
  arr((1, 1), (1, 2), [$square oo d^((P))_2$]),
  arr((1, 0), (2, 0), [$d^((Q))_2 oo square$]),
  arr((2, 0), (3, 0), [$d^((Q))_1 oo square$]),
  arr((1, 1), (2, 1), [$d^((Q))_2 oo square$]),
  arr((2, 1), (3, 1), [$d^((Q))_1 oo square$]),
  arr((1, 2), (2, 2), [$d^((Q))_2 oo square$]),
  arr((2, 2), (3, 2), [$d^((Q))_1 oo square$]),
  arr((0, 0), (1, 0), []),
  arr((0, 1), (1, 1), []),
  arr((0, 2), (1, 2), []),
  arr((1, 2), (1, 3), []),
  arr((2, 2), (2, 3), []),
  arr((3, 2), (3, 3), []),
  arr((3, 0), (4, 0), [$eta oo square$], "dashed"),
  arr((3, 1), (4, 1), [$eta oo square$], "dashed"),
  arr((3, 2), (4, 2), [$eta oo square$], "dashed"),
  arr((4, 0), (4, 1), [$-square oo d^((P))_1$]),
  arr((4, 1), (4, 2), [$-square oo d^((P))_2$]),
  arr((4, 2), (4, 3), []),
))
  Let $C$ be the double complex obtained by adding $hom(P, B)$ to the row $q = -1$ of the double complex $hom(P, Q)$. Since each $P_p$ is projective, $hom (P_p, -)$ is exact and so each column of $C$ is exact. $C$ can be turned into a (canonically ordered) upper half-plane complex (by reflecting it to the "second quadrant"), so @aal applies and $Tot^Pi (C)$ is acyclic. Again, observe that $Tot^Pi (C) iso cone(f)$ where 
  $
    f: Tot^Pi (hom (P,Q)) -> hom (P, B)
  $
  is the cochain map induced by $eta: Q_cx -> B$. Hence $f$ is a quasi-isomorphism, but $H^ast hom (P, B) iso Ext^ast_R (A, B)$ by the proof of @balance-ext, so the result follows. 
]


// Applying cohomology to this total cochain complex yields $Ext^ast _R (M, N)$. 


// #TODO modify in balancing Tor how you write the differentials e.g. it should be $d^((P))$