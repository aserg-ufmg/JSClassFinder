"
JSDataLoader is responsible for creating a moose model, based on FAMIX-JS metamodel. it receives a source code path of a JavaScript application as input.

Public API and Key Messages

- searchJSONFiles: sPath  

Example on how to create instances:
- js := JSDataLoader new.

Internal Representation and Key Implementation Points.

    Instance Variables
	aEmptyFct:		<Object>
	aEmptyProperty:		<Object>
	aEmptyPrototype:		<Object>
	context:		<Object>
	currentFileName:		<Object>
	files:		<Object>
	isTestsPath:		<Object>
	model:		<Object>
	rootPath: <String> - it is the source code path for the JS application to be analyzed


    Implementation Points:
	Public method searchJSONFiles visits the AST of the JS app, in JSON format, and builds a FAMIX-JS moose model of it.
"
Class {
	#name : #JSDataLoader,
	#superclass : #Object,
	#instVars : [
		'model',
		'context',
		'currentFileName',
		'isTestsPath',
		'aEmptyFct',
		'aEmptyProperty',
		'aEmptyPrototype',
		'files',
		'rootPath'
	],
	#category : #'JSFamixLoader-Core'
}

{ #category : #accessing }
JSDataLoader >> aEmptyFct [
	^ aEmptyFct
]

{ #category : #accessing }
JSDataLoader >> aEmptyPrototype [
	^ aEmptyPrototype
]

{ #category : #'creating elements' }
JSDataLoader >> addFunctionCall: fctCaller callee: fctCallee [
"Adds a CallExpression to the field 'invocations', in the caller." 
(fctCaller isKindOf: FAMIXJSFunction) & (fctCallee isKindOf: FAMIXJSFunction)
ifTrue: [
	(fctCaller invocations includes: fctCallee)
	ifFalse:[ fctCaller invocations: fctCallee ].
].
]

{ #category : #accessing }
JSDataLoader >> context [
	^context
]

{ #category : #'creating elements' }
JSDataLoader >> createJSCall: aCaller callee: aCallee [
	| obj |

	obj := FAMIXJSCall new. 
	obj caller: aCaller.
	obj callee: aCallee getCallee.
	obj locInfo: aCallee locInfo.
	model add: obj.
	^obj

]

{ #category : #'creating elements' }
JSDataLoader >> createJSFile: aDictionaryLOC [ 
	| f start end |
	f := JSFile new.
	f fileName: currentFileName.
	(aDictionaryLOC isNotNil)
	ifTrue: [ 
		"LOC information"
		start := aDictionaryLOC at:#start ifAbsent:nil.
		end := aDictionaryLOC at:#end ifAbsent:nil.
		(start isNotNil) & (end isNotNil)
		ifTrue: [ 
			f startLine: (start at:#line). 
			f endLine: (end at:#line). 
		].
	].
	"Add new jsfile to the list"
	files add: f.
	"Return new instance"
	^f

]

{ #category : #'creating elements' }
JSDataLoader >> createJSFunction: name parent: aParent [ 
	| fct |

	fct := FAMIXJSFunction new. 
	fct name: name.
	fct parentType: aParent.
	aParent ifNotNil: [ aParent jsFunctions: fct ].
	fct isStub: true.
	fct filePath: currentFileName.
	fct isArgument: aEmptyFct isArgument.
	fct locFirstThisExp: nil.
	model add: fct.
	^fct

]

{ #category : #'creating elements' }
JSDataLoader >> createJSObjectForFct: objName fctName: fctName [
	| obj fct |
	
	fct := (self ensureJSFunctionForObject: fctName parent: context top).
   obj := FAMIXJSObject new.
	obj name: objName.
	obj jsBEntity: fct.
	obj filePath: currentFileName.
	model add: obj.
	^obj

]

{ #category : #'creating elements' }
JSDataLoader >> createJSObjectForPrototype: aPrototype [
	| obj |
	
   obj := FAMIXJSObject new.
	obj name: nil.
	obj jsBEntity: aPrototype.
	obj filePath: currentFileName.
	model add: obj.
	^obj

]

{ #category : #'creating elements' }
JSDataLoader >> createJSParameter: paramName parent: aFunction [
	| p |

	p := FAMIXJSParameter new. 
	p name: paramName.
	p parentType: aFunction.
	model add: p.
	^p

]

{ #category : #'creating elements' }
JSDataLoader >> createJSProperty: aJSType parent: aParent [ 
	| prop |

   prop := FAMIXJSProperty new.
	prop name: aJSType getName.
	prop jsValue: aJSType getValue. 
	prop isValueIdentifier: false.
	prop isALeftSideAssignment: false.
	(aParent isNotNil)
	ifTrue: [ aParent jsProperties: prop ].
	prop filePath: currentFileName.
	prop locInfo: aJSType locInfo.
	model add: prop.
	^prop

]

{ #category : #'creating elements' }
JSDataLoader >> createJSPrototypeFor: aFct [
	| proto |
	
   proto := FAMIXJSPrototype new.
	proto jsOwnerFunction: aFct.
	aFct jsPrototype: proto.
	model add: proto.
	^proto

]

{ #category : #accessing }
JSDataLoader >> currentFileName [
	^ currentFileName
]

{ #category : #accessing }
JSDataLoader >> currentFileName: anObject [
	currentFileName := anObject
]

{ #category : #'creating elements' }
JSDataLoader >> ensureJSCall: aCaller callee: aTypeCallee [ 
	^ (model allWithType: FAMIXJSCall) 
			detect: [ :obj | (obj caller = aCaller) and: 
				[  (obj callee = aTypeCallee getCallee) and: 
					[ (obj locInfo startLine = aTypeCallee locInfo startLine) and: 
						[ (obj locInfo startColumn = aTypeCallee locInfo startColumn) and: 
							[ obj locInfo fileName = aTypeCallee locInfo fileName]
						] 
					]
				]
			] ifNone: [ self createJSCall: aCaller callee: aTypeCallee ]

]

{ #category : #'creating elements' }
JSDataLoader >> ensureJSFunction: fctName parent: aParent [ 
	^ (model allWithType: FAMIXJSFunction) 
			detect: [ :fctObj | (fctObj name = fctName) and: [fctObj parentType = aParent] ]
			ifNone: [ self createJSFunction: fctName parent: aParent ]

]

{ #category : #'creating elements' }
JSDataLoader >> ensureJSFunction: fctName parent: aParent filePath: aFilePath [
	| fct |
	fct := (model allWithType: FAMIXJSFunction) 
			detect: [ :fctObj | (fctObj name = fctName) and: [(fctObj parentType = aParent) 
					and: [fctObj filePath = aFilePath]] 
				]
			ifNone: [ nil ].
	(fct isNil) 
	ifTrue: [ fct := (model allWithType: FAMIXJSFunction) 
					detect: [ :fctObj | (fctObj name = fctName) and: [(fctObj parentType = aParent) 
						and: [fctObj isStub]] ]
					ifNone: [ self createJSFunction: fctName parent: aParent ].
				fct filePath: currentFileName.		
		 ].
	^ fct	
"	^ (model allWithType: FAMIXJSFunction) 
			detect: [ :fctObj | (fctObj name = fctName) and: [(fctObj parentType = aParent) 
					and: [fctObj filePath = aFilePath]] 
			]
			ifNone: [ (model allWithType: FAMIXJSFunction) 
					detect: [ :fctObj | (fctObj name = fctName) and: [(fctObj parentType = aParent) 
						and: [fctObj isStub]] ]
					ifNone: [ self createJSFunction: fctName parent: aParent ]
			].		
"
]

{ #category : #'creating elements' }
JSDataLoader >> ensureJSFunctionForObject: fctName parent: aParent [ 
	| fct |
	fct := (model allWithType: FAMIXJSFunction) 
		detect: [ :fctObj | (fctObj name = fctName) & (fctObj isStub = false) ]
		ifNone: [ (model allWithType: FAMIXJSFunction) detect: [ :fctObj2 | (fctObj2 name = fctName) ] ifNone: [nil] ].

	(fct isNotNil)
	ifTrue:[	
		(fct parentType = aParent)
		ifTrue: [ ^fct ] "Exact match with name and parent"
		ifFalse:[ 
			(fct parentType isNotNil) 
			ifTrue:[ 
				(fct parentType name isNil)
				ifTrue: [ ^fct ]. "Name ok and parent's function without name"
		 	]
			ifFalse:[ ^fct ]. "Name ok and parent's function nil"
		].
	].
	^(self ensureJSFunction: fctName parent: nil filePath: currentFileName) "Creates, if it doesn't exist already, a function isStub=true for the object with no parent"
	

]

{ #category : #'creating elements' }
JSDataLoader >> ensureJSFunctionForPrototype: fctName filePath: aFilePath [
	"Looks for a function without checking parentType, because it is for a prototype property (global)"
	| fcts |
	fcts := ((model allWithType: FAMIXJSFunction) select: [ :fct | (fct name = fctName) ]).
	(fcts isEmpty)
	ifTrue: [ ^(self createJSFunction: fctName parent: nil) ]
	ifFalse:[ 
		"Looks first for a function in the same file (package); if not found -> return any (the first)"
		^(fcts detect: [ :fctObj | (fctObj filePath = aFilePath) ] ifNone: [ fcts first ]) 
	].

]

{ #category : #'creating elements' }
JSDataLoader >> ensureJSParameter: aJSTypeIdentifier parent: aParent [ 
	^ (model allWithType: FAMIXJSParameter) 
			detect: [ :p | (p name = aJSTypeIdentifier entityName) and: [p parentType = aParent] ]
			ifNone: [ self createJSParameter: aJSTypeIdentifier entityName parent: aParent ]

]

{ #category : #'creating elements' }
JSDataLoader >> ensureJSProperty: aJSType parent: anEntity [
	(anEntity isNil)
	ifTrue: [ 
		^(model allWithType: FAMIXJSProperty)
			detect: [ :propObj | (propObj name = (aJSType entityName)) & (propObj parentType isNil) ]
			ifNone: [
				self createJSProperty: aJSType parent: anEntity.
			]
	]
	ifFalse:[
		^(anEntity jsProperties)
			detect: [ :propObj | propObj name = (aJSType entityName)]
			ifNone: [
				self createJSProperty: aJSType parent: anEntity
			]
	].

]

{ #category : #'creating elements' }
JSDataLoader >> ensureJSPrototype: aFct [
	(aFct jsPrototype = nil)
	ifTrue:[ self createJSPrototypeFor: aFct ].
	^aFct jsPrototype

]

{ #category : #accessing }
JSDataLoader >> files [
	^ files
]

{ #category : #accessing }
JSDataLoader >> files: anObject [
	files := anObject
]

{ #category : #accessing }
JSDataLoader >> getFileShortName: fileFullName [
	"Returns the short name of the file"

	"(rootPath size + 2): 2 because the '\' before the shotname."
	"(fileFullName size - 5): to remove the extension '.json' at the end."
	^fileFullName copyFrom: (rootPath size + 2) to: (fileFullName size - 5).
]

{ #category : #accessing }
JSDataLoader >> getNotStubVersion: aFunction [
	"Looks for a function with the same name that is not a stub"
	^aFunction.
	"(aFunction isStub)
	ifFalse: [ ^aFunction ].
	^(self model allWithType: FAMIXJSFunction) 
		detect: [ :fct | (fct name = aFunction name) & (fct isStub = false) ]
		ifNone: [ aFunction ]."
]

{ #category : #initialization }
JSDataLoader >> initialize [
	model := JSModel new.
	context := Stack new.
	context push: nil.
	files := OrderedCollection new.
	"isTestsPath := false."
	aEmptyFct := (FAMIXJSFunction new isStub:true) isArgument:false.
	"aEmptyProperty := FAMIXJSProperty new name:'EmptyProperty'.
	aEmptyPrototype := FAMIXJSPrototype new."

]

{ #category : #validation }
JSDataLoader >> isInsideAFunction [
	"If the stack (context) is empty, you are not inside any function"
	^(context top ~= nil)
]

{ #category : #validation }
JSDataLoader >> isInsideAnyNamedFunctionOrObj: aFunction [ 
	| fct |
	fct := aFunction parentType. 
	(fct isMemberOf: FAMIXJSPrototype) 
	"ifTrue: [ fct := fct jsOwnerFunction ]"
	ifTrue: [ fct := (self getNotStubVersion: fct jsOwnerFunction) ]
	ifFalse:[ (fct isMemberOf: FAMIXJSObject) ifTrue:[^true] ].

	[fct isNotNil]
	whileTrue:[	
		(fct name isNotNil) ifTrue:[ ^true ].
		fct := fct parentType.
		(fct isMemberOf: FAMIXJSPrototype) 
		"ifTrue: [ fct := fct jsOwnerFunction ]"
		ifTrue: [ fct := (self getNotStubVersion: fct jsOwnerFunction) ]
		ifFalse:[ (fct isMemberOf: FAMIXJSObject) ifTrue:[^true] ].
	].
	^false
	

]

{ #category : #accessing }
JSDataLoader >> isTestsPath [
	^ isTestsPath
]

{ #category : #accessing }
JSDataLoader >> isTestsPath: anObject [
	isTestsPath := anObject
]

{ #category : #validation }
JSDataLoader >> jsFindFunction: fctName [
	| fct |
	
	fct := [(model allWithType: FAMIXJSFunction) detect: [ :fctObj | fctObj name = fctName] ]
		on: NotFound do: [fct := nil].
	^fct

]

{ #category : #validation }
JSDataLoader >> jsFindObjectProperty: objName parent: aParent [
	| prop aReturn nextParent bExit |
	bExit := false.
	nextParent := aParent.
	[  "looks for a property whose value is a FAMIXJSObject named objName, in a valid scope (parentType)"
		prop := (model allWithType: FAMIXJSProperty) 
			detect: [ :famixProp | 
				(famixProp jsValue class = FAMIXJSObject) & 
				(famixProp name = objName) & 
				(famixProp parentType = nextParent) ] ifNone: [ nil ].

		((nextParent isNotNil) & ((nextParent class = FAMIXJSFunction) or: [ nextParent class = FAMIXJSPrototype ]))
		ifTrue: [ nextParent := nextParent parentType ] 
		ifFalse:[ bExit := true ].	
	] doWhileTrue: [ (prop isNil) & (bExit = false) ].		

	(prop isNil)	
	ifTrue: [	 aReturn := nil ]
	ifFalse:[ aReturn := prop jsValue ].	
	^aReturn

]

{ #category : #validation }
JSDataLoader >> jsFunctionExists: fctName [
	| fct |
	fct := [(model allWithType: FAMIXJSFunction) detect: [ :fctObj | fctObj name = fctName] ]
		on: NotFound do: [fct := nil].
	^(fct	~= nil)

]

{ #category : #validation }
JSDataLoader >> jsPropertyExists: aJSType fct: aFunction [ 
	| prop fct |
	fct := [(model allWithType: FAMIXJSFunction) detect: [ :fctObj | fctObj name = (aFunction name)]]
	on: NotFound do: [ fct := nil].
	(fct ~= nil)
	ifTrue:[ prop := [(fct jsProperties) detect: [ :propObj | propObj name = (aJSType entityName)]]
		on: NotFound do: [prop := nil].]
	ifFalse:[prop := nil.].
	^(prop ~= nil)
	

]

{ #category : #validation }
JSDataLoader >> jsRootFunction: aFunction [ 
	| fct |
	fct := aFunction. 
	[(fct parentType) = nil]
	whileFalse:[	
		fct := fct parentType.
		(fct isMemberOf: FAMIXJSPrototype)
		"ifTrue:[fct := fct jsOwnerFunction]."
		ifTrue:[ fct := (self getNotStubVersion: fct jsOwnerFunction) ].
	].
	^fct
	

]

{ #category : #metrics }
JSDataLoader >> loc [
	"It includes blank lines and comments"
	| loc |
	loc := 0.
	files do: [ :f | loc := loc + (f endLine - f startLine + 1) ].
	^loc

]

{ #category : #accessing }
JSDataLoader >> model [
	^ model
]

{ #category : #accessing }
JSDataLoader >> model: anObject [
	model := anObject
]

{ #category : #metrics }
JSDataLoader >> numberOfDifferentFunctionCalls [
	"Return the number of functions calls, without repetition of caller and callee, inside the model"
	^((model allWithType: FAMIXJSCall) size)
 
]

{ #category : #metrics }
JSDataLoader >> numberOfFiles [
	^files size

]

{ #category : #metrics }
JSDataLoader >> numberOfFunctions [
	"Return the number of functions inside the model"
	^((model allWithType: FAMIXJSFunction) select:[ :f | (f name isNotNil) & (f isStub = false) ] ) size
	"| list listObj listDel |
	list := (model allWithType: FAMIXJSFunction) 
		select: [ :f | (f name isNotNil) & 
							(f isStub = false) ].
	listObj := list select: [ :f | (f parentType isKindOf: FAMIXJSObject) ].
	listDel := listObj select: [ :f | (f parentType jsBEntity isNil) & (f parentType name isNil) ]. 
	^(list removeAll: listDel) size.	"

]

{ #category : #accessing }
JSDataLoader >> rootPath [
	^ rootPath
]

{ #category : #accessing }
JSDataLoader >> rootPath: anObject [
	rootPath := anObject
]

{ #category : #'input processing' }
JSDataLoader >> searchJSONFiles: aPath [
	"List all files with extension .json given a path (aPath). It searches in all subdirectories."
	| working allPathChildren i item |

	(aPath isKindOf: String)
	ifTrue: [ working := (aPath asFileReference) ]
	ifFalse:[ working := aPath ].
	
	rootPath := working name. "rootPath is the instance variable that will store the root path of the application"
	
	allPathChildren := (working allChildren).
	i := 0.
	[i < allPathChildren size] 
		whileTrue: [
			i := i + 1. 
			item := allPathChildren at:i. 
			(item isFile & (item extension asUppercase = 'JSON')) 
			ifTrue: [ "Navigate through the structure JSON"
				currentFileName := (self getFileShortName: item name). 
 				item readStreamDo: [ :stream |  self visitJSON: (NeoJSONReader on: stream) next].
			].
		].
]

{ #category : #validation }
JSDataLoader >> searchObjectExtensionType: calleeName dict: aJSONDict [
	"Look for different types of object extension"
	| jsTypeFirstArgument obj jsTypeReturn index fctName  |
	jsTypeReturn := nil.
	(calleeName = 'Object.create')
	ifTrue:["It uses (#arguments at:1) because we are interested only in the first argument"
		jsTypeFirstArgument := (self visitJSON: ((aJSONDict at:#arguments) at:1)).
		jsTypeFirstArgument isPrototype
		ifTrue: [ obj := self createJSObjectForPrototype: jsTypeFirstArgument prototype. ]
		ifFalse:[ obj := self createJSObjectForPrototype: nil ].
		jsTypeReturn := JSTypeObjectCreate new object: obj.
	] 
	ifFalse:[ "Extensions: *.extend(..)"
		index := (calleeName findString: '.extend').
		(index > 0)
		ifTrue:[
			fctName := calleeName copyFrom: 1 to: (index-1).
			(fctName = '$')
			ifTrue: [ "jQuery extension" "TODO" ]
			ifFalse:[ "Dean Edwards's base class implementation for JavaScript Inheritance - 'Base.extend({...})'"
				"It uses (#arguments at:1) because we are interested only in the first argument"
				jsTypeFirstArgument := (self visitJSON: ((aJSONDict at:#arguments) at:1)).
				jsTypeFirstArgument isObjectCreate 
				ifTrue: [ 
					jsTypeFirstArgument jsBEntity: (self ensureJSFunctionForObject: fctName parent: (context top) ).
					jsTypeReturn := jsTypeFirstArgument.
				].
			].	
		].
	].
	^jsTypeReturn

]

{ #category : #visiting }
JSDataLoader >> visitJSON: aJSONDict [
	| type visitSelector return |
	(aJSONDict isNotNil)
	ifTrue:[
		type := aJSONDict at: #type.
		visitSelector := 'visitJSON_' , type , ':'.
		return := self perform: visitSelector asSymbol with: aJSONDict.
	].
	^return	
	"on: MessageNotUnderstood
	do: [ Transcript show: '**not found:' , visitSelector ; cr]."
]

{ #category : #visiting }
JSDataLoader >> visitJSON_ArrayExpression: aJSONDict [
	^ JSTypeWithValue new propValue:'ArrayExpression'
]

{ #category : #visiting }
JSDataLoader >> visitJSON_ArrayPattern: aJSONDict [
	"This functionality IS NOT YET implemented / tested (ES 6)"
	^ self visitJSON_ArrayExpression: aJSONDict.
]

{ #category : #visiting }
JSDataLoader >> visitJSON_ArrowFunctionExpression: aJSONDict [
	"Functionality not YET implemented / tested (ES 6)"
	^ self visitJSON_FunctionExpression: aJSONDict.

]

{ #category : #visiting }
JSDataLoader >> visitJSON_AssignmentExpression: aJSONDict [
	| jsTypeLeft jsTypeRight |

	jsTypeLeft := self visitJSON: (aJSONDict at: #left).
	jsTypeRight := self visitJSON: (aJSONDict at: #right).

	(jsTypeRight getName isNil) & (jsTypeRight isPrototype = false)
	ifTrue:[	
		jsTypeRight setNameFrom: jsTypeLeft. 
		"(jsTypeRight getParent isNil)" 
		(jsTypeLeft getParent isNotNil)
		ifTrue:[	jsTypeRight setParentFrom: jsTypeLeft ].
	].

	jsTypeLeft isIdentifier
	ifTrue: [ jsTypeLeft := JSTypeWithValue new entityName: jsTypeLeft getName ]
	ifFalse:[
		jsTypeLeft isProperty
		ifTrue: [ jsTypeLeft jsProperty isALeftSideAssignment: true. ]. 
	].
	
	jsTypeLeft setValueFrom: jsTypeRight.
	^jsTypeLeft
	
]

{ #category : #visiting }
JSDataLoader >> visitJSON_BinaryExpression: aJSONDict [
	| jsTypeLeft jsTypeRight leftExpression rightExpression |
	jsTypeLeft := self visitJSON: (aJSONDict at:#left).
	jsTypeRight := self visitJSON: (aJSONDict at:#right).

	"Literals and JSTypeWithValue have values, not names"
	jsTypeLeft getName isNil
	ifTrue: [ leftExpression := jsTypeLeft getValue asString ]
	ifFalse:[ leftExpression := jsTypeLeft getName ].
	jsTypeRight getName isNil
	ifTrue: [ rightExpression := jsTypeRight getValue asString ]
	ifFalse:[ rightExpression := jsTypeRight getName ].

	^JSTypeWithValue new propValue: leftExpression,(aJSONDict at:#operator ifAbsent:''),rightExpression

]

{ #category : #visiting }
JSDataLoader >> visitJSON_BlockStatement: aJSONDict [
	self visitJSON_array: (aJSONDict at:#body).

]

{ #category : #visiting }
JSDataLoader >> visitJSON_BreakStatement: aJSONDict [
	"It does nothing at the moment"

]

{ #category : #visiting }
JSDataLoader >> visitJSON_CallExpression: aJSONDict [
	| jsType obj jsTypeArguments fc |
	jsType := (self visitJSON: (aJSONDict at:#callee)).
	jsType locInfo: (JSType getLocInfo: aJSONDict fileName: (self rootPath,'/',self currentFileName)). 
	"jsType locInfo: (JSType getLocInfo: (aJSONDict at:#callee) fileName: (self rootPath,'/',self currentFileName))." 
	"Creation of FAMIXJSCall" 
	fc := self ensureJSCall: context top callee: jsType. 
	fc typeOfFirstArgument: (((aJSONDict at:#arguments) isNotEmpty) 
									ifTrue: [ (((aJSONDict at:#arguments) at:1) at:#type)] 
									ifFalse: [ nil ]).
	"typeOfFirstArgument is used when exporting info to JSClassRefactor, to identify the following 'ugly case': properties only known at runtime."								

	jsType isIdentifier
	ifTrue:[ 
		(jsType getName = 'Object.create' )
		ifTrue:[ "It uses (#arguments at:1) because we are interested only in the first argument"
			jsTypeArguments := (self visitJSON: ((aJSONDict at:#arguments) at:1)).
			obj := jsTypeArguments isPrototype
				ifTrue: [ self createJSObjectForPrototype: jsTypeArguments prototype. ]
				ifFalse:[ self createJSObjectForPrototype: nil ].
			jsType := JSTypeObjectCreate new object: obj.
		] 
		ifFalse:[ 
			jsType setName: (jsType getName), '(...)'. 
		].
	]
	ifFalse:[ "It represents a call to a function that is a FAMIXJSProperty " 
		(jsType isProperty)	
		ifTrue: [ 
			self addFunctionCall: context top callee: jsType jsProperty jsValue. 
			"Creation of FAMIXJSCall"
			"self ensureJSCall: context top callee: jsType jsProperty."
		].
		"ifFalse:[	"
			"Creation of FAMIXJSCall"
			"self ensureJSCall: context top callee: jsType getValue."
"			MessageNotUnderstood new message: 'Creation of FAMIXJSCall not allowed';
			receiver: self;
			signal.
		].	"
	].	
	"Visiting arguments"
	aEmptyFct isArgument: true. 
	self visitJSON_array: (aJSONDict at:#arguments).
	aEmptyFct isArgument: false.

	(jsType isFunctionExpression) "Call expressions cannot return function type, we do not analyze return types"
	ifTrue: [ ^ JSTypeWithValue new propValue: 'CallExpression(...)' ].
	"It returns the jsType of the callee"
	^jsType

]

{ #category : #visiting }
JSDataLoader >> visitJSON_ConditionalExpression: aJSONDict [
	| dicAlternate |
	self visitJSON: (aJSONDict at:#test).
	self visitJSON: (aJSONDict at:#consequent).
	"The Alternate part may not exist"
	dicAlternate := (aJSONDict at:#alternate ifAbsent:nil).
	dicAlternate isNotNil
	ifTrue: [ self visitJSON: dicAlternate ].
	"I chose to return a 'meaningless' string because we cannot know, statically, if the conditional expression test will return true (consequent) or false(alternate)"
	^JSTypeWithValue new propValue: '#ConditionalExpression'
	"^consequent"
]

{ #category : #visiting }
JSDataLoader >> visitJSON_ContinueStatement: aJSONDict [
	"It does nothing at the moment"

]

{ #category : #visiting }
JSDataLoader >> visitJSON_DebuggerStatement: aJSONDict [
	"It does nothing at the moment"

]

{ #category : #visiting }
JSDataLoader >> visitJSON_DoWhileStatement: aJSONDict [
	self visitJSON: (aJSONDict at:#test).
	self visitJSON: (aJSONDict at:#body).

]

{ #category : #visiting }
JSDataLoader >> visitJSON_EmptyStatement: aJSONDict [
	"EmptyStatement is empty"

]

{ #category : #visiting }
JSDataLoader >> visitJSON_ExpressionStatement: aJSONDict [

	self visitJSON: (aJSONDict at: #expression).

]

{ #category : #visiting }
JSDataLoader >> visitJSON_ForInStatement: aJSONDict [
	self visitJSON: (aJSONDict at:#body).

]

{ #category : #visiting }
JSDataLoader >> visitJSON_ForOfStatement: aJSONDict [
	self visitJSON: (aJSONDict at:#body).

]

{ #category : #visiting }
JSDataLoader >> visitJSON_ForStatement: aJSONDict [
	self visitJSON: (aJSONDict at:#body).

]

{ #category : #visiting }
JSDataLoader >> visitJSON_FunctionDeclaration: aJSONDict [
	| fct jsType |

	jsType := (self visitJSON: (aJSONDict at:#id)).

	fct := self ensureJSFunction: jsType entityName parent: (context top) filePath: currentFileName. 
	fct isStub: false.
	fct sourceAnchor: (JSType getLocInfo: aJSONDict fileName: (self rootPath,'/',self currentFileName)). 

	"Parameters"
	(aJSONDict at:#params) do: [ :subJSON |	fct params: (self ensureJSParameter: (self visitJSON: subJSON) parent: fct) ].

	" return value"
	jsType := JSTypeFunction new.
	jsType function: fct.

	"Put function on the stack because we can have inner functions"
	context push: fct.
	self visitJSON: (aJSONDict at:#body).
	context pop.
	
	^ jsType 
]

{ #category : #visiting }
JSDataLoader >> visitJSON_FunctionExpression: aJSONDict [
	| fct jsType fctName |

	(aJSONDict at:#id ifAbsent:nil) isNotNil
	ifTrue: [ 
		fctName := (self visitJSON: (aJSONDict at:#id)) getName. 
	   fct := self ensureJSFunction: fctName parent: (context top) filePath: currentFileName.
	] 
	ifFalse:[ fct := self createJSFunction: nil parent: (context top) ].
	"fct := self createJSFunction: fctName parent: (context top)."
	fct isStub: false.
	fct sourceAnchor: (JSType getLocInfo: aJSONDict fileName: (self rootPath,'/',self currentFileName)). 

	"Parameters"
	(aJSONDict at:#params) do: [ :subJSON |	fct params: (self ensureJSParameter: (self visitJSON: subJSON) parent: fct) ].

	" return value"
	jsType := JSTypeFunction new.
	jsType function: fct.

	"Put function on the stack because we can have inner functions"
	context push: fct. 
	self visitJSON: (aJSONDict at:#body).
	context pop.
	
	^ jsType 
]

{ #category : #visiting }
JSDataLoader >> visitJSON_Identifier: aJSONDict [
	| jsType jsName |

	jsName := (aJSONDict at: #name).
	(jsName = 'prototype')
	ifTrue: [ jsType := JSTypePrototype new]
	ifFalse:[ 
		jsType := JSTypeIdentifier new entityName: jsName.
		"jsType locInfo: (JSType getLocInfo: (aJSONDict at: #loc ifAbsent: nil) fileName: (self currentFileName)). "
		jsType locInfo: (JSType getLocInfo: aJSONDict fileName: (self rootPath,'/',self currentFileName,'.js')). 
	].	
	^jsType
	"^ aJSONDict at: #name"
]

{ #category : #visiting }
JSDataLoader >> visitJSON_IfStatement: aJSONDict [
	| dicAlternate |
	self visitJSON: (aJSONDict at:#test).
	self visitJSON: (aJSONDict at:#consequent).
	dicAlternate := (aJSONDict at:#alternate ifAbsent:nil).
	(dicAlternate isNotNil)
	ifTrue: [ self visitJSON: dicAlternate ].

]

{ #category : #visiting }
JSDataLoader >> visitJSON_LabeledStatement: aJSONDict [
	self visitJSON: (aJSONDict at:#body).

]

{ #category : #visiting }
JSDataLoader >> visitJSON_Literal: aJSONDict [
	^JSTypeLiteral new propValue: (aJSONDict at: #value)
	"^ JSType new entityName: (aJSONDict at: #value)"

]

{ #category : #visiting }
JSDataLoader >> visitJSON_LogicalExpression: aJSONDict [
	| jsTypeLeft jsTypeRight leftExpression rightExpression |
	jsTypeLeft := self visitJSON: (aJSONDict at:#left).
	jsTypeRight := self visitJSON: (aJSONDict at:#right).

	"Literals and JSTypeWithValue have values, not names"
	jsTypeLeft getName isNil
	ifTrue: [ leftExpression := jsTypeLeft getValue asString ]
	ifFalse:[ leftExpression := jsTypeLeft getName ].
	jsTypeRight getName isNil
	ifTrue: [ rightExpression := jsTypeRight getValue asString ]
	ifFalse:[ rightExpression := jsTypeRight getName ].

	^JSTypeWithValue new propValue: leftExpression,(aJSONDict at:#operator ifAbsent:''),rightExpression

]

{ #category : #visiting }
JSDataLoader >> visitJSON_MemberExpression: aJSONDict [
	| obj prop returnJSType  objProp |

	obj  := (self visitJSON: (aJSONDict at: #object)).
	prop := (self visitJSON: (aJSONDict at: #property)).
	
	(obj isPrototype)
	ifTrue:["If (obj prototype isNil), then the code has a variable (identifier) named 'prototype', instead of a prototype object ."
		(obj prototype isNil)
		ifTrue:[ obj := JSTypeIdentifier new entityName: 'prototype' ].
	].	

	((obj isThisExpression) or: [ obj isNewExpression ])
	ifTrue: [
		returnJSType := JSTypeProperty new.
		(obj isThisExpression) 
		ifTrue: [ returnJSType jsProperty: ((self ensureJSProperty: prop parent: context top) isBoundToThis: true) ]
		ifFalse:[ returnJSType jsProperty: (self ensureJSProperty: prop parent: obj object) ].
	]
	ifFalse:[
		obj isPrototype
		ifTrue: [
			returnJSType := JSTypeProperty new.
			returnJSType jsProperty: (self ensureJSProperty: prop parent: obj prototype)
		]
		ifFalse:[
			prop isPrototype
			ifTrue: [ "If prop isPrototype, then we have a MemberExpression inside another, and we are in the innermost" 
				"prop prototype: (self ensureJSPrototype: (self ensureJSFunction: obj entityName parent: (context top) filePath: currentFileName))."
				prop prototype: (self ensureJSPrototype: (self ensureJSFunctionForPrototype: obj entityName filePath: currentFileName)).
				returnJSType := prop.
			]
			ifFalse:[
				((prop isIdentifier) and: (obj isIdentifier))
				ifTrue: [ "Doted notation"
					"Look for possible object (singleton) that was previously created"
					objProp := self jsFindObjectProperty: obj getName parent: context top.
					(objProp isNotNil)
					ifTrue: [ returnJSType := JSTypeProperty new jsProperty: (self ensureJSProperty: prop parent: objProp) ]
					ifFalse:[ returnJSType := JSTypeIdentifier new entityName: (obj getName,'.',prop getName) ].
				]
				ifFalse:[ 
					(((prop isLiteral) & (obj isIdentifier)) and: [ prop getValue isKindOf: String ])
					ifTrue: [ "Squared brackets notation"
						returnJSType := JSTypeIdentifier new entityName: (obj getName,'.',prop getValue).
					]
					ifFalse:[
						(obj isProperty) & (prop isIdentifier)
						ifTrue:[ 
							(obj getName isNotNil) 
							ifTrue: [ obj jsProperty name: (obj getName,'.',prop getName) ]
							ifFalse:[ obj jsProperty name: (prop getName) ].
						].

						returnJSType := obj.
					].		
					"ifFalse:[ returnJSType := obj ]."
				].
			].
		].
	].	
	^ returnJSType
	
]

{ #category : #visiting }
JSDataLoader >> visitJSON_NewExpression: aJSONDict [
	| jsType jsTypeObj |
	jsType := (self visitJSON: (aJSONDict at:#callee)).
	"Creates an object without a name because it is not known at this point"
	jsTypeObj := JSTypeNewExpression new entityName: jsType getName.
	jsTypeObj object: (self createJSObjectForFct: nil fctName: jsType getName).
	"Visiting arguments"
	self visitJSON_array: (aJSONDict at:#arguments).

	^jsTypeObj.

]

{ #category : #visiting }
JSDataLoader >> visitJSON_ObjectExpression: aJSONDict [
	"Creates an object without a name"
	| obj |
	obj := self createJSObjectForPrototype: nil.
	context push: obj.
	self visitJSON_array: (aJSONDict at:#properties).
	context pop.
	^ JSTypeObjectCreate new object: obj.
	"^ JSTypeWithValue new propValue:'ObjectExpression'"	
]

{ #category : #visiting }
JSDataLoader >> visitJSON_ObjectPattern: aJSONDict [
	"This functionality IS NOT YET implemented / tested (ES 6)"
	^ self visitJSON_ObjectExpression: aJSONDict.
]

{ #category : #visiting }
JSDataLoader >> visitJSON_Program: aJSONDict [
	self createJSFile: (aJSONDict at:#loc ifAbsent: nil).
	self visitJSON_array: (aJSONDict at:#body).
]

{ #category : #visiting }
JSDataLoader >> visitJSON_Property: aJSONDict [
	"Creates a property that belongs to an object. The object is on the top of the stack (context)."
	| jsTypeKey jsTypeValue |
	jsTypeKey := self visitJSON: (aJSONDict at:#key).
	jsTypeValue := self visitJSON: (aJSONDict at:#value).
	
	jsTypeValue getName isNil
	ifTrue:[	jsTypeValue setNameFrom: jsTypeKey ].	

	jsTypeKey isIdentifier
	ifTrue: [ jsTypeKey := JSTypeWithValue new entityName: jsTypeKey getName ].
	
	jsTypeKey setValueFrom: jsTypeValue.
		
	"jsTypeValue setNameFrom: jsTypeKey."
	
	^self createJSProperty: jsTypeKey parent: context top.

]

{ #category : #visiting }
JSDataLoader >> visitJSON_ReturnStatement: aJSONDict [
	aEmptyFct isArgument: true.
	self visitJSON: (aJSONDict at:#argument).
	aEmptyFct isArgument: false.	
]

{ #category : #visiting }
JSDataLoader >> visitJSON_SequenceExpression: aJSONDict [
	self visitJSON_array: (aJSONDict at:#expressions).
	^ JSTypeWithValue new propValue:'SequenceExpression'
]

{ #category : #visiting }
JSDataLoader >> visitJSON_SwitchCase: aJSONDict [
	self visitJSON_array: (aJSONDict at:#consequent).

]

{ #category : #visiting }
JSDataLoader >> visitJSON_SwitchStatement: aJSONDict [
	self visitJSON_array: (aJSONDict at:#cases).

]

{ #category : #visiting }
JSDataLoader >> visitJSON_TemplateLiteral: aJSONDict [
	"This functionality IS NOT YET implemented / tested (ES 6)"
	^ ''
]

{ #category : #visiting }
JSDataLoader >> visitJSON_ThisExpression: aJSONDict [
	"'context top' is a FAMIXJSFunction"
	((context top isNotNil) and: [ context top locFirstThisExp isNil ])
	ifTrue: [ context top locFirstThisExp: (JSType getLocInfo: aJSONDict fileName: (self rootPath,'/',self currentFileName)).  ].
	
	^ JSTypeThisExpression new
]

{ #category : #visiting }
JSDataLoader >> visitJSON_ThrowStatement: aJSONDict [
	| jsType |
	jsType := (self visitJSON: (aJSONDict at:#argument)).
	"(jsType isNewExpression)
	ifTrue:[	self createJSObjectForFct: nil fctName: jsType getName 	]."
	^jsType


]

{ #category : #visiting }
JSDataLoader >> visitJSON_TryStatement: aJSONDict [
	self visitJSON: (aJSONDict at:#block).

]

{ #category : #visiting }
JSDataLoader >> visitJSON_UnaryExpression: aJSONDict [
	| jsTypeArgument |
	jsTypeArgument := self visitJSON: (aJSONDict at:#argument).
	(jsTypeArgument isProperty) & (jsTypeArgument getName isNotNil)
	ifTrue: [ 
		(aJSONDict at:#prefix ifAbsent:true) 
		ifTrue: [ jsTypeArgument jsProperty jsValue: (aJSONDict at:#operator), ' ', jsTypeArgument getName ]
		ifFalse:[ jsTypeArgument jsProperty jsValue: jsTypeArgument getName, ' ', (aJSONDict at:#operator) ]
	].
	^jsTypeArgument

]

{ #category : #visiting }
JSDataLoader >> visitJSON_UpdateExpression: aJSONDict [
	| jsTypeArgument |
	jsTypeArgument := self visitJSON: (aJSONDict at:#argument).
	(jsTypeArgument isProperty)
	ifTrue: [ 
		(aJSONDict at:#prefix)
		ifTrue: [ jsTypeArgument jsProperty jsValue: (aJSONDict at:#operator ifAbsent:''),jsTypeArgument getName ]
		ifFalse:[ jsTypeArgument jsProperty jsValue: jsTypeArgument getName,(aJSONDict at:#operator ifAbsent:'') ].
	].
	^jsTypeArgument

]

{ #category : #visiting }
JSDataLoader >> visitJSON_VariableDeclaration: aJSONDict [
	self visitJSON_array: (aJSONDict at:#declarations).
	

]

{ #category : #visiting }
JSDataLoader >> visitJSON_VariableDeclarator: aJSONDict [
	| jsTypeId jsTypeInit |
	jsTypeId := self visitJSON: (aJSONDict at:#id).
	"(aJSONDict at:#init) can be nil if a variable is declared but no value is assigned to it, like in: 'var teste;' "
	(aJSONDict at:#init) isNotNil
	ifTrue:[ 
		jsTypeInit := self visitJSON: (aJSONDict at:#init).
		(jsTypeInit isNewExpression)
		ifTrue:[
			"self createJSObjectForFct: jsTypeId getName fctName: jsTypeInit getName."
			"Sets the name of the object that was just created"
			jsTypeInit setNameFrom: jsTypeId.
		]
		ifFalse:[
			(jsTypeInit isFunctionExpression or: [ jsTypeInit isObjectCreate ])
			ifTrue:[ jsTypeInit setNameFrom: jsTypeId ].

			"If inside a function, create a new property, not bound to this"
			"self isInsideAFunction 
			ifTrue:["
				
				"If it is not inside a function, create a new property, not bound to this"
				jsTypeId isIdentifier
				ifTrue: [ jsTypeId := JSTypeWithValue new entityName: jsTypeId getName ].

				jsTypeId setValueFrom: jsTypeInit.
				"jsTypeId propValue: (jsTypeInit propValue)."
				(self ensureJSProperty: jsTypeId parent: (context top)) isBoundToThis: false.
			"]."
		].
	].

]

{ #category : #visiting }
JSDataLoader >> visitJSON_WhileStatement: aJSONDict [
	self visitJSON: (aJSONDict at:#test).
	self visitJSON: (aJSONDict at:#body).

]

{ #category : #visiting }
JSDataLoader >> visitJSON_WithStatement: aJSONDict [
	self visitJSON: (aJSONDict at:#body).

]

{ #category : #visiting }
JSDataLoader >> visitJSON_YieldExpression: aJSONDict [
	self visitJSON: (aJSONDict at:#argument).

]

{ #category : #visiting }
JSDataLoader >> visitJSON_array: aJSONDict [
	
	aJSONDict isDictionary
		ifTrue: [ self visitJSON: aJSONDict ]
		ifFalse: [ "a collection of JSONDictionnaries"
			aJSONDict do: [ :subJSON |
				self visitJSON: subJSON
			]
		]	
	
]
