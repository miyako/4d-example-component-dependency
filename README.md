# 4d-example-component-dependency

* A depends on B and C
* B depends on C
* C has no dependency
* HOST depends on A, B and C

**Note**; you can not have compiled circular dependency. For example, B can not depend on A which iteself depends on B.

```4d
/*
	
	A depends on B and C
	
*/

$A:=CompA.new(cs)
$AA:=$A.A()
$AB:=$A.B()
$AC:=$A.C()

/*
	
	B depends on C
	
*/

$B:=CompB.new(cs)
$BC:=$B.C()

/*
	
	C has no dependencies
	
*/

$C:=CompC.new(cs)
```
