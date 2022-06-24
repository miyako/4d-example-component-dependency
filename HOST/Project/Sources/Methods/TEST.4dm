//%attributes = {}
/*

A depends on B and C

*/

$A:=CompA.new(cs:C1710)
$AA:=$A.A()
$AB:=$A.B()
$AC:=$A.C()

/*

B depends on C

*/

$B:=CompB.new(cs:C1710)
$BC:=$B.C()

/*

C has no dependencies

*/

$C:=CompC.new(cs:C1710)