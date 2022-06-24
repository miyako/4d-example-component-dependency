Class constructor
	
	This:C1470.shouldRestart:=False:C215
	This:C1470.projectFolder:=Folder:C1567(Get 4D folder:C485(Database folder:K5:14); fk platform path:K87:2)
	
/*
	
list of dependencies
	
*/
	
	This:C1470.components:=New collection:C1472("compC")
	
/*
	
location of host's compiled components folder
	
*/
	
	This:C1470.componentsFolder:=This:C1470.projectFolder.folder("Components")
	
/*
	
location of component's compiled components folder
	
*/
	
	This:C1470.builtComponentsFolder:=This:C1470.projectFolder.parent.parent.folder("Components")
	
Function linkComponents()->$this : cs:C1710.Startup
	
	$this:=This:C1470
	
	If (Not:C34(Is compiled mode:C492))
		
		This:C1470.componentsFolder.create()
		
		var $alias : Text
		var $aliasFile : 4D:C1709.File
		var $targetFolder : 4D:C1709.Folder
		
		For each ($alias; This:C1470.components)
			$aliasFile:=This:C1470.componentsFolder.file($alias+".4dbase")
			If (Not:C34($aliasFile.isAlias))
				$targetFolder:=This:C1470.builtComponentsFolder.folder($alias+".4dbase")
				If ($targetFolder.isPackage)
					CREATE ALIAS:C694($targetFolder.platformPath; $aliasFile.platformPath)
					This:C1470.shouldRestart:=True:C214
				End if 
			End if 
		End for each 
	End if 
	
Function restartIfNecessary()
	
	If (This:C1470.shouldRestart)
		RESTART 4D:C1292
	End if 
	