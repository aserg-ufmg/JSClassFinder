"
JSFile: class that represents a JavaScript file (.js)

Public API and Key Messages

- message one   
- message two 
- what is the way to create instances is a plus.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	endLine:	 number of the last line (source code).
	fileName: name of the js file.
	startLine: number of the first line (source code) in the file. 

endLine - startLine + 1 = LOC (number of lines of code)

    Implementation Points
"
Class {
	#name : #JSFile,
	#superclass : #Object,
	#instVars : [
		'fileName',
		'startLine',
		'endLine'
	],
	#category : #'JSFamixLoader-Core'
}

{ #category : #accessing }
JSFile >> endLine [
	^ endLine
]

{ #category : #accessing }
JSFile >> endLine: anObject [
	endLine := anObject
]

{ #category : #accessing }
JSFile >> fileName [
	^ fileName
]

{ #category : #accessing }
JSFile >> fileName: anObject [
	fileName := anObject
]

{ #category : #accessing }
JSFile >> startLine [
	^ startLine
]

{ #category : #accessing }
JSFile >> startLine: anObject [
	startLine := anObject
]
