Class {
	#name : #JSTypeWithValue,
	#superclass : #JSType,
	#instVars : [
		'propValue'
	],
	#category : #'JSFamixLoader-Core'
}

{ #category : #FamixAccessors }
JSTypeWithValue >> getCallee [
	(propValue class = FAMIXJSFunction)
	ifTrue: [ ^propValue ]
	ifFalse:[	 ^propValue asString ].
]

{ #category : #FamixAccessors }
JSTypeWithValue >> getName [
	^ entityName
]

{ #category : #FamixAccessors }
JSTypeWithValue >> getParent [
	^ nil
]

{ #category : #FamixAccessors }
JSTypeWithValue >> getValue [
	^ self propValue
]

{ #category : #accessing }
JSTypeWithValue >> isWithValue [
	^ true
]

{ #category : #accessing }
JSTypeWithValue >> propValue [
	^ propValue
]

{ #category : #accessing }
JSTypeWithValue >> propValue: anObject [
	propValue := anObject
]

{ #category : #FamixAccessors }
JSTypeWithValue >> setNameFrom: aJSType [
	self entityName: aJSType getName
]

{ #category : #FamixAccessors }
JSTypeWithValue >> setParentFrom: aJSType [
	"Do nothing for now"
]

{ #category : #FamixAccessors }
JSTypeWithValue >> setValueFrom: aJSType [
	aJSType isIdentifier
	ifTrue: [ self propValue: aJSType getName ]
	ifFalse:[ self propValue: aJSType getValue ]
]
