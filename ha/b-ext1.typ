#import "../libs/template.typ": *

= $Ext$ and Extensions

== Extensions

#definition[
  Let $A$ and $B$ be $R$-modules. An *extension* of $A$ by $B$ is a #sest 
  $
    ses(B, X, A)
  $
  Two extensions are *equivalent* if there is a commutative diagram 
  // #align(center,image("../imgs/2023-11-25-13-22-33.png",width:50%))
  // https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBpiBdUkANwEMAbAVxiRGJAF9T1Nd9CKAIzkqtRizYAhLjxAZseAkQBMo6vWatEIABqzeigUQDM68VrYBBA-L5LByACznNknR26H+ylGSFibtrstgo+jiIBGhLBMl52Rr7IalEW7noA5KH2xihmqUHW2YmOLgUxbJ5iMFAA5vBEoABmAE4QALZIZCA4EEhC8a0d-dS9SCqDbZ2Iaj19iCaTwwuj805L0yJzSABs0ZY6ALy2Q9OzY4gA7PvpWHB9G0hm24gAHDfBx4+IAKyru989i9Lt9ri9Xt93i8AJycCicIA
#align(center, commutative-diagram(
  node-padding: (50pt, 50pt),
  node((0, 0), [$0$]),
  node((0, 1), [$B$]),
  node((0, 2), [$X$]),
  node((0, 3), [$A$]),
  node((0, 4), [$0$]),
  node((1, 0), [$0$]),
  node((1, 1), [$B$]),
  node((1, 2), [$X'$]),
  node((1, 3), [$A$]),
  node((1, 4), [$0$]),
  arr((0, 0), (0, 1), []),
  arr((0, 1), (0, 2), []),
  arr((0, 2), (0, 3), []),
  arr((0, 3), (0, 4), []),
  arr((0, 1), (1, 1), [$=$]),
  arr((0, 2), (1, 2), [$iso$]),
  arr((0, 3), (1, 3), [$=$]),
  arr((1, 0), (1, 1), []),
  arr((1, 1), (1, 2), []),
  arr((1, 2), (1, 3), []),
  arr((1, 3), (1, 4), []),
))
  
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
    hom (A, X) -> hom (A, A) ->^diff Ext^1 (A, B) = 0
  $
  The first arrow is a surjection, so
  $id_A in hom (A, A)$ can always lift to a splitting $sigma: A -> X$. (It is helpful to recall the proof of @projective-split.)
]

From the above proof, we also see that $diff(id_A) in Ext^1 (A, B)$ is the obstruction to the extension of $A$ by $B$ being split:  the extension is split if and only if $id_A$ lifts to some element in $hom (A, X)$, if and only if $0 = diff (id_A)$. 

#endlec(14)

#lemma[
  Let $ses(B, X, A)$ be an extension of $A$ by $B$, and let $k : C -> A$. Then there exists an extension $ses(B, Y, C)$ of $C$ by $B$, unique up to extension equivalence, such that the following diagram commutes: 
  // https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZARgBpiBdUkANwEMAbAVxiRACEQBfU9TXfIRQAmclVqMWbABrdeIDNjwEiAZjHV6zVohABBOXyWCiABg0TtbU4YX9lQ5ABYLWqbps8jAlSjKnxNx0OW0UfR3UAzUlggGFQ+xMRUijLdxAATQTjX2RzVKDrbPCiFwKYoq5xGCgAc3giUAAzACcIAFskADZqHAgkUTTggGtbVo6kAFZe-sRzIbYsKAB9Ti8Qcc7EdRA+pFN1zf2ZpGJDtq2yXdnhc4nEQb3EJzutgHYTxDP5I8Rp66Qb1egM+XWBiAAHJ9JuCegDEABOKpcIA
