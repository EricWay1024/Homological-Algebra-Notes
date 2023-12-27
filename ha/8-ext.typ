#import "../libs/template.typ": *

= Ring Structures on $Ext$
== Reinterpreting $Ext$

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

