#import "libs/template.typ": *
#import "libs/var.typ": *
#import "libs/commute.typ": node, arr, commutative-diagram

#set heading(numbering: "1.a.")

#show: project.with(
  title: "Algebraic Topology",
  authors: (
    "Yuhang Wei",
  ),
  date: "October 24, 2023",
)

= Lecture 1

Fundamental group $pi_1 (X)$, or the first homotopy group.

We have the $n$-th homotopy group, $pi_n (X)$. 

We need a base point $x in X$ and $pi_n (X)$ depends on $x$. 
But it's "weak dependence", because if the space is path-connected then choosing any $x in X$ we get the same $pi_n (X)$. 

Recall we could define $pi_1 (X)$ as the set of maps from a circle into $X$, with a distinguished point on the circle mapping to the base point, up to homotopy; alternatively, it is also the set of maps from $[0, 1]$ into $X$ with $0$ and $1$ both mapping to the base point. 

$ pi_n(X) = {f: [0, 1]^n -> X | f |_(diff [0, 1]^n) equiv x } over tilde $

where we define the equivalence relation $tilde$ as follows:
$f tilde g$ if $ exists h : [0 , 1] times [0, 1]^n -> X $ such that $ h |_([0, 1] times diff [0, 1]^n) equiv x \ h|_({0} times [0, 1]^n) = f \ h|_({1} times [0, 1]^n) = g $

Recall that $A -> "Map"(B, C)$ continuous is typically better expressed as $A times B -> C$ continuous. 

Group operation on $pi_n (X)$:

$ f ast g (t_1, t_2, ..., t_n) = cases(
  f(2 t_1, t_2,..., t_n ) quad &t_1 <= 1/2,
  g(2 t_1 -1, t_2, ..., t_n) quad &t_1 >= 1/2
) $

Notice we are doing operations on the equivalence classes, so it is really 
$ [f] + [g] = [f+ g] $

#align(center,image("imgs/2023-10-31-21-53-40.png",width:30%))
#proposition[
  $pi_n (X)$ is an abelian group for $n >=2 $.  
]

#proof[
  We need to show that $f * g tilde g * f$. 
  #align(center,image("imgs/2023-10-31-22-01-20.png",width:100%))
  Notice that we send points in the blank regions to the base point $x$. Since we send $ diff f$ and $ diff g$ also to $x$, there is no contradiction and the map is continuous.  

  This is the case for $n = 2$, but for $n >= 3$, you just don't move the rest of the coordinates. Also notice in $n = 1$ you don't have the room for such manoeuvre. 
]

#example[
  $ pi_1(S^1) = ZZ $
  $ pi_1(T^2) = ZZ times ZZ $

  In general, we have 
  $ pi_n (A times B) = pi_n (A) times pi_n (B) $

  $ pi_1 (RR ^2 without {ast, ast }) = F_2 $
  which is a free group.
  #align(center,image("imgs/2023-10-31-22-17-52.png",width:20%))
  $ pi_1 ("two holed torus") = angle.l a, b, c, d | [a, b][c, d] angle.r $
  where $[a, b] = a b a^(-1) b^(-1)$. This is an example of a CW complex.
  #align(center,image("imgs/2023-10-31-22-21-41.png",width:50%))

  $ pi_1 (S^1 or S^1) = F_2 $
]

#definition[
  Two maps $f, g : X -> Y$ are *homotopic* if there exists $h : [0, 1] times X -> Y$ such that 
  $ h|_({0} times X) = f \ h|_({1} times X) = g $
  We denote $f tilde g$. 
]

#definition[
  Two spaces $X, Y$ are called *homotopy equivalent* if there exists maps $f: X-> Y$ and $g : Y -> X$ such that $f oo g tilde id_Y$ and $g oo f tilde id_X$. 
]

Notice if two spaces are homeomorphic, we can find maps $f: X-> Y$ and $g : Y -> X$ such that $f oo g = id_Y$ and $g oo f = id_X$.

$ pi_1 (S^1 or S^1) = F_2 $
$ pi_1 (RR ^2 without {ast, ast }) = F_2 $

#align(center,image("imgs/2023-10-31-22-28-08.png",width:50%))

= Lecture 2
$ pi_1 : Top_ast over tilde -> Grp $
$ pi_n : Top_ast over tilde -> Ab $

Let $f, g :X-> Y$, then $f tilde g$ if they are homotopic (pointed) maps. Then $f_ast, g_ast : pi_1 (X) -> pi_1 (Y)$ are equal. This also holds for $pi_n$.

