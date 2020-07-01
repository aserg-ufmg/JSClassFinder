"
This class represents the type Identifier in the AST of an application.
"
Class {
	#name : #JSTypeIdentifier,
	#superclass : #JSType,
	#category : #'JSFamixLoader-Core'
}

{ #category : #FamixAccessors }
JSTypeIdentifier >> getCallee [
	^entityName
]

{ #category : #FamixAccessors }
JSTypeIdentifier >> getName [
	^entityName
]

{ #category : #FamixAccessors }
JSTypeIdentifier >> getParent [
	^nil
]

{ #category : #FamixAccessors }
JSTypeIdentifier >> getValue [
	^nil
]

{ #category : #FamixAccessors }
JSTypeIdentifier >> isIdentifier [
	^true
]

{ #category : #FamixAccessors }
JSTypeIdentifier >> setName: sName [
	entityName := sName. 
]
