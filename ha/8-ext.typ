#import "../libs/template.typ": *

= Ring Structures on $Ext$
== Reinterpreting $Ext$
#lemma[
  Let $P_cx -> M$ and $Q_cx -> N$ be projective resolutions, then
  $
    Ext^ast_R (M, N) = H^ast Tot^Pi (hom_R (P, Q))
  $
]
The proof is similar to above and can be seen @notes[Lemma 8.16]. 

We first draw the (non-canonically ordered) double complex $hom_R (P, Q)$:
// #align(center,image("../imgs/2023-11-23-22-22-07.png",width:80%))
// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBoBmAXVJADcBDAGwFcYkQALCAWwAoAFAPpkABAEVhAShABfUuky58hFAEYK1Ok1bsufIevFTZ8kBmx4CRAEwaaDFm0SceAwbaPFpchReVEya00HHWc9N1EJVW9TcyUrNVIg+20nF31BQyiY33iVZFtkrUddVyEPbJNcy3yyVWDU0ozI9xyzRRqidXqUkrCyzNIjaza4zpRbHuLQ9LcK1qr2vwSSUmIGvpAAOh3Fsf9E9d6Zna29joOCtY2T3Z8lvKJyUimQtNPz5fznorf2D-u+xWzyox3ed00MCgAHN4ERQAAzABOPCQZBAOAgSFU92RqMQ6gxWMQ1lxKO4SGeRKQABYyfiaTRMUgAKz0imIABsTOJAHZ2UheTykAAOAVc4WIcjiqnMxDEcVC6mIOmmPEcxnKnFq8miyVsnX4lmS0mGjkATklnPFqnRcv5ZuxhLlYsdiBFktUpsRusQxq10rdti1dMoMiAA
#align(center, commutative-diagram(
  node-padding: (50pt, 50pt),
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
  arr((3, 0), (3, 1), []),
  arr((3, 1), (3, 2), []),
  arr((2, 0), (2, 1), []),
  arr((2, 1), (2, 2), []),
  arr((1, 0), (1, 1), []),
  arr((1, 1), (1, 2), []),
  arr((1, 0), (2, 0), []),
  arr((2, 0), (3, 0), []),
  arr((1, 1), (2, 1), []),
  arr((2, 1), (3, 1), []),
  arr((1, 2), (2, 2), []),
  arr((2, 2), (3, 2), []),
  arr((0, 0), (1, 0), []),
  arr((0, 1), (1, 1), []),
  arr((0, 2), (1, 2), []),
  arr((1, 2), (1, 3), []),
  arr((2, 2), (2, 3), []),
  arr((3, 2), (3, 3), []),
))

Note that the $n$-th term of the total complex can be written explicitly as 
$
  [Tot^Pi (hom_R (P_cx, Q_cx))]_n = product_(p >= max{0, -n}) hom (P_p, Q_(p + n))
$
Applying cohomology to this total cochain complex yields $Ext^ast _R (M, N)$. 

#corollary[
  $Ext_R^n (M, N)$ is isomorphic to the chain homotopy classes of chain maps $P_cx -> Q_cx [-n]$, namely the 
   quotient of the module of chain maps $P_cx -> Q_cx [-n]$ by the submodule of null homotopic chain maps.
]
A detailed proof can be seen @notes[Section 9.1]. 
To see this intuitively, notice a chain map $P_cx -> Q_cx [-n]$ is a collection of 
$hom (P_p, Q_(p - n))
$ for all suitable index $p$, subject to commuting with the differentials. 
Hence, it is an element of $[Tot^Pi (hom_R (P_cx, Q_cx))]^n =: T^n$.
One can show that the commuting condition for a chain map is equivalent to being a cycle in $T^n$. 
Further, the chain map is null homotopic if and only if it is a boundary in $T^n$.
Cohomology is cycles quotient by boundaries, which is now the same as "chain maps" quotient by "null homotopic chain maps".

== Yoneda Product


Given $R$-modules $A, B, C$ with projective resolutions $P_cx -> A$, $ Q_cx -> B$, $ T_cx-> C$, we see that $Ext^i_R\(A, B) $ is the chain homotopy classes of chain maps $P -> Q[-i]$, and $Ext^j_R\(B, C)$ is the chain homotopy classes of chain maps $Q -> T[-j]$. 

Note that $hom(Q, T[-j]) iso hom(Q[-i], T[-i - j])$, namely the translation (shifting) functor is an isomorphism on the category of chain complexes and it preserves chain homotopy. 
Also homotopy commutes with composition
of maps. 
Hence the composition $P -> Q[-i] ->T[-i-j]$ gives a map $ ⌣ :  Ext_R^i (A, B) times Ext_R^j (B, C) -> Ext^(i+j) (A, C) $ 

One can show that this is associative and biadditive. 

#remark[
We have shown $D^- (RMod) iso K^- ("Proj" RMod)$.
]

$Ext_R^ast (A, A) = plus.circle.big_i Ext_R^i (A, A)$ is a graded ring. For any $B$, $Ext_R^ast (A , B) = plus.circle.big_i Ext^i (A, B)$ is a graded module over the ring. 

#TODO what is even a graded ring 

#TODO alternative definition of Yoneda product, "gluing sequences"

