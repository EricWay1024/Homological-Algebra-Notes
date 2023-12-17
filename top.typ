#import "libs/template.typ": *
#show: thmrules


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


$ C_n (X; R) = plus.circle.big_(sigma : Delta^n -> X) R $
$ C^n (X; R) = product_(sigma : Delta^n -> X) R $
$ diff sigma = sum_(i=0)^n (-1)^i (sigma|_[0 ... hat(i) ... n]) $
$ delta phi.alt (sigma) = sum_(i=0)^n (-1)^i phi.alt (sigma|_[0 ... hat(i) ... n]) $

It is better to view the product as a function $phi.alt$ that takes a $sigma$ and returns an element in $R$.

We have now defined homology and cohomology with coefficients in $R$.

#proposition[
  When the space is connected, $H_0 = ZZ$.
]

#example[
  The 2-dimensional sphere $S^2$ has $H_0(S^2) = ZZ$, $H_2(S^2) = ZZ$.
]
#example[
  The mobius band is homotopy equivalent to a circle. $H_0 = ZZ$, $H_1 = ZZ$.
]
#example[
  The torus. $H_0 = ZZ$, $H_1 = ZZ^2$, $H_2 = ZZ$.
]

#example[
  $RR PP^2$. $H_0 = ZZ$, $H_1= ZZ over 2$, $H_2 = 0$ but $H_2(RR PP^2, ZZ over 2) = ZZ over 2$.
  TODO
]
= Lecture 5
#align(center,image("imgs/2023-11-09-11-09-12.png",width:90%))
#align(center,image("imgs/2023-11-09-11-14-21.png",width:50%))

$ diff sigma = sigma|_[1 2] - sigma|_[0 2] + sigma |_[0 1] $

#align(center,image("imgs/2023-11-09-11-16-07.png",width:50%))
The idea is you have to have the minus sign for things to work.


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
 
(TODO some examples Klein bottles, etc)

= Homotopy Invariance 
The next is the main theorem in this section.
#theorem("Homotopy Invariance")[
If two maps $f, g: X -> Y$ are homotopic, then they induce the same map in homology and cohomology, i.e. $f_ast = g_ast : H_ast (X) -> H_ast (Y)$ and $f^ast = g^ast : H^ast (X) -> H^ast (Y)$. 
]
<hmtp-inv>
Once the main theorem is proven we can have the following corollary:
#corollary[
  If $X iso Y$, then $H_n (X) iso H_n (Y)$ and $H^n (X) iso H^n (Y)$.
]
#proof[
  $X iso Y$ means we have $f: X -> Y$ and $g: Y -> X$ such that $ f oo g tilde id, quad g oo f tilde id $
  Apply $H_n$ to get 
  $f_ast : H_n (X) -> H_n (Y)$ and $g_ast : H_n (Y) -> H_n (X) $ such that $ f_ast oo g_ast = id, quad g_ast oo f_ast = id $
  showing $H_n (X) iso H_n (Y)$. It is the same for cohomolgy.
]

Now to prove the main theorem we need some reductions. 
#proposition[ Let $I = [0, 1]$.
  To prove @hmtp-inv[Theorem], it is enough to prove the special case where $Y = X times I$, $f = i : x mapsto (x, 0)$ and $g = j : x mapsto (x, 1)$. 
]
#proof[
  // Let $i(x) = (x, 0)$ and $j(x) = (x, 1)$.
  Let $f', g' : X -> Y$ be homotopic maps, i.e. there exists $h : X times I -> Y$ such that $f' = h oo i$ and $ g' = h oo j$. Apply $H_n$, we get $f'_ast = h_ast oo i_ast$ and $g'_ast = h_ast oo j_ast$. But by assumption, $i_ast = j_ast$ and thus $f'_ast = g'_ast$. The same proof works for cohomology.
]

Now fix maps $i, j: X -> X times I$ as defined above.
Our goal is to show that _chain maps_ $i_ast, j_ast : Ccx (X) -> Ccx (X times I)$ induce the same map in homology. It turns out we need them to have the following property:

#definition[
  Two chain maps $f_cx, g_cx: C_cx -> D_cx$ are called *chain homotopic* if there exists $ {h_n : C_n -> D_(n+1)}_(n in ZZ) $ such that $diff^D oo h + h oo diff^C = g - f$.
]

#proposition[
  Suppose that chain maps
$f_cx comma g_cx colon C_cx arrow.r D_cx$ are chain homotopic.
Then the induced maps
$f_* comma g_* colon H_n lr((C)) arrow.r H_n lr((D))$
are equal.
]
#proof[
  See homological algebra.
]

Now our goal is to prove the chain maps $i_ast, j_ast$ are chain homotopic, from which it will easily follow that $i^ast, j^ast: C^cx (X times I) -> C^cx (X)$ are also chain homotopic by applying $hom_ZZ (-, R)$.

#endlec(6)

#align(center,image("imgs/2023-11-18-22-08-32.png",width:90%))

We want to construct $h$, which sends $n$-chains on $X$ to $(n+1)$-chains on $X times I$, subject to the equation $diff h = g_ast - f_ast - h diff$. The easist idea is to multiply any $n$-chain on $X$ with $I$, but it might not be a $(n+1)$-chain on $X times I$ readily, and we need to triangulate it and give each triangle an orientation. For example, when $sigma: Delta^1 -> X$ is a $1$-chain (i.e. a path) on $X$, $sigma times I$ represents a "rectangle" in on $X times I$, which can be sliced to two $2$-chains (i.e. "triangles") $Delta^2 -> X times I$.  

#align(center,image("imgs/2023-11-18-22-19-23.png",width:90%))

#definition[
We define $h : C_n (X) -> C_(n+1) (X times I)$ for $sigma: Delta^n -> X$ as
$ h(sigma)= sum_(i=0)^n (-1)^i (sigma times I)|_(mat(, , i, ..., n; 0, ..., i, , )) $

where $mat(, , i, ..., n; 0, ..., i, , )$ means using vertices $0, ..., i$ at the bottom, i.e. $X times {0}$, and $i, ..., n$ at the top, i.e. $X times {1}$. Formally,
$ (sigma times I)|_(mat(, , i, ..., n; 0, ..., i, , )) : Delta^(n+1) &-> X times I \ 
(x_0, ..., x_(n+1)) &mapsto (sigma (x_0, ... , x_(i-1), underbrace(x_i + x_(i_1), i"-th" ), x_(i+1), ..., x_(n+1)), x_(i+1) + ... + x_(n+1))
$
]

#proposition[
  $h$ defined above gives the chain homotopy between chain maps $i_ast, j_ast : Ccx (X) -> Ccx (X times I)$ we desire.
]
#proof[
Now recall the formula for the boundary: 
$
  diff (sigma) = sum_(j=0)^n (-1)^j sigma | _[0, ..., j-1, j+1, ..., n]
