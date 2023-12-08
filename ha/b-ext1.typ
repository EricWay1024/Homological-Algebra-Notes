#import "../libs/template.typ": *

= $Ext^1$ and Extensions

== Extensions

#definition[
  Let $A$ and $B$ be $R$-modules. An *extension* of $A$ by $B$ is a #sest 
  $
    ses(B, X, A)
  $
  Two extensions are *equivalent* if there is a commutative diagram 
  #align(center,image("../imgs/2023-11-25-13-22-33.png",width:50%))
  
  This is an equivalence relation. We denote $e(A, B)$ as the equivalence classes of extensions of $A$ by $B$. 


  An extension is *split* if it is equivalent to 
  $
    ses(B, A xor B, A)
  $
]
#lemma[
  If $Ext^1 (A, B) = 0$, then every extension of $A$ by $B$ is split.   
]
#proof[
  We look at the #lest of $Ext^ast (A, -)$: 
  $
    hom (A, X) -> hom (A, A) ->^diff Ext^1 (A, B)
  $
  The first arrow is a surjection, so
  $id_A$ can always lift to a splitting $sigma: A -> X$.
]

From the above proof we see that $diff(id_A) in Ext^1 (A, B)$ is the obstruction to being split:  the extension is split if and only if $id_A$ lifts to $hom (A, X)$ if and only if $0 = diff (id_A)$. 

#endlec(14)


#theorem[
  Given $R$-modules $A$ and $B$, the map 
  $
    Theta: e(A, B) &-> Ext_R^1 (A, B) \ 
    [ses(B, X, A)] &mapsto diff(id_A)
  $
  is a bijection, and split extensions correspond to $0 in Ext_R^1 (A, B)$. 
]
#proof[
  This is a sketch of the proof.

  We first show that $Theta$ is surjective. Let $x in Ext^1 (A, B)$, and we want to construct some extension $xi = (ses(B, X, A))$ such that $Theta(xi) = x$. We proceed as follows. 

  Since $RMod$ has enough injectives, we can find a #sest 
  $
    ses(B, I, N, f:j, g: pi)
  $
  where $I$ is injective and $pi = coker(j)$. Since $I$ is injective, we have $Ext^1(A, I) = 0$, so the #lest of $Ext$ gives an exact sequence 
  $
    0 -> hom (A, B) -> hom (A, I) -> hom (A, N) ->^(delta') Ext^1 (A, B) -> 0
  $
  Now $delta'$ is surjective, so $x in Ext^1 (A, B)$ can be lifted to some $beta in hom (A, N)$ such that $delta' (beta) = x$. Now we have the following:

  // https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZARgBpiBdUkANwEMAbAVxiRACEQBfU9TXfIRQAmclVqMWbAJLdeIDNjwEiAZjHV6zVohAA5OXyWCiABg0TtbU4YX9lQ5ABYLWqbps8jAlSjKnxNx0OW0UfR3UAzUlggEFucRgoAHN4IlAAMwAnCABbJAA2ahwIJFFLdxAAIxgcOltsvKQAVmLSxHMK4KwoAH1OLxBG-MR1EBKkU0HhybakMi62ACsGnJGFicRyoLY0LFWmrbnEJy4KLiA
#align(center, commutative-diagram(
  node-padding: (50pt, 50pt),
  node((1, 1), [$B$]),
  node((1, 2), [$I$]),
  node((1, 3), [$N$]),
  node((1, 0), [$0$]),
  node((1, 4), [$0$]),
  node((0, 1), [$B$]),
  node((0, 3), [$A$]),
  arr((0, 3), (1, 3), [$beta$]),
  arr((0, 1), (1, 1), [$id_B$]),
  arr((1, 0), (1, 1), []),
  arr((1, 1), (1, 2), [$j$]),
  arr((1, 2), (1, 3), [$pi$]),
  arr((1, 3), (1, 4), []),
))
  We now apply @rotman[Lemma 7.29] to find a commutative diagram with exact rows that completes the above diagram:
  // https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZARgBpiBdUkANwEMAbAVxiRACEQBfU9TXfIRQAmclVqMWbAJLdeIDNjwEiAZjHV6zVohAA5OXyWCiABg0TtbU4YX9lQ5ABYLWqbps8jAlSjKnxNx0OW0UfR3UAzUlggEFQ+xMRUijLdxAADQTjX2RzVKDrbPCiFwKYoq5xGCgAc3giUAAzACcIAFskADZqHAgkUTTggCMYHDpbVo6kAFZe-sRzIbYsKAB9Ti8QKc7EdRA+pFMtnaP5pDJl3QArSbbdy8PEQcLdNCw76efzxCcT+6QAHYfsR-l85gcFoCwbtgZDujCkAAOH4zRGIHrwxAATiqXCAA
