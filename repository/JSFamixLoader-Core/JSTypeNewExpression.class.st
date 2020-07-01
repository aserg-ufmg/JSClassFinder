Class {
	#name : #JSTypeNewExpression,
	#superclass : #JSType,
	#instVars : [
		'object'
	],
	#category : #'JSFamixLoader-Core'
}

{ #category : #FamixAccessors }
JSTypeNewExpression >> getCallee [
	^ self object jsBEntity
]

{ #category : #FamixAccessors }
JSTypeNewExpression >> getName [
	^ self object name
]

{ #category : #FamixAccessors }
JSTypeNewExpression >> getParent [
	^ nil
]

{ #category : #FamixAccessors }
JSTypeNewExpression >> getValue [
	^ self object
]

{ #category : #test }
JSTypeNewExpression >> isNewExpression [
	^true
]

{ #category : #accessing }
JSTypeNewExpression >> object [
	^ object
]

{ #category : #accessing }
JSTypeNewExpression >> object: anObject [
	object := anObject
]

{ #category : #FamixAccessors }
JSTypeNewExpression >> setNameFrom: aJSType [
	self object name: aJSType getName
]

{ #category : #FamixAccessors }
JSTypeNewExpression >> setParentFrom: aJSType [
	"ignore for now"
]
