Class {
	#name : #JSTypeFunction,
	#superclass : #JSType,
	#instVars : [
		'function'
	],
	#category : #'JSFamixLoader-Core'
}

{ #category : #accessing }
JSTypeFunction >> function [
	^ function
]

{ #category : #accessing }
JSTypeFunction >> function: anObject [
	function := anObject
]

{ #category : #FamixAccessors }
JSTypeFunction >> getCallee [
	^ self function
]

{ #category : #FamixAccessors }
JSTypeFunction >> getName [
	^ self function name
]

{ #category : #FamixAccessors }
JSTypeFunction >> getParent [
	^ self function parentType
]

{ #category : #FamixAccessors }
JSTypeFunction >> getValue [
	^ self function
]

{ #category : #test }
JSTypeFunction >> isFunctionExpression [
	^ true
]

{ #category : #FamixAccessors }
JSTypeFunction >> setNameFrom: aJSType [
	self function name: aJSType getName
]

{ #category : #FamixAccessors }
JSTypeFunction >> setParentFrom: aJSType [
	self function parentType: aJSType getParent
]