$Top over tilde$ is the category of topological spaces and homotopy classes of continuous maps. $Top_ast over tilde$ is the category of pointed topological spaces and homotopy classes of base-point-preserving continuous maps. 

This class is mainly concerned about homology:
$ H_n : Top over tilde -> Ab $
for $n >= 0$ and cohomology: 
$ H^n : Top over tilde -> Ab $
for $n >= 0$. 

The cohomology is a contravariant functor. If we have $f : X-> Y$, then it will induce $f_ast : H_n (X) -> H_n (Y)$ and $f^ast: H^n (Y) -> H^n (X)$. 

== Homology

One definition $H_1\(X) := pi_1 (X)_"ab"$ (abelianised). This only applies to path-connected spaces. 

First idea: Take $pi_1$ and drop base-point condition. We hence look at the set 
$ {S^1 -> X} over tilde $

#lemma[
  If $X$ is path-connected (we might just say connected), ${S^1 -> X} over tilde$ is equal to the conjugacy classes in $pi_1 (X)$. 
]

#proof[
  Any map $S^1 -> X$ can be deformed to a base-point-preserving map since $X$ is connected.
    #align(center,image("imgs/2023-11-01-09-39-44.png",width:50%))
  We can start from the base point, follow the green path, go around the loop, and return along the green path. This defines a map ${S^1 -> X} -> pi_1 (X)$, but this is a map that depends on the choice of the green path.

  If we choose another green path, 
  #align(center,image("imgs/2023-11-01-09-42-51.png",width:50%))
  the result gets modified by a conjugation. 
  [TODO] But this is off topic.
]

In homology, we can separate loops like this:
#align(center,image("imgs/2023-11-01-09-48-08.png",width:50%))

Roughly speaking, $ H_n\(X) = {"closed" n"-dimensional stuff mapping to " X} over tilde $

Simplices are the stuff we are going to use.

== Simplex 
#align(center,image("imgs/2023-11-01-09-52-02.png",width:50%))

$ Delta^n = {(t_0, ... t_n) in RR^(n+1)_(>=0) | sum t_i = 1} $

Notice for $Delta^n$ we need one more dimension, in $RR^(n+1)$, to make things easier.

Now we have $"Map"(Delta^n, X)$; and we take the free abelian group on it. 

#definition[
  The $n$-chains on $X$ is defined as the free abelian group (informally, linear combination) of $ { sigma: Delta^n -> X } $ denoted as $C_n\(X)$.
]

This is our "$n$-dimensional stuff mapping to $X$".

What do we mean by closed? 
#align(center,image("imgs/2023-11-01-10-01-29.png",width:50%))
We have to make sure at each point the number of "flow-in" is equal to "flow-out". This is an example of a closed $1$-chain.

#align(center,image("imgs/2023-11-01-10-06-44.png",width:50%))
Now it's the edges must satisfy some conditions. 

We define the boundary of an $n$-chain.

#definition[
  The boundary of an $n$-chain $c in C_n (X)$ is an $(n-1)$-chain $diff c in C_(n-1) (X)$.
]

#definition[
  $c in C_n (X; R)$ is closed if and only if $diff c = 0$. 
]

#align(center,image("imgs/2023-11-01-10-10-10.png",width:50%))
#align(center,image("imgs/2023-11-01-10-12-03.png",width:50%))

= Lecture 3
#definition[
  A map $sigma: Delta^n -> X$ is called a *singualr simplex*. 
]

A typical $n$-chain is written $ sum r_sigma sigma $ (finite sum). By default $r_sigma in ZZ$. More generally, $r_sigma in R$ for any abelian group $R$, which leads to $H_n\(X; R)$, the $n$-th homology of $X$ with coefficients in $R$. (Free $R$-module on the set!) But $R$ is an abelian group not a ring, so $ C_n (X; R) = plus.circle.big_(sigma: Delta ^n -> X) R $

Notice: not all $n$-chains represent a class in $H_n (X)$. Only the closed ones; we have to make sure the boundary is zero.
#align(center,image("imgs/2023-11-01-10-22-32.png",width:50%))

#definition[The boundary map
$diff : C_n (X; R) -> C_(n-1) (X; R)$ 
$ sigma mapsto sum _(i=0) ^n (-1)^i sigma |_[0, ..., hat(i), ..., n] $
This can be linearly extended for any $sum r sigma $.
]

