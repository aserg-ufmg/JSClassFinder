Class {
	#name : #JSCallExpFunction,
	#superclass : #JSCallExpression,
	#category : #'JSFamixLoader-Core'
}

{ #category : #accessing }
JSCallExpFunction >> classification: aFunctions [
	"OBS: functionName must be set before calling classification:"
	classification := (aFunctions anySatisfy: [ :f | f name = functionName ]) ifTrue: [ #InternalFct ] ifFalse:[ #ApiJS ].
	
]

{ #category : #accessing }
JSCallExpFunction >> classificationGrade [
	(classification = #ApiJS) ifTrue: [ ^0 ].
	(classification = #InternalFct) ifTrue: [ ^4 ].	
]
