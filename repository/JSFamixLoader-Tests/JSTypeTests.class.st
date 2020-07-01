Class {
	#name : #JSTypeTests,
	#superclass : #TestCase,
	#category : #'JSFamixLoader-Tests'
}

{ #category : #examples }
JSTypeTests class >> locInfoDictionary [
	^ ' {
	       "type": "MemberExpression",
          "object": {
				"type": "Identifier",
            "name": "window",
            "loc": {
	            "start": {
	               "line": 15,
                  "column": 15
               },
               "end": {
 	              "line": 15,
                 "column": 21
               }
           }
        },
        "property": {
	        "type": "Identifier",
           "name": "setTimeout",
           "loc": {
	           "start": {
	              "line": 15,
	              "column": 22
              },
              "end": {
	              "line": 15,
                 "column": 32
              }
          }
       },
       "loc": {
	       "start": {
 	         "line": 15,
            "column": 15
          },
          "end": {
   		       "line": 15,
             "column": 32
          }
      }
  }
'
]

{ #category : #examples }
JSTypeTests class >> locInfoDictionaryWithMultipleObjects [
	^ '{
			"type": "MemberExpression",
			"object": {
				"type": "MemberExpression",
				"object": {
					"type": "Identifier",
					"name": "el",
					"loc": {
						"start": {
							"line": 64,
							"column": 18
						},
						"end": {
							"line": 64,
							"column": 20
						}
					}
				},
				"property": {
					"type": "Identifier",
					"name": "className",
					"loc": {
						"start": {
							"line": 64,
							"column": 21
						},
						"end": {
							"line": 64,
							"column": 30
						}
					}
				},
				"loc": {
					"start": {
						"line": 64,
						"column": 18
					},
					"end": {
						"line": 64,
						"column": 30
					}
				}
			},
			"property": {
				"type": "Identifier",
				"name": "replace",
				"loc": {
					"start": {
						"line": 64,
						"column": 31
					},
					"end": {
						"line": 64,
						"column": 38
					}
				}
			},
			"loc": {
				"start": {
					"line": 64,
					"column": 18
				},
				"end": {
					"line": 64,
					"column": 38
				}
			}
		}
	}	
'
]

{ #category : #examples }
JSTypeTests class >> locInfoDictionaryWithoutObject [
	^ '{
			"type": "Identifier",
			"name": "callback",
			"loc": {
				"start": {
					"line": 16,
					"column": 8
				},
				"end": {
					"line": 16,
					"column": 16
				}
			}
	  }
'
]

{ #category : #running }
JSTypeTests >> jsonFor: aSelector [
	^ NeoJSONReader fromString: (JSTypeTests perform: aSelector) 
]

{ #category : #'data get/put' }
JSTypeTests >> testGetLocInfo [
	| jsType |
	
	jsType := JSType getLocInfo: (self jsonFor: #locInfoDictionary) fileName: '/Users/Test/Test'.
	
	self assert: jsType startLine equals: 15.
	self assert: jsType endLine equals: 15.
	self assert: jsType startColumn equals: 15.
	self assert: jsType endColumn equals: 21.
	self assert: jsType fileName equals: '/Users/Test/Test.js'.

]

{ #category : #'data get/put' }
JSTypeTests >> testGetLocInfoWithMultipleObjects [
	| jsType |
	
	jsType := JSType getLocInfo: (self jsonFor: #locInfoDictionaryWithMultipleObjects) fileName: '/Users/Test/Test'.
	
	self assert: jsType startLine equals: 64.
	self assert: jsType endLine equals: 64.
	self assert: jsType startColumn equals: 18.
	self assert: jsType endColumn equals: 30.
	self assert: jsType fileName equals: '/Users/Test/Test.js'.

]

{ #category : #'data get/put' }
JSTypeTests >> testGetLocInfoWithoutObject [
	| jsType |
	
	jsType := JSType getLocInfo: (self jsonFor: #locInfoDictionaryWithoutObject) fileName: '/Users/Test/Test'.
	
	self assert: jsType startLine equals: 16.
	self assert: jsType endLine equals: 16.
	self assert: jsType startColumn equals: 8.
	self assert: jsType endColumn equals: 16.
	self assert: jsType fileName equals: '/Users/Test/Test.js'.

]