$
where 
$
  sigma | _[0, ..., j-1, j+1, ..., n] : Delta^(n-1) &-> X \

  (x_0, ..., x_(n-1)) &|-> sigma (x_0, ..., x_(j-1), underbrace(0, j"-th"), x_j, ..., x_(n-1))
$

So we have 

$
  diff h(sigma) = sum_(j < i) (-1)^(i+j) (sigma times I) | _mat(, , , , i, ..., n; 0, ..., hat(j), ..., i, , ) + sum_(j > i) (-1)^(i+j +1) (sigma times I) | _mat(
    zws, zws, i, ..., hat(j), ..., n; 
    0, ..., i, zws, zws, zws, zws) \
    + (sigma times I) |_mat(0, 1, ..., n; zws, , , ,) - (sigma times I) |_mat( zws, , , ; 0, 1, ..., n)
$

where 
$
(sigma times I) | _mat(, , , , i, ..., n; 0, ..., hat(j), ..., i, , ) : Delta^n &-> X times I \

(x_0, ..., x_n) &mapsto (sigma(x_0, ..., x_(j-1), underbrace(0, j), x_j, ..., underbrace(x_(i-1) + x_i, i), ..., x_n), x_i + ... + x_n)
$

$
(sigma times I) | _mat(
    zws, zws, i, ..., hat(j), ..., n; 
    0, ..., i, zws, zws, zws, zws) : Delta^n &-> X times I \
    
    (x_0, ..., x_n) &mapsto (sigma(x_0, ..., underbrace(x_i + x_(i+1), i), ..., x_j, underbrace(0, j), x_(j+1), ..., x_n), x_(i+1), ..., x_n)

$

Also

$
(sigma times I) |_mat(0, 1, ..., n; zws, , , ,) = g_ast (sigma)
$

$
(sigma times I) |_mat( zws, , , ; 0, 1, ..., n) = f_ast (sigma)
$

Notice the terms with $i=j$ come in cancelling pairs and thus can be removed, except the beginning and the end. These correspond to the hyperplanes we use to slice this simplex.

Now we compute 

$
  h diff (sigma) = sum_(i < j) (-1)^(i+j) (sigma times I) |_mat(zws, zws, i, ..., j-1, j+1, n; 0, ..., i) + sum_(i > j) (-1)^(i+j+1) (sigma times I)_mat(zws, zws, zws, zws, zws, i, ..., n; 0, ..., j-1, j+1, ..., i)
$

From which we finally conclude
$ diff h (sigma) = g_ast (sigma) - f_ast (sigma) - h diff (sigma) $
which makes us very happy because we have proven @hmtp-inv[Theorem].]
#endlec(7)

The following is a simple application.
#example[
  For the single-point space ${"pt"}$, we have $H_0 = ZZ$ and $H_n = 0$ for $n > 0$. It is the same for any contractible space because of the homotopy invariance.
]
= Exact Sequences and Relative Homology

#proposition[ Let $X_i$ be a family of spaces indexed by $i in I$. Then
  $ H_n (product.co_(i in I) X_i) = plus.circle.big_(i in I) H_n (X_i) $
  $ H^n (product.co_(i in I) X_i) = product_(i in I) H^n (X_i) $
]
#proof[@hatcher[Proposition 2.6]. Let $X = product.co_(i in I) X_i$. Since a singular simplex always has path-connected image, $C_n (X)$ splits as the direct sum $plus.circle.big_(i in I) C_n (X_i)$.
The boundary maps $diff_n$ preserve this direct sum decomposition, taking $C_n (X_i)$ to $C_(n-1) (X_(i))$, so $ker diff_n$ and $im diff_n$ split similarly as direct sums, hence the homology groups also split. #TODO cohomology
]

#definition[ Let $A, B, C$ be abelian groups.
  A *short exact sequence* $ ses(A, B, C, f: f, g: g) $ means $f$ is injective, $g$ is surjective and $im(f) = ker(f)$.
]
#definition[
  A *long exact sequence* is a chain complex whose homology is trivial. Namely, one where $im diff = ker diff$ at every position.
]

#definition[
  Let $X$ be a space and  $A subset.eq X$, then it induces $C_cx (A) arrow.hook Ccx (X)$. We define $
    C_cx (X, A) := C_cx (X)  over C_cx (A) 
  $
  Note that the differential on $C_cx (X)$ descends to a differential on $Ccx (X, A)$.
  Then the *relative homology* of the pair $A subset.eq X$ is 
  $
    H_ast (X, A) := H_ast (C_cx (X, A))
  $
]
#definition[
   We also define $
    C^cx (X, A) := hom (C_cx (X, A), ZZ)
  $ and the *relative cohomology*
  $
    H^ast (X, A) := H^ast (C^cx (X, A))
  $
  
]
#remark[
  It is also true that $ C_n (X, A) = plus.circle.big _(sigma: Delta^n -> X, im(sigma) subset.not A) ZZ  $ but it is better to think of it as a quotient group of $C_n (X)$ rather than a subgroup.
]

We now introduce the next theorem that uses the relative homology to construct a long exact sequence:
#theorem[
Let $A arrow.hook X$ be a subspace. Then $H_n (A) -> H_n (X)$ can be fit in a long exact sequence
$ ... -> H_n (A) -> H_n (X) -> H_n (X, A) -> H_(n-1) (A) -> ... $
where $H_n (X, A)$ is the relative homology. We also have for the cohomology:

$ ... <- H^n (A) <- H^n (X) <- H^n (X, A) <- H^(n-1) (A) <- ... $
]
<les-relative>
The maps $ H_n (A) -> H_n (X) -> H_n (X, A) $ are clear because they are induced by the inclusion and quotient maps, i.e. the short exact sequence of chain complexes:
$
  0-> Ccx(A) arrow.hook Ccx(X) arrow Ccx(X) over Ccx(A) -> 0
$

For the remaining map, $H_n (X, A) -> H_(n-1) (A)$, we need to work on a general theorem about short exact sequence of chain complexes, the Snake Lemma.
#lemma( "Snake Lemma")[
  Every #sest of chain complexes has an associated #lest of homology groups.
  
  In diagrams, suppose all the rows are exact and each column is a chain complex:
#align(center,image("imgs/2023-11-19-11-03-03.png",width:50%))
We claim that we can always get the following:
#align(center,image("imgs/2023-11-19-11-05-03.png",width:50%))
where the zigzagging arrow is the *boundary homomorphism*. 
]
<snake>
#proof[
  For $[c] in H_(n+1) (Ccx)$, define $diff [c]$ to be $[a]$ for $a in A_n$... #TODO Digram Chasing

  We need to check the following:
  - $diff a = 0$;
  - replacing $b$ by $b'$ doesn't affect $[a]$;
  - depends on $c$ within $[c]$?
]

#proof(title: [Proof of @les-relative[Theorem]])[
With the @snake[Snake Lemma], one can easily show the homology part of the claim.
To dualise the argument, we can get the short exact sequence 
$ 0<- C^cx (A) <- C^cx (X) <- C^cx (X, A) <- 0 $
by applying $hom(-, ZZ)$.
This is still a short exact sequence becasue the original short exact sequence is split and applying $hom(-, ZZ)$ preserves split short exact sequence.]