#align(center,image("imgs/2023-11-01-10-37-37.png",width:50%))
#align(center,image("imgs/2023-11-01-10-38-07.png",width:30%))

$sigma|_[0 , 2, 3]$ is a map $Delta^2 -> X$. 

#definition[
Formally, the $i$-th face of a singular simplex is defined as 
$ sigma|_[0, ..., hat(i), ..., n] (x_0, ..., x_(n-1)) := sigma(x_0, ..., x_(i-1), 0, x_i, ..., x_(n-1)) $
]

Now we look at the equivalence relation. 

#align(center,image("imgs/2023-11-01-10-47-42.png",width:50%))

$ diff a = c_2 - c_1 $
#definition[
  Two closed $n$-chains $c_1, c_2$ are *homologous* if there exists an $(n+1)$-chain $a$ such that $diff a = c_2 - c_1$. 
]
It is easily seen that this is an equivalence relation. 

#definition[
$ H_n\(X; R) := {"closed " n"-chains"} over "homologous" $
]

#definition[
  A chain complex is a sequence of abelian groups ${C_n}_(n in ZZ)$ and linear maps $diff_n: C_n -> C_(n-1)$ such that $diff oo diff = 0$. 
  This whole package is called $Ccx$. 
]

#definition[The $n$-th homology group
  $ H_n (Ccx) = {c in C_n | diff c = 0} over {c in C_n | exists a in C_(n+1) diff a = c}  = ker(diff_n) over im (diff_(n+1)) $
]
We need $diff (diff sigma ) = 0$ so that $ im (diff_(n+1)) subset.eq ker(diff_n) $.

#lemma[
  $ diff (diff sigma ) = 0 $
]
#proof[
  TODO
]

= Lecture 4

$ d_i : Delta^(n-1) -> Delta^n $ that $ d_i(x_0, ..., x_(n-1)) = (x_0, ..., x_(i-1), 0, x_i, ..., x_(n-1)) $
Then $ diff sigma = sum_(i=0)^n (-1)^i (sigma oo d_i) $
We know that $ d_i oo d_j = d_j oo d_(i+1) $ if $i > j$ and thus $diff oo diff = 0$.
#align(center,image("imgs/2023-11-01-17-45-19.png",width:90%))

$Z_n (Ccx) = ker (diff : C_n -> C_(n-1))$ is the $n$-cycles.

$B_n (Ccx) = im (diff : C_(n+1) -> C_n)$ is the $n$-boundaries.

$H_n (Ccx) = Z_n (Ccx) over B_n (Ccx)$

A morphism of chain complex $Ccx -> Dcx$ consists of morphisms of abelian groups $f_n : C_n -> D_n$ for each $n in ZZ$ satisfying
#align(center,image("imgs/2023-11-01-17-50-13.png",width:30%)) 
We thus have the category of chain complexes.

If we have $f: X-> Y$ a continous map between topological spaces, then it induces $f_ast: Ccx (X) -> Ccx(Y)$, defined by the linear expansion of $ sigma |-> f oo sigma $

Quick check: 
#align(center,image("imgs/2023-11-01-17-55-10.png",width:50%))

Note: $f_* : Ccx -> Dcx$ induces $Z_n (Ccx) -> Z_n (Dcx)$, $B_n (Ccx) -> B_n (Dcx)$, and therefore also $H_n (Ccx) -> H_n (Dcx)$.

What if we have coefficients in $R$ instead of $ZZ$? Apply $- tp_ZZ R$. (Still, $R$ is an abelian group, not a ring.)
#align(center,image("imgs/2023-11-01-18-37-28.png",width:100%))

Cohomology.
#align(center,image("imgs/2023-11-01-18-45-15.png",width:100%))
#align(center,image("imgs/2023-11-01-18-51-18.png",width:100%))


#pagebreak()




= Lecture 6

The data for a delta-complex contains ${I_n}_(n >= 0)$ and $ d^0, ..., d^n : I_n -> I_(n-1) $ for each $n$, where 

$ d^j oo d^i = d^(i-1) oo d^j (*) $ if $j < i$.

$ C^"simlicial"_n (X; R) = plus.circle.big _(alpha in I_n) R $

$ diff alpha = sum_(i=0)^n (-1)^n d^i alpha $

(\*) indicates
$ diff oo diff = 0 $

The cohomology is 

$ C_"simplicial"^n ( X; R) = product_(alpha in I_n) R $