### Os primeiros passos com grupos

`GAP` permite várias formas de definir grupos. O sistema já vem com algumas classes de grupos pré-definidas.
```matlab
gap> G1 := SL( 3, GF(5));
SL(3,5)
gap> G1 := SL( 3, 5);
SL(3,5)
gap> G1 := SL( 3, 5 );
SL(3,5)
gap> G1 := GL( 3, 5 );
GL(3,5)
gap> G2 := SL( 3, 5 );
SL(3,5)
gap> Order( G1 );
1488000
gap> Order( G2 );
372000
gap> S6 := SymmetricGroup( 6 );
Sym( [ 1 .. 6 ] )
gap> A6 := AlternatingGroup( 6 );
Alt( [ 1 .. 6 ] )
gap> IsSubgroup( G1, G2 );
true
gap> IsSubgroup( S6, A6 );
true
gap> IsNormal( S6, A6 );
true
gap> IsNormal( G1, G2 );
true
```

Pode também definir grupo por geradores. Os geradores podem ser objetos multiplicáveis, tipicamente usamos matrizes e permutações. Primeiro, consideremos alguns exemplos com permutações.
```matlab
gap> G := Group( (1,2), (1,2,3,4,5));
Group([ (1,2), (1,2,3,4,5) ])
gap> Size( G );
120
gap> G = SymmetricGroup( 5 );
true
gap> A := Group( (1,2,3),(3,4,5));
Group([ (1,2,3), (3,4,5) ])
gap> Size( A );
60
gap> A = AlternatingGroup( 5 );
true
gap> A = SymmetricGroup( 5 );
false
```

O grupo dihedral $D_5$ de ordem $10$ pode ser construído da forma seguinte.
```matlab
gap> D := Group( (1,2,3,4,5),(2,4)(3,5));
Group([ (1,2,3,4,5), (2,4)(3,5) ])
gap> Size( D );
60
gap> D := Group( (1,2,3,4,5),(2,5)(3,4));
Group([ (1,2,3,4,5), (2,5)(3,4) ])
gap> Size( D );
10
gap> Elements( D );
[ (), (2,5)(3,4), (1,2)(3,5), (1,2,3,4,5), (1,3)(4,5), (1,3,5,2,4), (1,4)(2,3), (1,4,2,5,3), (1,5,4,3,2), (1,5)(2,4) ]
gap> IsSubgroup( AlternatingGroup( 5 ), D );
true
gap> IsNormal( AlternatingGroup( 5 ), D );
false
```
Para ver um grupo gerado por matrizes, considere o grupo de Heisenberg sobre $\mathbb F_5$.
```matlab
gap> F := GF( 5 );
GF(5)
gap> e := One( F );
Z(5)^0
gap> mx := [[1,1,0],[0,1,0],[0,0,1]]*e;
[ [ Z(5)^0, Z(5)^0, 0*Z(5) ], [ 0*Z(5), Z(5)^0, 0*Z(5) ], [ 0*Z(5), 0*Z(5), Z(5)^0 ] ]
gap> Display( mx );
 1 1 .
 . 1 .
 . . 1
gap> my := [[1,0,0],[0,1,1],[0,0,1]]*e;
[ [ Z(5)^0, 0*Z(5), 0*Z(5) ], [ 0*Z(5), Z(5)^0, Z(5)^0 ], [ 0*Z(5), 0*Z(5), Z(5)^0 ] ]
gap> Display( my );
 1 . .
 . 1 1
 . . 1
gap> H := Group( mx, my );
Group([ [ [ Z(5)^0, Z(5)^0, 0*Z(5) ], [ 0*Z(5), Z(5)^0, 0*Z(5) ], [ 0*Z(5), 0*Z(5), Z(5)^0 ] ], 
  [ [ Z(5)^0, 0*Z(5), 0*Z(5) ], [ 0*Z(5), Z(5)^0, Z(5)^0 ], [ 0*Z(5), 0*Z(5), Z(5)^0 ] ] ])
gap> Size( H );
125
gap> Comm( mx, my );
[ [ Z(5)^0, 0*Z(5), Z(5)^0 ], [ 0*Z(5), Z(5)^0, 0*Z(5) ], [ 0*Z(5), 0*Z(5), Z(5)^0 ] ]
gap> Display( last );
 1 . 1
 . 1 .
 . . 1
gap> IsSubgroup( SL( 3, 5 ), H );
true
gap> IsNormal( SL( 3, 5 ), H );
false
```

VbRU_8/+kzP9Ek