The next is a special case of the relative homology when $A$ is a single point.

#definition[
  The *reduced homology* of a space $X$ is $ tilde(H)_ast (X) := H_ast (X, ast) $
  where $ast$ is the space of a single point.
]
#proposition[
  $tilde(H)_n (X) = H_n (X)$ for $n >=1 $ and $H_0 (X) = tilde(H)_0 (X) xor ZZ$.
]
#proof[ Drawing the long exact sequence associated to the relative homolgy easily gives the result:
  #align(center,image("imgs/2023-11-19-12-01-32.png",width:50%))
]

#remark[
  Everything here also holds for coefficient ring $H_ast (X; R)$ and $H_ast (X, A; R)$.
]

The next example makes use of a theorem we shall discuss later.
#theorem( "Excision Theorem")[
  Let $A subset X$ and $macron(E) subset circle(A)$, then 
  $ H_ast (X, A) iso H_ast (X \\ E, A \\ E) $
]
#example[
  #align(center,image("imgs/2023-11-19-11-55-05.png",width:80%))
  $
     tilde(H)_ast (S^1) = H_ast (S^1, ast) = H_ast (S^1, A) = H_ast ( [0, 1], {0, 1})
  $
  #align(center,image("imgs/2023-11-19-12-05-26.png",width:80%))
]

#endlec(8)

= Computing Homology Groups

#theorem( "Small Simplices Theorem")[
  Let $X = union.big_alpha U_alpha $ be an open cover, denoted as $cal(U)$. Set 
  $ C_n^cal(U) (X) = plus.circle.big_(sigma: Delta^n -> X \ sigma(Delta^n) subset.eq U_alpha "for some" alpha )  ZZ subset.eq C_n (X) $
  which is a subchain complex. Then $C_n^cal(U) (X) -> C_n (X)$ induces an isomorphism in homology. 
]
<small-simp>
The proof is delayed later. We will first present some consequences of this theorem; but before doing that, we need the following lemma, a tool from homological algebra to prove isomorphisms using long exact sequences.
#lemma( "The Five Lemma")[
  Assume we are given a diagram of modules:
  #align(center,image("imgs/2023-11-19-12-18-27.png",width:50%))
  such that 
  - rows are exact;
  - $m, p$ are isomorphisms;
  - $l$ is surjective;
  - $q$ is injective.
  Then $n$ is an isomorphism. 
]
  <five>
#remark[
We are usually only concerned with a weaker form, where we assume $m, p, l, n$ are all isomorphisms.
]
#proof[
  #TODO Diagram chasing
]

== Excision Theorem

The reader is reminded that $macron(E)$ is the closure of $E$ and $circle(A)$, also denoted as $A^circle.small$, is the interior of $A$. 
#theorem( "Excision Theorem")[
  Let $A subset X$ and $macron(E) subset circle(A)$, then 
  $ H_ast (X, A) iso H_ast (X \\ E, A \\ E) $
]
  <excision>
#proof[
  Consider the open cover $X = circle(A) union (X \\ macron(E))$. We observe that given a simplex $sigma: Delta^n -> X$ landing in $circle(A)$ or $X \\ macron(E)$, $sigma$ is either disjoint from $E$ or $sigma$ is contained in $circle(A)$.
  This implies that $ C_cx^cal(U) (X \\ E, A \\ E) = C^cal(U)_cx (X, A) $
  Indeed, an element $sigma: Delta^n -> X$ in the basis of $C^cal(U)_cx (X, A)$ is one such that (due to the superscript $cal(U)$) either $im(sigma) subset.eq circle(A)$ or $im(sigma) subset.eq X \\ macron(E)$, but (due to the relativity to $A$) $im(sigma) subset.eq.not A$, which means $im(sigma)$ must be disjoint from $E$. Similarly, we can show that an element in the basis of $C_cx^cal(U) (X \\ E, A \\ E)$ must also be one with its image disjoint from $E$.

  Hence $
    H_ast^cal(U) (X \\ E, A \\ E) = H_ast^cal(U) (X, A)
  $
  Consider the following map between #sess
  // $ ses(C_cx^cal(U) (A), C_cx^cal(U) (X), C_cx^cal(U) (X, A)) $
  // #align(center,image("imgs/2023-11-19-12-39-30.png",width:50%))
  // https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBpiBdUkANwEMAbAVxiRGJAF9T1Nd9CKAIzkqtRizYBhAPoBjAB4A9OYwAUAVQCUAAjUBBLVx4gM2PASIAmUdXrNWiELMUr12vQA0j3XuYFEAMy24g7S8sqqDJq6ap6kOobGfvyWKAAsIfaSThy+pnwWgiSkQmLZjuzJBf5pyCJldhKVLgp6SflmqcU2jaE5zhFePiZdRUGl5c3hil4JHaOFARmTTWG5XGIwUADm8ESgAGYAThAAtkhkIDgQSEL5J+d31DdIVg+nF4g217eIgR8nv8Xn90oCvgBWEFIABs4Nh0MQAHZ4cjEQAOVHoxEATlRIl+sNRP1eyNRwUJiExFE4QA
#align(center, commutative-diagram(
  node-padding: (50pt, 50pt),
  node((0, 0), [$0$]),
  node((0, 1), [$C_cx^cal(U) (A)$]),
  node((0, 2), [$C_cx^cal(U) (X)$]),
  node((0, 3), [$C_cx^cal(U) (X, A)$]),
  node((0, 4), [$0$]),
  node((1, 0), [$0$]),
  node((1, 1), [$C_cx (A)$]),
  node((1, 2), [$C_cx (X)$]),
  node((1, 3), [$C_cx (X, A)$]),
  node((1, 4), [$0$]),
  arr((0, 0), (0, 1), []),
  arr((0, 1), (0, 2), []),
  arr((0, 2), (0, 3), []),
  arr((0, 3), (0, 4), []),
  arr((1, 0), (1, 1), []),
  arr((1, 1), (1, 2), []),
  arr((1, 2), (1, 3), []),
  arr((1, 3), (1, 4), []),
  arr((0, 1), (1, 1), []),
  arr((0, 2), (1, 2), []),
  arr((0, 3), (1, 3), []),
))
  Passing to homology, we get a map of long exact sequences:
  #align(center,image("imgs/2023-11-19-12-41-03.png",width:80%))
  By @small-simp[Small Simplices Theorem], maps 1, 2, 4, 5 are isomorphisms.
  By @five[Five Lemma], map 3 is an isomorphism, i.e. 
  $
    H_ast^cal(U) (X, A) iso H_ast (X ,A)
  $
  In the same way we can show that 
  $
    H_ast^cal(U) (X \\ E, A \\ E) iso H_ast (X\\E ,A\\E)
  $
   Thus $H_ast (X\\E, A \\E) iso H_ast (X, A) $.
]

#definition[
  We say that a subset $A$ of a
