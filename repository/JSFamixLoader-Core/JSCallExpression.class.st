"
JSCallExpression: Class that stores info about function calls identified in the source code.

Public API and Key Messages
- message one   
- message two 
- what is the way to create instances is a plus.

One simple example:
JSCallExpression createWithValue: 'bind;CallExpression;27;41;27;93;{toString} [Point] '
 

"
Class {
	#name : #JSCallExpression,
	#superclass : #Object,
	#instVars : [
		'startLine',
		'startColumn',
		'calleeTypes',
		'caller',
		'functionName',
		'type',
		'classification'
	],
	#category : #'JSFamixLoader-Core'
}

{ #category : #'instance creation' }
JSCallExpression class >> createCalleeTypesCollection: aString [
	| posOpenBrackets posCloseBrackets calleeTypes |
	"calleeTypes"
	calleeTypes := OrderedCollection new.
	(aString isNotNil)
	ifTrue: [  
		posCloseBrackets := 1.
		posOpenBrackets := aString indexOf: $[.
		[ posOpenBrackets > (posCloseBrackets-1) ]
		whileTrue: [ 
			posCloseBrackets := ((aString copyFrom: posOpenBrackets+1 to: aString size) indexOf: $]) + posOpenBrackets.
			(posOpenBrackets+1) < (posCloseBrackets-1)
			ifTrue: [ calleeTypes add: (aString copyFrom: posOpenBrackets+1 to: posCloseBrackets-1) ].
			posOpenBrackets := ((aString copyFrom: posCloseBrackets to: aString size) indexOf: $[) + posCloseBrackets-1.
		].
	].
	^ calleeTypes
	
				
]

{ #category : #'instance creation' }
JSCallExpression class >> createForFlowUndefined: aFunctionCall [
	| callExpInstance   |
	
	callExpInstance := self new. 
	callExpInstance changeClassification: #Undefined.
	^ callExpInstance startLine: aFunctionCall locInfo startLine; 
					startColumn: aFunctionCall locInfo startColumn; 
					calleeTypes: nil; 
					functionName: ((aFunctionCall callee isKindOf: String) ifTrue: [ aFunctionCall callee ] ifFalse:[ aFunctionCall callee name ]); 
					type: 'CallExpression'; yourself


]

{ #category : #'instance creation' }
JSCallExpression class >> createWithValue: aArrayCSV [
	| callExpInstance calleeTypes stringCalleeTypes |
	stringCalleeTypes := aArrayCSV at: (JSCallExpression posCSV: 'calleeTypes').
	
	( (stringCalleeTypes isNil) or: 
	  [ ((stringCalleeTypes copyReplaceAll: ' ' with: '') = '') or:
		  [ JSCallExpression isMultipleTypes: stringCalleeTypes ]  "#MultipleTypes"
	  ] 
	) 
	ifTrue: [ callExpInstance := self new. ]
	ifFalse:[
		"calleeTypes"
		calleeTypes := JSCallExpression createCalleeTypesCollection: stringCalleeTypes.
		"Classify the type of call expression"
		callExpInstance := (calleeTypes isEmpty) 
									ifTrue: [ 
										((aArrayCSV at: (JSCallExpression posCSV: 'functionName')) isNil) "if #Anonymous"
										ifTrue: [ self new. ]
										ifFalse:[ JSCallExpFunction new ].
									] 
									ifFalse:[ JSCallExpObject new calleeConstructors: calleeTypes. ].
	].								
	^ callExpInstance startLine: (aArrayCSV at: (JSCallExpression posCSV: 'startLine')); 
					startColumn: (aArrayCSV at: (JSCallExpression posCSV: 'startColumn')); 
					calleeTypes: stringCalleeTypes; 
					functionName: (aArrayCSV at: (JSCallExpression posCSV: 'functionName')); 
					type: (aArrayCSV at: (JSCallExpression posCSV: 'type')); yourself


]

{ #category : #'instance creation' }
JSCallExpression class >> createWithValueBackUp: aArrayCSV [
	| callExpInstance calleeTypes stringCalleeTypes |
	stringCalleeTypes := aArrayCSV at: (JSCallExpression posCSV: 'calleeTypes').
	((( ((stringCalleeTypes isNotNil) and: [ JSCallExpression isMultipleTypes: stringCalleeTypes ]) "#MultipleTypes"
		or: [ (aArrayCSV at: (JSCallExpression posCSV: 'functionName')) isNil ] )	"#Anonymous"
		or: [ stringCalleeTypes isNil ] )		"#Unknown"
		or: [ (stringCalleeTypes copyReplaceAll: ' ' with: '') = '' ] )  "#Unknown"
	ifTrue: [ callExpInstance := self new. ]
	ifFalse:[
		"calleeTypes"
		calleeTypes := JSCallExpression createCalleeTypesCollection: stringCalleeTypes.
		"Classify the type of call expression"
		callExpInstance := (calleeTypes isEmpty) 
									ifTrue: [ JSCallExpFunction new ] 
									ifFalse:[ JSCallExpObject new calleeConstructors: calleeTypes. ].
	].								
	^ callExpInstance startLine: (aArrayCSV at: (JSCallExpression posCSV: 'startLine')); 
					startColumn: (aArrayCSV at: (JSCallExpression posCSV: 'startColumn')); 
					calleeTypes: stringCalleeTypes; 
					functionName: (aArrayCSV at: (JSCallExpression posCSV: 'functionName')); 
					type: (aArrayCSV at: (JSCallExpression posCSV: 'type')); yourself


]

{ #category : #accessing }
JSCallExpression class >> getCallExpressionInList: aCallExpression collection: aCollection [
	"It returns an object with the same desired structure of aCallExpression inside aCollection"
	|  |
	aCallExpression isNil ifTrue: [ ^nil ].
	^ aCollection detect: [ :cet | 
			(cet startLine = aCallExpression startLine) and: 
				[ (cet startColumn = aCallExpression startColumn) and:
					[ cet functionName = aCallExpression functionName ]
				]
		]	ifNone: [ nil ].
]

{ #category : #'instance creation' }
JSCallExpression class >> getFullCSVCollection: sFileName [
	"Apply NeoCSV to the txt file with Aran dump info"
	^ JSCallExpression separateCSVStringFields: (sFileName asFileReference readStream) delimiter: $;.


]

{ #category : #accessing }
JSCallExpression class >> isADefinedType: sType [
	|  |
	"Validating the input"
	((sType copyWithout: (Character space)) isEmpty) ifTrue: [ ^false ].
	"Comparing with all categories of undefined types"
	^ ( #(#Unknown #Undefined #Anonymous) anySatisfy: [ :t | t = sType ]) not

]

{ #category : #accessing }
JSCallExpression class >> isCallExpressionPresent: aCallExpression collection: aCollection [
	"It verifies if there is an object with the same desired structure of aCallExpression inside aCollection"
	|  |
	aCallExpression isNil ifTrue: [ ^false ].
	^ aCollection anySatisfy: [ :cet | 
			(cet startLine = aCallExpression startLine) and: 
				[ (cet startColumn = aCallExpression startColumn) and:
					[ (cet calleeTypes = aCallExpression calleeTypes) and:
						[ (cet functionName = aCallExpression functionName) and:
							[ (cet class = aCallExpression class) and:
								[ cet classification = aCallExpression classification ]
							]
						] 
					]
				]
		]	
]

{ #category : #accessing }
JSCallExpression class >> isMultipleTypes: sTypes [
	| closingPos |
	"Validating the input"
	(sTypes isEmpty) ifTrue: [ ^false ].
	"If it is not an structure, just verifies if it cointais '|'"
	(#(${ $( $[) includes: (sTypes at:1)) ifFalse: [ ^((sTypes indexOf: $|) > 0) ].
	"If it is an structure, verifies if its structure may vary"
	closingPos := JSClassFinder lookForPosOfTheClosing: sTypes.
	^((sTypes lastIndexOf: $|) > closingPos) 

	"(JSClassFinder getCollectionListOfStringTypes: sTypes) do: [ :c | ((c indexOf: $|) > 0) ifTrue: [ ^ true ]. ].
	^ false"
]

{ #category : #accessing }
JSCallExpression class >> nextField: aString pos: nInitialPos delimiter: cDelimiter [
	"It receives aString cointaining fields that are delimited by cDelimiter and returns the next field starting from nInitialPos."
	| sNewString idxDelimiterIni idxDelimiterEnd |
	(nInitialPos >= aString size) ifTrue: [ ^'' ].
	sNewString := aString copyFrom: nInitialPos to: aString size.
	"aString must have at least one cDelimiter and another character after it"
	(sNewString size <= 1) ifTrue: [ ^'' ].
	idxDelimiterIni := sNewString indexOf: cDelimiter.
	((idxDelimiterIni = 0) or: [ idxDelimiterIni = sNewString size ]) ifTrue: [ ^'' ].
	idxDelimiterEnd := ((sNewString copyFrom: idxDelimiterIni+1 to: sNewString size) indexOf: cDelimiter) + idxDelimiterIni.
	"In the case of only one cDelimiter"
	(idxDelimiterIni = idxDelimiterEnd) ifTrue: [ idxDelimiterEnd := sNewString size + 1].
	^ sNewString copyFrom: idxDelimiterIni+1 to: idxDelimiterEnd-1.
		
]

{ #category : #accessing }
JSCallExpression class >> posCSV: sField [
	^ #('functionName' 'type' 'startLine' 'startColumn' 'endLine' 'endColumn' 'fileName' 'calleeTypes') indexOf: sField.


]

{ #category : #accessing }
JSCallExpression class >> separateCSVStringFields: aString delimiter: cDelimiter [
	^((NeoCSVReader on: aString readStream)
			separator: cDelimiter;
			addField;
			addField;
			addField;
			addField;
			addField;
			addField;
			addField;
			addField;
			upToEnd) 
			"]
		on: SubscriptOutOfBounds do: [ nil ]) ."	
]

{ #category : #operators }
JSCallExpression >> <= aCE [
	"The implementation of <= defines the criteria to order a collecdtion of JSCallExpressions"
	^(self startLine <= aCE startLine)

]

{ #category : #accessing }
JSCallExpression >> calleeConstructors [
"This property only have valid values for JSCallExpObjects."
	^ ''
]

{ #category : #accessing }
JSCallExpression >> calleeTypes [
	(calleeTypes isNil) ifTrue: [ ^'' ].
	"Only makes sense for Aran's dump file"
	^ (calleeTypes subStrings: '127.0.0.1') first
]

{ #category : #accessing }
JSCallExpression >> calleeTypes: anObject [
	calleeTypes := anObject
]

{ #category : #accessing }
JSCallExpression >> caller [
	^ caller
]

{ #category : #accessing }
JSCallExpression >> caller: anObject [
	caller := anObject
]

{ #category : #accessing }
JSCallExpression >> changeClassification: aSymbol [
	classification := aSymbol
]

{ #category : #accessing }
JSCallExpression >> classification [
	^ classification
]

{ #category : #accessing }
JSCallExpression >> classification: anObject [
	classification := (functionName isNil) 
							ifTrue: [ #Anonymous ] 
							ifFalse:[ 
								((calleeTypes isNil) or: [ (calleeTypes copyReplaceAll: ' ' with: '') = '' ])
								ifTrue: [ #Unknown ]
								ifFalse:[ #MultipleTypes ].
							].
]

{ #category : #accessing }
JSCallExpression >> classificationGrade [
	(classification = #MultipleTypes) ifTrue: [ ^1 ].
	(classification = #Anonymous) ifTrue: [ ^2 ].	
]

{ #category : #accessing }
JSCallExpression >> functionName [
	^ functionName
]

{ #category : #accessing }
JSCallExpression >> functionName: anObject [
	functionName := anObject
]

{ #category : #initialization }
JSCallExpression >> initialize [

	super initialize.

]

{ #category : #printing }
JSCallExpression >> printOn: stream [
	super printOn: stream.
	stream nextPut: $(; 
		print: ((self functionName isNil) ifTrue:[ '' ] ifFalse:[self functionName]), '-L', self startLine asString, '-', self classification;
		nextPut: $)
]

{ #category : #accessing }
JSCallExpression >> startColumn [
	^ startColumn
]

{ #category : #accessing }
JSCallExpression >> startColumn: anObject [
	startColumn := anObject
]

{ #category : #accessing }
JSCallExpression >> startLine [
	^ startLine
]

{ #category : #accessing }
JSCallExpression >> startLine: anObject [
	startLine := anObject
]

{ #category : #accessing }
JSCallExpression >> type [
	^ type
]

{ #category : #accessing }
JSCallExpression >> type: anObject [
	type := anObject
]