#align(center, commutative-diagram(
  node-padding: (50pt, 50pt),
  node((1, 1), [$B$]),
  node((1, 2), [$I$]),
  node((1, 3), [$N$]),
  node((1, 0), [$0$]),
  node((1, 4), [$0$]),
  node((0, 1), [$B$]),
  node((0, 3), [$A$]),
  node((0, 2), [$X$]),
  node((0, 0), [$0$]),
  node((0, 4), [$0$]),
  arr((0, 3), (1, 3), [$beta$]),
  arr((0, 1), (1, 1), [$id_B$]),
  arr((1, 0), (1, 1), []),
  arr((1, 1), (1, 2), [$j$]),
  arr((1, 2), (1, 3), [$pi$]),
  arr((1, 3), (1, 4), []),
  arr((0, 2), (1, 2), []),
  arr((0, 1), (0, 2), []),
  arr((0, 2), (0, 3), []),
  arr((0, 0), (0, 1), []),
  arr((0, 3), (0, 4), []),
))
  where the top row is the extension $xi$ we claim to have $Theta(xi) = x$. To prove that it is indeed the case, notice by naturality of the #lest of $Ext$, there is a commutative diagram
  // https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBpiBdUkANwEMAbAVxiRAAsIBbACgEFSAAj4BKEAF9S6TLnyEUARnJVajFmwCiADxwA9BfyEAhMZOnY8BImQUr6zVog7dDggHKmpIDBblElttT26k7aegYCgiYSKjBQAObwRKAAZgBO3EhKIDgQSADMQWqOIFhQEl7pmYhkOXmI2cElsAw4dBWpGVxItblIAExFDmwARjBtghAQggC0HSBV3YiDdQVDISAtbQDkMeJAA
#align(center, commutative-diagram(
  node-padding: (50pt, 50pt),
  node((0, 0), [$hom(A, A)$]),
  node((0, 1), [$Ext^1(A, B)$]),
  node((1, 0), [$hom(A, N)$]),
  node((1, 1), [$Ext^1(A, B)$]),
  arr((0, 1), (1, 1), [$id$]),
  arr((0, 0), (0, 1), [$delta$]),
  arr((0, 0), (1, 0), [$beta oo -$]),
  arr((1, 0), (1, 1), [$delta'$]),
))
  from which we see 
  $
    Theta(xi) = delta(id_A) = delta'((beta oo -)(id_A)) = delta'(beta) = x
  $
  Thus we have shown $Theta$ is surjective.

  Now again by @rotman[Lemma 7.29], the extension $xi$ we have constructed is unique up to equivalence, so we have effectively constructed a well-defined map 
  $
    Phi : Ext^1 (A, B) -> e(A, B)
  $
  with $Theta(Phi(x)) = x$, if we can show that $Phi$ is indepedent of the choices of $I$ and $beta$.
  
  It remains to be shown that $Phi(Theta([xi])) = [xi]$ for any extension class $[xi] in e(A, B)$. #TODO
]

== Baer Sum

When a set $X$ has a bijection with the underlying map of a group $G$, then in general $X$ can be also equipped with a group structure. We are therefore interested in characterising the group structure on $e(A, B)$, in view of its bijection with the group $Ext^1(A, B)$. The natural addition operation on $e(A, B)$ was first explicitly acertained by R. Baer.