space $U$ is a *deformation retract* of $U$ if there exists
$pi colon lr((U comma A)) arrow.r lr((A comma A))$ with
$i compose pi tilde.op "id"_(lr((U comma A)))$ as maps of pairs \(where
$i colon lr((A comma A)) arrow.r lr((U comma A))$ is the inclusion).
]

#definition[
  We say $A subset.eq X$ is a *good pair* if 
  - $A$ is a nonempty closed subspace of $X$ and 
  - $A$ is a deformation retract of some open set $V$ such that $A subset.eq V subset.eq X$.
]


#remark[
  If $(A subset.eq X), V$ are as above, then $H_ast (A) -> H_ast (V)$ is an isomorphism.
]

#example[
  In the topologist's sine curve, the segment on the $y$-axis does not make a good pair with the whole space.
]

Let $A subset.eq X$ be spaces. The quotient space  $X over A$ has $[x] = [y]$ if $x, y in A$ or $x = y$. The next corollary equates the relative homology of a good pair with the reduced homology of their quotient space. 

#corollary( "Collapsing a Pair")[
  If $A subset.eq X$ is a good pair, then $H_ast (X, A) = tilde(H)_ast (X over A)$.
]
  Before we proceed with the proof, the reader is kindly reminded of the potential confusion between symbols $\\$ (for set-theoretic exclusion or 'without') and $over$ (for forming a quotient space).
  
#proof[
  Pick an open neighborhood $V$ of $A$ as in the definition of good pair.
  The map of pairs $(X, A) -> (X, V)$ gives a map of long exact sequences:
  // #align(center,image("imgs/2023-11-19-12-56-51.png",width:80%))
// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZARgBoAGAXVJADcBDAGwFcYkQAJAfQAowBqYgEoABDwCCQkAF9S6TLnyEUAJgrU6TVu259BongA0ps+djwEiAZnU0GLNok5cwYw6RGSZckBnNKiABZbTQcdFzEvU18FC2VkAFYQ+20nblcjEx8-RUsUMmINFMdnPWExADUss1z4tUK7LRLdAXLM7xq461IG0NTnDPcRKo6Y-zzkYN7i8Iyo7NiAlCTpptm3arHaonJktacAOiPRnK6UADY9sMPj6NOl5F3V65Ajg5PFicvn-reZDRgUAA5vAiKAAGYAJwgAFskMRdiAcBAkORolDYaiaMj4ejoXDEGQkSjECo8ZjSdiSVZyQSbMSkIFaYyqfDiMzCWoGYgEhyktzzhzLtyAOwckWsxAADg5UslAE4OfLJcQaT4MQTETieRyidrBer8UgudqxYaKfTtTLzQTgtzFZRpEA
#align(center, commutative-diagram(
  node-padding: (40pt, 40pt),
  node((0, 1), [$H_(n+1) (A)$]),
  node((0, 2), [$H_(n+1) (X)$]),
  node((0, 3), [$H_n (X, A)$]),
  node((0, 4), [$H_n (A)$]),
  node((0, 5), [$H_n (X)$]),
  node((1, 1), [$H_(n+1) (V)$]),
  node((1, 2), [$H_(n+1) (X)$]),
  node((1, 3), [$H_n (X, V)$]),
  node((1, 4), [$H_n (A)$]),
  node((1, 5), [$H_n (X)$]),
  node((0, 0), [$...$]),
  node((0, 6), [$...$]),
  node((1, 0), [$...$]),
  node((1, 6), [$...$]),
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
  arr((0, 1), (1, 1), []),
  arr((0, 2), (1, 2), []),
  arr((0, 3), (1, 3), []),
  arr((0, 4), (1, 4), []),
  arr((0, 5), (1, 5), []),
))
  By @five[Five Lemma], $H_ast (X, A) -> H_ast (X, V)$ is an isomorphism.

  Since $ast = A over A$ is a deformation retract of $V over A$, in the same way as above, the long exact sequence associated with $(A over A arrow.hook X over A) -> (V over A arrow.hook X over A)$ shows that $ H_ast (X over A, ast) = H_ast (X over A, V over A)  $
  but $ H_ast (X over A, ast) = tilde(H)_ast (X over A)$ by definition.

  By @excision[Excision Theorem], for $A subset.eq V subset.eq X$, 
  $ H_ast (X, V) iso H_ast (X \\ A, V \\ A) $
  Apply @excision[Excision Theorem] again to $ A over A subset.eq V over A subset.eq X over A$,
  $ H_ast (X over A, V over A) iso H_ast (X \\ A, V \\ A)  $
  Putting together all the pieces gives
  $
    H_ast (X, A) = H_ast (X, V) = H_ast (X \\ A, V \\ A) = H_ast (X over A, V over A) = H_ast (X over A, A over A) = tilde(H)_ast (X over A) 
  $
]

#example[
  When $A = S^1$ and $X = S^1 or S^1$, $A subset X$ is a good pair. Thus 
  $ H_ast (S^1 or S^1, S^1) = tilde(H)_ast (S^1) $
]
== Mayer-Vietoris Theorem
#theorem( "Mayer-Vietoris Theorem")[
  Let $X = A union B$ be an open cover by two sets. Then there is a #lest 
  $ ...-> H_n (A sect B) -> H_n (A) xor H_n (B) -> H_n (X) -> H_(n-1) (A sect B) -> ... $
#align(center,image("imgs/2023-11-19-13-11-54.png",width:80%))
]
<mv>
#proof[
  Consider the open cover $cal(U) = {A, B}$. Then we get a #sest 
  $ ses(Ccx(A sect B), Ccx (A) xor Ccx (B), C_cx^cal(U) (X), f: i, g: pi) $
  where $i: sigma mapsto (sigma , -sigma)$ and $pi : (alpha, beta) mapsto alpha + beta$. (The minus sign in $f$ is to make the sequence exact.)
  We then obtain a #lest on homology groups. Apply @small-simp[Small Simplices Theorem] to replace $H_ast^cal(U) (X) $ by $H_ast (X)$. 
]
#endlec(9)
#definition[
  A space $X$ is *well-pointed* if $ ast in X$ is a good pair.
]

#corollary[
  Let $ast in X$, $ast in Y$ be two well-pointed spaces. Then for $n >= 1$,
  $ H_n (X or Y)  = H_n (X) xor H_n (Y) $
]
  #align(center,image("imgs/2023-11-19-13-23-03.png",width:30%))
