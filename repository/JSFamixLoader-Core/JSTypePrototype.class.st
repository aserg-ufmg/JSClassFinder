"
JSTypePrototype represents prototype objects found in JavaScript source code.

For the Responsibility part: Three sentences about my main responsibility, what I'm doing, what services do I offer.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- what is the way to create instances is a plus.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	property:		<Object>
	prototype:		<Object>


    Implementation Points
"
Class {
	#name : #JSTypePrototype,
	#superclass : #JSTypeWithValue,
	#instVars : [
		'property',
		'prototype'
	],
	#category : #'JSFamixLoader-Core'
}

{ #category : #accessing }
JSTypePrototype >> getParent [
	(prototype jsOwnerFunction isNotNil)
	ifTrue: [^ prototype jsOwnerFunction parentType ]
	"ifTrue: [^ (self getNotStubVersion: prototype jsOwnerFunction) parentType ]"
	ifFalse:[^ nil ].
]

{ #category : #test }
JSTypePrototype >> isPrototype [
	^ true
]

{ #category : #accessing }
JSTypePrototype >> property [
	^ property
]

{ #category : #accessing }
JSTypePrototype >> property: anObject [
	property := anObject
]

{ #category : #accessing }
JSTypePrototype >> prototype [
	^ prototype
]

{ #category : #accessing }
JSTypePrototype >> prototype: anObject [
	prototype := anObject
]

{ #category : #accessing }
JSTypePrototype >> setValueFrom: aJSType [
	(aJSType isObjectCreate) | (aJSType isNewExpression)
	ifTrue: [
		(self prototype isNil)
		ifTrue: [ "There is a variable named prototype"
			self propValue: aJSType object.
		]
		ifFalse: [ self prototype parentObj: aJSType object ]. 
	].
	(aJSType isPrototype)  
	ifTrue: [	"prototype := anotherPrototype"
		self prototype: aJSType prototype.	
	].
	

]
