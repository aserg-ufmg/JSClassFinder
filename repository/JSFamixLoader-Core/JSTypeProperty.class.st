Class {
	#name : #JSTypeProperty,
	#superclass : #JSTypeWithValue,
	#instVars : [
		'jsProperty'
	],
	#category : #'JSFamixLoader-Core'
}

{ #category : #FamixAccessors }
JSTypeProperty >> getCallee [
	^ self jsProperty
]

{ #category : #FamixAccessors }
JSTypeProperty >> getName [
	^ self jsProperty name
]

{ #category : #FamixAccessors }
JSTypeProperty >> getParent [
	^ self jsProperty parentType
]

{ #category : #FamixAccessors }
JSTypeProperty >> getValue [
	^ self jsProperty jsValue
]

{ #category : #test }
JSTypeProperty >> isProperty [
	^ true
]

{ #category : #accessing }
JSTypeProperty >> jsProperty [
	^ jsProperty
]

{ #category : #accessing }
JSTypeProperty >> jsProperty: anObject [
	jsProperty := anObject
]

{ #category : #FamixAccessors }
JSTypeProperty >> setValueFrom: aJSType [
	aJSType isIdentifier
	ifTrue: [ 
		self jsProperty jsValue: aJSType getName. 
		self jsProperty isValueIdentifier: true.
	]
	ifFalse:[ self jsProperty jsValue: aJSType getValue ]	
]