#proof[
  Cover $X or Y$ by $A = X union U_y$, where $U_y $ is an open neighborhood of $ast in Y$ as in the definition of good pair, and $B = Y union U_x$, where $U_x$ is defined similarly.
  Notice $A sect B = U_x union U_y$.

  Apply @mv[Mayer-Vietoris Theorem] to get a #lest
  $
    ...-> H_n (U_x union U_y) -> H_n (X union U_y) xor H_n (Y union U_x) -> H_n (X or Y) ->  H_(n-1) (U_x union U_y) ->...
  $
  But $U_x union U_y iso ast$, $X union U_y iso X$ and $Y union U_x iso Y$.
  For $n >= 2$, since $H_n (ast) = H_(n-1) (ast)= 0$, we easily see $  H_n (X ) xor H_n (Y ) = H_n (X or Y)  $
  For $n = 1$,
  $
    ... -> 0 -> H_1 (X) xor H_1 (Y) -> H_1 (X or Y) ->^f ZZ ->^i H_0 (X) xor H_0 (Y) -> ...
  $
  Here map $i $ is injective which means map $f = 0$, so we still have $ H_1 (X ) xor H_1 (Y ) = H_1 (X or Y)$. 
  //  we need some reasoning:
  // #align(center,image("imgs/2023-11-19-13-31-12.png",width:60%))
]

#example[
  $X = S^2$. We define $A$ as "the northen hemisphere plus $epsilon$" (a narrow band across the equator) and $B$ as "the southern hemisphere plus $epsilon$". Note that $ A iso ast iso B$ and $A sect B = S^1$. #align(center,image("imgs/2023-11-19-13-36-38.png",width:15%))
  By @mv[Mayer-Vietoris Theorem],
  #align(center,image("imgs/2023-11-19-13-42-37.png",width:50%))
  Recall that $H_n (S_1) = ZZ$ for $n = 0, 1$ and $H_n (S_1) = 0$ for $n >= 2$. 
  We can compute that
  $H_n (S^2) = 0$ for $n >= 3$ and $n = 1$, and $H_n (S^2) = ZZ$ for $n = 0, 2$.
]

#example[
  #align(center,image("imgs/2023-11-19-14-04-39.png",width:50%))
  $ A sect B = S^1 $
  #TODO
]

= Proving Small Simplices Theorem
https://www.dpmms.cam.ac.uk/~or257/teaching/IIIAlgTop2016/SmallSx.pdf

Now we work on proving @small-simp[Small Simplices Theorem], which states that $C^cal(U)_cx (X) -> C_cx (X)$ induces an isomphism in homology for any open cover $cal(U)$ of $X$. The strategy of the proof:
+ Define a "subdivision operator" $S : C_cx (X) -> C_cx (X)$. For example: #align(center,image("imgs/2023-11-19-14-20-27.png",width:50%))
+ Prove that $S$ is chain homotopic to $id : C_cx (X) -> Ccx (X)$;
+ Prove for all $c in C_n (X)$, there exists $N$ such that $S^N (c) in C^cal(U)_n (X) $.

Assume we have shown the above, we could prove the theorm in the following way:
#proof[
  First, we show $H^cal(U)_ast (X) -> H_ast (X)$ is surjective. Pick $[c] in H_n (X)$. As $S iso id$, for all $N$ we have $S^N iso id$ and $[S^N (c)] = [c]$. But $S^N (c) in C^cal(U)_n (X)$ for $N$ large enough, and thus $[c] = [S^N (c)] in H_ast^cal(U) (X)$.

  Second, we show $H^cal(U)_ast (X) -> H_ast (X)$ is injective. Pick $[c] in H_n^cal(U) (X)$ such that its image in $H_n (X)$ is zero. Then we can pick $d in C_(n+1) (X)$ such that $diff (d) = c$. 
  By assumption, we can pick $N$ large enough such that $S^N (d) in C^cal(U)_(n+1) (X)$. We can also pick a chain homotopy $k$ from $S^N$ to $id$, i.e. $id - S^N = k diff + diff k$. Applying this to $d$ to get $ d - S^N (d) = k (diff (d)) + diff (k (d)) = k (c) + diff (k (d)) $
  Applying $diff$ to get 
  $
    c - diff(S^N (d))  = diff (k (c))
  $
  
  and therefore $c = diff (S^N (d) + k (c))$. Here $S^N (d) in C^cal(U)_(n+1) (X)$ by choice of $N$ and $k(c) in C^cal(U)_(n+1) (X)$ due to the naturality of chain homotopy $k$, and hence $[c] = 0$.
]

Our current goal is to define $S : Ccx(X) -> Ccx(X)$ and $h: C_n (X) -> C_(n+1) (X)$ with $h diff + diff h = id - S$ in a way that is natural in $X$, i.e. for all $f: X-> Y$, the following diagrams commute:
#align(center,image("imgs/2023-11-19-14-39-38.png",width:30%))
#align(center,image("imgs/2023-11-19-14-39-58.png",width:30%))
As any simplex $sigma in C_n$ can be obtained as $sigma_ast (iota)$ for $iota in C_n (Delta^n)$, the "identity simplex", it is enough to find $S, h$ on simplices $iota in C_n (Delta^n)$. ($sigma_ast : Ccx(Delta^n) -> Ccx(X)$ is the push-forward of $sigma: Delta^n -> X$.) In general, we have $S(sigma) = sigma_ast (S(iota))$ and $h(sigma) = sigma_ast (h(iota))$.

To define $S(iota)$, we need the *cone operator* $C_k (Delta^n) -> C_(k+1) (Delta^n)$. 
#definition[
Write the *berycentre* $ b = 1/(n+1) sum_(i=0)^n e_i $ Given a singular $k$-simplex $sigma : Delta^k -> Delta^n$, define a  $(k+1)$-simplex $cone(sigma) : Delta^(k+1) -> Delta^n$ by
$
  cone(sigma)(x_0, ..., x_(k+1)) = x_0 b + (1-x_0) sigma (x_1 / (1-x_0), ..., x_(k+1) / (1-x_0))
$
#align(center,image("imgs/2023-11-19-17-18-16.png",width:50%))
]
#proposition[
  This operation satisfies
  $ diff oo cone = id - cone oo diff $
]
#proof[
  #TODO
]

#definition[
  Induction definition of $S$. When $n = 0$, then $S : C_0 (X) -> C_0 (X)$ is the identity. When $n > 0$, define
  $ S(iota) = cone(S (diff iota )) $
]

#TODO Unravel this definition for $n = 2$.

#definition[
  When $n = 0$, $h : C_0 (X) -> C_1 (X)$ is the zero map. When $n > 0$, $ h(iota) = cone(iota - h(diff iota)) $
]
#proposition[
  For all $sigma$, $ h diff sigma + diff h sigma = sigma - S sigma $
]
#proof[
  TODO
]

The final task: 
3. Prove for all $c in Ccx(X)$, there exists $N$ such that $S^N (c) in C^cal(U) (X) $.

#endlec(10)

= Universal Coefficient Theorem

 Basic questions that the UCT tries to
answer: 
- Is $H_ast lr((X comma R))$ determined by $H_ast lr((X comma bb(Z)))$? 
- Is $H^ast lr((X comma R))$ determined by $H_ast lr((X comma bb(Z)))$? \(And, if yes, how?)
$ upright(" input ") eq H_ast lr((X comma bb(Z))) $