#align(center, commutative-diagram(
  node-padding: (50pt, 50pt),
  node((1, 1), [$B$]),
  node((1, 2), [$X$]),
  node((1, 3), [$A$]),
  node((1, 0), [$0$]),
  node((1, 4), [$0$]),
  node((0, 1), [$B$]),
  node((0, 3), [$C$]),
  node((0, 2), [$Y$]),
  node((0, 0), [$0$]),
  node((0, 4), [$0$]),
  arr((0, 3), (1, 3), [$k$]),
  arr((0, 1), (1, 1), [$id_B$]),
  arr((1, 0), (1, 1), []),
  arr((1, 1), (1, 2), []),
  arr((1, 2), (1, 3), []),
  arr((1, 3), (1, 4), []),
  arr((0, 2), (1, 2), []),
  arr((0, 1), (0, 2), []),
  arr((0, 2), (0, 3), []),
  arr((0, 0), (0, 1), []),
  arr((0, 3), (0, 4), []),
))
]
<rotman729>
#proof[
@rotman[Lemma 7.29].
]
#theorem[
  Given $R$-modules $A$ and $B$, the map 
  $
    Theta: e(A, B) &-> Ext_R^1 (A, B) \ 
    [ses(B, X, A)] &mapsto diff(id_A)
  $
  is a bijection, and split extensions correspond to $0 in Ext_R^1 (A, B)$. 
]
#proof[
  (This is a proof sketch.)
  We first show that $Theta$ is surjective. Let $x in Ext^1_R (A, B)$, and we want to construct some extension $xi = (ses(B, X, A))$ such that $Theta(xi) = x$. 
  Since $RMod$ has enough injectives, we can find a #sest 
  $
    ses(B, I, N, f:j, g: pi)
  $
  where $I$ is injective and $pi = coker(j)$. Since $I$ is injective, we have $Ext^1_R (A, I) = 0$ by @ext-injective, so the #lest of $Ext$ gives an exact sequence 
  $
    0 -> homr (A, B) -> homr (A, I) -> homr (A, N) ->^(delta') Ext^1_R (A, B) -> 0
  $
  Now $delta'$ is surjective, so $x in Ext^1_R (A, B)$ can be lifted to some $beta in homr (A, N)$ such that $delta' (beta) = x$. Now we have the following:

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
  We now apply @rotman729 to find a commutative diagram with exact rows that completes the above diagram:
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
  node((0, 0), [$homr(A, A)$]),
  node((0, 1), [$Ext^1_R (A, B)$]),
  node((1, 0), [$homr(A, N)$]),
  node((1, 1), [$Ext^1_R (A, B)$]),
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

  Now again by @rotman729, the extension $xi$ we have constructed is unique up to equivalence, so  we have effectively constructed a well-defined map 
  $
    Phi : Ext^1_R (A, B) -> e(A, B)
  $
  with $Theta(Phi(x)) = x$ (if we can show that $Phi$ is independent of the choices of $I$ and $beta$). 
  
  The rest of the proof is to show that $Phi(Theta([xi])) = [xi]$ for any extension class $[xi] in e(A, B)$. 
]

== Baer Sum

When a set $X$ has a bijection with the underlying map of a group $G$, then in general $X$ can be also equipped with a group structure. We are therefore interested in characterising the group structure on $e(A, B)$, in view of its bijection with the group $Ext^1(A, B)$. The natural addition operation on $e(A, B)$ was first explicitly acertained by R. Baer.

#definition[
Let
$ xi_1 colon 0 arrow.r B arrow.r^(i_1) X_1 arrow.r^(pi_1) A arrow.r 0 comma quad xi_2 colon 0 arrow.r B arrow.r^(i_2) X_2 arrow.r^(pi_2) A arrow.r 0 $
be extensions of $A$ by $B$. Let
$ X^(prime prime) eq X_1 times_A X_2 eq lr({lr((x_1 comma x_2)) in X_1 times X_2 colon pi_1 lr((x_1)) eq pi_2 lr((x_2))}) $
and let
$ Y eq X^(prime prime) / lr({lr((i_1 lr((b)) comma minus i_2 lr((b)))) colon b in B}) $ Then the sequence $ 0 arrow.r B arrow.r^i Y arrow.r^pi A arrow.r 0 $ is
called the *Baer sum* of $xi$ and $xi^prime$, where we have maps
$ i colon B &arrow.r Y \ b &arrow.r.bar lr((i_1 lr((b)) comma 0)) $
and
$ pi colon Y &arrow.r A \ lr((x_1 comma x_2)) &arrow.r.bar pi_1 lr((x_1)) plus pi_2 lr((x_2)) $
]

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


Using extensions of $A$ by $B$, we can define $"Ext"^n lr((A comma B))$
in any abelian category, not necessarily with enough projectives or injectives.
We call this the Yoneda $Ext$ group.

#definition[
We define the Yoneda $"Ext"^n lr((A comma B))$ to be the
equivalence classes of exact sequences

$ xi colon 0 arrow.r B arrow.r X_n arrow.r dots.h arrow.r X_1 arrow.r A arrow.r 0 $

under the equivalence relation generated by $xi tilde.op xi^prime$ if
there is a diagram

// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBpiBdUkANwEMAbAVxiRGJAF9T1Nd9CKAIzkqtRizYAhLjxAZseAkQBMo6vWatEIABoB9Qt16KBRAMzrxWtgDp7sk-2UoALFc2SdBoY-l8lQWQAVg8JbRAAQT8FZyCANjCbHQ5jf1MXElIhMU8I1LlYwKIRHI1w6RiAsxQ1MusvPQByQyqMoMt6vLsHNKKa5Hcuiu8W3z7qzNDh5Ki2uKJEmcbUsRgoAHN4IlAAMwAnCABbJDIQHAgkITSD46vqC6QVG8OTxDVzy8RzF7vvh6+rl+b3cnyQwWB4IBSHikMQAHZoYgABxw5FIgCccIxSKExDheNx1zktzeQhEYMQQmeJNeVw+jypP1pfwpjPRDQiAF4-KSnpi4aDGeS4aFKdTyrMeZwKJwgA
#align(center, commutative-diagram(
  node-padding: (50pt, 50pt),
  node((0, 0), [$0$]),
  node((0, 1), [$B$]),
  node((0, 2), [$X_n$]),
  node((0, 3), [$...$]),
  node((0, 4), [$X_1$]),
  node((0, 5), [$A$]),
  node((0, 6), [$0$]),
  node((1, 0), [$0$]),
  node((1, 1), [$B$]),
  node((1, 2), [$X'_n$]),
  node((1, 3), [$...$]),
  node((1, 4), [$X'_1$]),
  node((1, 5), [$A$]),
  node((1, 6), [$0$]),
  arr((0, 0), (0, 1), []),
  arr((0, 1), (0, 2), []),
  arr((0, 2), (0, 3), []),
  arr((0, 3), (0, 4), []),
  arr((0, 4), (0, 5), []),
  arr((0, 5), (0, 6), []),
  arr((1, 0), (1, 1), []),
  arr((1, 1), (1, 2), []),
  arr((1, 2), (1, 3), []),
  arr((1, 3), (1, 4), []),
  arr((1, 4), (1, 5), []),
  arr((1, 5), (1, 6), []),
  arr((0, 1), (1, 1), [$=$]),
  arr((0, 2), (1, 2), []),
  arr((0, 4), (1, 4), []),
  arr((0, 5), (1, 5), [$=$]),
))
// #align(center, img("2023_10_29_1d9afce33fbce6757ca2g-099(1)", width: 80%))
]

Note that the arrows $X_i arrow.r X_i^prime$ do not have to be
isomorphisms. At first glance, this seems different to our previous definition of
equivalence for extensions of $A$ by $B$. However, by the Five Lemma, when $n = 1$, the morphism $X_1 -> X'_1$ is necessarily an isomorphism.

#definition[
We again define a notion of a Baer sum. Let $xi$ and $xi^prime$ be
representatives of elements of $"Ext"^n lr((A comma B))$. Let
$X_1^(prime prime)$ be the pullback of
// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZARgBoAGAXVJADcBDAGwFcYkQANAfWJAF9S6TLnyEUZYtTpNW7AIL9BIDNjwEi5UpJoMWbRJx4ByflJhQA5vCKgAZgCcIAWySaQOCEmIC7jl4gAmGg8vPko+IA
#align(center, commutative-diagram(
  node-padding: (40pt, 40pt),
  node((0, 1), [$X_1$]),
  node((1, 1), [$A$]),
  node((1, 0), [$X'_1$]),
  arr((0, 1), (1, 1), []),
  arr((1, 0), (1, 1), []),
))
// #block[
// #box(width: textwidth, img("2023_10_29_1d9afce33fbce6757ca2g-099(2)", width: 15%))

// ]
and let $X_n^(prime prime)$ be the pushout of
 // https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBpiBdUkANwEMAbAVxiRACEQBfU9TXfIRQBGclVqMWbABoB9Qjz7Y8BImWHj6zVohDSA5PO7iYUAObwioAGYAnCAFskZEDghJhikHcfPqbpAAmLgouIA
#align(center, commutative-diagram(
    node-padding: (40pt, 40pt),
  node((0, 0), [$B$]),
  node((0, 1), [$X_n$]),
  node((1, 0), [$X'_n$]),
  arr((0, 0), (0, 1), []),
  arr((0, 0), (1, 0), []),
))
// #block[
// #box(width: textwidth, img("2023_10_29_1d9afce33fbce6757ca2g-099", width: 15%))

// ]
Let $Y_n$ be the quotient of $X_n^(prime prime)$ by the antidiagonal.
Then the Baer sum is

$ 0 arrow.r B arrow.r Y_n arrow.r X_(n minus 1) xor X_(n minus 1)^prime arrow.r dots.h arrow.r X_2 xor X_2^prime arrow.r X_1^(prime prime) arrow.r A arrow.r 0 $
]
Suppose that $cal(A)$ has enough projectives and $P_bullet arrow.r A$ is
a projective resolution. Consider the diagram

// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZANgBoAGAXVJADcBDAGwFcYkQBBEAX1PU1z5CKMgEZqdJq3Zde-bHgJEA7BQkMWbRCHI8+IDAqErS4mhunbdcgwMXDkAVlPqpWkAA0A+tf2HBSigALC7mbuwAdFF68gEOAMyhkprs3oQ2-vZEAExJFu4AQjG2RoFOamEp2gAKPsWZxsEVyZYgURH1do3IiVSVrbUAFGAAtKIAlJ2lDrl9Le616X5dZaLN+exDYADUE1NxROTr4drt+1koa2bz7NYSMFAA5vBEoABmAE4QALZIookgHAQP7ZGyfH4gmhAv6iMFfX6IURrQHAxHkOEQtFQ1EATgxCJx2KQAA58SSiYh0fpwQijiikKDqfCkHToYj+u4ALzFGlIZz0xBBMmIMgCxzC1QC4jC0QhAXKYVytmwpmY5Fs+LcSjcIA
#align(center, commutative-diagram(
    node-padding: (40pt, 40pt),
  node((0, 6), [$A$]),
  node((1, 6), [$A$]),
  node((0, 7), [$0$]),
  node((1, 7), [$0$]),
  node((1, 5), [$X_0$]),
  node((1, 4), [$...$]),
  node((1, 3), [$X_n$]),
  node((1, 2), [$B$]),
  node((0, 5), [$P_0$]),
  node((0, 4), [$...$]),
  node((0, 3), [$P_(n-1)$]),
  node((0, 2), [$P_n$]),
  node((0, 1), [$P_(n+1)$]),
  node((0, 0), [$...$]),
  node((1, 1), [$0$]),
  arr((0, 0), (0, 1), []),
  arr((0, 1), (0, 2), []),
  arr((0, 2), (0, 3), []),
  arr((0, 3), (0, 4), []),
  arr((0, 4), (0, 5), []),
  arr((0, 5), (0, 6), []),
  arr((0, 6), (0, 7), []),
  arr((0, 6), (1, 6), [$=$]),
  arr((1, 4), (1, 5), []),
  arr((1, 3), (1, 4), []),
  arr((1, 2), (1, 3), []),
  arr((1, 1), (1, 2), []),
  arr((1, 5), (1, 6), []),
  arr((1, 6), (1, 7), []),
))
By @comparison, there is a chain map from the top row to the
bottom row lifting id : $A arrow.r A$. Setting
$M eq Ker d_n^(lr((P)))$ gives a diagram
// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZAVgBoAGAXVJADcBDAGwFcYkQBBEAX1PU1z5CKMgEZqdJq3Zde-bHgJEAbBQkMWbRCHI8+IDAqErS4mhunbdcgwMXDkAFlPqpWkAA0A+tf2HBSigAzC7mbuwAdFF68gEOAEyhkprs3oQ2-vZEokkW7gBCMbZGgU5qYSnaAAo+RZnGweXJliBREXV2DciJVBUtNQAUYAC0ogCUHSUOOb3N7gCyk3FE5E157L6xWSirZnMbPBIwUADm8ESgAGYAThAAtkiiiSA4EI+iNjf37zSvj+SfW4PRCiVYvN6IACcgO+UN+EIAHDDgQj4UgAfovsCwX9EPFkei0SC+u4ALxFLFIMjgpCOAmIVQ0xDEekAdiJynpohCTNZ9OcTI+mKBjyJQS5OV5JPYACMYDh6BSRSCcRDOcLYaimXTKNwgA
#align(center, commutative-diagram(
    node-padding: (40pt, 40pt),
  node((0, 5), [$A$]),
  node((1, 5), [$A$]),
  node((0, 6), [$0$]),
  node((1, 6), [$0$]),
  node((1, 4), [$X_0$]),
  node((1, 3), [$...$]),
  node((1, 2), [$X_n$]),
  node((1, 1), [$B$]),
  node((0, 4), [$P_0$]),
  node((0, 3), [$...$]),
  node((0, 2), [$P_(n-1)$]),
  node((0, 1), [$M$]),
  node((0, 0), [$0$]),
  node((1, 0), [$0$]),
  arr((0, 0), (0, 1), []),
  arr((0, 1), (0, 2), []),
  arr((0, 2), (0, 3), []),
  arr((0, 3), (0, 4), []),
  arr((0, 4), (0, 5), []),
  arr((0, 5), (0, 6), []),
  arr((0, 5), (1, 5), [$=$]),
  arr((1, 3), (1, 4), []),
  arr((1, 2), (1, 3), []),
  arr((1, 1), (1, 2), []),
  arr((1, 0), (1, 1), []),
  arr((1, 4), (1, 5), []),
  arr((1, 5), (1, 6), []),
  arr((0, 1), (1, 1), [$beta$]),
  arr((0, 2), (1, 2), []),
  arr((0, 4), (1, 4), []),
))
// #block[
// #box(width: textwidth, img("2023_10_29_1d9afce33fbce6757ca2g-100", width: 80%))

// ]
with exact rows.

#proposition[There is a natural isomorphism between Yoneda
$Ext ^n$ and the standard $"Ext"^n$.]


