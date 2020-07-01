Class {
	#name : #JSCallExpObject,
	#superclass : #JSCallExpression,
	#instVars : [
		'calleeConstructors'
	],
	#category : #'JSFamixLoader-Core'
}

{ #category : #accessing }
JSCallExpObject >> calleeConstructors [
	^ calleeConstructors
]

{ #category : #accessing }
JSCallExpObject >> calleeConstructors: anObject [
	calleeConstructors := anObject
]

{ #category : #accessing }
JSCallExpObject >> classification: aFunctions [
	| lstFunctionNames |
	lstFunctionNames := aFunctions collect: [ :f | f name ].
	classification := (calleeConstructors anySatisfy: [ :ca | lstFunctionNames includes: ca ]) ifTrue: [ #Class ] ifFalse:[ #OtherObj ].

]

{ #category : #accessing }
JSCallExpObject >> classificationGrade [
	(classification = #OtherObj) ifTrue: [ ^3 ].
	(classification = #Class) ifTrue: [ ^5 ].	
]