Certainly, $Ccx lr((X comma R))$ and
$C^cx lr((X comma R))$ are determined by
$Ccx lr((X comma bb(Z)))$, via the formulas
$ Ccx lr((X comma R)) eq Ccx lr((X comma bb(Z))) times.circle R upright(" and ") C^cx lr((X comma R)) eq "Hom"_Z lr((Ccx lr((X comma bb(Z))) comma R)) $

Recall $hom_ZZ$ just means homomorphisms of abelian groups.
The subscript $zws_ZZ$ means $ZZ$-module, but a $ZZ$-module is the
same thing as an abelian group.

#definition[
$A times.circle B$ \(also denoted $A times.circle_ZZ B$ ) is the abelian
group whose elements are formal sums $sum_i a_i times.circle b_i$ with
$a_i in A$ and $b_i in B$, modulo the equivalence relation generated by
$lr((a plus a^prime)) times.circle b tilde.op a times.circle b plus a^prime times.circle b$
and by
$a times.circle lr((b plus b^prime)) tilde.op a times.circle b plus a times.circle b^prime$.
]

Alternatively, $A times.circle B$ is the quotient of $xor_A B$ by the
subgroup generated by
$ lr((a plus a^prime)) times.circle b tilde.op a times.circle b plus a^prime times.circle b $
or the quotient of $xor_B A$ by the subgroup generated by
$ a times.circle lr((b plus b^prime)) tilde.op a times.circle b plus a times.circle b^prime $

In order to formulate the UCT, one needs $Ext$ and $Tor$ which, just like
$hom$ and $times.circle$, are bifunctors. They take two abelian groups as
input, and produce a new ablelian group.

#definition[
For any abelian group A, using that evey
subgroup of a free abelian group is free, one can find a short exact
sequence
$ 0 arrow.r bb(Z)^(xor J) ->^f bb(Z)^(xor I) arrow.r A arrow.r 0 $
\(The chain complex
$dots.h 0 arrow.r 0 arrow.r bb(Z)^(xor J) arrow.r bb(Z)^(xor I)$
is called a *free resolution* of $A$.)

One then defines
$ "Ext"lr((A, B)) := "coker"lr((f^ast.basic colon product_I B arrow.r product_(J) B)) $
and
$ "Tor"lr((A comma B)) := ker lr((f_ast colon plus.circle.big_(J) B arrow.r plus.circle.big_(I) B)) $
where we’ve applied the functors $"Hom"lr((minus comma B))$ and
$minus times.circle_ZZ B$ to the map
$f colon bb(Z)^(xor J) arrow.r bb(Z)^(xor I)$, respectively.
]

#proposition[
$"Ext"lr((A comma B))$ is a contravariant functor of the variable $A$, and covariant of the variable $B$ \(just
like $hom$). 

$"Tor"lr((A comma B))$ is a covariant functor of each
variable, and satisfies $"Tor"lr((A comma B)) eq "Tor"lr((B comma A))$
\(just like $ - times.circle minus$ ).
]
#proof[Omitted.]
#example[
$  & "Ext"lr((bb(Z) slash 2 comma B)) eq B slash brace.l 2 b colon b in B brace.r\
 & "Tor"lr((bb(Z) slash 2 comma B)) eq brace.l b in B colon 2 b eq 0 brace.r $
\(can be seen by taking the free resolution of $bb(Z) slash 2$ given by
$bb(Z) ->^2 bb(Z)$.)
]

#proposition[
  $ hom (A, B) = ker(f^ast: product_I B -> product _J B) $
  $ A tp B = coker(f_ast : plus.circle.big_J B -> plus.circle.big_I B ) $
]

// $bold(A) times.circle bold(B) eq "coker" lr((upright(f) dot.basic colon xor_(upright(J)) upright(B) arrow.r xor_1 upright(med B)))$
// because that’s coker
// $lr((bb(Z)^(xor upright(J)) times.circle upright(B) arrow.r bb(Z)^(xor 1) times.circle upright(B)))$.

#proof[
Notice that $ hom(A, B) = ker (hom (ZZ^(xor I), B) -> hom(ZZ^(xor J), B)) $ and $ A tp B = coker(ZZ^(xor J) tp B -> ZZ^(xor I) tp B) $

The second one is harder to show.

The map 
$ coker lr((bb(Z)^(xor J) times.circle B arrow.r bb(Z)^(xor I) times.circle B)) arrow.r A times.circle B $
is visibly surjective. Because for a typical element
$sum_i a_i times.circle b_i in A times.circle B$, one can lift each
$a_i$ to $bb(Z)^(xor I)$. 

We need to see that if
$ sum_i x_i times.circle b_i in bb(Z)^(xor I) times.circle B mapsto 0 in A times.circle B $
then it comes from $bb(Z)^(xor J) times.circle B$. The expression
$sum_i x_i times.circle b_i$ represents an element of
$xor_B lr((bb(Z)^(xor I)))$. Since its image in $xor_B A$ represents zero
in $A times.circle B$, it can be written as
$ sum_k a_k times.circle lr((b_k^prime plus b^(prime prime)_k)) minus a_k times.circle b_k^prime minus a_k times.circle b^(prime prime)_k in xor_B A $
Lift each $a_k in A$ to some $x_k^prime in Z^(xor I)$ and consider the
corresponding sum
$ sum_k x_k^prime times.circle lr((b_k^prime plus b^(prime prime)_k)) minus x_k^prime times.circle b_k^prime minus x_k^prime times.circle b^(prime prime)_k in xor_B lr((bb(Z)^(xor I))) $
That new element of $xor_(B) lr((bb(Z)^(xor I)))$ differs
from our original $sum_i x_i times.circle b_i$ by something in
$ xor_B ker lr((bb(Z)^(xor I) arrow.r A)) eq xor_B lr((bb(Z)^(xor J))) $
We have written
$sum_i x_i times.circle b_i in xor_B lr((bb(Z)^(xor I)))$ as a sum of
something in $xor_B lr((bb(Z)^(xor J)))$ and something that
represents 0 in $bb(Z)^(xor I) times.circle B$. Thus we have
written our
$sum_i x_i times.circle b_i in bb(Z)^(xor I ) times.circle B$ as
something in $bb(Z)^(xor J) times.circle B$. #TODO]

#theorem( "Universal coefficient theorem")[
  There exsit natural, split #sess:
  $ ses(H_n (X, ZZ) tp R, H_n (X, R), Tor(H_(n-1) (X, ZZ), R)) $
  $ ses(Ext(H_(n-1) (X, ZZ), R), H^n (X, R), hom (X_n (X, ZZ), R))  $
]
#proof[
  The #sest (\*) $ ses(Z_n (X),  C_n (X), B_(n-1) (X), g: diff) $
  can be interpreted as a #sest of chain complexes:
  $ ses( Z_cx (X), Ccx (X), B_cx (X)) $
  where the first and third terms are viewed as chain complexes with zero differential.
  Now we look at the associated #lest of homology groups. The connecting homomorphism $B_(cx -1) (X) -> Z_(cx -1) (X)$ is just the usual inclusion. 
  #align(center,image("imgs/2023-11-19-22-20-42.png",width:50%))
  Applying the functors $ - tp R$ and $hom (-, R)$ to get two new #sest of chain complexes:

  $ ses(Z_cx (X) tp R, Ccx (X, R), B_(cx - 1) (X) tp R) $
  $ ses(hom(B_(cx - 1)(X), R), C^cx (X, R), hom (Z_cx (X), R)) $
  
  Note: these two functors do not in general send #sest to #sest. But the #sest (\*) is split because $B_(n-1) (X)$ is a free abelian group. Recall that every subgroup of a free abelian group is free.

  We get the corresponding #lest in (co)homology:

  // We get corresponding LES in \(co)homology: and