#definition[
Let
$ xi_1 colon 0 arrow.r B arrow.r^(i_1) X_1 arrow.r^(pi_1) A arrow.r 0 comma quad xi_2 colon 0 arrow.r B arrow.r^(i_2) X_2 arrow.r^(pi_2) A arrow.r 0 $
be extensions of $A$ by $B$. Let
$ X^(prime prime) eq X_1 times_A X_2 eq lr({lr((x_1 comma x_2)) in X_1 times X_2 colon pi_1 lr((x_1)) eq pi_2 lr((x_2))}) $
and let
$Y eq X^(prime prime) slash lr({lr((i_1 lr((b)) comma minus i_2 lr((b)))) colon b in B})$.
We have maps
$ i colon B arrow.r Y comma b arrow.r.bar lr((i_1 lr((b)) comma 0)) $
and
$ pi colon Y arrow.r A comma lr((x_1 comma x_2)) arrow.r.bar pi_1 lr((x_1)) plus pi_2 lr((x_2)) dot.basic $

The sequence $ 0 arrow.r B arrow.r^i Y arrow.r^pi A arrow.r 0 $ is
called the Baer sum of $xi$ and $xi^prime$.]

#lemma[
The Baer sum is
a well-defined extension of $A$ by $B$.
]

#lemma[
  The set of
equivalence classes of extensions of $A$ by $B$ is an abelian group
under the Baer sum, and the map $Theta$ is an isomorphism of abelian
groups.
]


== Yoneda $Ext$ Groups


Using extensions of $A$ by $B$, we can define $"Ext"^1 lr((A comma B))$
in any abelian category \(i.e. no need for projectives or injectives).
We call this the Yoneda $Ext$ group.

#definition[
More generally, we define the Yoneda $"Ext"^n lr((A comma B))$ to be the
equivalence classes of exact sequences

$ xi colon 0 arrow.r B arrow.r X_n arrow.r dots.h arrow.r X_1 arrow.r A arrow.r 0 $

under the equivalence relation generated by $xi tilde.op xi^prime$ if
there is a diagram

#align(center, img("2023_10_29_1d9afce33fbce6757ca2g-099(1)", width: 80%))
]

Note that the arrows $X_i arrow.r X_i^prime$ do not have to be
isomorphisms. At first glance, this seems different to our definition of
equivalence for extensions of $A$ by $B$. However, by the Five Lemma, when $n = 1$, the morphism $X_1 -> X'_1$ is necessarily an isomorphism.

#definition[
We again define a notion of a Baer sum. Let $xi$ and $xi^prime$ be
representatives of elements of $"Ext"^n lr((A comma B))$. Let
$X_1^(prime prime)$ be the pullback of

#block[
#box(width: textwidth, img("2023_10_29_1d9afce33fbce6757ca2g-099(2)", width: 15%))

]
and let $X_n^(prime prime)$ be the pushout of

#block[
#box(width: textwidth, img("2023_10_29_1d9afce33fbce6757ca2g-099", width: 15%))

]
Let $Y_n$ be the quotient of $X_n^(prime prime)$ by the antidiagonal.
Then the Baer sum is

$ 0 arrow.r B arrow.r Y_n arrow.r X_(n minus 1) xor X_(n minus 1)^prime arrow.r dots.h arrow.r X_2 xor X_2^prime arrow.r X_1^(prime prime) arrow.r A arrow.r 0 $
]
Suppose that $cal(A)$ has enough projectives and $P_bullet arrow.r A$ is
a projective resolution. Consider the diagram

#block[
#box(width: textwidth, img("2023_10_29_1d9afce33fbce6757ca2g-100(1)", width: 80%))

]
By the comparison theorem, there is a chain map from the top row to the
bottom row lifting id : $A arrow.r A$. Setting
$M eq ker diff_n^(lr((P)))$ gives a diagram

#block[
#box(width: textwidth, img("2023_10_29_1d9afce33fbce6757ca2g-100", width: 80%))

]
with exact rows.

#proposition[There is a natural isomorphism between Yoneda
$Ext ^n$ and the standard $"Ext"^n$.]


