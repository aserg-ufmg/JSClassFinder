Class {
	#name : #JSTypeLiteral,
	#superclass : #JSTypeWithValue,
	#category : #'JSFamixLoader-Core'
}

{ #category : #'as yet unclassified' }
JSTypeLiteral >> getName [
	(propValue class = FAMIXJSFunction)
	ifTrue: [ ^propValue name ]
	ifFalse:[	 ^propValue asString ].
]

{ #category : #'as yet unclassified' }
JSTypeLiteral >> getParent [
	^ nil
]

{ #category : #accessing }
JSTypeLiteral >> isLiteral [
	^true
]

{ #category : #'as yet unclassified' }
JSTypeLiteral >> setNameFrom: aJSType [
	"ignore"
]

{ #category : #'as yet unclassified' }
JSTypeLiteral >> setParentFrom: aJSType [
	"ignore"
]