$   quad dots.h arrow.r B_n lr((X)) times.circle R arrow.r Z_n lr((X)) times.circle R arrow.r H_n lr((X comma R)) arrow.r B_(n minus 1) lr((X)) times.circle R arrow.r Z_(n minus 1) lr((X)) times.circle R arrow.r dots.h $
and 
 $
  dots.h arrow.r "Hom"lr((Z_(n minus 1) lr((X)) comma R)) arrow.r  "Hom"lr((B_(n minus 1) lr((X)) comma R)) arrow.r H^ast.basic lr((X comma R)) \ arrow.r   "Hom"lr((Z_n lr((X)) comma R)) arrow.r  "Hom"lr((B_n lr((X)) comma R)) arrow.r dots.h $
Like above, the maps
$B_n lr((X)) times.circle R arrow.r Z_n lr((X)) times.circle R$ and
$"Hom"lr((Z_(n minus 1) lr((X)) comma R)) arrow.r "Hom"lr((B_(n minus 1) lr((X)) comma R))$
are induced by the inclusion
$B_n lr((X)) times.circle R arrow.r.hook Z_n lr((X))$. 

We rewrite this as short exact sequences: 
$ 0 arrow.r "coker"lr((B_n lr((X)) times.circle R arrow.r Z_n lr((X)) times.circle R)) arrow.r H_n lr((X comma R)) \ arrow.r ker lr((B_(n minus 1) lr((X)) times.circle R arrow.r Z_(n minus 1) lr((X)) times.circle R)) arrow.r 0 $
and
$ 0 arrow.r coker lr(("Hom"lr((Z_(n minus 1) lr((X)) comma R)) arrow.r  "Hom"lr((B_(n minus 1) lr((X)) comma R)))) arrow.r H^ast.basic lr((X comma R)) \ arrow.r ker lr(("Hom"lr((Z_n lr((X)) comma R)) arrow.r "Hom"lr((B_n lr((X)) comma R)))) arrow.r 0 $

which we then recognise as 
$ 0 arrow.r H_n lr((X comma bb(Z))) times.circle R arrow.r H_n lr((X comma R)) arrow.r "Tor"lr((H_(n minus 1) lr((X comma bb(Z))) comma R)) arrow.r 0 $
and 
$ 0 arrow.r "Ext"lr((H_(n minus 1) lr((X comma bb(Z))) comma R)) arrow.r H^ast.basic lr((X comma R)) arrow.r "Hom"lr((H_n lr((X comma bb(Z))) comma R)) arrow.r 0 $

In view of the fact that
$ dots.h arrow.r 0 arrow.r B_n lr((X)) arrow.r Z_n lr((X)) $ is a
free resolution of $H_n lr((X))$. Here, we’ve used that if
$dots.h arrow.r 0 arrow.r bb(Z)^(xor J) arrow.r^f bb(Z)^(xor I)$
is a free resolution of $A$, then
  $
  A times.circle R &eq "coker"lr((f_ast colon xor_(J) R arrow.r xor_(I) R)) \
  "Tor"lr((A comma R)) &eq ker lr((f_ast colon xor_(J) R arrow.r xor_I R)) \
"Ext"lr((A comma R)) &eq "coker"lr((f^ast colon product_I R arrow.r product_J R)) \
"Hom"lr((A comma R)) &eq ker lr((f^star.op colon product_I R arrow.r product_J R))
  $
]
#TODO a lot of stuff
#corollary[ Excision stuff ]

#endlec(11)

= Equivalence of singular and simplicial homology

#let Hsing(X, n: $ast$) = [$H_#n^"sing" (#X)$]
#let Hsimp(X, n: $ast$) = [$H_#n^"simpl"$ (#X)]
#let Hcell(X, n: $ast$) = [$H_#n^"cellular"$ (#X)]
#let Hcw(X, n: $ast$) = [$H_#n^"CW"$ (#X)]
Our next goal is to show for any space $X$, $ Hsing(X) iso Hsimp(X) $

For that we will first show $ Hsing(X) iso Hcell(X) $
where $Hcell(X) equiv Hcw(X)$ is homology for CW-complexes. 

#definition[
  A *CW-Complex* $X$ is a space $ X = union.big_(n=0)^infinity X^((n)) $
  where each $X^((n))$ is obtained from the previous $X^((n-1))$ by a pushout diagram:
// #align(center,image("imgs/2023-11-20-07-46-04.png",width:30%))
  // https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBpiBdUkANwEMAbAVxiRDQCdomBjHAOh4QA+gAoAksLABKAARQsAM0WyAIgD1CAX1LpMufIRQBGclVqMWbABrrRosAFpj06SB17seAkVPHz9MysiCC29jJuHuz63kYkpP7UgVYhnNx8giISUnIa2uYwUADm8ESgilwAtkhkIDgQSKYWQWw8ABZY7rogFRDViE31SABMUb39tUOIAMxJlsEgnWNVSLN1DYijFFpAA
#align(center, commutative-diagram(
  node-padding: (50pt, 50pt),
  node((0, 0), [$product.co_(I_n) diff D^n$]),
  node((0, 1), [$X^((n-1))$]),
  node((1, 1), [$X^((n))$]),
  node((1, 0), [$product.co_(I_n) D^n$]),
  arr((0, 0), (0, 1), [$phi$]),
  arr((0, 1), (1, 1), []),
  arr((0, 0), (1, 0), [$i$]),
  arr((1, 0), (1, 1), []),
))
  We call the subspace $X^((n))$ the  *$n$-skeleton* of $X$, and $phi$ in the diagram is called the *attaching map*.
]
#remark[
  More explicitly, $X^((n))$ is the space obtained from the disjoint union $X^((n-1)) union.sq product.co_(I_n) D^n $ by identifying each $i (y) in product.co_(I_n) D^n$ with $phi(y) in X^((n-1))$ for all $y in product.co_(I_n) diff D^n$, and equipping the resulting set with quotient topology.
  See https://www.math.ru.nl/~gutierrez/files/Lecture07.pdf
]


