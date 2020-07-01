Class {
	#name : #JSTypeObjectCreate,
	#superclass : #JSType,
	#instVars : [
		'object'
	],
	#category : #'JSFamixLoader-Core'
}

{ #category : #'as yet unclassified' }
JSTypeObjectCreate >> getCallee [
	^ self object
]

{ #category : #'as yet unclassified' }
JSTypeObjectCreate >> getName [
	^ self object name
]

{ #category : #'as yet unclassified' }
JSTypeObjectCreate >> getParent [
	^ nil
]

{ #category : #'as yet unclassified' }
JSTypeObjectCreate >> getValue [
	^ self object
]

{ #category : #'as yet unclassified' }
JSTypeObjectCreate >> isObjectCreate [
	^ true
]

{ #category : #accessing }
JSTypeObjectCreate >> object [
	^ object
]

{ #category : #accessing }
JSTypeObjectCreate >> object: anObject [
	object := anObject
]

{ #category : #'as yet unclassified' }
JSTypeObjectCreate >> setNameFrom: aJSType [
	self object name: aJSType getName.
]

{ #category : #'as yet unclassified' }
JSTypeObjectCreate >> setParentFrom: aJSType [
	"ignore for now"
]
