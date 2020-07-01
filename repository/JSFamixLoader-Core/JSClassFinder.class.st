"
JSClassFinder is the class responsible for identifying class-like structures inside a FAMIX-JS model and creating a FAMIXClass model with the structures found.

Public API and Key Messages

- newOnJSModel: aMooseModel
- searchJSClasses   
- umlClassDiagram: aLayout
-

An example on how to create instances:
js := JSDataLoader new.
js searchJSONFiles: '/Users/leonardosilva/Dropbox/PhD/Thesis/JSClassFinder/teste'.
js1 := JSClassFinder newOnJSModel: (js model).
js1 searchJSClasses. 

Internal Representation and Key Implementation Points.

    Instance Variables
	classModel: <Moose class model> is the output model
	famixJSModel: <JSMoose model> input model


    Implementation Points
"
Class {
	#name : #JSClassFinder,
	#superclass : #Object,
	#instVars : [
		'famixJSModel',
		'classModel',
		'files'
	],
	#category : #'JSFamixLoader-Core'
}

{ #category : #'creating elements' }
JSClassFinder class >> createCollectionForJSCallExpression: aFunctionCall calleeTypes: sCalleeTypes [
	"Returns an ordered collection with the format expected for building JSCallExpressions"
	|   aArrayCSV |
	aArrayCSV := OrderedCollection new.
	aArrayCSV add: ((aFunctionCall callee isKindOf: String) 
						ifTrue: [ JSClassFinder lastSubString: (aFunctionCall callee) after: $.] 
						ifFalse:[ aFunctionCall callee name ]).
	aArrayCSV add: 'CallExpression'.
	aArrayCSV add: aFunctionCall sourceAnchor startLine.
	aArrayCSV add: aFunctionCall sourceAnchor startColumn.
	aArrayCSV add: aFunctionCall sourceAnchor endLine.
	aArrayCSV	 add: aFunctionCall sourceAnchor endColumn.
	aArrayCSV	 add: aFunctionCall sourceAnchor sourceText. "fileName"
	aArrayCSV add: sCalleeTypes.
	
	^ aArrayCSV

]

{ #category : #accessing }
JSClassFinder class >> firstNameField: sName [
	"Return the substring that comes before the first dot '.'"
	((sName indexOf: $.) > 0)
	ifTrue: [ ^ sName copyFrom: 1 to: (sName indexOf: $.) - 1 ].
	^ sName.
]

{ #category : #'search and filtering' }
JSClassFinder class >> getCollectionListOfStringTypes: sTypes [
	"Locate attribute and method names in a string with types that were identified by Facebook Flow"
	| resultList  columnPos entityName closingPos nNextComma sString objStructure intermediatePosObj  bORType |
	"Collection of different objStructures"
	resultList := OrderedCollection new. 
	"Validating the input"
	(sTypes isEmpty) ifTrue: [ ^resultList ].
	((sTypes at:1) ~= ${) ifTrue: [ ^resultList ].

	objStructure := SortedCollection new. "For the names of the entities (methods and attributes)"
	sString := sTypes.
	
	columnPos := sString indexOf: $:.

	[(columnPos + 2 <= sString size) & (columnPos > 0)]
	whileTrue: [ 
		entityName := (sString copyFrom: 2 to: columnPos-1).
		((sString at: columnPos+2) = $()
		ifTrue: [ 
			entityName := entityName,'()'.
			sString := sString copyFrom: columnPos+2 to: sString size.
			closingPos := JSClassFinder lookForPosOfTheClosing: sString. "(sString copyFrom: columnPos+2 to: sString size)."
			intermediatePosObj := (sString copyFrom: 1 to: closingPos) indexOf: ${.
			(intermediatePosObj > 0)
			ifTrue: [  
				"Recursive call"
				resultList addAll: (JSClassFinder getCollectionListOfStringTypes: (sString copyFrom: intermediatePosObj to: closingPos) ).
			].	
			"It truncs sString"
			sString := sString copyFrom: closingPos to: sString size.
		]
		ifFalse:[ 
			bORType := true.
			[ bORType ]
			whileTrue: [ "It passes inside the loop at least once"
				( ((sString at: columnPos+2) = ${) or: [ (sString at: columnPos+2) = $[ ] )
				ifTrue: [ 
					sString := sString copyFrom: columnPos+2 to: sString size.
					closingPos := JSClassFinder lookForPosOfTheClosing: sString. "(sString copyFrom: columnPos+2 to: sString size)."
				]
				ifFalse:[
					((sString copyFrom: columnPos+2 to: ((columnPos+7) min: (sString size)) ) = 'Array<') |
					((sString copyFrom: columnPos+2 to: ((columnPos+10) min: (sString size)) ) = '$Subtype<') 
					ifTrue: [ 
						sString := sString copyFrom: (sString indexOf: $<) to: sString size.
						closingPos := JSClassFinder lookForPosOfTheClosing: sString. "(sString copyFrom: columnPos+2 to: sString size)."
					]	
				   "If after the column $: we a string like 'number' or 'null'"
				   ifFalse:[ 
						sString := sString copyFrom: columnPos+2 to: sString size.
						closingPos := JSClassFinder lookForTheEndOfFirstWord: sString. 
					].
				].
				"It truncs sString"
				sString := sString copyFrom: (closingPos max: 1) to: sString size.
				"Loop test"
				((sString indexOf: $|) = 3)
				ifTrue: [ columnPos := 3 ]
				ifFalse:[ bORType := false ].
			].
		].	
		objStructure add: entityName.
		"Verifies if there are more entities and truncs sString"
		"sString := sString copyFrom: closingPos to: sString size."
		
		nNextComma := sString indexOf: $,.
		(nNextComma = 0) 
		ifTrue: [  sString := '' ]
		ifFalse:[ 
			"sString := sString copyFrom: nNextComma+1 to: sString size. 
			columnPos := sString indexOf: $:."

			[ nNextComma > 0 ] 
			whileTrue: [  
				sString := sString copyFrom: nNextComma+1 to: sString size. 
				columnPos := sString indexOf: $:. "Do not remove this line from the whileTrue loop"
				(columnPos = 0)
				ifTrue: [ nNextComma := 0. sString := ''. ]
				ifFalse:[ nNextComma := (sString copyFrom: 1 to: columnPos) indexOf: $,. ].
			].
		].
	].
	resultList add: objStructure.
	^ resultList

]

{ #category : #'search and filtering' }
JSClassFinder class >> getCollectionListOfStringTypes: sTypes lookIntoInternalObjects: bLookIntoInternalObjects [
	"Locate attribute and method names in a string with types that were identified by Facebook Flow"
	| resultList  columnPos entityName closingPos nNextComma sString objStructure intermediatePosObj |
	"Collection of different objStructures"
	resultList := OrderedCollection new. 
	"Validating the input"
	(sTypes isEmpty) ifTrue: [ ^resultList ].
	((sTypes at:1) ~= ${) ifTrue: [ ^resultList ].

	objStructure := SortedCollection new. "For the names of the entities (methods and attributes)"
	sString := sTypes.
	
	columnPos := sString indexOf: $:.

	[(columnPos + 2 <= sString size) & (columnPos > 0)]
	whileTrue: [ 
		entityName := (sString copyFrom: 2 to: columnPos-1).
		((sString at: columnPos+2) = $()
		ifTrue: [ 
			entityName := entityName,'()'.
			sString := sString copyFrom: columnPos+2 to: sString size.
			closingPos := JSClassFinder lookForPosOfTheClosing: sString. "(sString copyFrom: columnPos+2 to: sString size)."
			intermediatePosObj := (sString copyFrom: 1 to: closingPos) indexOf: ${.
			(intermediatePosObj > 0)
			ifTrue: [  
				"intermediateClosing := JSClassFinder lookForPosOfTheClosing: (sString copyFrom: intermediatePosObj to: closingPos)."
				"Recursive call"
				resultList addAll: (JSClassFinder getCollectionListOfStringTypes: (sString copyFrom: intermediatePosObj to: closingPos) lookIntoInternalObjects: bLookIntoInternalObjects).
			].	
		]
		ifFalse:[ 
			((sString at: columnPos+2) = ${) 
			ifTrue: [ 
				sString := sString copyFrom: columnPos+2 to: sString size.
				closingPos := JSClassFinder lookForPosOfTheClosing: sString. "(sString copyFrom: columnPos+2 to: sString size)."
				(bLookIntoInternalObjects)
				ifTrue: [ 
					"Recursive call"
					resultList addAll: (JSClassFinder getCollectionListOfStringTypes: (sString copyFrom: 1 to: closingPos) lookIntoInternalObjects: true).
				].	
			]
			ifFalse:[
				((sString copyFrom: columnPos+2 to: ((columnPos+7) min: (sString size)) ) = 'Array<') |
				((sString copyFrom: columnPos+2 to: ((columnPos+10) min: (sString size)) ) = '$Subtype<') 
				ifTrue: [ 
					sString := sString copyFrom: (sString indexOf: $<) to: sString size.
					closingPos := JSClassFinder lookForPosOfTheClosing: sString. "(sString copyFrom: columnPos+2 to: sString size)."
					(bLookIntoInternalObjects)
					ifTrue: [ 
						"Recursive call"
						resultList addAll: (JSClassFinder getCollectionListOfStringTypes: (sString copyFrom: 1 to: closingPos) lookIntoInternalObjects: true).
					].	
				]	
			   "If after the column $: we do not have $<, ${ neither $("
			   ifFalse:[ closingPos := columnPos+2 ].
			].
		].	
		objStructure add: entityName.
		"Verifies if there are more entities and truncs sString"
		sString := sString copyFrom: closingPos to: sString size.
		
		"To avoid the 'ORs'"
"		(sString indexOf: $| = 3)
		ifTrue: [ 
			sString := sString copyFrom: 5 to: sString size. 
			((sString at:1) = $() | ((sString at:1) = ${)
			ifTrue: [ 
				closingPos := JSClassFinder lookForPosOfTheClosing: sString. 
				(bLookIntoInternalObjects)
				ifTrue: [" 
					"Recursive call"
					"resultList addAll: (JSClassFinder getCollectionListOfStringTypes: (sString copyFrom: 1 to: closingPos) lookIntoInternalObjects: true).
				].	
			]
			ifFalse:[
				((sString copyFrom: 1 to: (6 min: (sString size)) ) = 'Array<') |
				((sString copyFrom: 1 to: (9 min: (sString size)) ) = '$Subtype<') 
				ifTrue: [ 
					sString := sString copyFrom: (sString indexOf: $<) to: sString size.
					closingPos := JSClassFinder lookForPosOfTheClosing: sString. 
					(bLookIntoInternalObjects)
					ifTrue: [ 
"						"Recursive call"
"						resultList addAll: (JSClassFinder getCollectionListOfStringTypes: (sString copyFrom: 1 to: closingPos) lookIntoInternalObjects: true).
					].	
				]	
"			   "If after the column $: we do not have $<, ${ neither $("
"			   ifFalse:[ closingPos := JSClassFinder lookForTheEndOfFirstWord: sString ].
			].
			sString := sString copyFrom: closingPos to: sString size.
		].
"		
		nNextComma := sString indexOf: $,.
		(nNextComma = 0) 
		ifTrue: [  sString := '' ]
		ifFalse:[ 
			"sString := sString copyFrom: nNextComma+1 to: sString size. 
			columnPos := sString indexOf: $:."

			[ nNextComma > 0 ] 
			whileTrue: [  
				sString := sString copyFrom: nNextComma+1 to: sString size. 
				columnPos := sString indexOf: $:. "Do not remove this line from the whileTrue loop"
				(columnPos = 0)
				ifTrue: [ nNextComma := 0. sString := ''. ]
				ifFalse:[ nNextComma := (sString copyFrom: 1 to: columnPos) indexOf: $,. ].
			].
		].
	].
	resultList add: objStructure.
	^ resultList

]

{ #category : #'search and filtering' }
JSClassFinder class >> getOuterStringTypeForFlow: sTypes [
	"Locate attribute and method names in a string with types that were identified by Facebook Flow"
	| sOuterType  columnPos entityName closingPos nNextComma sString    bORType |
	"Validating the input"
	(sTypes isEmpty) ifTrue: [ ^sTypes ].
	
	((sTypes at:1) = ${) ifFalse: [ ^sTypes ].
	
	columnPos := sTypes indexOf: $:.
	(columnPos = 0) ifTrue: [ ^sTypes ].

	sOuterType := ''. 
	sString := sTypes.

	[ columnPos + 2 <= sString size ]
	whileTrue: [ 
		entityName := (sString copyFrom: 2 to: columnPos-1).
		((sString at: columnPos+2) = $()
		ifTrue: [ 
			entityName := entityName,'()'.
			sString := sString copyFrom: columnPos+2 to: sString size.
			closingPos := JSClassFinder lookForPosOfTheClosing: sString. "(sString copyFrom: columnPos+2 to: sString size)."
			"It truncs sString"
			sString := sString copyFrom: closingPos to: sString size.
		]
		ifFalse:[ 
			bORType := true.
			[ bORType ]
			whileTrue: [ "It passes inside the loop at least once"
				( ((sString at: columnPos+2) = ${) or: [ (sString at: columnPos+2) = $[ ] )
				ifTrue: [ 
					sString := sString copyFrom: columnPos+2 to: sString size.
					closingPos := JSClassFinder lookForPosOfTheClosing: sString. "(sString copyFrom: columnPos+2 to: sString size)."
				]
				ifFalse:[
					((sString copyFrom: columnPos+2 to: ((columnPos+7) min: (sString size)) ) = 'Array<') |
					((sString copyFrom: columnPos+2 to: ((columnPos+10) min: (sString size)) ) = '$Subtype<') 
					ifTrue: [ 
						sString := sString copyFrom: (sString indexOf: $<) to: sString size.
						closingPos := JSClassFinder lookForPosOfTheClosing: sString. "(sString copyFrom: columnPos+2 to: sString size)."
					]	
				   "If after the column $: we a string like 'number' or 'null'"
				   ifFalse:[ 
						sString := sString copyFrom: columnPos+2 to: sString size.
						closingPos := JSClassFinder lookForTheEndOfFirstWord: sString. 
					].
				].
				"It truncs sString"
				sString := sString copyFrom: (closingPos max: 1) to: sString size.
				"Loop test"
				((sString indexOf: $|) = 3)
				ifTrue: [ 
					columnPos := 3. 
					"sOuterType := sOuterType, ' | '." 
				]
				ifFalse:[ bORType := false ].
			].
		].	
		sOuterType := (sOuterType isEmpty) ifTrue: [ entityName ] ifFalse: [ sOuterType, ', ', entityName ].
		
		nNextComma := sString indexOf: $,.
		(nNextComma = 0) 
		ifTrue: [  sString := '' ]
		ifFalse:[ 
			[ nNextComma > 0 ] 
			whileTrue: [  
				sString := sString copyFrom: nNextComma+1 to: sString size. 
				columnPos := sString indexOf: $:. "Do not remove this line from the whileTrue loop"
				(columnPos = 0)
				ifTrue: [ nNextComma := 0. sString := ''. ]
				ifFalse:[ nNextComma := (sString copyFrom: 1 to: columnPos) indexOf: $,. ].
			].
		].
	].
	^ sOuterType

]

{ #category : #validation }
JSClassFinder class >> isAPropertyClass: aProperty [
	"Verifies if the property is a class property (is bound to 'this' or belongs to a prototype / object)"
	^((aProperty isBoundToThis or: [ aProperty parentType class = FAMIXJSPrototype ] ) or: [ aProperty parentType class = FAMIXJSObject ]) and: [ aProperty name isNotNil ]
]

{ #category : #'string access' }
JSClassFinder class >> lastSubString: sString after: cDelimiter [
	"| posLastDelimiter |
	posLastDelimiter := sString lastIndexOf: cDelimiter.
	(posLastDelimiter = 0) ifTrue: [ ^'' ]. '' copyFrom: 1 to: 0 ''"
	^ sString copyFrom: (sString lastIndexOf: cDelimiter)+1 to: sString size.

]

{ #category : #'search and filtering' }
JSClassFinder class >> lookForPosOfTheClosing: sString [
	"Locate the position of the closing symbol for (sString at:1) inside sString"
	| closingCharacter pos nCharacter |
	"Example of sString = '{getArea: () => number, getArea2: () => number, radius: number}'"
	(sString isEmpty) ifTrue: [ ^0 ].
	pos := 1. 
	((sString at:1) = ${) 
	ifTrue: [ closingCharacter := $} ] 
	ifFalse:[ 
		((sString at:1) = $()
		ifTrue: [ closingCharacter := $) ] 
		ifFalse:[ 
			((sString at:1) = $[ )
			ifTrue: [ closingCharacter := $] ]
			ifFalse:[ 
				((sString at:1) = $< )
				ifTrue: [ closingCharacter := $> ]
				ifFalse:[ ^0 ].
			].	
		].	
	].
	nCharacter := 0.
	sString do: [ :c | 
		(c = (sString at:1)) 
		ifTrue: [ nCharacter := nCharacter + 1 ]
		ifFalse:[
			(c = closingCharacter) 
			ifTrue: [ 
				nCharacter := nCharacter - 1. 
				(nCharacter = 0)
				ifTrue: [ ^pos ].
			].
		].
		pos := pos + 1.
	].
	^0
]

{ #category : #'search and filtering' }
JSClassFinder class >> lookForTheEndOfFirstWord: sString [
	"Locate the position of the closing caracter for the first word inside sString"
	|  pos  |
	"Example of sString = 'getArea: () => number, getArea2: () => number, radius: number'"
	(sString isEmpty) ifTrue: [ ^0 ].
	pos := 0.
	[(pos+1 <= sString size) and: [(sString at:pos+1) isAlphaNumeric]]	whileTrue: [ pos := pos + 1 ].
	^pos
]

{ #category : #initialize }
JSClassFinder class >> newOnJSModel: aJSModel [
	| finder |
	finder := self new.
	finder famixJSModel: aJSModel.
	^finder
]

{ #category : #accessing }
JSClassFinder >> allClasses [
	"Returns a collections with all valid classes"
	^(classModel allWithType: FAMIXClass) 
		select: [ :c | c creationPattern ~= #singleton ] 

]

{ #category : #accessing }
JSClassFinder >> classModel [
	^ classModel
]

{ #category : #accessing }
JSClassFinder >> classModel: anObject [
	classModel := anObject
]

{ #category : #metrics }
JSClassFinder >> classUsageRatio [
	"CUR"
	^[((self numberOfMethodsWithUniqueFunctionName) + (self numberOfClasses)) / ((JSDataLoader new model: famixJSModel) numberOfFunctions)] 
		on: ZeroDivide do: [ :ex | -1 ]. 

]

{ #category : #'creating elements' }
JSClassFinder >> createJSAssociation: aSourceClass target: aTargetClass [
	| c |
	c := FAMIXReference new.
	c source: aSourceClass.
	c target: aTargetClass.
	classModel add: c.
	^c
]

{ #category : #'creating elements' }
JSClassFinder >> createJSAttribute: aProp parent: aClass [
	| c |
	c := FAMIXAttribute new.
	c name: aProp name.
	c parentType: aClass.
	c sourceAnchor: aProp locInfo. 
	c jsBEntity: aProp parentType.
	classModel add: c.
	^c
]

{ #category : #'creating elements' }
JSClassFinder >> createJSCallExpressionsForFlow: aFunctionCall stringFlow: sLineFlow [
	"Returns an instance of JSCallExpression's family according to sLineFlow and aFunctionCall"
	
	| indexMinus indexColon  sEndColumn sType  aArrayCSV calleeTypes  |
	indexColon := sLineFlow indexOf: $:. 
	((indexColon > 0) and: [ (sLineFlow at:1) ~= Character space ] )
	ifTrue: [ 
		((sLineFlow at: indexColon+1) = Character space)
		ifTrue: [ 
			indexMinus := sLineFlow indexOf: $-. 
			sEndColumn := sLineFlow copyFrom: indexMinus+1 to: indexColon-1.
		]
		ifFalse: [ 
			indexMinus := indexColon. 
			indexColon := sLineFlow lastIndexOf: $:.
			sEndColumn := sLineFlow copyFrom: indexMinus+1 to: indexColon-1.
		].		
		"(indexMinus > 0)
		ifTrue: [ sStartColumn := sLineFlow copyFrom: 1 to: indexMinus-1 ]
		ifFalse:[ sStartColumn := sEndColumn ]."
			
		sType := sLineFlow copyFrom: indexColon+2 to: (sLineFlow size).
		"FCs are selected according to line/column position."
		((aFunctionCall sourceAnchor startLine ~= aFunctionCall sourceAnchor endLine)
			or: [ sEndColumn asInteger = aFunctionCall sourceAnchor endColumn ] )
			"or: [ 
				(sStartColumn asInteger <= aFunctionCall sourceAnchor endColumn) and: [ (sEndColumn asInteger >= aFunctionCall sourceAnchor startColumn) ]
			])"
		ifTrue: [ 
			calleeTypes := self getFlowCalleeObjectType: sType.

			"Array that follows the format expected by JSCallExpressions"
			aArrayCSV := self class createCollectionForJSCallExpression: aFunctionCall calleeTypes: sType, ' ', calleeTypes.
			"aArrayCSV := OrderedCollection new.
			aArrayCSV add: ((aFunctionCall callee isKindOf: FAMIXJSFunction) 
								ifTrue: [ aFunctionCall callee name ] 
								ifFalse:[ aFunctionCall callee ]).
			aArrayCSV add: 'CallExpression'.
			aArrayCSV add: aFunctionCall sourceAnchor startLine.
			aArrayCSV add: aFunctionCall sourceAnchor startColumn.
			aArrayCSV add: aFunctionCall sourceAnchor endLine.
			aArrayCSV	 add: aFunctionCall sourceAnchor endColumn.
			aArrayCSV add: sType, ' ', calleeTypes."
			
			^ (JSCallExpression createWithValue: aArrayCSV) classification: (self getAllValidFamixJSFunctions).
		].
	].
^nil

]

{ #category : #'creating elements' }
JSClassFinder >> createJSClass: className pattern: aPattern [
	| c |
	c := FAMIXClass new.
	c name: className.
	c isStub: false.
	c creationPattern: aPattern.
	classModel add: c.
	^c
]

{ #category : #'creating elements' }
JSClassFinder >> createJSClass: aFunction pattern: aPattern package: pckName [
	| c p |
	p := self ensureJSPackage: pckName.
	c := FAMIXClass new.
	c name: aFunction name.
	c isStub: false.
	c creationPattern: aPattern.
	c jsFunction: aFunction.
	c parentPackage: p.
	classModel add: c.
	^c
]

{ #category : #'creating elements' }
JSClassFinder >> createJSClassInheritance: aSubClass super: aSuperClass [
	| c |
	c := FAMIXInheritance new.
	c subclass: aSubClass.
	c superclass: aSuperClass.
	classModel add: c.
	^c
]

{ #category : #'creating elements' }
JSClassFinder >> createJSInvocation: aSourceClass target: aTargetClass [
	| c |
	c := FAMIXInvocation new.
	c sender: aSourceClass.
	c receiver: aTargetClass.
	classModel add: c.
	^c
]

{ #category : #'creating elements' }
JSClassFinder >> createJSMethod: aProperty parent: aClass [
	| m |
	m := FAMIXMethod new.
	m name: aProperty name.
	m parentType: aClass.
	m isPublic: true.
	m jsFunction: aProperty jsValue. "aProperty jsValue is a FAMIXJSFunction"
	"m isPublic: (JSClassFinder isAPropertyClass: aProperty)."
	classModel add: m.
	^m
]

{ #category : #'creating elements' }
JSClassFinder >> createJSPackage: pckName [
	| p |
	p := FAMIXPackage new.
	p name: pckName.
	p isStub: false.
	classModel add: p.
	^p
]

{ #category : #metrics }
JSClassFinder >> dataOrientedClassRatio [
	"DOCR"
	(self numberOfClasses = 0) ifTrue: [ ^-1 ]. "This metric is not defined when NOC = 0"
	^( self allClasses 
		select: [ :c | (self numberOfAttributes: c) > (self numberOfMethods: c) ] ) size / (self numberOfClasses) 

]

{ #category : #metrics }
JSClassFinder >> depthOfInheritanceTree: aClass [
	"DIT"
	| inheritance dit |
	dit := 1.
	inheritance := aClass.
	[inheritance isNotNil]
	whileTrue: [ 
		inheritance := ((classModel allWithType: FAMIXInheritance) detect: [ :c | c subclass = inheritance] ifNone: [ nil ]).
		(inheritance isNotNil) 
		ifTrue:[ 
			inheritance := inheritance superclass. 
			dit := dit + 1.
		].
	].
	^dit	

]

{ #category : #'creating elements' }
JSClassFinder >> ensureJSAssociation: aSourceClass target: aTargetClass [
	^ (classModel allWithType: FAMIXReference) 
			detect: [ :obj | (obj source = aSourceClass) & (obj target = aTargetClass) ]
			ifNone: [ self createJSAssociation: aSourceClass target: aTargetClass ]
]

{ #category : #'creating elements' }
JSClassFinder >> ensureJSAttribute: aProp parent: aClass [
	| attName |
	attName := (aProp name indexOf: $.) > 0
		ifTrue: [ aProp name copyFrom: 1 to: (aProp name indexOf: $.) - 1 ]
		ifFalse:[ aProp name ].
	^ (classModel allWithType: FAMIXAttribute)
		detect: [ :obj | (obj name = attName) & (obj parentType = aClass) ]
		ifNone: [ self createJSAttribute: aProp parent: aClass ]
]

{ #category : #'creating elements' }
JSClassFinder >> ensureJSClass: className pattern: aPattern [
	^ (classModel allWithType: FAMIXClass) 
			detect: [ :class | (class name = className) & (class creationPattern = aPattern)]
			ifNone: [ self createJSClass: className pattern: aPattern]
]

{ #category : #'creating elements' }
JSClassFinder >> ensureJSClass: aFunction pattern: aPattern package: pckName [
	^ (classModel allWithType: FAMIXClass) 
			detect: [ :class | (class name = aFunction name) & 
									(class creationPattern = aPattern) &
									(class parentPackage name = pckName) ]
			ifNone: [ self createJSClass: aFunction pattern: aPattern package: pckName ]
]

{ #category : #'creating elements' }
JSClassFinder >> ensureJSClassInheritance: aSubClass super: aSuperClass [
	^ (classModel allWithType: FAMIXInheritance) 
			detect: [ :obj | (obj subclass = aSubClass) & (obj superclass = aSuperClass) ]
			ifNone: [ self createJSClassInheritance: aSubClass super: aSuperClass ]
]

{ #category : #'creating elements' }
JSClassFinder >> ensureJSInvocation: aSourceClass target: aTargetClass [
	^ (classModel allWithType: FAMIXInvocation) 
			detect: [ :obj | (obj sender = aSourceClass) & (obj receiver = aTargetClass) ]
			ifNone: [ self createJSInvocation: aSourceClass target: aTargetClass ]
]

{ #category : #'creating elements' }
JSClassFinder >> ensureJSMethod: aProperty parent: aClass [
	^ (classModel allWithType: FAMIXMethod) 
			detect: [ :obj | (obj name = aProperty name) & (obj parentType = aClass) ]
			ifNone: [ self createJSMethod: aProperty parent: aClass ]
]

{ #category : #'creating elements' }
JSClassFinder >> ensureJSPackage: pckName [
	^ (classModel allWithType: FAMIXPackage) 
			detect: [ :pck | (pck name = pckName) ]
			ifNone: [ self createJSPackage: pckName ]
]

{ #category : #'search and filtering' }
JSClassFinder >> existJSClass: className pattern: aPattern [
	| resultClass |
	resultClass :=  (classModel allWithType: FAMIXClass) 
			detect: [ :class | (class name = className) & (class creationPattern = aPattern) ]
			ifNone: [ nil ].
	^(resultClass isNotNil)	
]

{ #category : #'search and filtering' }
JSClassFinder >> existJSClass: className pattern: aPattern packageName: pckName [
	| resultClass |
	resultClass :=  (classModel allWithType: FAMIXClass) 
			detect: [ :class | (class name = className) & (class creationPattern = aPattern) & (class parentPackage name = pckName) ]
			ifNone: [ nil ].
	^(resultClass isNotNil)	
]

{ #category : #outputting }
JSClassFinder >> exportClassMetricsToCSV: appPath appName: appName [
	"Write metrics values, per class, for application appPath\appName, into a CSV file"

	| workingDir csvFile |
	workingDir := FileSystem disk workingDirectory.
	csvFile := workingDir / ('class-metrics-',appName,'.csv').	"Delete file if it already exists"
	csvFile exists
		ifTrue: [ csvFile delete ].	"Write CSV"
	csvFile
		writeStreamDo: [ :writeCSVStream | 
			writeCSVStream
				nextPutAll: 'CLASS;NOM;NOA';
				cr.
			self loadNewApplication: appPath name: appName.
			"Calculate metrics for each class"
			(self classModel allWithType: FAMIXClass) do: [ :each | self sendClassMetricsToStream: writeCSVStream class: each ].
			self initialize.	"Initialize instance variables"
		]
]

{ #category : #outputting }
JSClassFinder >> exportMetricsCSV: writeStream [
	"Write metrics values into writeStream"

	"SYSTEM;LOC;Files;NOF;NOC;NOM;NOA;CUR;SCUR;DOCR"
	writeStream nextPutAll: self classModel name.	"Application's name"
	writeStream
		nextPutAll: ';';
		nextPutAll: self loc asString.	"LOC"
	writeStream
		nextPutAll: ';';
		nextPutAll: self numberOfFiles asString.	"Writes number of files"
	writeStream
		nextPutAll: ';';
		nextPutAll: self numberOfFunctions asString.	"Writes number of functions"
	writeStream
		nextPutAll: ';';
		nextPutAll: self numberOfClasses asString.	"Writes NOC"
	writeStream
		nextPutAll: ';';
		nextPutAll: self numberOfMethods asString.	"Writes NOM"
	writeStream
		nextPutAll: ';';
		nextPutAll: self numberOfAttributes asString.	"Writes NOA"
	writeStream
		nextPutAll: ';=';
		nextPutAll: self classUsageRatio asString.	"Writes CUR"
	writeStream
		nextPutAll: ';=';
		nextPutAll: self subclassUsageRatio asString.	"Writes SCUR"
	writeStream
		nextPutAll: ';=';
		nextPutAll: self dataOrientedClassRatio asString.	"Writes DOCR"
	writeStream
		nextPutAll: '';
		cr	"Line delimiter"
]

{ #category : #outputting }
JSClassFinder >> exportToJSClassRefactor: appPath appName: appName [
	"Write a CSV file to be imported by JSClassRefactor"

	| workingDir csvFile |
	workingDir := FileSystem disk workingDirectory.
	csvFile := workingDir / ('class-info-',appName,'.csv').	"Delete file if it already exists"
	csvFile exists
		ifTrue: [ csvFile delete ].	"Write CSV"
	csvFile
		writeStreamDo: [ :writeCSVStream | 
			writeCSVStream
				nextPutAll: 'file;class;function;startLine;endLine;parent;type;isThisUsedBeforeSuper;callsWithoutNew;aliases;dynamicProperties;staticDataProperties;optionalFeatures';
				cr.
			self loadNewApplication: appPath name: appName.
			"Calculate metrics for each class"
			(self classModel allWithType: FAMIXClass) do: [ :each | 
				self sendJSClassRefactorInfoToStream: writeCSVStream class: each. 
				each methods do: [ :m | self sendJSClassRefactorInfoToStream: writeCSVStream method: m. ].
			].
			self initialize.	"Initialize instance variables"
		]
]

{ #category : #accessing }
JSClassFinder >> famixJSModel [
	^ famixJSModel
]

{ #category : #accessing }
JSClassFinder >> famixJSModel: anObject [
	famixJSModel := anObject
]

{ #category : #accessing }
JSClassFinder >> files [
	^ files
]

{ #category : #accessing }
JSClassFinder >> files: anObject [
	files := anObject
]

{ #category : #'search and filtering' }
JSClassFinder >> filterJSClassesNew [
	"Eliminate classes of patterns #new that do not have any public methods nor attributes and do not belong to any inheritance chain"
	| classList  |
	"Select elements to eliminate"
	classList := 
		(classModel allWithType: FAMIXClass) 
			select: [ :obj | (obj creationPattern = #new) &
				( ( (classModel allWithType: FAMIXMethod) 
					detect: [:method | (method parentType = obj) & (method isPublic)] ifNone:[ nil ]) isNil) &
				( ( (classModel allWithType: FAMIXAttribute) 
					detect: [:attr | (attr parentType = obj)] ifNone:[ nil ]) isNil) &
				( ( (classModel allWithType: FAMIXInheritance) 
					detect: [:objInheritance | 
						(objInheritance superclass = obj) | (objInheritance subclass = obj)] ifNone:[ nil ]) isNil)
					].	
	"Eliminate elements from classModel"				
	classList do: [ :objClass | classModel remove: objClass ].

]

{ #category : #'search and filtering' }
JSClassFinder >> filterJSClassesNoNewAndSingleton [
	"Eliminate classes of patterns #nonew and #singleton that do not have at least one method (public) AND do not belong to any inheritance chain"
	| classList attList |
	"Select elements to eliminate"
	classList := 
		(classModel allWithType: FAMIXClass) 
			select: [ :obj | (obj creationPattern ~= #new) &
				( ( (classModel allWithType: FAMIXMethod) 
					detect: [:method | (method parentType = obj) & (method isPublic) ] ifNone:[ nil ]) isNil) &
				( ( (classModel allWithType: FAMIXInheritance) 
					detect: [:objInheritance | 
						(objInheritance superclass = obj) | (objInheritance subclass = obj)] ifNone:[ nil ]) isNil)
					].	
	"Eliminate elements from classModel"				
	classList do: [ :objClass | 
		"Remove class from the model"
		classModel remove: objClass.
		"Look for attributes of the removed class"
		attList := (classModel allWithType: FAMIXAttribute) 	select: [ :att | att parentType = objClass ].
		"Remove attributes of the removed class"
		attList do: [ :attObj | classModel remove: attObj ].	
	].

]

{ #category : #accessing }
JSClassFinder >> functionCallsInClasses [
	"Return a list of functions calls inside classes (constructors and/or methods)"
	| callList  |
	callList := ((famixJSModel allWithType: FAMIXJSCall) select:[ :fc | fc caller class = FAMIXJSFunction ] ).
	callList := callList select: [ :fc | (self isAClassOrMethodByFunction: (fc caller)) ].
	^callList 

]

{ #category : #accessing }
JSClassFinder >> functionCallsInClassesToInternalFct [
	"Return a list with functions calls inside classes (constructors and/or methods) that calls internal functions (not fcts from API of JS nor from external sources)"
	|  classMethodCallerList resultList |
	"caller"
	classMethodCallerList := self functionCallsInClasses.
	"callee"
	resultList := OrderedCollection new.
	classMethodCallerList do: [ :fc | 
		(fc callee isKindOf: String)
		ifTrue: [ 
			fc calleeCandidates: (self locateFunctionByCalleeName: fc callee).
			(fc calleeCandidates isEmpty) 
			ifFalse:[ resultList add: fc ].
		]
		ifFalse:[ 
			(fc callee class = FAMIXJSProperty) 
			ifTrue: [ 
				(fc callee jsValue class = FAMIXJSFunction)
				ifTrue: [ 
					resultList add: fc.
					fc calleeCandidates: (OrderedCollection with: fc callee jsValue).
			 	]
				ifFalse:[
					fc calleeCandidates: (self locateFunctionByCalleeName: fc callee name).
					(fc calleeCandidates isEmpty) 
					ifFalse:[ resultList add: fc ].
				].	
			]
			ifFalse: [  
				(fc callee class = FAMIXJSFunction)
				ifTrue: [ 
					(fc callee name isNotNil) 
					ifTrue: [ 
						resultList add: fc. 
						fc calleeCandidates: (OrderedCollection with: fc callee).
					]. 
				]
				ifFalse: [ 
					MessageNotUnderstood new message: 'Type of FAMIXJSCall>>Callee not allowed';
					receiver: self;
					signal.
				].	
			].
		].	
	].
	^resultList

]

{ #category : #accessing }
JSClassFinder >> functionCallsInClassesToUniqueClassFct [
	"Return the number of functions inside classes (constructors and/or methods) that calls functions from other classes that have unique names"
	|   resultList  |
	resultList := OrderedCollection new.
	(self functionCallsInClassesToUniqueInternalFct) do: [ :fc | 
		(self isAClassOrMethodByFunction: fc calleeCandidates first)
		ifTrue: [ resultList add: fc ].
	].
	^resultList

]

{ #category : #accessing }
JSClassFinder >> functionCallsInClassesToUniqueDifferentClassFct [
	"Return the functions calls inside classes (constructors and/or methods) that calls functions from other classes that have unique names"
	|   resultList   clsCaller clsCallee |
	resultList := OrderedCollection new.
	(self functionCallsInClassesToUniqueInternalFct) do: [ :fc | 
		clsCaller := self locateClassByMethodOrConstructorFunction: fc caller.
		clsCallee := self locateClassByMethodOrConstructorFunction: fc calleeCandidates first. "calleeCandidates has only one element at this point"
		(clsCaller isNotNil) & (clsCallee isNotNil) & (clsCaller ~= clsCallee)
		ifTrue: [ resultList add: fc ].
	].
	^resultList

]

{ #category : #accessing }
JSClassFinder >> functionCallsInClassesToUniqueInternalFct [
	"Return the number of functions calls inside classes (constructors and/or methods) that calls internal functions (not fcts from API of JS nor from external sources) that have unique names"
	| resultList |
	"callee"
	resultList := OrderedCollection new.
	(self functionCallsInClassesToInternalFct) do: [ :fc | 
		(fc calleeCandidates size = 1)	
		ifTrue: [ 
			(self isAUniqueValidFunctionName: fc calleeCandidates first name)
			ifTrue: [ resultList add: fc. ].
		].
	].		
	^resultList

]

{ #category : #'search and filtering' }
JSClassFinder >> getAllOrderedFunctionCallsForFlow [
	"Returns an SortedCollection with all FAMIXJSCalls ordered by: fileName>startLine>startColumn"
	| functionCallsList   |
	functionCallsList := SortedCollection new.
	functionCallsList addAll: (famixJSModel allWithType: FAMIXJSCall).
	functionCallsList sortBlock: [ :i :j | (i locInfo fileName < j locInfo fileName) | (i locInfo startLine < j locInfo startLine) | (i locInfo endLine < j locInfo endLine) | (i locInfo startColumn < j locInfo startColumn) | (i locInfo endColumn < j locInfo endColumn) ].
	^ functionCallsList 

]

{ #category : #'search and filtering' }
JSClassFinder >> getAllValidFamixJSFunctions [
	"Returns a Collection with all FAMIXJSFunction that are not stub"
	| |
	^ (famixJSModel allWithType: FAMIXJSFunction) select: [ :f | (f isStub) not ]. 

]

{ #category : #'search and filtering' }
JSClassFinder >> getConstructorCallsWithoutNew: aFamixClass [
	"Returns a collection of FAMIXJSCalls whose callees correspond to class constructors. 
	OBS: (1) When constructors are called using the keyword 'new', they are associated with a NewExpression, instead of a CallExpression. (2) When constructors are called using 'Object.create', the callee is not the name of the class constructor."
	| |
	(aFamixClass isNil) ifTrue: [ ^ OrderedCollection new ].
	^ (famixJSModel allWithType: FAMIXJSCall) 
		select: [ :fc | fc callee = aFamixClass jsFunction name ]. 

]

{ #category : #'search and filtering' }
JSClassFinder >> getDynamicProperties: aFamixClass [
	"Returns a collection of FAMIXJSCalls whose callees begin with '__define' and the 1st parameter, that correspond to the name of the property, is not of type 'Literal' (i.e., it is only known at runtime). 
"
| |
(aFamixClass isNil) ifTrue: [ ^ OrderedCollection new ].
^ (self famixJSModel allWithType: FAMIXJSCall) 
		select: [ :fc | (fc typeOfFirstArgument ~= 'Literal') 
						 and: [ (fc callee isMemberOf: FAMIXJSProperty)  
						 		and: [ (fc callee name beginsWith: '__define')
									and: [ fc callee parentType jsOwnerFunction = aFamixClass jsFunction ] ] ] ].

]

{ #category : #'search and filtering' }
JSClassFinder >> getFlowCalleeObjectType: sType [
	"Returns a string cointaining the type of the object whose structure is in sType. This returned type will be either a class name or '[OtherObject]'"
	| cTypeCollection calleeTypes classType |
	calleeTypes := ''.
	((sType indexOf: ${) > 0)
	ifTrue: [ 
		cTypeCollection := JSClassFinder getCollectionListOfStringTypes: sType. 

		classType := (classModel allWithType: FAMIXClass) detect: [ :c |
				(cTypeCollection includes: (c jsType)) or: [ cTypeCollection includes: (c jsTypePrototype) ] 
			  ] ifNone: [ nil ].
		"'[OtherObject]' means that the callee is an object that is not an internal JS class"
		calleeTypes := (classType isNotNil)	ifTrue: [ '[', classType name, ']' ]  ifFalse:[ '[OtherObject]' ]. 
	].
^calleeTypes

]

{ #category : #'search and filtering' }
JSClassFinder >> getFunctionCallNotVisitedByLineNumber: nLine column: nColumn [
	"Returns a collection of not visited FAMIXJSCalls that are implemented in line nLine / column nColumn of the source code"
	| |
	(nLine isNil) ifTrue: [ ^ OrderedCollection new ].
	^ (famixJSModel allWithType: FAMIXJSCall) 
		select: [ :fc | ((fc locInfo startLine = nLine asInteger) 
								and: [ (fc locInfo startColumn - nColumn asInteger) abs <= 1])  "We tolerate 1 column difference"
								and: [ (fc visited) not ] ]. 

]

{ #category : #accessing }
JSClassFinder >> getJSClassTypePrototype: aClass [
	"It returns a SortedCollection containing the structure of aClass considering only prototype info. Every item in the collection is the name of a method or attribute."
	| list |
	list := SortedCollection new.
	((classModel allWithType: FAMIXMethod) 
		select: [ :m | (m parentType = aClass) and: [ ((m jsFunction isKindOf: String) not) and: [m jsFunction parentType class = FAMIXJSPrototype] ] ] ) 
		do: [ :m |  
			list add: ((m name),'()').
		].
	((classModel allWithType: FAMIXAttribute) 
		select: [ :a | (a parentType = aClass) and: [a jsBEntity class = FAMIXJSPrototype] ]) do: [ :a |  
			list add: (self class firstNameField: a name).
		].
	^ list
]

{ #category : #accessing }
JSClassFinder >> getJSClassTypeWithoutPrototype: aClass [
	"It returns a SortedCollection containing the structure of aClass (WITHOUT prototype info). Every item in the collection is the name of a method or attribute."
	| list |
	list := SortedCollection new.
	((classModel allWithType: FAMIXMethod) 
		select: [ :m | (m parentType = aClass) and: [ ((m jsFunction isKindOf: String)) or: [m jsFunction parentType class ~= FAMIXJSPrototype] ] ]) 
		do: [ :m |  
			list add: ((m name),'()').
		].
	((classModel allWithType: FAMIXAttribute) 
		select: [ :a | (a parentType = aClass) and: [a jsBEntity class ~= FAMIXJSPrototype] ]) do: [ :a |  
			list add: (self class firstNameField: a name).
		].
	^ list
]

{ #category : #accessing }
JSClassFinder >> getJSFunctionNamed: fctName [
	"Returns a collections with all valid functions"
	^	(famixJSModel allWithType: FAMIXJSFunction) 
			detect: [ :fct1 | fct1 name = fctName ]
			ifNone: [ nil ].

]

{ #category : #accessing }
JSClassFinder >> getJSFunctionProperties: aFunction lookInsideInnerFunctions: aLookInsideInnerFunctions [
	"Returns the concatenation of aFunction properties with aFunction prototype properties (when they exist)"
	| propList |
	"propList := aFunction jsProperties. 01-Mars-2016"
	propList := aFunction jsProperties select: [ :p | p isALeftSideAssignment ].
	(aLookInsideInnerFunctions)
	ifTrue: [ 
		(aFunction jsFunctions) 
		do: [ :fct | propList := propList, (fct jsProperties select: [ :p | p isALeftSideAssignment ]) ].
	].
	(aFunction jsPrototype isNotNil)
	ifTrue: [ 
		(aFunction jsPrototype jsProperties isNotNil)
		ifTrue: [ propList := propList, (aFunction jsPrototype jsProperties select: [ :p | p isALeftSideAssignment ]) ].
		(aFunction jsPrototype parentObj isNotNil)
		ifTrue: [ "Prototypes can receive objects directly"
			(aFunction jsPrototype parentObj jsBEntity isNil)
			ifTrue: [ propList := propList, (aFunction jsPrototype parentObj jsProperties select: [ :p | p isALeftSideAssignment ]) ].
		].
		(aLookInsideInnerFunctions)
		ifTrue: [ 
			(aFunction jsPrototype jsFunctions) 
			do: [ :fct | propList := propList, (fct jsProperties select: [ :p | p isALeftSideAssignment ]) ].
		].
	].
	^propList	
]

{ #category : #'search and filtering' }
JSClassFinder >> getMethodAliases: aFamixMethod [
	"Returns a collection of FAMIXMethods that point to the same function as aFamixMethod."
	| |
	(aFamixMethod isNil) ifTrue: [ ^ OrderedCollection new ].
	^ (classModel allWithType: FAMIXMethod) 
		select: [ :m | (m jsFunction = aFamixMethod jsFunction) and: [ m ~= aFamixMethod ] ]. 

]

{ #category : #'search and filtering' }
JSClassFinder >> getOptionalFeatures: aClassConstructor [
	"Returns a collection of FAMIXMethods whose filePath is different from the filePath of their class constructor. This information is exported to JSClassRefactor."
	| |
	(aClassConstructor isNil) ifTrue: [ ^ OrderedCollection new ].
	^ (classModel allWithType: FAMIXMethod) 
		select: [ :m | (m parentType = aClassConstructor)
							and: [ (m jsFunction isMemberOf: FAMIXJSFunction) 
									and: [ m jsFunction filePath ~= aClassConstructor jsFunction filePath ] ] ]. 

]

{ #category : #'search and filtering' }
JSClassFinder >> getOrderedAttributes [
	"Returns an SortedCollection with all FAMIXAttributes ordered by: fileName>startLine>startColumn"
	
	|  attList |
	attList := SortedCollection new.
	attList sortBlock: [ :i :j | (i sourceAnchor fileName < j sourceAnchor fileName) | (i sourceAnchor startLine < j sourceAnchor startLine) | (i sourceAnchor startColumn < j sourceAnchor startColumn) ].
	attList addAll: (classModel allWithType: FAMIXAttribute).
	"objs := (classModel allWithType: FAMIXAttribute)." 
"	objs do: [ :item | 
		attList add: item sourceAnchor fileName, sDelimiter, item sourceAnchor startLine asString, sDelimiter, item sourceAnchor startColumn asString, sDelimiter, item sourceAnchor endColumn asString, sDelimiter, item parentType name, sDelimiter, item name.
	]."
	^ attList

]

{ #category : #'search and filtering' }
JSClassFinder >> getOrderedFunctionCalls [
	"Returns an SortedCollection with all FAMIXJSCalls (Class -> Internal Fct that is not used to implement any class or method of the caller) ordered by: fileName>startLine>startColumn"
	
	|   functionCallsList clsCaller clsCallee |
	"Looks for the desired FCs"
	functionCallsList := SortedCollection new.
	"functionCallsList sortBlock: [ :i :j | (i locInfo fileName < j locInfo fileName) | (i locInfo startLine < j locInfo startLine) | (i locInfo startColumn < j locInfo startColumn) ]."
	(self functionCallsInClassesToInternalFct) do: [ :fc | 
		clsCaller := self locateClassByMethodOrConstructorFunction: fc caller.
		clsCallee := self locateClassByMethodOrConstructorFunction: fc calleeCandidates first. 
		(clsCaller ~= clsCallee)
		ifTrue: [ functionCallsList add: fc ].
	].
	^ functionCallsList 

]

{ #category : #'search and filtering' }
JSClassFinder >> getOrderedFunctionCallsForFlow [
	"Returns an SortedCollection with all FAMIXJSCalls (Class -> Internal Fct that is not used to implement any class or method of the caller) ordered by: fileName>startLine>startColumn"
	
	|   functionCallsList clsCaller clsCallee |
	"Looks for the desired FCs"
	functionCallsList := SortedCollection new.
	"functionCallsList sortBlock: [ :i :j | (i locInfo fileName < j locInfo fileName) | (i locInfo startLine < j locInfo startLine) | (i locInfo startColumn < j locInfo startColumn) ]."
	(self functionCallsInClassesToInternalFct) do: [ :fc | 
		(fc calleeCandidates size) > 1
		ifTrue: [ functionCallsList add: fc ]
		ifFalse:[
			clsCaller := self locateClassByMethodOrConstructorFunction: fc caller.
			clsCallee := self locateClassByMethodOrConstructorFunction: fc calleeCandidates first. 
			(clsCaller ~= clsCallee)
			ifTrue: [ functionCallsList add: fc ].
		].	
	].
	^ functionCallsList 

]

{ #category : #'search and filtering' }
JSClassFinder >> getParentClass: aFamixClass [
| inheritance |
inheritance := ((classModel allWithType: FAMIXInheritance) detect: [ :item | (item subclass = aFamixClass) ] ifNone: nil).
(inheritance isNil) ifTrue: [ ^nil ] ifFalse: [ ^inheritance superclass ].	
]

{ #category : #'search and filtering' }
JSClassFinder >> getStaticDataProperties: aFamixClass [
	"Returns a collection of FAMIXJSProperties that are class properties and whose values are not functions."
	|  |
	((aFamixClass isNil) or: [ aFamixClass jsFunction jsPrototype isNil ]) ifTrue: [ ^ OrderedCollection new ].
	^ (aFamixClass jsFunction jsPrototype jsProperties) 
	  reject: [ :p | (p jsValue isMemberOf: FAMIXJSFunction) 
					or: [ p name = 'constructor' ] ]
]

{ #category : #initialization }
JSClassFinder >> initialize [
	classModel := MooseModel new.

]

{ #category : #'user interface' }
JSClassFinder >> installOpenClassModel [
	"Installs a moose model and opens it inside the moose panel"
	|  |
	(self numberOfClasses > 0)
	ifTrue: [ 
		self classModel sourceLanguage: (FAMIXCustomSourceLanguage new name: 'JavaScript').
		self classModel install.
		MoosePanel open.
	].	
]

{ #category : #validation }
JSClassFinder >> isAClass: className [
	"Returns true if there is a class called className"
	^((classModel allWithType: FAMIXClass) detect: [ :c | (c name = className) ] ifNone: [ nil ]) isNotNil

]

{ #category : #validation }
JSClassFinder >> isAClassOrMethodByFunction: aFct [
	"Returns true if aFct belongs to a method or a class constructor"
	| auxFunction |
	auxFunction := aFct.
	[ auxFunction isNotNil and: [ auxFunction class = FAMIXJSFunction ] ]
	whileTrue: [ 
		(self locateClassByFunction: auxFunction) isEmpty 
		ifFalse: [ ^true ]
		ifTrue:[
			(self locateMethodByFunction: auxFunction) isEmpty
			ifFalse: [ ^true ].
		].
		auxFunction := auxFunction parentType.
	].
	^false	

]

{ #category : #validation }
JSClassFinder >> isAMethod: methodName class: aClass [
	"Returns true if there is a method called methodName for aClass"
	^((classModel allWithType: FAMIXMethod) detect: [ :m | (m name = methodName) & (m parentType = aClass) ] ifNone: [ nil ]) isNotNil

]

{ #category : #validation }
JSClassFinder >> isAUniqueValidFunctionName: fctName [ 
	"Returns true if there is only one function named fctName"
	^(((famixJSModel allWithType: FAMIXJSFunction) select: [ :f | (f name = fctName) & (f isStub = false) ]) size = 1)

]

{ #category : #validation }
JSClassFinder >> isAValidClass: aClass [
	"Returns true if the aClass is valid (not singleton)"
	^(aClass creationPattern ~= #singleton)
]

{ #category : #validation }
JSClassFinder >> isThisPropertyAFunction: aProperty [
	"Returns true if aProperty is a method (function) or an identifier that corresponds to a method"
	(aProperty jsValue class = FAMIXJSFunction)
	ifTrue: [ ^true ]
	ifFalse:[
		(aProperty isValueIdentifier) & (aProperty jsValue isNotNil)
		ifTrue:[ "'aProperty jsValue' can be nil here if the identifier (right side) is 'this'; e.g. 'this.a = this;'"
			((aProperty parentType findVarName: aProperty jsValue) isNotNil) 
			ifTrue: [ ^false ]
			ifFalse:[ ^((self getJSFunctionNamed: aProperty jsValue) isNotNil) ].
		].
			"
				((self getJSFunctionNamed: aProperty jsValue) isNotNil)	 ifTrue: [ ^true ] ]."	
	].
	^false
]

{ #category : #validation }
JSClassFinder >> isThisUsedBeforeSuper: aFamixClass [
| parentName fctCall |
"Parent name"
parentName := self getParentClass: aFamixClass.
(parentName isNotNil) 
ifTrue: [ 
	fctCall := (self famixJSModel allWithType: FAMIXJSCall) 
			detect: [ :fc | (fc caller = aFamixClass jsFunction) 
						 and: [ fc callee = (parentName jsFunction name, '.call') ] ] ifNone: nil.
	(fctCall isNotNil)
	ifTrue: [  
		((aFamixClass jsFunction locFirstThisExp startLine < fctCall locInfo startLine) 
		  or: [ (aFamixClass jsFunction locFirstThisExp startLine = fctCall locInfo startLine) 
				and: [ (aFamixClass jsFunction locFirstThisExp startColumn < fctCall locInfo startColumn) ]
		  ])
		ifTrue: [ ^true ].
	]
].

^false
]

{ #category : #'user interface' }
JSClassFinder >> jsApplicationName [
	"Asks the user the name of the JS app"
	| valueInputBrowser browser |
	valueInputBrowser := TextEntryDialogWindow new
		title: 'Name of the JS Application';
		textFont: StandardFonts codeFont;
		text: 'Please enter the name of your application. 
			The class model will receive the same name when created.';
		entryText: 'Name'.
		
	browser := Morph new.	
	browser asMorph openModal: valueInputBrowser.
	
	^ valueInputBrowser entryText
	

]

{ #category : #'input processing' }
JSClassFinder >> loadNewApplication: rootPath name: appName [
	"Load an aplication's AST to build the Moose models"

	| jsModelHandler |
	jsModelHandler := JSDataLoader new.
	jsModelHandler searchJSONFiles: rootPath.
	self famixJSModel: jsModelHandler model.
	self files: jsModelHandler files.
	self searchJSClasses.
	self classModel name: appName. 

]

{ #category : #metrics }
JSClassFinder >> loc [
	"It includes blank lines and comments"
	| loc |
	loc := 0.
	self files do: [ :f | loc := loc + (f endLine - f startLine + 1) ].
	^loc

]

{ #category : #'search and filtering' }
JSClassFinder >> locateClassByFunction: aFunction [
	"Locates a class by the info about the constructor function"
	^(classModel allWithType: FAMIXClass) select: [ :item | (item jsFunction = aFunction) ]	

	"| classList |
	classList := nil.
	(aFunction isNotNil)
	ifTrue: [ 
		(aFunction name isNotNil) & (aFunction isStub = false) 
		ifTrue: [ 
			classList := (classModel allWithType: FAMIXClass) 
								select: [ :item | (item name = aFunction name) ].
		].
	].
	^ classList
"
]

{ #category : #'search and filtering' }
JSClassFinder >> locateClassByFunctionLine: sStartLine [
	"Locates a FAMIXJSFunction based on the startLine (number of the line in the file)"

	^ (classModel allWithType: FAMIXClass)
		detect: [ :each | each jsFunction locInfo startLine <= sStartLine and: [ each jsFunction locInfo endLine >= sStartLine ] ]
		ifNone: [ 
			| m |
			m := (classModel allWithType: FAMIXMethod)
				detect: [ :each | 
					| fct |
					fct := each jsFunction class = FAMIXJSFunction
						ifTrue: [ each jsFunction ]
						ifFalse: [ self getJSFunctionNamed: each jsFunction ].	"(each jsFunction locInfo startLine <= sStartLine) and: [ each jsFunction locInfo endLine >= sStartLine ]. "
					fct isNotNil and: [fct locInfo startLine <= sStartLine and: [ fct locInfo endLine >= sStartLine ] ] 
				]
				ifNone: [ nil ].
			m isNil
				ifTrue: [ nil ]
				ifFalse: [ m parentType ] ]
]

{ #category : #'search and filtering' }
JSClassFinder >> locateClassByMethodOrConstructorFunction: aFct [
	"Locates a class by the info about the constructor function or any of the class' methods"
	| clsList  auxFunction |
	auxFunction := aFct.
	[ auxFunction isNotNil and: [ auxFunction class = FAMIXJSFunction ] ]
	whileTrue: [ 
		clsList := self locateClassByFunction: auxFunction.
		(clsList isEmpty)
		ifTrue: [ 
			clsList := self locateMethodByFunction: auxFunction.
			(clsList isEmpty)
			ifFalse: [ ^(clsList first parentType) ].
		]
		ifFalse:[ ^(clsList first)	].

		auxFunction := auxFunction parentType.
	].	
	^ nil

]

{ #category : #'search and filtering' }
JSClassFinder >> locateFunctionByCalleeName: calleeName [
	"Locates a function based on the name of the callee (from a FAMIXJSCall)"
	| indexOfPoint fctName |
	(calleeName isNil) | ((OrderedCollection withAll: #('Object.create' 'console.log')) includes: calleeName) 
	ifTrue: [ ^OrderedCollection new. ].
	"Remove intermediary points ($.)"
	fctName := calleeName.
	indexOfPoint := fctName indexOf: $..
	[indexOfPoint > 0]
	whileTrue: [ 
		fctName := fctName copyFrom: indexOfPoint + 1 to: fctName size. 
		indexOfPoint := fctName indexOf: $..
	].
	^(famixJSModel allWithType: FAMIXJSFunction) select: [ :item | (item name = fctName) ]


]

{ #category : #'search and filtering' }
JSClassFinder >> locateFunctionCallByLine: sStartLine column: sStartColumn [
	"Locates a FAMIXJSCall based on the startLine and startColumn"
	^ (famixJSModel allWithType: FAMIXJSCall) detect: [ :each | (each locInfo startLine = sStartLine) and: [ each locInfo startColumn = sStartColumn ] ] ifNone: [ nil ].


]

{ #category : #'search and filtering' }
JSClassFinder >> locateMethodByFunction: aFunction [
	"Locates a method by the info about the function that implements it"
	^(classModel allWithType: FAMIXMethod) select: [ :item | (item jsFunction = aFunction) ]	

]

{ #category : #metrics }
JSClassFinder >> numberOfAttributes [
	^((classModel allWithType: FAMIXAttribute) select: [ :attr | (self isAValidClass: attr parentType) = true ]) size

]

{ #category : #metrics }
JSClassFinder >> numberOfAttributes: aClass [
	"Number of Attributes (NOA) for a given class"
	(self isAValidClass: aClass)
	ifTrue: [ ^((classModel allWithType: FAMIXAttribute) select: [ :attr | (attr parentType = aClass) ]) size ]
	ifFalse:[ ^0 ].

]

{ #category : #metrics }
JSClassFinder >> numberOfClasses [
	"This metric do not consider singleton objects as classes"
	^self allClasses size

]

{ #category : #metrics }
JSClassFinder >> numberOfFiles [
	^self files size

]

{ #category : #metrics }
JSClassFinder >> numberOfFunctionCallsInClasses [
	"Return the number of functions inside classes (constructors and/or methods)"
	^self functionCallsInClasses size 

]

{ #category : #metrics }
JSClassFinder >> numberOfFunctionCallsInClassesToInternalFct [
	"Return the number of functions calls inside classes (constructors and/or methods) that calls internal functions (not fcts from API of JS nor from external sources)"
	^self functionCallsInClassesToInternalFct size

]

{ #category : #metrics }
JSClassFinder >> numberOfFunctionCallsInClassesToUniqueClassFct [
	"Return the number of functions inside classes (constructors and/or methods) that calls functions from other classes that have unique names"
	^self functionCallsInClassesToUniqueClassFct size

]

{ #category : #metrics }
JSClassFinder >> numberOfFunctionCallsInClassesToUniqueInternalFct [
	"Return the number of functions calls inside classes (constructors and/or methods) that calls internal functions (not fcts from API of JS nor from external sources) that have unique names"
	^self functionCallsInClassesToUniqueInternalFct size

]

{ #category : #metrics }
JSClassFinder >> numberOfFunctions [
	"Return the number of functions inside the model"
	^((famixJSModel allWithType: FAMIXJSFunction) select:[ :f | (f name isNotNil) & (f isStub = false) ] ) size
	"| list listObj listDel |
	list := (famixJSModel allWithType: FAMIXJSFunction) 
		select: [ :f | (f name isNotNil) & 
							(f isStub = false) ].
	listObj := list select: [ :f | (f parentType isKindOf: FAMIXJSObject) ].
	listDel := listObj select: [ :f | (f parentType jsBEntity isNil) & (f parentType name isNil) ]. 
	^(list removeAll: listDel) size."	

]

{ #category : #metrics }
JSClassFinder >> numberOfMethods [
	^((classModel allWithType: FAMIXMethod) select: [ :m | (self isAValidClass: m parentType) = true]) size

]

{ #category : #metrics }
JSClassFinder >> numberOfMethods: aClass [
	"Number of Methods (NOM) for a given class"
	(self isAValidClass: aClass)
	ifTrue: [ ^((classModel allWithType: FAMIXMethod) select: [ :m | (m parentType = aClass)]) size ]
	ifFalse:[ ^0 ].

]

{ #category : #metrics }
JSClassFinder >> numberOfMethodsWithUniqueFunctionName [

	| methods |
	methods := (classModel allWithType: FAMIXMethod) select: [ :m | (self isAValidClass: m parentType) = true].
	^ ( methods collect: [ :each | each parentType parentPackage name, '.', each parentType name, '.', each jsFunction name ] ) asSet size.

]

{ #category : #metrics }
JSClassFinder >> numberOffunctionCallsInClassesToUniqueDifferentClassFct [
	"Return the number of functions inside classes (constructors and/or methods) that calls functions from other (different) classes that have unique names"
	^self functionCallsInClassesToUniqueDifferentClassFct size

]

{ #category : #'user interface' }
JSClassFinder >> onAboutClick [
	"Handles button click event for 'About' menu option"
	| valueInputBrowser browser |
	valueInputBrowser := MessageDialogWindow new
		title: 'About';
		textFont: StandardFonts codeFont;
		text: 'JSClassFinder 
version 1.0.23'.
		
	browser := Morph new.	
	browser asMorph openModal: valueInputBrowser.	

]

{ #category : #'user interface' }
JSClassFinder >> onHelpClick [
	"Handles button click event for 'Help' option"
	| valueInputBrowser browser |
	valueInputBrowser := MessageDialogWindow new
		title: 'Help';
		textFont: StandardFonts codeFont;
		text: 'Please visit the page below to get help on how to use JSClassFinder
http://aserg.labsoft.dcc.ufmg.br/jsclasses/'.
		
	browser := Morph new.	
	browser asMorph openModal: valueInputBrowser.	

]

{ #category : #'user interface' }
JSClassFinder >> onNewAppClick [
	"Handles button click event for: 'Load New JS app'"

	| dirReference   appName aCursor |
	appName := self jsApplicationName.
	dirReference := UITheme builder chooseDirectory: 'Choose the source code (AST) directory'.
	(dirReference isNil)
		ifTrue: [ ^ self ].
	"Initializes a new moose model"	
	self initialize.	
		
	aCursor := Cursor currentCursor.
	Cursor currentCursor: Cursor wait.	
	[  "Start analysis"
		self loadNewApplication: dirReference name: appName. 
		self installOpenClassModel. 
		"jsModelHandler := JSDataLoader new.
		jsModelHandler searchJSONFiles: dirReference.
		classModelHandler := JSClassFinder newOnJSModel: jsModelHandler model.
		classModelHandler searchJSClasses.
		classModelHandler classModel name: appName." 
	] ensure: [ Cursor currentCursor: aCursor ].
		
]

{ #category : #'user interface' }
JSClassFinder >> onOpenModelClick [
	MoosePanel open.
	

]

{ #category : #initialization }
JSClassFinder >> recordTypeForClassWithoutPrototype [
	"Records the type of the class in the field jsType"
	(self classModel allWithType: FAMIXClass) do: [ :c | 
		c jsType: (self getJSClassTypeWithoutPrototype: c).
		c jsTypePrototype: (self getJSClassTypePrototype: c).
	].

]

{ #category : #'input processing' }
JSClassFinder >> scriptMultipleSystems: fileName [
	"Script to execute searchJSONFiles to all systems whose source code paths are written inside fileName."

	| scriptFile workingDir currentSystemName currentSystemPath csvFile |
	scriptFile := fileName asFileReference.
	scriptFile isFile
		ifFalse: [ ^ self ].
	workingDir := FileSystem disk workingDirectory.
	csvFile := workingDir / ('evaluation-allSystems.csv').	"Delete file if it already exists"
	csvFile exists
		ifTrue: [ csvFile delete ].	"Write CSV"
	csvFile
		writeStreamDo: [ :writeCSVStream | 
			writeCSVStream
				nextPutAll: 'SYSTEM;LOC;Files;NOF;NOC;NOM;NOA;CUR;SCUR;DOCR';
				cr.
			scriptFile
				readStreamDo: [ :stream | 
					[ stream atEnd ]
						whileFalse: [ 
							currentSystemName := stream nextLine.
							currentSystemPath := stream nextLine.
							self loadNewApplication: currentSystemPath name: currentSystemName.
							self exportMetricsCSV: writeCSVStream.
							self initialize.	"Initialize instance variables"
							Transcript
								show: 'OK Script finished execution for ';
								show: currentSystemName;
								cr ] ] ]
]

{ #category : #'input processing' }
JSClassFinder >> scriptMultipleSystemsPerClass: fileName [
	"Script to execute searchJSONFiles to all systems whose source code paths are written inside fileName."

	| scriptFile workingDir currentSystemName currentSystemPath csvFile srcPathName |
	scriptFile := fileName asFileReference.
	scriptFile isFile
		ifFalse: [ ^ self ].
	workingDir := FileSystem disk workingDirectory.
	csvFile := workingDir / ('evaluation-allSystemsPerClass.csv').	"Delete file if it already exists"
	csvFile exists
		ifTrue: [ csvFile delete ].	"Write CSV"
	csvFile
		writeStreamDo: [ :writeCSVStream | 
			writeCSVStream
				nextPutAll: 'SYSTEM;CLASS;NOM;NOA';
				cr.
			scriptFile
				readStreamDo: [ :stream | 
					[ stream atEnd ]
						whileFalse: [ 
							currentSystemName := stream nextLine.
							currentSystemPath := stream nextLine.
							"-----------------------------------------"
							srcPathName := currentSystemPath, '/src'.
							(srcPathName asFileReference) exists
							   ifTrue: [ currentSystemPath := srcPathName ].
							"------------------------------------------"
							self loadNewApplication: currentSystemPath name: currentSystemName.
							"Calculate metrics for each class"
							(self classModel allWithType: FAMIXClass) 
								do: [ :each | 
										writeCSVStream nextPutAll: currentSystemName;	nextPutAll: ';'. "Application's name"
										self sendClassMetricsToStream: writeCSVStream class: each ].
							self initialize.	"Initialize instance variables"
							Transcript
								show: 'OK Script finished execution for ';
								show: currentSystemName;
								cr ] ] ]
]

{ #category : #'input processing' }
JSClassFinder >> scriptMultipleSystemsSrcPath: fileName [
	"Script to execute searchJSONFiles to all systems whose source code paths are written inside src\fileName."

	| scriptFile workingDir currentSystemName currentSystemPath csvFile srcPathName |
	scriptFile := fileName asFileReference.
	scriptFile isFile
		ifFalse: [ ^ self ].
	workingDir := FileSystem disk workingDirectory.
	csvFile := workingDir / ('evaluation-allSrcSystems.csv').	"Delete file if it already exists"
	csvFile exists
		ifTrue: [ csvFile delete ].	"Write CSV"
	csvFile
		writeStreamDo: [ :writeCSVStream | 
			writeCSVStream
				nextPutAll: 'SYSTEM;LOC;Files;NOF;NOC;NOM;NOA;CUR;SCUR;DOCR';
				cr.
			scriptFile
				readStreamDo: [ :stream | 
					[ stream atEnd ]
						whileFalse: [ 
							currentSystemName := stream nextLine.
							currentSystemPath := stream nextLine.
							"-----------------------------------------"
							srcPathName := currentSystemPath, '/src'.
							(srcPathName asFileReference) exists
							   ifTrue: [ currentSystemPath := srcPathName ].
							"------------------------------------------"
							self loadNewApplication: currentSystemPath name: currentSystemName.
							self exportMetricsCSV: writeCSVStream.
							self initialize.	"Initialize instance variables"
							Transcript
								show: 'OK Script finished execution for ';
								show: currentSystemName;
								cr ] ] ]
]

{ #category : #'search and filtering' }
JSClassFinder >> searchDynamicJSTypes: sAranFileName source: sSourceFileName [
	""
	| lstCETypes posFileName    newCE previousCE |
	lstCETypes := OrderedCollection new.
	"allJSFunctions := famixJSModel allWithType: FAMIXJSFunction."
	"Fields position's in the CSV file format"
	"posStartLine := JSCallExpression posCSV: 'startLine'.
	posStartColumn := JSCallExpression posCSV: 'startColumn'.
	posCalleeTypes := JSCallExpression posCSV: 'calleeTypes'.
	posFunctionName := JSCallExpression posCSV: 'functionName'."
	posFileName := JSCallExpression posCSV: 'fileName'.
	
	(JSCallExpression getFullCSVCollection: sAranFileName) do: [ :each |
		( ((each at: (JSCallExpression posCSV: 'type')) = 'CallExpression') and: 
			[ (((each at:posFileName) findString: sSourceFileName startingAt: 1) > 0) or: [ (each at:posFileName) = 'EXTERNAL-FC' ] ] )
		ifTrue: [ 
			newCE := (JSCallExpression createWithValue: each) classification: (self getAllValidFamixJSFunctions).
		
			"Mark related FCs as visited"
			(self getFunctionCallNotVisitedByLineNumber: newCE startLine column: newCE startColumn) do: [ :fc | fc visited: true ].
		
			"Verifying the existence of #MultipleTypes in Aran dump"
			previousCE := (lstCETypes detect: [ :cet | 
								(cet startLine = newCE startLine) and: 
									[ (cet startColumn = newCE startColumn) and:
										[ cet functionName = newCE functionName ]
									]
							 ] ifNone: [ nil ]).	
			(previousCE isNil)		
			ifTrue: [ lstCETypes add: newCE ]	
			ifFalse:[ 
			   ( (JSCallExpression isADefinedType: newCE classification) and:
					[ (previousCE classification ~= newCE classification) or: [ previousCE calleeConstructors ~= newCE calleeConstructors ] ]
				)
				ifTrue: [
					(JSCallExpression isADefinedType: previousCE classification)
					ifTrue: [ previousCE changeClassification: #MultipleTypes ]
					ifFalse:[ lstCETypes replaceAll: previousCE with: newCE ].
				].
				
			].				
		].				
	].
		
	^ lstCETypes
]

{ #category : #'search and filtering' }
JSClassFinder >> searchJSAssociationByInstantiation: aProperty class: aClass [
	"Identifies properties that make reference to other classes by receiving new instances of these classes through new or Object.create()"
	
	|  fct targetClassList bEntity |
	(aProperty jsValue isKindOf: FAMIXJSObject) 
	ifTrue: [
		fct := nil.
		bEntity := aProperty jsValue jsBEntity.
		(bEntity isKindOf: FAMIXJSFunction)
		ifTrue: [ fct := bEntity ]
		ifFalse:[ 
			(bEntity isKindOf: FAMIXJSPrototype)
			ifTrue: [ fct := bEntity jsOwnerFunction ].
		].

		(fct isNotNil)
		ifTrue: [ 
			(fct name ~= aClass name) 
			ifTrue: [ 
				targetClassList := self locateClassByFunction: fct.
				(targetClassList isNotNil)
				ifTrue: [ 
					"It only creates a FAMIXReference if there is only one function with name = aProperty getValue jsBEntity name"
					(targetClassList size = 1)
					ifTrue: [  
						"Create FAMIXReference" 
						self ensureJSAssociation: aClass target: targetClassList first.
					].	
				].	
			].
		]. 
	].

]

{ #category : #'search and filtering' }
JSClassFinder >> searchJSAssociationByInvocation: aFunction class: aSourceClass [
	"Identifies associations through direct function calls"
	
	| targetClassList targetFunction fctList  |
	fctList := OrderedCollection new.
	fctList add: aFunction.
	fctList := (fctList union: aFunction jsFunctions).
	fctList do: [ :fct00 | 
		fct00 invocations do: [ :fct | 
			targetFunction := nil. 
			(fct parentType isKindOf: FAMIXJSPrototype)
			ifTrue: [ targetFunction := fct parentType jsOwnerFunction]
			ifFalse:[
				(fct parentType isKindOf: FAMIXJSFunction)
				ifTrue: [ targetFunction := fct parentType. ]
			].	 

			(targetFunction isNotNil)
			ifTrue: [ 
				(targetFunction name ~= aSourceClass name) 
				ifTrue: [ 
					targetClassList := self locateClassByFunction: targetFunction.
					"sourceMethod := self locateMethod: fct00 name class: aSourceClass."
					(targetClassList isNotNil) "& (sourceMethod isNotNil)"
					ifTrue: [
						"It only creates a FAMIXInvocation if there is only one function with name = aProperty getValue jsBEntity name"
						(targetClassList size = 1)
						ifTrue: [  
							"Create FAMIXInvocation" 
							self ensureJSInvocation: fct00 target: targetClassList first.
						].	
					].	
				].
			]. 
		].
	].

]

{ #category : #'search and filtering' }
JSClassFinder >> searchJSAttributes [
	"Identifies properties inside a FAMIX-JS model and creates it inside an OO model with classes and inheritance info"
	
	| objs  fctList |
	objs := (classModel allWithType: FAMIXClass). 
	objs do: [ :item | 
		"fct := (famixJSModel allWithType: FAMIXJSFunction) detect: [ :fct1 | fct1 name = item name ]. "
		fctList := (famixJSModel allWithType: FAMIXJSFunction) "select: [ :fct1 | fct1 name = item name ]. "
			select: [ :fct1 | (fct1 name = item name) & 
				((item parentPackage isNil) or: [fct1 filePath = item parentPackage name]) ].
		fctList do: [ :fct | 
			"Look for associations between classes through invocations (direct function calls)"
			self searchJSAssociationByInvocation: fct class: item.
			
			(self getJSFunctionProperties: fct lookInsideInnerFunctions: true)
			do: [ :fctProp | 	
				"Look for Associations through instantiation (with new or Object.create)"
				"<< self searchJSAssociationByInstantiation: fctProp class: item. >>"
				
				(JSClassFinder isAPropertyClass: fctProp) 
				ifTrue:[
					(self isThisPropertyAFunction: fctProp)
					ifFalse:[ "ifFalse!!" "ifFalse!!"
						(self isAMethod: fctProp name class: item)
						ifFalse:[ self ensureJSAttribute: fctProp parent: item ].
					].
				].
			].
		].
	].


]

{ #category : #'search and filtering' }
JSClassFinder >> searchJSClassInheritance [
	"Identifies inheritance inside a FAMIX-JS model and creates it inside an OO model with classes and inheritance info"
	| objs superClass subClassFct parentObj auxParentFct |
	objs := (classModel allWithType: FAMIXClass). 
	objs do: [ :item | 
		subClassFct := (famixJSModel allWithType: FAMIXJSFunction) 
			select: [ :fct | (fct name = item name) & (fct isStub = false) & (fct jsPrototype isNotNil) ]. 
		subClassFct do:[ :fctClass | 
			parentObj := fctClass jsPrototype parentObj. 
			(parentObj isNotNil) 
			ifTrue: [ 
				(parentObj jsBEntity isNotNil) 
				ifTrue:[ 
					(parentObj jsBEntity class = FAMIXJSPrototype)
					"ifTrue: [ auxParentFct := parentObj jsBEntity jsOwnerFunction ]"
					ifTrue: [ 
						auxParentFct := (famixJSModel allWithType: FAMIXJSFunction) 
							detect: [ :fct | (fct name = (parentObj jsBEntity jsOwnerFunction name)) & (fct isStub = false) ] 
							ifNone: [ parentObj jsBEntity jsOwnerFunction ].					
					]
					ifFalse:[ auxParentFct := parentObj jsBEntity ].
					((auxParentFct isStub = false) & (auxParentFct name isNotNil))
					ifTrue: [ 
					 	"superClass := self ensureJSClass: auxParentFct name pattern: #new package: auxParentFct filePath."
					 	superClass := self ensureJSClass: auxParentFct pattern: #new package: auxParentFct filePath.
						self ensureJSClassInheritance: item super: superClass.
					].			
				].	
			].
		].
	].


]

{ #category : #'search and filtering' }
JSClassFinder >> searchJSClasses [
	"Receives a FAMIX-JS model and creates another model with classes and inheritance info"
	| | 
	"Do not change the execution order for the following methods"
	self searchJSClassesFromFunctionObjects. "For objects created from a function"
	self searchJSClassesFromPrototypeObjects. "For objects created from a prototype"
	self searchJSClassesFromFunctionsWithoutNew. "For classes that were not instantiated"

	self searchJSClassInheritance. "Inheritance"
	
	self searchJSMethods. "Methods"
	self searchJSAttributes. "Attributes"

	"self searchJSClassesFromSingletonObjects." "Singletons are not considered classes!!"
	
	self filterJSClassesNoNewAndSingleton.
	self filterJSClassesNew.
	
	

]

{ #category : #'search and filtering' }
JSClassFinder >> searchJSClassesFromFunctionObjects [
	"Look for classes in objects created from functions, with 'new' or 'Object.create'"
	| objsFct fctList |
	objsFct := (famixJSModel allWithType: FAMIXJSObject) 
					select: [ :obj | (obj jsBEntity class = FAMIXJSFunction) & (obj jsBEntity name isNotNil) ].
	objsFct do: [ :item | 
		"fctList := (famixJSModel allWithType: FAMIXJSFunction) select: [ :fct | (fct name = item jsBEntity name) & (fct filePath = item jsBEntity filePath) ]."
		"We cannot compare the filePath in order to get fctList, because we have objects instantiated in one file associated to JSFunctions created in other file. IT WOULD BE GREAT TO CREATE A TEST ABLE TO SIMULATE THAT (TO DO LIST)"
		fctList := (famixJSModel allWithType: FAMIXJSFunction) select: [ :fct | (fct name = item jsBEntity name) ].
		fctList do:[ :fct | 
			(fct isStub = false)  
			"ifTrue: [ self ensureJSClass: fct name pattern: #new package: fct filePath]."
			ifTrue: [ self ensureJSClass: fct pattern: #new package: fct filePath].
		].		
	].

]

{ #category : #'search and filtering' }
JSClassFinder >> searchJSClassesFromFunctionsWithoutNew [
	"Look for classes in functions that were not instantiated (no 'new' nor 'Object.create')"
	| fctList aJSDataLoader |
	aJSDataLoader := JSDataLoader new model: famixJSModel.
	fctList := (famixJSModel allWithType: FAMIXJSFunction) 
					select: [ :fct | (fct name isNotNil) & 
						((self existJSClass: fct name pattern: #new packageName: fct filePath) = false) &
						(fct parentType class ~= FAMIXJSPrototype) &
						(fct parentType class ~= FAMIXJSObject) &
						((fct jsProperties size > 0) or: [fct jsPrototype isNotNil]) &
						((aJSDataLoader isInsideAnyNamedFunctionOrObj: fct) = false) &
						(fct isStub = false) &
						(fct isArgument = false) 
					]. 
	"fctList do:[ :fct | self ensureJSClass: fct name pattern: #nonew package: fct filePath ]."
	fctList do:[ :fct | self ensureJSClass: fct pattern: #nonew package: fct filePath ].

]

{ #category : #'search and filtering' }
JSClassFinder >> searchJSClassesFromPrototypeObjects [
	"Look for classes in objects created from functions, with 'Object.create'"
	| objProto fctList |
	objProto := (famixJSModel allWithType: FAMIXJSObject) 
					select: [ :obj | (obj jsBEntity class = FAMIXJSPrototype) ].
	objProto do: [ :item | 
		"Remember that 'jsOwnerFunction isStub' may be 'true'"
		fctList := (famixJSModel allWithType: FAMIXJSFunction) select: [ :fct | (fct name isNotNil) & (fct name = item jsBEntity jsOwnerFunction name) & (fct isStub = false) ].
		fctList do:[ :fct | 
			(fct isStub = false)
			ifTrue: [ self ensureJSClass: fct pattern: #new package: fct filePath ].
		].	
	].

]

{ #category : #'search and filtering' }
JSClassFinder >> searchJSClassesFromSingletonObjects [
	"Look for classes in objects created directly inside the source code"
	| objsFct classObj |
	objsFct := (famixJSModel allWithType: FAMIXJSObject) 
					select: [ :obj | (obj jsBEntity isNil) & (obj jsProperties isNotNil) & (obj name isNotNil) ].
	objsFct do: [ :item | 
		classObj := self ensureJSClass: item name pattern: #singleton.
		item jsProperties 
			do:[ :prop | 
				(prop jsValue class = FAMIXJSFunction)  
				"ifTrue: [ self ensureJSMethod: prop name parent: classObj ]"
				ifTrue: [ self ensureJSMethod: prop parent: classObj ]
				ifFalse:[ self ensureJSAttribute: prop parent: classObj ].
			].		
	].

]

{ #category : #'search and filtering' }
JSClassFinder >> searchJSMethods [
	"Identifies methods inside a FAMIX-JS model and creates it inside an OO model with classes and inheritance info"
	
	| objs fctList  |
	objs := (classModel allWithType: FAMIXClass). 
	objs do: [ :item | 
		fctList := (famixJSModel allWithType: FAMIXJSFunction) 
			"select: [ :fct1 | (fct1 name = item name) ]." 
			select: [ :fct1 | (fct1 name = item name) & 
				((item parentPackage isNil) or: [fct1 filePath = item parentPackage name]) ].
		fctList do: [ :fct |
			(self getJSFunctionProperties: fct lookInsideInnerFunctions: false)
			do: [ :fctProp | 	
				(JSClassFinder isAPropertyClass: fctProp) 
				ifTrue:[ 
					(self isThisPropertyAFunction: fctProp)
					ifTrue: [ self ensureJSMethod: fctProp parent: item ].
				].
			].
		].
	].

]

{ #category : #'search and filtering' }
JSClassFinder >> searchJSTypesBaselineSolution [
"COMMENTED ON 27-July-2016"
	"Apply 'the baseline solution' to classify the function calls according to the JSCallExpression"
"	| lstCETypes aFilterBlock lstFunctions sCalleeTypes aArrayCSV aClass |
	lstCETypes := OrderedCollection new.
	
	(famixJSModel allWithType: FAMIXJSCall) do: [ :each |
		sCalleeTypes := ''.  
		aFilterBlock := (each callee isKindOf: String)
			ifTrue: [ [ :f | f name = each callee ] ] ifFalse: [ [ :f | f name = each callee name ] ].
"		"Selects possible function that implement the callee"	
"		lstFunctions := ((famixJSModel allWithType: FAMIXJSFunction) select: aFilterBlock).	
		(lstFunctions isEmpty) 
		ifTrue: [  
			aFilterBlock := (each callee isKindOf: String)
				ifTrue: [ [ :f | f name = (JSClassFinder lastSubString: (each callee) after: $.) ] ] 
				ifFalse:[ [ :f | f name = (JSClassFinder lastSubString: (each callee name) after: $.) ] ].
"			"Selects possible function that implement the callee"	
"			lstFunctions := ((famixJSModel allWithType: FAMIXJSFunction) select: aFilterBlock).	
		].	
		
		(lstFunctions size > 1) 
		ifTrue: [ MultipleTypes
			lstFunctions := nil. 
			sCalleeTypes := '|'. 
		]
		ifFalse: [  	
			(lstFunctions size = 1) ifTrue: [ Functions that have unique names
				aClass := (self locateClassByMethodOrConstructorFunction: (lstFunctions at:1)).
				(aClass isNotNil) 
				ifTrue: [ 
					sCalleeTypes := '[', aClass name, ']'. 
					((lstFunctions at:1) ~= aClass jsFunction) ifTrue: [ lstFunctions add: aClass jsFunction. ].
				]. 
			].
		].	

		Array that follows the format expected by JSCallExpressions
		aArrayCSV := self class createCollectionForJSCallExpression: each calleeTypes: sCalleeTypes.
		
		lstCETypes add: ((JSCallExpression createWithValue: aArrayCSV) classification: lstFunctions ).
	].
		
	^ lstCETypes"
]

{ #category : #'search and filtering' }
JSClassFinder >> searchStaticJSTypes [
	"Looks for types infered statically for every FAMIXAttribute"
	
	|  dumpFileName f  lastFileName sLine stream next indexMinus indexColon sStartColumn sEndColumn |
	lastFileName := ''.
	stream := nil.
	(self getOrderedAttributes) do: [ :item |
		f := item sourceAnchor fileName.
		"In the cmd below -> copyFrom: 8 because the name of the file in 'f' comes with 'File @ ' in the beginning"
		dumpFileName := ((f copyFrom: 8 to: (f indexOf: $.)), 'dump').
		(lastFileName = dumpFileName) 
		ifFalse:[ 
			(lastFileName = '') ifFalse:[ stream close. ].
			lastFileName := dumpFileName. 
			"open dump file"
			stream := dumpFileName asFileReference readStream.
		]. 
		"Get info about line and column"
		sLine := ':', item sourceAnchor startLine asString, ':'. ",item sourceAnchor startColumn asString."
		sStartColumn := sEndColumn := '0'.
		[(sStartColumn asInteger <= item sourceAnchor startColumn) & (sEndColumn asInteger >= item sourceAnchor endColumn)]	
		whileFalse: [ 
			stream upToAll: sLine.
			next := stream nextLine.
			indexMinus := next indexOf: $-. 
			indexColon := next indexOf: $:.
			(indexMinus = 0) 
			ifTrue: [ 
				sStartColumn := next copyFrom: 1 to: indexColon-1. 
				sEndColumn := sStartColumn. 
			]
			ifFalse:[ 
				sStartColumn := next copyFrom: 1 to: indexMinus-1. 
				sEndColumn := next copyFrom: indexMinus+1 to: indexColon-1.
			].
		].
		Transcript show: 'Class: ', item parentType name, ' - Attribute: ', item name, ' - Type: ', (next copyFrom: indexColon+1 to: (next size)); cr.
		"]] 	ensure: [stream close]."
	].
	(stream isNil) ifFalse:[	stream close. ].


]

{ #category : #'search and filtering' }
JSClassFinder >> searchStaticJSTypes: aList [
	"Looks for types infered statically for every item in aList"
	
	|  dumpFileName f  lastFileName sLine stream next indexMinus indexColon sStartColumn sEndColumn sType cTypeCollection resultList currentClass |
	resultList := OrderedCollection new. "OrderedCollection new."
	"Get the types (strings in a SortedCollection) of all classes"
	self recordTypeForClassWithoutPrototype. 
	"Look for the structures in the dump file"
	lastFileName := ''.
	stream := nil.
	aList do: [ :item |
		"Gets the (current) class that implements the caller"
		currentClass := (self locateClassByMethodOrConstructorFunction: item caller).
		"Gets the file name that implements the caller"
		f := item sourceAnchor fileName.
		"In the cmd below -> copyFrom: 8 because the name of the file in 'f' comes with 'File @ ' in the beginning"
		dumpFileName := ((f copyFrom: 8 to: (f indexOf: $.)), 'dump').
		(lastFileName = dumpFileName) 
		ifFalse:[ 
			(lastFileName = '') ifFalse:[ stream close. ].
			lastFileName := dumpFileName. 
			"open dump file"
			stream := dumpFileName asFileReference readStream.
		]. 
		"Get info about line and column"
		sLine := ':', item sourceAnchor startLine asString, ':'. ",item sourceAnchor startColumn asString."
		sStartColumn := sEndColumn := '0'.
		"next := ''."
		stream upToAll: sLine.
		next := stream nextLine.
		"When (next at:1) = Character space), it means that the number found corresponds to a column number and not a line one"
		[(next isNotNil) & ((resultList includes: item) not)]	
		whileTrue: [ 
			indexColon := next indexOf: $:.
			(indexColon > 0) & ((next at: indexColon+1) = Character space) & ((next at:1) ~= Character space) 
			ifTrue: [ 
				indexMinus := next indexOf: $-. 
				sEndColumn := next copyFrom: indexMinus+1 to: indexColon-1.
				(indexMinus > 0)
				ifTrue: [ sStartColumn := next copyFrom: 1 to: indexMinus-1 ]
				ifFalse:[ sStartColumn := sEndColumn ].
			
				sType := next copyFrom: indexColon+2 to: (next size).
				"We add 2 to endColumn to adjust the end column Flow considers with the one Esprima considers"
				"((sType indexOf: ${) > 0) & (sStartColumn asInteger >= item sourceAnchor startColumn) & 
				(
					(item sourceAnchor startLine ~= item sourceAnchor endLine) | (sEndColumn asInteger <= ((item sourceAnchor endColumn)+2)) 
				)"
				( ((sType indexOf: ${) > 0) 
				and: [
					(item sourceAnchor startLine ~= item sourceAnchor endLine)
					or: [ 
						(sStartColumn asInteger <= item sourceAnchor endColumn) and: [ (sEndColumn asInteger >= item sourceAnchor startColumn) ]
					]
				] )	
				ifTrue: [ 
					cTypeCollection := JSClassFinder getCollectionListOfStringTypes: sType. "lookIntoInternalObjects: false."

					(classModel allWithType: FAMIXClass) do: [ :c |
						(c ~= currentClass)
						ifTrue: [ 
							(cTypeCollection includes: c jsType) | (cTypeCollection includes: c jsTypePrototype)
							ifTrue: [ resultList add: item ]. 
						].
					].
				].
			].
			stream upToAll: sLine.
			next := stream nextLine.
			(next isNil) ifTrue: [ stream reset. ]
		].
		"]] 	ensure: [stream close]."
	].
	(stream isNotNil) ifTrue:[	stream close. ].
		
^resultList

]

{ #category : #'search and filtering' }
JSClassFinder >> searchStaticJSTypesForFlow: aList [
	"Looks for types infered statically for every item in aList"
	
	|  dumpFileName f  lastFileName sLine stream next  sLineNext resultList  ce   itemUsed |
	resultList := OrderedCollection new. "OrderedCollection new."
	"Get the types (strings in a SortedCollection) of all classes"
	self recordTypeForClassWithoutPrototype. 
	"Look for the structures in the dump file"
	lastFileName := sLineNext := ''.
	stream := next := nil.
	aList do: [ :item | 
		"Gets the (current) class that implements the caller"
		"--- currentClass := (self locateClassByMethodOrConstructorFunction: item caller). ---"
		"Gets the file name that implements the caller"
		f := item sourceAnchor fileName.
		"In the cmd below -> copyFrom: 8 because the name of the file in 'f' comes with 'File @ ' in the beginning"
		dumpFileName := ((f copyFrom: 8 to: (f lastIndexOf: $.)), 'dump').
		(lastFileName = dumpFileName) 
		ifFalse:[ 
			(lastFileName = '') ifFalse:[ stream close. ].
			lastFileName := dumpFileName. 
			"open dump file"
			stream := dumpFileName asFileReference readStream.
		]. 
		"Get info about line and column"
		sLine := ':', item sourceAnchor startLine asString, ':'. ",item sourceAnchor startColumn asString."
		
		((next isNil) or: [ sLineNext ~= sLine ])
		ifTrue: [ 
			stream upToAll: sLine.
			next := stream nextLine.
			(next isNil) 
			ifTrue: [ stream reset ].
			sLineNext := sLine.
		].	

		itemUsed := false.
		
		"[ next isNotNil ]"	
		[ (next isNotNil) and: [ sLineNext = sLine ] ]	
		whileTrue: [  
			ce := self createJSCallExpressionsForFlow: item stringFlow: next.
			(ce isNil)
			ifTrue: [ 
				"stream upToAll: sLine." "commented on 15-August-2016"
				next := stream nextLine.
				(next isNil) 
				ifTrue: [ stream reset. ]
				ifFalse:[
					"It separates line coordinate inside 'sLineNext' and the rest of the string inside 'next'"
					"For example, if next = 'ghost-0.9.0.js:877:22-46:', then next will be '22-46:' and sLineNext will be ':877:'"
					sLineNext := (next readStream upToAll: '.js:'; nextLine).
					sLineNext := ':', (sLineNext copyFrom:1 to: (sLineNext indexOf: $:)).
					next := (next readStream upToAll: sLineNext; nextLine).
				].	
			]
			ifFalse: [ 
				(JSCallExpression isCallExpressionPresent: ce collection: resultList)
				ifFalse:[ resultList add: ce ].
				next := nil. itemUsed := true.
			].	

			"stream upToAll: sLine.
			next := stream nextLine.
			(next isNil) ifTrue: [ stream reset. ]"
		]. (itemUsed) ifFalse: [ resultList add: (JSCallExpression createForFlowUndefined: item) ].
		"]] 	ensure: [stream close]."
	].
	(stream isNotNil) ifTrue:[	stream close. ].
		
^resultList

]

{ #category : #outputting }
JSClassFinder >> sendClassMetricsToStream: writeStream class: aFamixClass [
	"Write metrics values for class aFamixClass into writeStream"

	"CLASS;NOM;NOA"
	writeStream nextPutAll: aFamixClass name.	"Class' name"
	writeStream
		nextPutAll: ';';
		nextPutAll: (self numberOfMethods: aFamixClass) asString.	"Writes NOM"
	writeStream
		nextPutAll: ';';
		nextPutAll: (self numberOfAttributes: aFamixClass) asString.	"Writes NOA"
	writeStream
		nextPutAll: '';
		cr	"Line delimiter"
]

{ #category : #outputting }
JSClassFinder >> sendJSClassRefactorInfoToStream: writeStream class: aFamixClass [
	"Write class info into writeStream"
	| sThisBeforeSuper parentClass |
	"file;class;function;startLine;endLine;parent;type;isThisUsedBeforeSuper;callsWithoutNew"
	writeStream nextPutAll: aFamixClass jsFunction filePath.
	writeStream
		nextPutAll: ';';
		nextPutAll: aFamixClass name.	
	writeStream
		nextPutAll: ';';
		nextPutAll: aFamixClass jsFunction name.	
	writeStream
		nextPutAll: ';';
		nextPutAll: aFamixClass jsFunction locInfo startLine asString.	
	writeStream
		nextPutAll: ';';
		nextPutAll: aFamixClass jsFunction locInfo endLine asString.	
	parentClass := 	self getParentClass: aFamixClass.	
	writeStream
		nextPutAll: ';';
		nextPutAll: ((parentClass isNotNil) ifTrue: [parentClass name] ifFalse: ['']).	
	writeStream
		nextPutAll: ';';
		nextPutAll: 'constructor'.	
	sThisBeforeSuper := ((self isThisUsedBeforeSuper: aFamixClass) ifTrue: ['YES'] ifFalse: ['NO']).
	writeStream
		nextPutAll: ';';
		nextPutAll: sThisBeforeSuper.	
	writeStream
		nextPutAll: ';';
		nextPutAll: (self getConstructorCallsWithoutNew: aFamixClass) size asString.	
	writeStream
		nextPutAll: ';';
		nextPutAll: ''.	
	writeStream
		nextPutAll: ';';
		nextPutAll: (self getDynamicProperties: aFamixClass) size asString.	
		"nextPutAll: ((self isThereADynamicProperty: aFamixClass) ifTrue: ['YES'] ifFalse: ['NO'])."	
	writeStream
		nextPutAll: ';';
		nextPutAll: (self getStaticDataProperties: aFamixClass) size asString.	
	writeStream  "numberOfOptionalFeatures"
		nextPutAll: ';';
		nextPutAll: (self getOptionalFeatures: aFamixClass) size asString.	
	writeStream
		nextPutAll: '';
		cr	"Line delimiter"
]

{ #category : #outputting }
JSClassFinder >> sendJSClassRefactorInfoToStream: writeStream method: aFamixMethod [
	"Write class info into writeStream"
	| parentClass |
	"file;class;function;startLine;endLine;parent;type;isThisUsedBeforeSuper,callsWithoutNew"
	writeStream nextPutAll: ((aFamixMethod jsFunction isMemberOf: FAMIXJSFunction) ifTrue: [ aFamixMethod jsFunction filePath] ifFalse: [aFamixMethod jsFunction]).
	writeStream
		nextPutAll: ';';
		nextPutAll: aFamixMethod parentType name.	
	writeStream
		nextPutAll: ';';
		nextPutAll: aFamixMethod name.	
	writeStream
		nextPutAll: ';';
		nextPutAll: ((aFamixMethod jsFunction isMemberOf: FAMIXJSFunction) ifTrue: [ aFamixMethod jsFunction locInfo startLine asString] ifFalse: ['']).	
	writeStream
		nextPutAll: ';';
		nextPutAll: ((aFamixMethod jsFunction isMemberOf: FAMIXJSFunction) ifTrue: [ aFamixMethod jsFunction locInfo endLine asString] ifFalse: ['']).	
	parentClass := 	self getParentClass: aFamixMethod parentType.	
	writeStream
		nextPutAll: ';';
		nextPutAll: ((parentClass isNotNil) ifTrue: [parentClass name] ifFalse: ['']).	
	writeStream
		nextPutAll: ';';
		nextPutAll: 'method'.	
	writeStream  "isThisUsedBeforeSuper"
		nextPutAll: ';';
		nextPutAll: ''.	
	writeStream  "callsWithoutNew"
		nextPutAll: ';';
		nextPutAll: ''.	
	writeStream  "numberOfAliases"
		nextPutAll: ';';
		nextPutAll: (self getMethodAliases: aFamixMethod) size asString.	
	writeStream  "isThereADynamicProperty"
		nextPutAll: ';';
		nextPutAll: ''.	
	writeStream  "numberOfStaticDataProperties"
		nextPutAll: ';';
		nextPutAll: ''.	
	writeStream  "numberOfOptionalFeatures"
		nextPutAll: ';';
		nextPutAll: ''.	
	writeStream
		nextPutAll: '';
		cr	"Line delimiter"
]

{ #category : #initialization }
JSClassFinder >> setAllFunctionCallsUnvisited [
	"Set false to all FAMIXJSCall>>visited"
	(self famixJSModel allWithType: FAMIXJSCall) do: [ :fc | fc visited: false ].

]

{ #category : #'user interface' }
JSClassFinder >> showUI [
	"User interface with menu options"
	| builder contain  gifPath forms |
	gifPath :=  'JSClassFinderUI-Theme.png' asFileReference.
	forms := gifPath readStreamDo: [ :in | (PNGReadWriter on: in) nextImage ]. 
	
   builder := UITheme builder.
   contain := builder newColumn: {builder newRow: {
					builder newButtonFor: self action: #onNewAppClick label: 'Load New JavaScript Application'  help: 'Load AST in JSON format'.
					builder newButtonFor: self action: #onOpenModelClick label: 'Open Models'  help: 'Open Moose Panel'.
					builder newButtonFor: self action: #onHelpClick label: 'Help'  help: 'Help'.
					builder newButtonFor: self action: #onAboutClick label: 'About'  help: 'About'
				}.
		 		builder newColumn: { builder newImage: forms }.
		}.
   
    (contain  openInWindowLabeled: 'Reverse Engineering Tool for JS Applications') extent: 620@600.
]

{ #category : #metrics }
JSClassFinder >> subclassUsageRatio [
	"SCUR"
	(self numberOfClasses <= 1) ifTrue: [ ^-1 ]. "This metric is not defined when NOC <= 1"
	^(self allClasses 
		select: [ :c | (self depthOfInheritanceTree: c) >= 2 ] ) size / (self numberOfClasses - 1) 

]

{ #category : #outputting }
JSClassFinder >> transcriptShowClassElements [
	"List the class elements inside the transcript window"

	| i |
	Transcript clear.
	(classModel allWithType: FAMIXClass)
	do: [ :aClass |  
		Transcript show: 'CLASS: ',aClass name, ' pattern: ', aClass creationPattern; cr.
		i := 0.
		((classModel allWithType: FAMIXInheritance) select:[ :aInher | aInher superclass = aClass])
		do: [ :aInher | 
			(i = 0) ifTrue: [ Transcript show: 'Children:';cr. i := 1. ].
			Transcript show: '      ',aInher subclass name; cr. 
		].
		i := 0.
		((classModel allWithType: FAMIXInheritance) select:[ :aInher | aInher subclass = aClass])
		do: [ :aInher | 
			(i = 0) ifTrue: [ Transcript show: 'Parent:';cr. i := 1. ].
			Transcript show: '      ',aInher superclass name; cr. 
		].
		i := 0.
		((classModel allWithType: FAMIXAttribute) select:[ :aField | aField parentType = aClass])
		do: [ :aField | 
			(i = 0) ifTrue: [ Transcript show: 'Fields:';cr. i := 1. ].
			Transcript show: '      ',aField name; cr. 
		].
		i := 0.
		((classModel allWithType: FAMIXMethod) select:[ :aMethod | aMethod parentType = aClass])
		do: [ :aMethod | 
			(i = 0) ifTrue: [ Transcript show: 'Methods:';cr. i := 1. ].
			Transcript show: '      ',aMethod name; cr. 
		].
		Transcript show: '';cr. 
	].
]

{ #category : #outputting }
JSClassFinder >> umlClassDiagram: layout [
	"Build a UML class diagram based on classModel."
	"<layout> can be lTree for treeLayout or anything else for gridLayout"

	| b | 
	b := RTUMLClassBuilder new.
	b instanceVariables: #attributes.
	b methodselector: #nameWithNoVisibility.
	b methodsNames: #methods.   
	b attributeselector: #nameWithLabel.
	b lineShape arrowedLine inverted.
	b lineShape shape head: RTEmptyArrowHead new.
	(b lineShape) if: true color: Color black.
   b addObjects: classModel allClasses.
	(layout = #lTree)	ifTrue: [ b layout tree ]	ifFalse:[ b gridLayout ].
	b methodShape label color: Color black.       
   b attributeShape label color: Color black.
   b shape label color: Color black.			

	b build.
	^b view.
]