#definition[
  The *cellular complex* of a CW-complex $X$ is 
  $
    C_n^"CW" (X) := plus.circle.big_(I_n) ZZ
  $
  and the differential $diff^"CW" : C_(n+1)^"CW" (X) -> C_n^"CW" $ is given by a $I_(n+1) times I_n$ matrix of integers.
]
In the case of simplicial topology, all the coefficients are either $1$ or $-1$, representing the orientaion. But here it can be other integers. Suppose we have a $2$-cell and we want to attach its boundary $S^1$ to a $1$-cell, then what we do is defining a map $S^1 -> S^1$. For example, we might 'wind' the circle three times, yielding a coefficient of $3$. 

== Maps between Spheres
#definition[
  
  $
    D^n = { x in RR^n | norm(x) <= 1 } \
    S^n = diff D^(n+1) = D^n over diff D^n
  $

]

We have the #lest:
$
  ... -> tilde(H)_n (D^n) -> H_n (D^n, diff D^n) -> tilde(H)_(n-1) (diff D^n) -> tilde(H)_(n-1) (D^n) -> ...
$
which indicates $H_n (D^n, diff D^n) -> tilde(H)_(n-1) (diff D^n)$ is an isomorphism. Hence standard choices of generators for $H_n (D^n over diff D^n)$ induce corresponding choices of generators of $H_n (diff D^(n+1))$. 

We could use $Delta^n$ to define $D^n$, in which case $H_n (D^n, diff D^n)$ would have a natural generator.

#proposition[For $n >= 0$, 
  
  $
    tilde(H)_k (S^n) = cases(ZZ quad k = n, 0 quad k != n)
  $
  
]
#proof[
  Induction on $n$. 
]

#definition[
The matrix coefficient corresponding to $alpha in I_(n+1)$ and $beta in I_n$ is given by the homology of  
$
  diff D_(n+1) ->^(phi_alpha) X^((n)) arrow.r.twohead X^((n)) over X^((n-1)) = or.big_(I_n) S^n arrow.r.twohead^(pi_beta) D^n over diff D^n
$
]

== Equivalence
#proposition[
  For any space $X$, $Hsing(X) iso Hcell(X)$. ]

#proof[
  // https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZARgBoBmAXVJADcBDAGwFcYkQAJAfQAowBqYgEoABDwAaAPR59BQoaRFSZYeSKEgAvqXSZc+QinIVqdJq3bdZwscr7zFdsAFphojdt3Y8BIgFYTGgYWNkROXgEbCWk+VwclGJcAJjUPHRAMbwMiJNIk02CLMO4wW0T5NK99XxQABkCzEPYtdMzqw2RjYgLzUPDS6JU5eRaqnw6AFlJanqaw2tGMvXGiKYnZovDYqKc4kc8lrJrO0j8NvoWDtpWUMm6g3vZL0xgoAHN4IlAAMwAnCAAtkhjCAcBAkGRQfQsIx2AALCAQADWiz+gKQ9VB4MQIMKfSgWG+31R-yBiExYIhBzRZMhlMQSWppKQUyxGKZ6JxNHpfg5ZICbMQADY+RDudiAOwPOYgAlEkmcqWC3JQmHwxEo0WIAAc4qQEq1AE49TjNJRNEA
#align(center, commutative-diagram(
  node-padding: (-10pt, 30pt),
  node((3, 1), [$H_(n+1) (X^((n+1)), X^((n)) )$]),
  node((3, 3), [$H_(n) (X^((n)), X^((n-1)) )$]),
  node((3, 5), [$H_(n-1) (X^((n-1)), X^((n-2)) )$]),
  node((2, 2), [$H_n (X^((n)))$]),
  node((3, 0), []),
  node((1, 3), [$H_n (X^((n+1)))$]),
  node((0, 4), [$0$]),
  node((4, 4), [$H_(n-1) (X^((n-1)))$]),
  node((5, 3), [$0$]),
  node((1, 1), [$0$]),
  arr((2, 2), (3, 3), [], "inj"),
  arr((3, 1), (2, 2), [$diff$]),
  arr((3, 1), (3, 3), []),
  arr((3, 3), (3, 5), []),
  arr((3, 0), (3, 1), []),
  arr((2, 2), (1, 3), []),
  arr((1, 3), (0, 4), []),
  arr((3, 3), (4, 4), [$diff$]),
  arr((4, 4), (3, 5), [], "inj"),
  arr((5, 3), (4, 4), []),
  arr((1, 1), (2, 2), []),
))
#TODO 
]


#lemma[
  $iota = id_(Delta^n)$ represents a generator $H_n (Delta^n, diff Delta^n)$. 
]
#proof[
  Induction. We introduce the following notation: $ and_j^n = diff Delta^n over ("interior of the "j"-th face") $ we call it a "horn".

  Pick any $j$. 
  $
    and_j^n arrow.hook diff Delta^n arrow.hook Delta^n
  $

LES of a triple $A subset B subset C$ #TODO

  #TODO
  
]
#endlec(12)

#definition[
  The *degree* of a map $f: S^n -> S^n$  is the induced map $ f_ast: ZZ = H_n (S^n) -> H_n (S^n) = ZZ $ denoted by an integer $deg(f)$. 
]

#example[
  - $deg(id) = 1$.
  - $deg("const") =0$. 
  - $deg(z mapsto z^2)=2$ where $z in S^1$. 
  - $deg(z mapsto macron(z))=-1$ where $z in S^1$. 
  - $deg(g) = 1$ for $g in S O_(n+1)$.
]
#definition[
  The *suspension* of a space $X$ is 
  $
    Sigma X = X times [0, 1] over tilde
  $
  where $(x, 0) tilde (y, 0)$ and $(x, 1) tilde (y, 1)$ for any $x, y in X$.  
  #align(center,image("imgs/2023-11-22-23-40-25.png",width:10%)) 
  It is a functor.
]
#proposition[
  $deg(f) = deg(Sigma f)$. 
]
#proof[
  Use the M.V. LES associated to the cover 
  $
    Sigma S^n = cone^+ (S^n) union cone^- (S^n)
  $
  #align(center,image("imgs/2023-11-22-23-47-41.png",width:80%))
]

#definition[ Let $f : S^n -> S^n$ be a map. Assume $x in S^n$ is an isolated point in $f^(-1) (f(x))$.
  The *local degree* of $f$ at $x$, denoted as $deg_x (f)$, is the induced map 
  $
    ZZ = tilde(H)_n (S^n) =  H_n (S^n, S^n \\ {x}) iso H_n (U, U \\ {x}) ->^(f_ast) H_n (S^n, S^n \\ {f(x)}) = ZZ
  $
  where $U$ is a neighborhood of $x$ which isolates it in  $f^(-1) (f(x))$. @excision[Excision Theorem] is used.
]

#proposition[
  For any map $f : S^n -> S^n$ and $y in S^n$ such that $f^(-1) (y)$ is finite, then 
  $
    deg(f) = sum_(x in f^(-1) (y)) deg_x (f )
  $
]
#proof[
#align(center,image("imgs/2023-11-23-00-17-22.png",width:50%))
]

#example[
  $T^2$. #TODO
]
#endlec(13)
#pagebreak()

#bibliography("bib.yml", style: "chicago-author-date")
