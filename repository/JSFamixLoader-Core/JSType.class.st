"
Root class representing the different types in the AST of an application (json format).
"
Class {
	#name : #JSType,
	#superclass : #Object,
	#instVars : [
		'entityName',
		'locInfo'
	],
	#category : #'JSFamixLoader-Core'
}

{ #category : #'data get/put' }
JSType class >> getLocInfo: aJSONDict fileName: currentFileName [
	"Receives a dictionary with loc info and returns an object of type JSLocInfo"
	|aStart aEnd oLocInfo aObjectNode aNodeWithLocInfo aFirstPropertyNode aLastPropertyNode |
	oLocInfo := aFirstPropertyNode := aLastPropertyNode := nil.
	(aJSONDict isNotNil)
	ifTrue: [ 
		"aNodeWithLocInfo := aObjectNode := aJSONDict. 
		[ aObjectNode isNotNil ] 
		whileTrue: [ 
			aNodeWithLocInfo := aObjectNode.
			aObjectNode := aObjectNode at: #object ifAbsent: nil. 
			(aObjectNode isNotNil)
			ifTrue: [ 
				(aFirstPropertyNode isNil)
				ifTrue: [ aFirstPropertyNode := aNodeWithLocInfo at: #property ifAbsent: nil ]
				ifFalse:[ aLastPropertyNode := aNodeWithLocInfo at: #property ifAbsent: nil ].
			].	
		].	
		aNodeWithLocInfo := (aLastPropertyNode isNil) 
									ifTrue: [ aNodeWithLocInfo at: #loc ifAbsent: nil ]
									ifFalse:[ aLastPropertyNode at: #loc ifAbsent: nil ]."
		aObjectNode := aJSONDict at: #object ifAbsent: nil.							
		aNodeWithLocInfo := (aObjectNode isNil) 
									ifTrue: [ aJSONDict at: #loc ifAbsent: nil ]
									ifFalse:[ aObjectNode at: #loc ifAbsent: nil ].							
		
		(aNodeWithLocInfo isNotNil)
		ifTrue: [ 
			aStart := aNodeWithLocInfo at: #start ifAbsent: nil. 
			aEnd := aNodeWithLocInfo at: #end ifAbsent: nil.
			"oLocInfo := JSLocInfo new."
			oLocInfo := FAMIXFileAnchor new.
			oLocInfo fileName: currentFileName,'.js'.
			oLocInfo startLine: (aStart at: #line).
			oLocInfo endLine: (aEnd at: #line).
			oLocInfo startColumn: (aStart at: #column).
			oLocInfo endColumn: (aEnd at: #column).
		].	
	].
	^ oLocInfo 
	
]

{ #category : #accessing }
JSType >> entityName [
	^ entityName
]

{ #category : #accessing }
JSType >> entityName: anObject [
	entityName := anObject
]

{ #category : #FamixAccessors }
JSType >> getCallee [
	self subclassResponsibility 
]

{ #category : #FamixAccessors }
JSType >> getName [
	self subclassResponsibility 
]

{ #category : #FamixAccessors }
JSType >> getParent [
	self subclassResponsibility 
]

{ #category : #FamixAccessors }
JSType >> getValue [
	self subclassResponsibility 
]

{ #category : #test }
JSType >> isFunctionExpression [
	^ false
]

{ #category : #test }
JSType >> isIdentifier [
	^ false
]

{ #category : #test }
JSType >> isLiteral [
	^ false
]

{ #category : #test }
JSType >> isNewExpression [
	^ false
]

{ #category : #test }
JSType >> isObjectCreate [
	^ false
]

{ #category : #test }
JSType >> isProperty [
	^ false
]

{ #category : #test }
JSType >> isPrototype [
	^ false
]

{ #category : #test }
JSType >> isThisExpression [
	^ false
]

{ #category : #test }
JSType >> isWithValue [
	^ false
]

{ #category : #accessing }
JSType >> locInfo [
	^ locInfo
]

{ #category : #accessing }
JSType >> locInfo: anObject [
	locInfo := anObject
]

{ #category : #FamixAccessors }
JSType >> setNameFrom: aJSType [
	self subclassResponsibility 
]

{ #category : #FamixAccessors }
JSType >> setParentFrom: aJSType [
	self subclassResponsibility 
]

{ #category : #FamixAccessors }
JSType >> setValueFrom: aJSType [
	self subclassResponsibility 
]
