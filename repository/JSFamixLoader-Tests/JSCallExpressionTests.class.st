Class {
	#name : #JSCallExpressionTests,
	#superclass : #TestCase,
	#category : #'JSFamixLoader-Tests'
}

{ #category : #'instance creation' }
JSCallExpressionTests >> testCreateCalleeTypesCollection [
	|  |
	self assert: (JSCallExpression createCalleeTypesCollection: 'Cal') size equals: 0.
	self assert: (JSCallExpression createCalleeTypesCollection: 'Cal; []') size equals: 0.
	self assert: (JSCallExpression createCalleeTypesCollection: 'Cal;Exp; [Point]') size equals: 1.
	self assert: (JSCallExpression createCalleeTypesCollection: 'Cal;Exp; [Point] [Line]') size equals: 2.
	
]

{ #category : #'instance creation' }
JSCallExpressionTests >> testCreateForFlowUndefined [
	| ce fctMammal fctSetSound fc01 fc02 |
	
	"Set up the environment"
	fctMammal := FAMIXJSFunction new name: 'Mammal'.
	fctSetSound := FAMIXJSFunction new name: 'setSound'.
	fc01 := FAMIXJSCall new.
	fc01 caller: fctMammal; callee: fctSetSound.  
	fc01 locInfo: (FAMIXFileAnchor new fileName: 'Mammal.js').
	fc01 locInfo startLine: 15.
	fc01 locInfo startColumn: 10.
	fc01 locInfo endColumn: 13.

	fc02 := FAMIXJSCall new.
	fc02 caller: fctMammal; callee: 'testMammal'.  
	fc02 locInfo: (FAMIXFileAnchor new fileName: 'Mammal.js').
	fc02 locInfo startLine: 10.
	fc02 locInfo startColumn: 1.
	fc02 locInfo endColumn: 12.
	
	ce := JSCallExpression createForFlowUndefined: fc01.
	self assert: ce startLine equals: 15.
	self assert: ce startColumn equals: 10.
	self assert: ce calleeTypes equals: ''.
	self assert: ce functionName equals: 'setSound'.
	self assert: ce classification equals: #Undefined.
	ce := JSCallExpression createForFlowUndefined: fc02.
	self assert: ce functionName equals: 'testMammal'.

]

{ #category : #'instance creation' }
JSCallExpressionTests >> testCreateWithValue [
	| ce |
	ce := JSCallExpression createWithValue: #(nil 'CallExpression' '2' '412' '27' '93' nil nil).
	self assert: (ce isKindOf: JSCallExpression). "because functionName is nil"
	self assert: ce startLine equals: '2'.
	self assert: ce startColumn equals: '412'.
	self assert: ce calleeTypes equals: ''.
	ce := JSCallExpression createWithValue: #('bind' 'CallExpression' '27' '41' '27' '93' 'demo.js' '{toString} [Point]').
	self assert: (ce isKindOf: JSCallExpObject).
	self assert: ce startLine equals: '27'.
	self assert: ce startColumn equals: '41'.
	self assert: (ce calleeConstructors at:1) equals: 'Point'.
	self assert: ce calleeTypes equals: '{toString} [Point]'.
	self assert: ce functionName equals: 'bind'.
	ce := JSCallExpression createWithValue: #('sort' 'CallExpression' '272' '1' '27' '93' 'demo.js' '{toString} [Point] [Line]').
	self assert: (ce calleeConstructors at:1) equals: 'Point'.
	self assert: (ce calleeConstructors at:2) equals: 'Line'.
	self assert: ce calleeConstructors size equals: 2.

]

{ #category : #'instance creation' }
JSCallExpressionTests >> testGetCallExpressionInList [
	| ce ceTypes aFunctions ceInList |
	ceTypes := OrderedCollection new.
	aFunctions := OrderedCollection with: (FAMIXJSFunction new).

	self deny: (JSCallExpression isCallExpressionPresent: nil collection: ceTypes).
	
	ce := (JSCallExpression createWithValue: #(nil 'CallExpression' '2' '412' '27' '93' nil nil)) classification: aFunctions.
	ceInList := JSCallExpression getCallExpressionInList: ce collection: ceTypes.
	self assert: ceInList isNil.
	ceTypes add: ce.
	
	ce := (JSCallExpression createWithValue: #('bind' 'CallExpression' '27' '41' '27' '93' 'demo.js' '{toString} [Point]')) classification: aFunctions.
	ceInList := JSCallExpression getCallExpressionInList: ce collection: ceTypes.
	self assert: ceInList isNil.
	ceTypes add: ce.
	
	ce := (JSCallExpression createWithValue: #('bind' '' '27' '41' '27' '99' 'demo.js' '{toString} [Point]')) classification: aFunctions.
	ceInList := JSCallExpression getCallExpressionInList: ce collection: ceTypes.
	self deny: ceInList isNil.
	self assert: (ceInList classification = ce classification).

	aFunctions := OrderedCollection with: (FAMIXJSFunction new name: 'Point').
	ce := (JSCallExpression createWithValue: #('bind' '' '27' '41' '27' '99'  'demo.js' '{toString} [Point]')) classification: aFunctions.
	ceInList := JSCallExpression getCallExpressionInList: ce collection: ceTypes.
	self deny: ceInList isNil.
	self assert: ceInList classification equals: #OtherObj.
	self assert: ce classification equals: #Class.

]

{ #category : #accessing }
JSCallExpressionTests >> testIsADefinedType [
	|   |
	self assert: (JSCallExpression isADefinedType: '') equals: false.
	self assert: (JSCallExpression isADefinedType: 'string') equals: true.
	self assert: (JSCallExpression isADefinedType: #Anonymous) equals: false.
	self assert: (JSCallExpression isADefinedType: #Unknown) equals: false.
	self assert: (JSCallExpression isADefinedType: #Undefined) equals: false.
	self assert: (JSCallExpression isADefinedType: #Class) equals: true.

]

{ #category : #'instance creation' }
JSCallExpressionTests >> testIsCallExpressionPresent [
	| ce ceTypes aFunctions |
	ceTypes := OrderedCollection new.
	aFunctions := OrderedCollection with: (FAMIXJSFunction new).

	self deny: (JSCallExpression isCallExpressionPresent: nil collection: ceTypes).
	
	ce := (JSCallExpression createWithValue: #(nil 'CallExpression' '2' '412' '27' '93' nil nil)) classification: aFunctions.
	self deny: (JSCallExpression isCallExpressionPresent: ce collection: ceTypes).
	ceTypes add: ce.
	self assert: (JSCallExpression isCallExpressionPresent: ce collection: ceTypes).
	
	ce := (JSCallExpression createWithValue: #('bind' 'CallExpression' '27' '41' '27' '93' 'demo.js' '{toString} [Point]')) classification: aFunctions.
	self deny: (JSCallExpression isCallExpressionPresent: ce collection: ceTypes).
	ceTypes add: ce.
	
	ce := (JSCallExpression createWithValue: #('bind' '' '27' '41' '27' '99' 'demo.js' '{toString} [Point]')) classification: aFunctions.
	self assert: (JSCallExpression isCallExpressionPresent: ce collection: ceTypes).

	aFunctions := OrderedCollection with: (FAMIXJSFunction new name: 'Point').
	ce := (JSCallExpression createWithValue: #('bind' '' '27' '41' '27' '99' 'demo.js' '{toString} [Point]')) classification: aFunctions.
	self deny: (JSCallExpression isCallExpressionPresent: ce collection: ceTypes).

]

{ #category : #accessing }
JSCallExpressionTests >> testIsMultipleTypesForFlow [
	|   |
	"Inputs are equal to the output"
	self assert: (JSCallExpression isMultipleTypes: '') equals: false.
	self assert: (JSCallExpression isMultipleTypes: 'string') equals: false.
	"Other valid outputs"
	self assert: (JSCallExpression isMultipleTypes: '{x: number, y: number}') equals: false.
	self assert: (JSCallExpression isMultipleTypes: '{print: (obj: {p1: {x: number, y: number}, p2: {x: number, y: number}, x: number, y: number}) => string}') equals: false.
	self assert: (JSCallExpression isMultipleTypes: '{bestScoreKey: string, gameStateKey: string, storage: }') equals: false.
	self assert: (JSCallExpression isMultipleTypes: '(direction: number | number | number | number | void) => void') equals: false.
	" Test with logical ORs (#MultipleFct)"
	self assert: (JSCallExpression isMultipleTypes: 'void | {x: , y: }') equals: true.
	self assert: (JSCallExpression isMultipleTypes: '{x: , y: } | {a: , b: }') equals: true.
	self assert: (JSCallExpression isMultipleTypes: '{mergedFrom: $Subtype<null | null | [any, any]> | $Subtype<null | null | [any, any]> | null | null | null | null | [any, any] | $Subtype<null | null | [any, any]> | $Subtype<null | null | [any, any]>, previousPosition: $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | null | {x: number, y: number} | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}>, value: $Subtype<number> | $Subtype<number> | number | number | number | number | $Subtype<number> | $Subtype<number> | $Subtype<number> | number | number | number | number | number | number | number | number | $Subtype<number> | $Subtype<number>, x: number, y: number}') equals: false.
]

{ #category : #accessing }
JSCallExpressionTests >> testNextFieldPosDelimiter [
	|  |
	self assert: (JSCallExpression nextField: 'Cal' pos: 1 delimiter: $;) equals: ''.
	self assert: (JSCallExpression nextField: 'Cal;' pos: 1 delimiter: $;) equals: ''.
	self assert: (JSCallExpression nextField: 'Cal;Exp' pos: 10 delimiter: $;) equals: ''.
	self assert: (JSCallExpression nextField: 'CallExpression;2;412;27;93;' pos: 1 delimiter: $;) equals: '2'.
	self assert: (JSCallExpression nextField: 'CallExpression;2;412;27;93;' pos: 23 delimiter: $;) equals: '93'.
	self assert: (JSCallExpression nextField: ';CallExpression;2;412;27;93;' pos: 1 delimiter: $;) equals: 'CallExpression'.
	self assert: (JSCallExpression nextField: 'Cal' pos: 1 delimiter: $a) equals: 'l'.
	
]

{ #category : #accessing }
JSCallExpressionTests >> testPosCSV [
	|  |
	self assert: (JSCallExpression posCSV: 'functionName') equals: 1.
	self assert: (JSCallExpression posCSV: 'startLine') equals: 3.
	self assert: (JSCallExpression posCSV: 'startColumn') equals: 4.
	self assert: (JSCallExpression posCSV: 'endLine') equals: 5.
	self assert: (JSCallExpression posCSV: 'endColumn') equals: 6.
	self assert: (JSCallExpression posCSV: 'blabla') equals: 0.
	
]

{ #category : #accessing }
JSCallExpressionTests >> testSeparateCSVStringFieldsDelimiter [
	| aArray aStream |
	JSClassFinderTests createExampleDumpFileAran: 'tempSeparateCSV.txt'.
	aStream := 'tempSeparateCSV.txt' asFileReference readStream.
	
	aArray := JSCallExpression separateCSVStringFields: aStream delimiter: $;.
	self assert: aArray size equals: 6.
	self assert: ((aArray at:1) at: 1) isNil.
	self assert: ((aArray at:2) at: 1) equals: 'bind'.
		
	
]

{ #category : #accessing }
JSCallExpressionTests >> testSeparateCSVStringFieldsDelimiterWrongFormat [
	| aArray |
	aArray := JSCallExpression separateCSVStringFields: '' delimiter: $;.
	self assert: aArray isEmpty.
	aArray := JSCallExpression separateCSVStringFields: 'bind;Call' delimiter: $;.
	self assert: aArray size equals: 1.
	self assert: ((aArray at:1) at: 1) equals: 'bind'.
	self assert: ((aArray at:1) at: 2) equals: 'Call'.
	self assert: ((aArray at:1) at: 3) isNil.
		
	
]
