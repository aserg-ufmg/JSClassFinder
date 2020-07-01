Class {
	#name : #JSDataLoaderTests,
	#superclass : #TestCase,
	#instVars : [
		'aJSDataLoader',
		'model'
	],
	#category : #'JSFamixLoader-Tests'
}

{ #category : #examples }
JSDataLoaderTests class >> arrayExpression [
	^ '{
			"type": "ArrayExpression",
			"elements": [  ]
		}'
]

{ #category : #examples }
JSDataLoaderTests class >> assignmentExpressionIdentifierIdentifier [
	^ '{
			"type": "AssignmentExpression",
			"operator": "=",
			"left": { 
				"type": "Identifier",
				"name": "dx"
			},
			"right": { 
				"type": "Identifier",
				"name": "dy"
			}	
     }'
]

{ #category : #examples }
JSDataLoaderTests class >> assignmentExpressionIdentifierLiteral [
	^ '{
			"type": "AssignmentExpression",
			"operator": "=",
			"left": { 
				"type": "Identifier",
				"name": "definition"
			},
			"right": { 
				"type": "Literal",
				"value": "teste value"
			}	
     }'
]

{ #category : #examples }
JSDataLoaderTests class >> assignmentExpressionIdentifierNewExpression [
	^ '{
			"type": "AssignmentExpression",
			"operator": "=",
			"left": { 
				"type": "Identifier",
				"name": "currentMerge"
			},
			"right": { 
				"type": "NewExpression",
				"callee": {
					"type": "Identifier",
					"name": "Merge"
				},
				"arguments": [  ]
			}	
     }'
]

{ #category : #examples }
JSDataLoaderTests class >> assignmentExpressionMemberExpressionFunctionExpression [
	^ '{
			"type": "AssignmentExpression",
			"operator": "=",
			"left": {
				"type": "MemberExpression",
				"object": {
					"type": "Identifier",
					"name": "_commands"
				},
				"property": {
					"type": "Identifier",
					"name": "getArea"
				}
			},
			"right": {
				"type": "FunctionExpression",
				"id": null,
				"params": [  ],
				"body": {
					"type": "BlockStatement",
					"body": [ ]
				}
			}	
     }'
]

{ #category : #examples }
JSDataLoaderTests class >> assignmentExpressionMemberExpressionFunctionExpressionMemberExpressionLiteral [
	^ '{
			"type": "AssignmentExpression",
			"left": {
				"type": "MemberExpression",
				"object": {
					"type": "Identifier",
					"name": "_commands"
				},
				"property": {
					"type": "Identifier",
					"name": "inner_set"
				}
			},
			"right": {
				"type": "FunctionExpression",
				"params": [  ],
				"body": {
					"type": "BlockStatement",
					"body": [
						{
							"type": "ExpressionStatement",
							"expression": {
								"type": "AssignmentExpression",
								"left": {
									"type": "MemberExpression",
									"object": {
										"type": "Identifier",
										"name": "_commands"
									},
									"property": {
										"type": "Identifier",
										"name": "radius"
									}
								},
								"right": {
									"type": "Literal",
									"value": 10
								}
							}
						}
					]
				}
			}			
		}'
]

{ #category : #examples }
JSDataLoaderTests class >> assignmentExpressionMemberExpressionLiteral [
	^ '{
			"type": "AssignmentExpression",
			"operator": "=",
			"left": {
				"type": "MemberExpression",
				"object": {
					"type": "Identifier",
					"name": "_commands"
				},
				"property": {
					"type": "Identifier",
					"name": "radius"
				}
			},
			"right": {
				"type": "Literal",
				"value": 10
			}
     }'
]

{ #category : #examples }
JSDataLoaderTests class >> assignmentExpressionPrototypeCallExpressionObjectCreate [
	^ '{
			"type": "AssignmentExpression",
			"operator": "=",
			"left": {
				"type": "MemberExpression",
				"object": {
					"type": "Identifier",
					"name": "Cat"
				},
				"property": {
					"type": "Identifier",
					"name": "prototype"
				}
			},
			"right": {
				"type": "CallExpression",
				"callee": {
					"type": "MemberExpression",
					"object": {
						"type": "Identifier",
						"name": "Object"
					},
					"property": {
						"type": "Identifier",
						"name": "create"
					}
				},
				"arguments": [
					{
						"type": "MemberExpression",
						"object": {
							"type": "Identifier",
							"name": "Mammal"
						},
						"property": {
							"type": "Identifier",
							"name": "prototype"
						}
					}
				]
			}
		}'
]

{ #category : #examples }
JSDataLoaderTests class >> assignmentExpressionPrototypeFunctionExpression [
	^ '{
			"type": "AssignmentExpression",
			"left": { 
				"type": "MemberExpression",
				"object": {
					"type": "MemberExpression",
					"object": { 
						"type": "Identifier",
						"name": "circle"
					},
					"property": { 
						"type": "Identifier",
						"name": "prototype"
					}
				},
				"property": {
					"type": "Identifier",
					"name": "getArea"
				}
			},
			"right": { 
				"type": "FunctionExpression",
				"params": [  ],
				"body": { 
					"type": "BlockStatement",
					"body": [  ]
				 }
			}	
     }'
]

{ #category : #examples }
JSDataLoaderTests class >> assignmentExpressionPrototypeLiteral [
	^ '{
			"type": "AssignmentExpression",
			"left": { 
				"type": "MemberExpression",
				"object": {
					"type": "MemberExpression",
					"object": { 
						"type": "Identifier",
						"name": "circle"
					},
					"property": { 
						"type": "Identifier",
						"name": "prototype"
					}
				},
				"property": {
					"type": "Identifier",
					"name": "pi"
				}
			},
			"right": { 
				"type": "Literal",
				"value": 3.14
			}	
     }'
]

{ #category : #examples }
JSDataLoaderTests class >> assignmentExpressionPrototypeNewExpression [
	^ '{
			"type": "AssignmentExpression",
			"operator": "=",
			"left": {
				"type": "MemberExpression",
				"object": {
					"type": "Identifier",
					"name": "DecoratedClass"
				},
				"property": {
					"type": "Identifier",
					"name": "prototype"
				}
			},
			"right": {
				"type": "NewExpression",
				"callee": {
					"type": "Identifier",
					"name": "ctr"
				},
				"arguments": [  ]
			}
		}'
]

{ #category : #examples }
JSDataLoaderTests class >> assignmentExpressionPrototypePropertyPrototypeAsIdentifier [
	^ '{
			"type": "AssignmentExpression",
			"left": { 
				"type": "MemberExpression",
				"object": {
					"type": "MemberExpression",
					"object": { 
						"type": "Identifier",
						"name": "sub"
					},
					"property": { 
						"type": "Identifier",
						"name": "prototype"
					}
				},
				"property": {
					"type": "Identifier",
					"name": "prop"
				}
			},
			"right": { 
				"type": "MemberExpression",
				"object": { 
					"type": "Identifier",
					"name": "prototype"
				 },
				"property": { 
					"type": "Identifier",
					"name": "prop"
				}
			}	
     }'
]

{ #category : #examples }
JSDataLoaderTests class >> assignmentExpressionThisExpressionComposedName [
	^ '{
			"type": "AssignmentExpression",
			"operator": "=",
			"left": { 
				"type": "MemberExpression",
				"object": {	"type": "ThisExpression" },
				"property": {
					"type": "Identifier",
					"name": "teste"
				}
			},
			"right": { 
				"type": "MemberExpression",
				"object": {
					"type": "Identifier",
					"name": "ellipse"
				},
				"property": {
					"type": "Identifier",
					"name": "getArea"
				}
			}	
     }'
]

{ #category : #examples }
JSDataLoaderTests class >> assignmentExpressionThisExpressionIdentifier [
	^ '{
			"type": "AssignmentExpression",
			"operator": "=",
			"left": { 
				"type": "MemberExpression",
				"computed": false,
				"object": {
					"type": "ThisExpression"
				},
				"property": {
					"type": "Identifier",
					"name": "teste"
				}
			},
			"right": { 
				"type": "Identifier",
				"name": "radius"
			}	
     }'
]

{ #category : #examples }
JSDataLoaderTests class >> assignmentExpressionThisExpressionLiteral [
	^ '{
			"type": "AssignmentExpression",
			"operator": "=",
			"left": { 
				"type": "MemberExpression",
				"computed": false,
				"object": {
					"type": "ThisExpression"
				},
				"property": {
					"type": "Identifier",
					"name": "teste"
				}
			},
			"right": { 
				"type": "Literal",
				"value": "teste value"
			}	
     }'
]

{ #category : #examples }
JSDataLoaderTests class >> binaryExpressionCallExpression [
	^ '{
			"type": "BinaryExpression",
			"operator": "*",
			"left": { 
				"type": "CallExpression",
				"callee": { 
					"type": "Identifier",
					"name": "plus"
				 },
				"arguments": [  ]
			 },
			"right": { 
				"type": "Literal",
				"value": 5
			 }
		}'
]

{ #category : #examples }
JSDataLoaderTests class >> binaryExpressionThisExpression [
	^ '{
			"type": "BinaryExpression",
			"operator": "*",
			"left": { 
				"type": "MemberExpression",
				"object": { "type": "ThisExpression" },
				"property": { 
					"type": "Identifier",
					"name": "radius"
				 }
			 },
			"right": { 
				"type": "Literal",
				"value": 2
			 }
		}'
]

{ #category : #examples }
JSDataLoaderTests class >> binaryExpressionTwoLiterals [
	^ '{
			"type": "BinaryExpression",
			"operator": "*",
			"left": { 
				"type": "Literal",
				"value": 3
			 },
			"right": { 
				"type": "Literal",
				"value": 2
			 }
		}'
]

{ #category : #examples }
JSDataLoaderTests class >> callExpressionMemberExpression [
	^ '{
			"type": "CallExpression",
			"callee": {
				"type": "MemberExpression",
				"object": {
					"type": "MemberExpression",
					"object": {
						"type": "Identifier",
						"name": "Point"
					},
					"property": { 
						"type": "Identifier",
						"name": "prototype"
					}
				},
				"property": {
					"type": "Identifier",
					"name": "toString"
				}
			},
			"arguments": [
				{
					"type": "MemberExpression",
					"object": {
						"type": "Identifier",
						"name": "p1"
					},
					"property": {
						"type": "Identifier",
						"name": "prototype"
					}
				}
			]
		}'
]

{ #category : #examples }
JSDataLoaderTests class >> callExpressionObjectCreate [
	^ '{
			"type": "CallExpression",
			"callee": {
				"type": "MemberExpression",
				"object": {
					"type": "Identifier",
					"name": "Object"
				},
				"property": {
					"type": "Identifier",
					"name": "create"
				}
			},
			"arguments": [
				{
					"type": "MemberExpression",
					"object": {
						"type": "Identifier",
						"name": "Mammal"
					},
					"property": {
						"type": "Identifier",
						"name": "prototype"
					}
				}
			]
		}'
]

{ #category : #examples }
JSDataLoaderTests class >> callExpressionWithNoArguments [
	^ '{
			"type": "CallExpression",
			"callee": { 
				"type": "Identifier",
				"name": "plus"
			 },
			"arguments": [  ]
		}'
]

{ #category : #examples }
JSDataLoaderTests class >> conditionalExpressionConsequentMemberExpression [
	^ '{
			"type": "ConditionalExpression",
			"test": {
				"type": "Identifier",
				"name": "won"
         },			
			"consequent": {
				"type": "MemberExpression",
				"object": {
					"type": "MemberExpression",
					"object": {
						"type": "Identifier",
						"name": "editDesc1"
					},
					"property": { 
						"type": "Identifier",
						"name": "edit"
					}
				},
				"property": { 
					"type": "Literal",
					"value": 0
				}
			}
		}'
]

{ #category : #examples }
JSDataLoaderTests class >> functionDeclarationNoParamNoBody [
	^ '{ "type": "FunctionDeclaration",
            "id": {
                "type": "Identifier",
                "name": "circle"
            },
            "params": [],
            "defaults": [],
            "body": {
                "type": "BlockStatement",
                "body": [] }
}'
]

{ #category : #examples }
JSDataLoaderTests class >> functionDeclarationWithParam [
	^ '{
			"type": "FunctionDeclaration",
			"id": { 
				"type": "Identifier",
				"name": "setRadius"
			 },
         "params": [
				{
					"type": "Identifier",
					"name": "radius"
				}
			],
			"body": {
				"type": "BlockStatement",
				"body": [ 	 ]
			}
		}'
]

{ #category : #examples }
JSDataLoaderTests class >> functionExpressionReturnStatement [
	^ '{
			"type": "FunctionExpression",
			"params": [  ],
			"body": {
				"type": "BlockStatement",
             "body": [ 
					{ 
						"type": "ReturnStatement",
						"argument": { 
							"type": "Identifier",
							"name": "teste"
						}
					 }
				 ]
			}
		}'
]

{ #category : #examples }
JSDataLoaderTests class >> functionExpressionWithName [
	^ '{
			"type": "FunctionExpression",
			"id": { 
				"type": "Identifier",
				"name": "Compiler"
			 },
			"params": [  ],
			"body": {
				"type": "BlockStatement",
             "body": [ 	 ]
			}
		}'
]

{ #category : #examples }
JSDataLoaderTests class >> functionExpressionWithParams [
	^ '{
			"type": "FunctionExpression",
			"id": { 
				"type": "Identifier",
				"name": "setRadius"
			 },
         "params": [
				{
					"type": "Identifier",
					"name": "radius"
				},
				{
					"type": "Identifier",
					"name": "teste"
				}
			],
			"body": {
				"type": "BlockStatement",
             "body": [ 	 ]
			}
		}'
]

{ #category : #examples }
JSDataLoaderTests class >> ifStatementAlternateBlockStatement [
	^ '{
			"type": "IfStatement",
			"test": {  
				"type": "Identifier",
				"name": "previousState",
				"loc": {
					"start": {
						"line": 160,
						"column": 6
					},
					"end": {
						"line": 160,
						"column": 19
					}
				}
			},
			"consequent": {
				"type": "ReturnStatement",
				"argument": {
					"type": "Literal",
					"value": false
				}
			},
			"alternate": { 
				"type": "BlockStatement",
				"body": [  ]
			 }
		}'
]

{ #category : #examples }
JSDataLoaderTests class >> ifStatementConsequentReturnStatement [
	^ '{
			"type": "IfStatement",
			"test": {  
				"type": "Identifier",
				"name": "previousState",
				"loc": {
					"start": {
						"line": 160,
						"column": 6
					},
					"end": {
						"line": 160,
						"column": 19
					}
				}
			},
			"consequent": {
				"type": "ReturnStatement",
				"argument": {
					"type": "Literal",
					"value": false
				}
			}
		}'
]

{ #category : #examples }
JSDataLoaderTests class >> innerBinaryExpression [
	^ '{
			"type": "BinaryExpression",
			"operator": "*",
			"left": {
				"type": "BinaryExpression",
				"operator": "*",
				"left": {
					"type": "MemberExpression",
					"object": { "type": "ThisExpression" },
					"property": {
						"type": "Identifier",
						"name": "radius"
					}
				},
				"right": {
					"type": "MemberExpression",
					"object": { "type": "ThisExpression" },
					"property": {
						"type": "Identifier",
						"name": "radius"
					}
				}
			},
			"right": {
				"type": "Literal",
				"value": 3.14
			}
		}'
]

{ #category : #examples }
JSDataLoaderTests class >> innerFunctionDeclarationNoParamNoBody [
	^ '{     "type": "FunctionDeclaration",
            "id": {
                "type": "Identifier",
                "name": "circle"
            },
            "params": [],
            "defaults": [],
            "body": {	
                "type": "BlockStatement",
                "body": [
                    {
                        "type": "FunctionDeclaration",
                        "id": {
                            "type": "Identifier",
                            "name": "plus"
                        },
                        "params": [],
                        "defaults": [],
                        "body": {
                            "type": "BlockStatement",
									"body": []
								}
						} ]		
				}
		}'
]

{ #category : #examples }
JSDataLoaderTests class >> logicalExpressionIdentifierLiteral [
	^ '{
			"type": "LogicalExpression",
			"operator": "||",
			"left": { 
				"type": "Identifier",
				"name": "radius"
			 },
			"right": { 
				"type": "Literal",
				"value": 0
			 }
		}'
]

{ #category : #examples }
JSDataLoaderTests class >> logicalExpressionIdentifierSequenceExpression [
	^ '{
			"type": "LogicalExpression",
			"operator": "||",
			"left": { 
				"type": "Identifier",
				"name": "radius"
			 },
			"right": { 
				"type": "SequenceExpression",
				"expressions": [  ]
			 }
		}'
]

{ #category : #examples }
JSDataLoaderTests class >> memberExpressionPrototype [
	^ '{
				"type": "MemberExpression",
				"object": { 
					"type": "Identifier",
					"name": "circle"
				},
				"property": { 
					"type": "Identifier",
					"name": "prototype"
				}
			}'
]

{ #category : #examples }
JSDataLoaderTests class >> memberExpressionPrototypeProperty [
	^ '{
			"type": "MemberExpression",
			"computed": false,
			"object": {
				"type": "MemberExpression",
				"computed": false,
				"object": { 
					"type": "Identifier",
					"name": "circle"
				},
				"property": { 
					"type": "Identifier",
					"name": "prototype"
				}
			},
			"property": {
				"type": "Identifier",
				"name": "getArea"
			}
     }'
]

{ #category : #examples }
JSDataLoaderTests class >> memberExpressionThisExpression [
	^ '{
			"type": "MemberExpression",
			"object": {
				"type": "ThisExpression"
			},
			"property": {
				"type": "Identifier",
				"name": "teste",
				"loc": {
					"start": {
						"line": 7,
						"column": 6
					},
					"end": {
						"line": 8,
						"column": 9
					}
				}
			}
     }'
]

{ #category : #examples }
JSDataLoaderTests class >> objectExpressionNoProperties [
	^ '{
			"type": "ObjectExpression",
			"properties": [  ]
		}'
]

{ #category : #examples }
JSDataLoaderTests class >> programLocEmptyBody [
	^ '{
			"type": "Program", 
			"loc": {
				"start": {
					"line": 1,
					"column": 0
				},
				"end": {
					"line": 21,
					"column": 54
				}
			},
         "body": [ ]
		}'
]

{ #category : #examples }
JSDataLoaderTests class >> propertyFunctionExpression [
	^ '{
			"type": "Property", 
			"key": { 
				"type": "Identifier",
				"name": "getAncestorWithClass"
			 },
			"value": { 
				"type": "FunctionExpression",
				"params": [  ],
				"body": {
					"type": "BlockStatement",
	             "body": [ 
						{ 
							"type": "ReturnStatement",
							"argument": { 
								"type": "Identifier",
								"name": "teste"
							}
						 }
					 ]
				}
		 	}
		}'
]

{ #category : #examples }
JSDataLoaderTests class >> returnStatementNewExpression [
	^ '{
			"type": "ReturnStatement", 
			"argument": { 
				"type": "NewExpression",
				"callee": {
					"type": "Identifier",
					"name": "DecryptStream"
				},
				"arguments": [ ]	
			 }
		}'
]

{ #category : #examples }
JSDataLoaderTests class >> thisExpressionLocInfo [
	^ '{
			"type": "ThisExpression",
			"loc": {
				"start": {
					"line": 16,
					"column": 2
				},
				"end": {
					"line": 16,
					"column": 6
				}
			}
		}'
]

{ #category : #examples }
JSDataLoaderTests class >> throwStatementNewExpression [
	^ '{
			"type": "ThrowStatement",
			"argument": {
				"type": "NewExpression",
				"callee": { 
					"type": "Identifier",
					"name": "Error"
				 },
				"arguments": [  ]
			}
		}'
]

{ #category : #examples }
JSDataLoaderTests class >> unaryExpressionMemberExpressionThisExpression [
	^ '{
			"type": "UnaryExpression",
			"operator": "!",
			"argument": {
				"type": "MemberExpression",
				"object": {  
					"type": "ThisExpression"
				},
				"property": { 
					"type": "Identifier",
					"name": "file"
				}
			},	
			"prefix": true
     }'
]

{ #category : #examples }
JSDataLoaderTests class >> updateExpressionThisExpressionIdentifier [
	^ '{
			"type": "UpdateExpression",
			"operator": "++",
			"argument": { 
				"type": "MemberExpression",
				"object": {
					"type": "ThisExpression"
				},
				"property": {
					"type": "Identifier",
					"name": "_refCount"
				}
			},
			"prefix": false	
     }'
]

{ #category : #examples }
JSDataLoaderTests class >> varDeclaratorBinaryExpressionThisExpression [
	^ '{
			"type": "VariableDeclarator",
			"id": {
				"type": "Identifier",
				"name": "diameter"
			},
			"init": {
				"type": "BinaryExpression",
				"operator": "*",
				"left": { 
					"type": "MemberExpression",
					"object": { "type": "ThisExpression" },
					"property": { 
						"type": "Identifier",
						"name": "radius"
					 }
				 },
				"right": { 
					"type": "Literal",
					"value": 2
				 }
			}
		}'
]

{ #category : #examples }
JSDataLoaderTests class >> varDeclaratorFunctionExpression [
	^ '{
			"type": "VariableDeclarator",
			"id": {
				"type": "Identifier",
				"name": "Mammal"
			},
			"init": {
				"type": "FunctionExpression",
				"params": [  ],
				"body": { 
					"type": "BlockStatement",
					"body": [  ]
				 }
			}
		}'
]

{ #category : #examples }
JSDataLoaderTests class >> varDeclaratorInitNew [
	^ '{
            "type": "VariableDeclarator",
            "id": {
                        "type": "Identifier",
                        "name": "smallCircle"
             },
                    "init": {
                        "type": "NewExpression",
                        "callee": {
                            "type": "Identifier",
                            "name": "circle"
                        },
                        "arguments": [ ]
                    }
         }'
]

{ #category : #examples }
JSDataLoaderTests class >> varDeclaratorNotBoundToThis [
	^ '{
            "type": "VariableDeclarator",
            "id": {
                        "type": "Identifier",
                        "name": "_commands"
             },
                    "init": {
                        "type": "Literal",
                        "value": "Class to define circles.",
                        "raw": ""
                    }
         }'
]

{ #category : #examples }
JSDataLoaderTests class >> varDeclaratorObjectExpression [
	^ '{
			"type": "VariableDeclarator",
			"id": {
				"type": "Identifier",
				"name": "_commands"
			},
			"init": {
				"type": "ObjectExpression",
				"properties": [  ]
			}
		}'
]

{ #category : #examples }
JSDataLoaderTests class >> varDeclaratorObjectExpressionWithProperties [
	^ '{
                    "type": "VariableDeclarator",
                    "id": {
                        "type": "Identifier",
                        "name": "myCircle"
                    },
                    "init": {
                        "type": "ObjectExpression",
                        "properties": [
                            {
                                "type": "Property",
                                "key": {
                                    "type": "Identifier",
                                    "name": "radius"
                                },
                                "value": {
                                    "type": "Literal",
                                    "value": 10,
                                    "raw": "10"
                                },
                                "kind": "init"
                            },
                            {
                                "type": "Property",
                                "key": {
                                    "type": "Identifier",
                                    "name": "pi"
                                },
                                "value": {
                                    "type": "Literal",
                                    "value": 3.14,
                                    "raw": "3.14"
                                },
                                "kind": "init"
                            },
                            {
                                "type": "Property",
                                "key": {
                                    "type": "Identifier",
                                    "name": "getArea"
                                },
                                "value": {
                                    "type": "FunctionExpression",
                                    "id": null,
                                    "params": [],
                                    "defaults": [],
                                    "body": {
                                        "type": "BlockStatement",
                                        "body": [
                                            {
                                                "type": "ReturnStatement",
                                                "argument": {
                                                    "type": "BinaryExpression",
                                                    "operator": "*",
                                                    "left": {
                                                        "type": "BinaryExpression",
                                                        "operator": "*",
                                                        "left": {
                                                            "type": "MemberExpression",
                                                            "object": {
                                                                "type": "ThisExpression"
                                                            },
                                                            "property": {
                                                                "type": "Identifier",
                                                                "name": "radius"
                                                            }
                                                        },
                                                        "right": {
                                                            "type": "MemberExpression",
                                                            "object": {
                                                                "type": "ThisExpression"
                                                            },
                                                            "property": {
                                                                "type": "Identifier",
                                                                "name": "radius"
                                                            }
                                                        }
                                                    },
                                                    "right": {
                                                        "type": "MemberExpression",
                                                        "object": {
                                                            "type": "ThisExpression"
                                                        },
                                                        "property": {
                                                            "type": "Identifier",
                                                            "name": "pi"
                                                        }
                                                    }
                                                }
                                            }
                                        ]
                                    }
                                },
                                "kind": "init"
                            }
                        ]
                    }
                }'
]

{ #category : #running }
JSDataLoaderTests >> createJSFunctionNamed: aString [
	| fct |
	fct := FAMIXJSFunction new name: aString.
	fct isStub: false.
	fct isArgument: false.
	fct filePath: ''.
	model add: fct.
	^ fct

]

{ #category : #running }
JSDataLoaderTests >> jsonFor: aSelector [
	^ NeoJSONReader fromString: (JSDataLoaderTests perform: aSelector) 
]

{ #category : #running }
JSDataLoaderTests >> setUp [
	"Create the necessary objects to test the class JSDataLoader"
	aJSDataLoader := JSDataLoader new.
	model := aJSDataLoader model.
	aJSDataLoader currentFileName: 'test'.
	aJSDataLoader rootPath: '/Users/Tests'.


]

{ #category : #creating }
JSDataLoaderTests >> testAddFunctionCallCallee [
	| fct01 fct02 fct03 fct04 |
	fct01 := aJSDataLoader ensureJSFunction: 'fct' parent: nil.
	fct02 := aJSDataLoader ensureJSFunction: 'fct2' parent: fct01.
	fct03 := aJSDataLoader ensureJSFunction: 'fct3' parent: nil.
	fct04 := aJSDataLoader ensureJSFunction: 'fct4' parent: fct03.
	
	aJSDataLoader addFunctionCall: fct01 callee: fct04.
	aJSDataLoader addFunctionCall: fct01 callee: fct04.
	
	self assert: fct01 invocations size equals: 1.
	self assert: fct02 invocations size equals: 0.
	
	
]

{ #category : #'communication with model' }
JSDataLoaderTests >> testChangeFunctionIsStub [
	| fct01 |
	fct01 := aJSDataLoader ensureJSFunction: 'fct' parent: nil.
	self assert: fct01 isStub.
	fct01 isArgument: true.
	fct01 isStub: false.
	self deny: fct01 isStub.
	self deny: fct01 isArgument.
	
	
]

{ #category : #creating }
JSDataLoaderTests >> testEnsureFunctionDifferentParent [
	| fct01 fct02 |
	fct01 := aJSDataLoader ensureJSFunction: 'fct' parent: nil.
	fct02 := aJSDataLoader ensureJSFunction: 'fct' parent: fct01.
	
	self assert: model entities size equals: 2.
	
	
	
	
]

{ #category : #creating }
JSDataLoaderTests >> testEnsureFunctionDoesNotExist [
	aJSDataLoader ensureJSFunction: 'fct' parent: nil.
	
	self assert: model entities size equals: 1.
	self assert: model entities first class equals: FAMIXJSFunction.
	self assert: model entities first name equals: 'fct'.
	self assert: model entities first isStub.
	
	
]

{ #category : #creating }
JSDataLoaderTests >> testEnsureFunctionExist [
	| fct01 fct02 |
	fct01 := aJSDataLoader ensureJSFunction: 'fct' parent: nil.
	fct02 := aJSDataLoader ensureJSFunction: 'fct' parent: nil.
	
	self assert: model entities size equals: 1.
	self assert: fct01 equals: fct02.
	self assert: model entities first class equals: FAMIXJSFunction.
	self assert: model entities first name equals: 'fct'.
	self assert: model entities first isStub.
	
	
]

{ #category : #creating }
JSDataLoaderTests >> testEnsureFunctionForPrototype [
	| fct01 fct02 fct03 |
	fct01 := aJSDataLoader ensureJSFunction: 'fct' parent: nil.
	fct01 filePath: 'teste\File1.js'.
	fct01 isStub: false.
	fct02 := aJSDataLoader ensureJSFunction: 'Otherfct' parent: nil.
	fct02 filePath: 'teste\File2.js'.
	fct03 := aJSDataLoader ensureJSFunctionForPrototype: 'fct' filePath: 'teste\File2.js'.
	
	self assert: model entities size equals: 2.
	self assert: fct03 filePath equals: 'teste\File1.js'.
	
	
	
	
]

{ #category : #acessing }
JSDataLoaderTests >> testGetFileShortName [
	|  fileFullName |
	aJSDataLoader rootPath: 'File @ /User/Developer/System/src'.
	fileFullName := 'File @ /User/Developer/System/src/JSClassFinder/teste/temp.json'.

	self assert: (aJSDataLoader getFileShortName: fileFullName) equals: 'JSClassFinder/teste/temp'.

]

{ #category : #validation }
JSDataLoaderTests >> testIsInsideAnyNamedFunctionOrObj [
	|   aFunction aInnerFunction  |
	"Create the necessary objects for the test"
	aFunction := aJSDataLoader createJSFunction: 'fct01' parent:nil.
	aJSDataLoader createJSPrototypeFor:aFunction.
	
	"Test the method 'JSDataLoader isInsideAnyNamedFunction:'"
	self deny: (aJSDataLoader isInsideAnyNamedFunctionOrObj: aFunction).
	aInnerFunction := aJSDataLoader createJSFunction: 'fct02' parent:aFunction jsPrototype.
	self assert: (aJSDataLoader isInsideAnyNamedFunctionOrObj: aInnerFunction).
	aInnerFunction parentType:aFunction.
	self assert: (aJSDataLoader isInsideAnyNamedFunctionOrObj: aInnerFunction).
	aFunction name:nil.
	self deny: (aJSDataLoader isInsideAnyNamedFunctionOrObj: aInnerFunction).
	aInnerFunction parentType: (FAMIXJSObject new).
	self assert: (aJSDataLoader isInsideAnyNamedFunctionOrObj: aInnerFunction).
	aInnerFunction parentType: nil.
	self deny: (aJSDataLoader isInsideAnyNamedFunctionOrObj: aInnerFunction).

]

{ #category : #validation }
JSDataLoaderTests >> testJSFindObjectProperty [
	| aObject |
	"Create the necessary objects for the test"
	aJSDataLoader currentFileName: 'test'.
	aJSDataLoader rootPath: '/Users/Tests'.
	aJSDataLoader visitJSON: (self jsonFor: #varDeclaratorObjectExpression).
	
	aObject := aJSDataLoader jsFindObjectProperty: '_commands' parent: nil.
	self assert: aObject name = '_commands'.
	aObject := aJSDataLoader jsFindObjectProperty: '_commands' parent: aObject.
	self assert: aObject isNil.
	aObject := aJSDataLoader jsFindObjectProperty: '******' parent: nil.
	self assert: aObject isNil.

]

{ #category : #validation }
JSDataLoaderTests >> testJSRootFunction [
	|   aFunction aInnerFunction  |
	"Create the necessary objects for the test"
	aFunction := aJSDataLoader createJSFunction: 'fct01' parent:nil.
	aJSDataLoader createJSPrototypeFor:aFunction.
	
	"Test the method 'JSDataLoader jsRootFunction:'"
	aInnerFunction := aJSDataLoader createJSFunction: 'fct02' parent:aFunction jsPrototype.
	self assert: (aJSDataLoader jsRootFunction: aInnerFunction) name = 'fct01'.
	aInnerFunction parentType:aFunction.
	self assert: (aJSDataLoader jsRootFunction: aInnerFunction) name = 'fct01'.
	aInnerFunction parentType:nil.
	self assert: (aJSDataLoader jsRootFunction: aInnerFunction) name = 'fct02'.

]

{ #category : #metrics }
JSDataLoaderTests >> testNumberOfFilesLOC [
	"Set up the environment"
	aJSDataLoader currentFileName: 'path\test.json'.
	aJSDataLoader visitJSON: (self jsonFor: #programLocEmptyBody).
	aJSDataLoader currentFileName: 'path\test2.json'.
	aJSDataLoader visitJSON: (self jsonFor: #programLocEmptyBody).
	
	self assert: aJSDataLoader loc equals: 42.
	self assert: aJSDataLoader numberOfFiles equals: 2.
	
]

{ #category : #metrics }
JSDataLoaderTests >> testNumberOfFunctions [
	"Set up the environment"
	model add: FAMIXJSFunction new.
	model add: (FAMIXJSFunction new name: 'circle').
	model add: (FAMIXJSFunction new name: 'ellipse').
	model add: FAMIXJSProperty new.
	
	self assert: aJSDataLoader numberOfFunctions equals: 2.
	
]

{ #category : #creating }
JSDataLoaderTests >> testSettingParentType [
	| fct1 fct2 |
	fct1 := FAMIXJSFunction new.
	fct2 := FAMIXJSFunction new.
	
	fct2 parentType: fct1.
	
	self assert: fct2 parentType equals: fct1.
	self assert: fct1 jsFunctions size equals: 1.
	self assert: fct1 jsFunctions first equals: fct2.
	
]

{ #category : #visiting }
JSDataLoaderTests >> testVisitArrayExpression [
	| jsType |
	jsType := aJSDataLoader visitJSON: (self jsonFor: #arrayExpression).
	
	self assert: jsType getValue equals: 'ArrayExpression'.

]

{ #category : #visiting }
JSDataLoaderTests >> testVisitAssignmentExpressionIdentifierIdentifier [
	| jsType |
	aJSDataLoader currentFileName: 'test'.
	aJSDataLoader rootPath: '/Users/Tests'.
	jsType := aJSDataLoader visitJSON: (self jsonFor: #assignmentExpressionIdentifierIdentifier).
	
	self assert: model entities size equals: 0.
	self assert: jsType class equals: JSTypeWithValue.
	self assert: jsType getName equals: 'dx'.
	self assert: jsType getValue equals: 'dy'

]

{ #category : #visiting }
JSDataLoaderTests >> testVisitAssignmentExpressionIdentifierLiteral [
	"The stack is used to indicate (simulate) that we are inside a function"
	| jsType |
	jsType := aJSDataLoader visitJSON: (self jsonFor: #assignmentExpressionIdentifierLiteral).
	
	self assert: model entities size equals: 0.
	self assert: jsType class equals: JSTypeWithValue.
	self assert: jsType getName equals: 'definition'.
	self assert: jsType getValue equals: 'teste value'

]

{ #category : #visiting }
JSDataLoaderTests >> testVisitAssignmentExpressionIdentifierNewExpressionJsBEntityParentNotNil [
	"The stack is used to indicate (simulate) that we are inside a function"
	| fct obj |
	fct := aJSDataLoader ensureJSFunction: 'Merge' parent: FAMIXJSFunction new.
	fct isStub: false.
	aJSDataLoader context push: fct.
	aJSDataLoader visitJSON: (self jsonFor: #assignmentExpressionIdentifierNewExpression).
	
	self assert: model entities size equals: 2.
	self assert: (model allWithType: FAMIXJSFunction) size equals: 1.
	self assert: (model allWithType: FAMIXJSObject) size equals: 1.

	obj := (model allWithType: FAMIXJSObject) first.
	self assert: obj name equals: 'currentMerge'.
	self assert: obj jsBEntity name equals: 'Merge'.
	self deny: obj jsBEntity isStub.

]

{ #category : #visiting }
JSDataLoaderTests >> testVisitAssignmentExpressionIdentifierNewExpressionJsBEntityParentNotNilTestsPath [
	"The stack is used to indicate (simulate) that we are inside a function"
	| fct obj |
	fct := FAMIXJSFunction new.
	fct name: 'Merge'.
	fct parentType: FAMIXJSFunction new.
	model add: fct.
	aJSDataLoader context push: fct.
	aJSDataLoader isTestsPath: true. 
	aJSDataLoader visitJSON: (self jsonFor: #assignmentExpressionIdentifierNewExpression).
	
	self assert: model entities size equals: 2.
	self assert: (model allWithType: FAMIXJSFunction) size equals: 1.
	self assert: (model allWithType: FAMIXJSObject) size equals: 1.

	obj := (model allWithType: FAMIXJSObject) first.
	self assert: obj name equals: 'currentMerge'.
	self assert: obj jsBEntity name equals: 'Merge'.
	self deny: obj jsBEntity isStub.

]

{ #category : #visiting }
JSDataLoaderTests >> testVisitAssignmentExpressionMemberExpressionFunctionExpressionMemberExpressionLiteralObjectProperty [
	| obj fct prop | 
	"Set up the environment"
	aJSDataLoader context push: (FAMIXJSFunction new name:'shell').
	aJSDataLoader visitJSON: (self jsonFor: #varDeclaratorObjectExpression).
	
	"Target of the test"
	aJSDataLoader visitJSON: (self jsonFor: #assignmentExpressionMemberExpressionFunctionExpressionMemberExpressionLiteral). 
	
	self assert: model entities size equals: 5.
	self assert: (model allWithType: FAMIXJSProperty) size equals: 3.
	self assert: (model allWithType: FAMIXJSObject) size equals: 1.
	self assert: (model allWithType: FAMIXJSFunction) size equals: 1.
	obj := (model allWithType: FAMIXJSObject) first.
	self assert: obj name equals: '_commands'.
	self assert: obj jsProperties size equals: 2.
	fct := obj jsProperties detect: [ :f | f jsValue class = FAMIXJSFunction ].
	self assert: fct jsValue name equals: 'inner_set'.
	self assert: fct parentType equals: obj.
	prop := obj jsProperties detect: [ :f | f name = 'radius' ].
	self assert: prop parentType equals: obj.
	self assert: prop jsValue equals: 10.

]

{ #category : #visiting }
JSDataLoaderTests >> testVisitAssignmentExpressionMemberExpressionFunctionExpressionObjectProperty [
	| obj | 
	"Set up the environment"
	aJSDataLoader visitJSON: (self jsonFor: #varDeclaratorObjectExpression).
	
	aJSDataLoader visitJSON: (self jsonFor: #assignmentExpressionMemberExpressionFunctionExpression). "<-- Target of the test"
	
	self assert: model entities size equals: 4.
	self assert: (model allWithType: FAMIXJSProperty) size equals: 2.
	self assert: (model allWithType: FAMIXJSObject) size equals: 1.
	self assert: (model allWithType: FAMIXJSFunction) size equals: 1.
	obj := (model allWithType: FAMIXJSObject) first.
	self assert: obj name equals: '_commands'.
	self assert: obj jsProperties size equals: 1.
	self assert: obj jsProperties first name equals: 'getArea'.
	self assert: obj jsProperties first jsValue class equals: FAMIXJSFunction.
	self assert: obj jsProperties first jsValue name equals: 'getArea'.

]

{ #category : #visiting }
JSDataLoaderTests >> testVisitAssignmentExpressionMemberExpressionLiteralObjectProperty [
	| obj | 
	"Set up the environment"
	aJSDataLoader visitJSON: (self jsonFor: #varDeclaratorObjectExpression).
	
	aJSDataLoader visitJSON: (self jsonFor: #assignmentExpressionMemberExpressionLiteral). "<-- Target of the test"
	
	self assert: model entities size equals: 3.
	self assert: (model allWithType: FAMIXJSProperty) size equals: 2.
	self assert: (model allWithType: FAMIXJSObject) size equals: 1.
	obj := (model allWithType: FAMIXJSObject) first.
	self assert: obj name equals: '_commands'.
	self assert: obj jsProperties size equals: 1.
	self assert: obj jsProperties first name equals: 'radius'.
	self assert: obj jsProperties first jsValue equals: 10.

]

{ #category : #visiting }
JSDataLoaderTests >> testVisitAssignmentExpressionPrototypeCallExpressionObjectCreate [
	| jsType catPrototype mammalPrototype|
	
	jsType := aJSDataLoader visitJSON: (self jsonFor: #assignmentExpressionPrototypeCallExpressionObjectCreate).
	
	self assert: model entities size equals: 6.
	self assert: (model allWithType: FAMIXJSCall) size equals: 1.
	self assert: (model allWithType: FAMIXJSFunction) size equals: 2.
	self assert: (model allWithType: FAMIXJSPrototype) size equals: 2.
	self assert: (model allWithType: FAMIXJSObject) size equals: 1.
	mammalPrototype := (model allWithType: FAMIXJSPrototype) detect: [ :proto | proto jsOwnerFunction name = 'Mammal'].
	catPrototype := (model allWithType: FAMIXJSPrototype) detect: [ :proto | proto jsOwnerFunction name = 'Cat'].
	self assert: catPrototype parentObj equals: (model allWithType: FAMIXJSObject) first.
	self assert: (model allWithType: FAMIXJSObject) first jsBEntity equals: mammalPrototype.
	self assert: (model allWithType: FAMIXJSCall) first callee equals: 'Object.create'.
	self assert: mammalPrototype parentObj isNil.


]

{ #category : #visiting }
JSDataLoaderTests >> testVisitAssignmentExpressionPrototypeFunctionExpression [
	"Tests AssignmentExpression(s) used to associate a functiona to a prototype "
	| fct1 fct2 |
	fct1 := aJSDataLoader createJSFunction: 'circle' parent: nil.
	aJSDataLoader visitJSON: (self jsonFor: #assignmentExpressionPrototypeFunctionExpression).
	
	self assert: (model allWithType: FAMIXJSFunction) size equals: 2.
	fct2 := (model allWithType: FAMIXJSFunction) detect: [ :f | f ~= fct1 ].
	
	self assert: fct2 name = 'getArea'.
	self assert: fct2 parentType equals: fct1 jsPrototype.
	self assert: fct1 jsPrototype jsFunctions size equals: 1.
	self assert: fct1 jsPrototype jsFunctions first equals: fct2.
	self assert: fct1 jsPrototype jsProperties size equals: 1.
	self assert: fct1 jsPrototype jsProperties first isBoundToPrototype.
	self assert: fct1 jsPrototype jsProperties first jsValue equals: fct2.
	
	self assert: (model allWithType: FAMIXJSProperty) size equals: 1.
	self assert: (model allWithType: FAMIXJSProperty) first jsValue equals: fct2.
	self deny: (model allWithType: FAMIXJSProperty) first isValueIdentifier
	

]

{ #category : #visiting }
JSDataLoaderTests >> testVisitAssignmentExpressionPrototypeLiteral [
	"The stack is used to indicate (simulate) that we are inside a function"
	| fct prop |
	fct := FAMIXJSFunction new.
	fct name: 'circle'.
	model add: fct.
	aJSDataLoader visitJSON: (self jsonFor: #assignmentExpressionPrototypeLiteral).
	
	self assert: model entities size equals: 3.
	self assert: (model allWithType: FAMIXJSFunction) size equals: 1.
	self assert: (model allWithType: FAMIXJSPrototype) size equals: 1.
	self assert: (model allWithType: FAMIXJSProperty) size equals: 1.

	prop := (model allWithType: FAMIXJSProperty) first.
	self assert: prop name equals: 'pi'.
	self assert: prop jsValue equals: 3.14.

]

{ #category : #visiting }
JSDataLoaderTests >> testVisitAssignmentExpressionPrototypeNewExpression [
	| jsType  childPrototype|
	
	jsType := aJSDataLoader visitJSON: (self jsonFor: #assignmentExpressionPrototypeNewExpression).
	
	self assert: model entities size equals: 4.
	self assert: (model allWithType: FAMIXJSFunction) size equals: 2.
	self assert: (model allWithType: FAMIXJSPrototype) size equals: 1.
	self assert: (model allWithType: FAMIXJSObject) size equals: 1.
	childPrototype := (model allWithType: FAMIXJSPrototype) detect: [ :proto | proto jsOwnerFunction name = 'DecoratedClass'].
	self assert: childPrototype parentObj equals: (model allWithType: FAMIXJSObject) first.
	self assert: (model allWithType: FAMIXJSObject) first jsBEntity name equals: 'ctr'.


]

{ #category : #visiting }
JSDataLoaderTests >> testVisitAssignmentExpressionPrototypePropertyPrototypeAsIdentifier [
	"The stack is used to indicate (simulate) that we are inside a function"
	| fct1 prop proto |
	fct1 := FAMIXJSFunction new.
	fct1 name: 'sub'.
	model add: fct1.
	aJSDataLoader visitJSON: (self jsonFor: #assignmentExpressionPrototypePropertyPrototypeAsIdentifier).
	
	self assert: (model allWithType: FAMIXJSFunction) size equals: 1.
	self assert: (model allWithType: FAMIXJSPrototype) size equals: 1.
	proto := (model allWithType: FAMIXJSPrototype) first.
	self assert: (model allWithType: FAMIXJSProperty) size equals: 1.
	prop := (model allWithType: FAMIXJSProperty) first.
	
	self assert: prop name = 'prop'.
	self assert: prop jsValue equals: 'prototype.prop'.
	self assert: prop parentType equals: proto.
	self assert: prop isValueIdentifier
	

]

{ #category : #visiting }
JSDataLoaderTests >> testVisitAssignmentExpressionThisExpressionComposedName [
	"The stack is used to indicate (simulate) that we are inside a function"
	| fct prop |
	fct := FAMIXJSFunction new.
	fct name: 'ellipse'.
	model add: fct.
	aJSDataLoader context push: fct.
	aJSDataLoader visitJSON: (self jsonFor: #assignmentExpressionThisExpressionComposedName).
	
	self assert: model entities size equals: 2.
	self assert: (model allWithType: FAMIXJSFunction) size equals: 1.
	self assert: (model allWithType: FAMIXJSProperty) size equals: 1.

	prop := (model allWithType: FAMIXJSProperty) first.
	self assert: prop name equals: 'teste'.
	self assert: prop jsValue equals: 'ellipse.getArea'.
	self assert: prop isValueIdentifier.

]

{ #category : #visiting }
JSDataLoaderTests >> testVisitAssignmentExpressionThisExpressionIdentifier [
	"The stack is used to indicate (simulate) that we are inside a function"
	| fct prop |
	fct := FAMIXJSFunction new.
	fct name: 'circle'.
	model add: fct.
	aJSDataLoader context push: fct.
	aJSDataLoader visitJSON: (self jsonFor: #assignmentExpressionThisExpressionIdentifier).
	
	self assert: model entities size equals: 2.
	self assert: (model allWithType: FAMIXJSFunction) size equals: 1.
	self assert: (model allWithType: FAMIXJSProperty) size equals: 1.

	prop := (model allWithType: FAMIXJSProperty) first.
	self assert: prop name equals: 'teste'.
	self assert: prop jsValue equals: 'radius'

]

{ #category : #visiting }
JSDataLoaderTests >> testVisitAssignmentExpressionThisExpressionLiteral [
	"The stack is used to indicate (simulate) that we are inside a function"
	| fct prop |
	fct := FAMIXJSFunction new.
	fct name: 'circle'.
	model add: fct.
	aJSDataLoader context push: fct.
	aJSDataLoader visitJSON: (self jsonFor: #assignmentExpressionThisExpressionLiteral).
	
	self assert: model entities size equals: 2.
	self assert: (model allWithType: FAMIXJSFunction) size equals: 1.
	self assert: (model allWithType: FAMIXJSProperty) size equals: 1.

	prop := (model allWithType: FAMIXJSProperty) first.
	self assert: prop name equals: 'teste'.
	self assert: prop jsValue equals: 'teste value'

]

{ #category : #visiting }
JSDataLoaderTests >> testVisitBinaryExpressionCallExpression [
	| jsType |
	
	jsType := aJSDataLoader visitJSON: (self jsonFor: #binaryExpressionCallExpression).
	
	self assert: jsType class equals: JSTypeWithValue.
	self assert: jsType getValue equals: 'plus(...)*5'.

]

{ #category : #visiting }
JSDataLoaderTests >> testVisitBinaryExpressionThisExpression [
	| jsType |
	
	aJSDataLoader context push: FAMIXJSFunction new.
	jsType := aJSDataLoader visitJSON: (self jsonFor: #binaryExpressionThisExpression).
	
	self assert: model entities size equals: 1.
	self assert: jsType class equals: JSTypeWithValue.
	self assert: (model allWithType: FAMIXJSProperty) size equals: 1.
	self assert: jsType getValue equals: 'radius*2'.

]

{ #category : #visiting }
JSDataLoaderTests >> testVisitBinaryExpressionTwoLiterals [
	| jsType |
	
	jsType := aJSDataLoader visitJSON: (self jsonFor: #binaryExpressionTwoLiterals).
	
	self assert: jsType class equals: JSTypeWithValue.
	self assert: jsType getValue equals: '3*2'.

]

{ #category : #visiting }
JSDataLoaderTests >> testVisitCallExpressionObjectCreate [
	| jsType  |
	
	jsType := aJSDataLoader visitJSON: (self jsonFor: #callExpressionObjectCreate).
	
	self assert: model entities size equals: 4.
	self assert: (model allWithType: FAMIXJSFunction) size equals: 1.
	self assert: (model allWithType: FAMIXJSPrototype) size equals: 1.
	self assert: (model allWithType: FAMIXJSObject) size equals: 1.
	self assert: (model allWithType: FAMIXJSCall) size equals: 1.
	self assert: jsType class equals: JSTypeObjectCreate.
	self assert: jsType getValue class equals: FAMIXJSObject.
	self assert: jsType getValue name isNil.
	self assert: jsType getValue jsBEntity equals: (model allWithType: FAMIXJSPrototype) first.
	self assert: (model allWithType: FAMIXJSCall) first callee equals: 'Object.create'.


]

{ #category : #visiting }
JSDataLoaderTests >> testVisitCallExpressionPrototypeMemberExpression [
	"This test aims the creation of FAMIXJSCall"
	| fct |
	fct := self createJSFunctionNamed: 'Line'.
	aJSDataLoader context push: fct.
	
	aJSDataLoader visitJSON: (self jsonFor: #callExpressionMemberExpression).
	
	self assert: (model allWithType: FAMIXJSCall) size equals: 1.
	self assert: (model allWithType: FAMIXJSCall) first callee name equals: 'toString'.
	self assert: (model allWithType: FAMIXJSCall) first caller name equals: 'Line'.
	self assert: (model allWithType: FAMIXJSCall) first callee parentType jsOwnerFunction name equals: 'Point'.

	aJSDataLoader context pop.


]

{ #category : #visiting }
JSDataLoaderTests >> testVisitCallExpressionWithNoArguments [
	| jsType |
	
	jsType := aJSDataLoader visitJSON: (self jsonFor: #callExpressionWithNoArguments).
	
	self assert: jsType class equals: JSTypeIdentifier.
	self assert: jsType getName equals: 'plus(...)'.

]

{ #category : #visiting }
JSDataLoaderTests >> testVisitConditionalExpressionConsequentMemberExpression [
	| jsType |
	jsType := aJSDataLoader visitJSON: (self jsonFor: #conditionalExpressionConsequentMemberExpression).
	
	self assert: model entities size equals: 0.
	self assert: jsType class equals: JSTypeWithValue.
	self assert: jsType getValue equals: '#ConditionalExpression'.
	self assert: jsType getName isNil.

]

{ #category : #visiting }
JSDataLoaderTests >> testVisitFuncDeclNoParamNoBody [

	aJSDataLoader visitJSON: (self jsonFor: #functionDeclarationNoParamNoBody).
	
	self assert: model entities size equals: 1.
	self assert: model entities first class equals: FAMIXJSFunction.
	self assert: model entities first name equals: 'circle'.

]

{ #category : #visiting }
JSDataLoaderTests >> testVisitFunctionDeclarationWithParam [
	| ret |
	ret := aJSDataLoader visitJSON: (self jsonFor: #functionDeclarationWithParam).
	
	self assert: ret class equals: JSTypeFunction.
	self assert: model entities size equals: 2.
	self assert: ((model allWithType: FAMIXJSParameter) 
		detect: [ :p | (p name = 'radius') & (p parentType = ret function) ] ifNone: [ nil ]) isNotNil.
	self assert: ret function name equals: 'setRadius'.
	self assert: ret function params size equals: 1.

]

{ #category : #visiting }
JSDataLoaderTests >> testVisitFunctionExpressionReturnStatement [

	| ret |
	ret := aJSDataLoader visitJSON: (self jsonFor: #functionExpressionReturnStatement).
	
	self assert: ret class equals: JSTypeFunction.
	self assert: model entities size equals: 1.
	self assert: model entities first class equals: FAMIXJSFunction.
	self assert: model entities first equals: ret function.
	self assert: model entities first name isNil.

]

{ #category : #visiting }
JSDataLoaderTests >> testVisitFunctionExpressionWithName [

	| ret |
	ret := aJSDataLoader visitJSON: (self jsonFor: #functionExpressionWithName).
	
	self assert: ret class equals: JSTypeFunction.
	self assert: model entities size equals: 1.
	self assert: model entities first class equals: FAMIXJSFunction.
	self assert: model entities first equals: ret function.
	self assert: model entities first name equals: 'Compiler'.

]

{ #category : #visiting }
JSDataLoaderTests >> testVisitFunctionExpressionWithParams [
	| ret |
	ret := aJSDataLoader visitJSON: (self jsonFor: #functionExpressionWithParams).
	
	self assert: ret class equals: JSTypeFunction.
	self assert: model entities size equals: 3.
	self assert: ((model allWithType: FAMIXJSParameter) 
		detect: [ :p | (p name = 'radius') & (p parentType = ret function) ] ifNone: [ nil ]) isNotNil.
	self assert: ((model allWithType: FAMIXJSParameter) 
		detect: [ :p | (p name = 'teste') & (p parentType = ret function) ] ifNone: [ nil ]) isNotNil.
	self assert: ret function name equals: 'setRadius'.
	self assert: ret function params size equals: 2.

]

{ #category : #visiting }
JSDataLoaderTests >> testVisitIfStatementAlternateBlockStatement [
	aJSDataLoader visitJSON: (self jsonFor: #ifStatementAlternateBlockStatement).
	
	self assert: model entities size equals: 0.

]

{ #category : #visiting }
JSDataLoaderTests >> testVisitIfStatementConsequentReturnStatement [
	aJSDataLoader visitJSON: (self jsonFor: #ifStatementConsequentReturnStatement).
	
	self assert: model entities size equals: 0.

]

{ #category : #visiting }
JSDataLoaderTests >> testVisitInnerBinaryThisExpression [
	| jsType |
	
	aJSDataLoader context push: FAMIXJSFunction new.
	jsType := aJSDataLoader visitJSON: (self jsonFor: #innerBinaryExpression).
	
	self assert: jsType class equals: JSTypeWithValue.
	self assert: jsType getValue equals: 'radius*radius*3.14'.

]

{ #category : #visiting }
JSDataLoaderTests >> testVisitInnerFuncDeclNoParamNoBody [

	| fct innerFct |
	aJSDataLoader visitJSON: (self jsonFor: #innerFunctionDeclarationNoParamNoBody).
	
	self assert: model entities size equals: 2.
	fct := model entityNamed: 'circle'.
	innerFct := model entityNamed: 'plus'.
	self assert: innerFct class equals: FAMIXJSFunction.
	self assert: innerFct name equals: 'plus'.
	self assert: innerFct parentType equals: fct.
	self assert: fct jsFunctions size equals: 1.
	self assert: fct jsFunctions first equals: innerFct.

]

{ #category : #visiting }
JSDataLoaderTests >> testVisitLogicalExpressionIdentifierLiteral [
	| jsType |
	
	jsType := aJSDataLoader visitJSON: (self jsonFor: #logicalExpressionIdentifierLiteral).
	
	self assert: jsType class equals: JSTypeWithValue.
	self assert: jsType getValue equals: 'radius||0'.

]

{ #category : #visiting }
JSDataLoaderTests >> testVisitLogicalExpressionIdentifierSequenceExpression [
	| jsType |
	
	jsType := aJSDataLoader visitJSON: (self jsonFor: #logicalExpressionIdentifierSequenceExpression).
	
	self assert: jsType class equals: JSTypeWithValue.
	self assert: jsType getValue equals: 'radius||SequenceExpression'.

]

{ #category : #visiting }
JSDataLoaderTests >> testVisitMemberExpressionPrototype [
	| jsType fct |
	"The stack is used to indicate (simulate) that we are inside a function"
	fct := FAMIXJSFunction new.
	fct name: 'circle'.
	model add: fct.
	"aJSDataLoader context push: fct."

	jsType := aJSDataLoader visitJSON: (self jsonFor: #memberExpressionPrototype).

	self assert: model entities size equals: 2.
	self assert: (model allWithType: FAMIXJSPrototype) size equals: 1.
	self assert: jsType class equals: JSTypePrototype .
	self assert: jsType prototype notNil.
	self assert: jsType prototype class equals: FAMIXJSPrototype.
	self assert: jsType prototype jsOwnerFunction name equals: 'circle'.
	self assert: fct jsPrototype equals: jsType prototype 

]

{ #category : #visiting }
JSDataLoaderTests >> testVisitMemberExpressionPrototypeProperty [
	| jsType fct |
	"The stack is used to indicate (simulate) that we are inside a function"
	fct := FAMIXJSFunction new.
	fct name: 'circle'.
	model add: fct.
	"aJSDataLoader context push: fct."

	jsType := aJSDataLoader visitJSON: (self jsonFor: #memberExpressionPrototypeProperty).

	self assert: model entities size equals: 3.
	self assert: (model allWithType: FAMIXJSProperty) size equals: 1.
	
	self assert: jsType class equals: JSTypeProperty .
	self assert: jsType jsProperty notNil.
	self assert: jsType jsProperty class equals: FAMIXJSProperty.
	self assert: jsType jsProperty name equals: 'getArea'.
	self assert: fct jsPrototype jsProperties size equals: 1.
	self assert: fct jsPrototype jsProperties first equals: jsType jsProperty .

]

{ #category : #visiting }
JSDataLoaderTests >> testVisitMemberExpressionThisExpression [
	| jsType |
	
	aJSDataLoader context push: FAMIXJSFunction new.
	aJSDataLoader currentFileName: '/Users/Test/Test.js'.
	jsType := aJSDataLoader visitJSON: (self jsonFor: #memberExpressionThisExpression).
	
	self assert: model entities size equals: 1.
	self assert: jsType class equals: JSTypeProperty.
	self assert: jsType jsProperty notNil.
	self assert: jsType jsProperty class equals: FAMIXJSProperty.
	self assert: jsType jsProperty name equals: 'teste'.
	self assert: jsType jsProperty locInfo startLine equals: 7.
	self assert: jsType jsProperty locInfo endLine equals: 8.
	self assert: jsType jsProperty locInfo startColumn equals: 6.
	self assert: jsType jsProperty locInfo endColumn equals: 9.

]

{ #category : #visiting }
JSDataLoaderTests >> testVisitObjectExpressionNoProperties [
	| obj jsType | 
	jsType := aJSDataLoader visitJSON: (self jsonFor: #objectExpressionNoProperties).
	
	self assert: model entities size equals: 1.
	self assert: (model allWithType: FAMIXJSObject) size equals: 1.
	obj := (model allWithType: FAMIXJSObject) first.
	self assert: jsType class equals: JSTypeObjectCreate.
	self assert: jsType getValue equals: obj.

]

{ #category : #visiting }
JSDataLoaderTests >> testVisitProgramLocEmptyBody [
	"Set up the environment"
	aJSDataLoader currentFileName: 'path\test.json'.
	aJSDataLoader visitJSON: (self jsonFor: #programLocEmptyBody).
	
	self assert: model entities size equals: 0.
	self assert: aJSDataLoader files size equals: 1.
	self assert: aJSDataLoader files first fileName equals: 'path\test.json'.
	self assert: aJSDataLoader files first startLine equals: 1.
	self assert: aJSDataLoader files first endLine equals: 21.
	
]

{ #category : #visiting }
JSDataLoaderTests >> testVisitPropertyFunctionExpression [
	| prop fct obj |
	obj := FAMIXJSObject new.
	aJSDataLoader context push: obj.
	aJSDataLoader visitJSON: (self jsonFor: #propertyFunctionExpression).
	
	self assert: model entities size equals: 2.
	self assert: (model allWithType: FAMIXJSFunction) size equals: 1.
	self assert: (model allWithType: FAMIXJSProperty) size equals: 1.
	prop := (model allWithType: FAMIXJSProperty) first.
	fct := (model allWithType: FAMIXJSFunction) first.
	self assert: prop name equals: 'getAncestorWithClass'.
	self assert: fct name equals: 'getAncestorWithClass'.
	self assert: obj jsProperties first equals: prop.

]

{ #category : #visiting }
JSDataLoaderTests >> testVisitReturnStatementNewExpression [
	"The stack is used to indicate (simulate) that we are inside a function"
	| fct obj |
	fct := FAMIXJSFunction new.
	fct name: 'DecryptStream'.
	aJSDataLoader context push: fct.
	aJSDataLoader visitJSON: (self jsonFor: #returnStatementNewExpression).
	
	self assert: model entities size equals: 2.
	self assert: (model allWithType: FAMIXJSFunction) size equals: 1.
	self assert: (model allWithType: FAMIXJSObject) size equals: 1.

	obj := (model allWithType: FAMIXJSObject) first.
	self assert: obj name isNil.
	self assert: obj jsBEntity name equals: 'DecryptStream'.

]

{ #category : #visiting }
JSDataLoaderTests >> testVisitThisExpressionLocInfo [
	| fct |
	fct := FAMIXJSFunction new.
	fct name: 'circle'.
	model add: fct.
	aJSDataLoader context push: fct.
	aJSDataLoader currentFileName: '/Users/Test/Test.js'.
	aJSDataLoader visitJSON: (self jsonFor: #thisExpressionLocInfo).
	
	self assert: ((model allWithType: FAMIXJSFunction) at:1) locFirstThisExp startLine equals: 16.
	self assert: ((model allWithType: FAMIXJSFunction) at:1) locFirstThisExp startColumn equals: 2.

]

{ #category : #visiting }
JSDataLoaderTests >> testVisitThisExpressionNotEmptyLocInfo [
	| fct |
	fct := FAMIXJSFunction new.
	fct name: 'circle'.
	model add: fct.
	fct locFirstThisExp: (FAMIXFileAnchor new startLine: 100).
	aJSDataLoader context push: fct.
	aJSDataLoader currentFileName: '/Users/Test/Test.js'.
	aJSDataLoader visitJSON: (self jsonFor: #thisExpressionLocInfo).
	
	self assert: ((model allWithType: FAMIXJSFunction) at:1) locFirstThisExp startLine equals: 100.


]

{ #category : #visiting }
JSDataLoaderTests >> testVisitThrowStatementNewExpression [
	aJSDataLoader visitJSON: (self jsonFor: #throwStatementNewExpression).
	
	self assert: model entities size equals: 2.
	self assert: (model allWithType: FAMIXJSObject) size equals: 1.
	self assert: (model allWithType: FAMIXJSFunction) size equals: 1.
	self assert: (model allWithType: FAMIXJSFunction) first isStub.
	self assert: (model allWithType: FAMIXJSFunction) first name equals: 'Error'.
	self assert: (model allWithType: FAMIXJSObject) first jsBEntity equals: (model allWithType: FAMIXJSFunction) first.

]

{ #category : #visiting }
JSDataLoaderTests >> testVisitUnaryExpressionMemberExpressionThisExpression [
	| jsType |
	
	aJSDataLoader context push: FAMIXJSFunction new.
	jsType := aJSDataLoader visitJSON: (self jsonFor: #unaryExpressionMemberExpressionThisExpression).
	
	self assert: model entities size equals: 1.
	self assert: (model allWithType: FAMIXJSProperty) size equals: 1.
	self assert: jsType isProperty.
	self assert: jsType jsProperty jsValue equals: '! file'.


]

{ #category : #visiting }
JSDataLoaderTests >> testVisitUpdateExpressionThisExpressionIdentifier [
	| jsType |
	
	aJSDataLoader context push: FAMIXJSFunction new.
	jsType := aJSDataLoader visitJSON: (self jsonFor: #updateExpressionThisExpressionIdentifier).
	
	self assert: model entities size equals: 1.
	self assert: (model allWithType: FAMIXJSProperty) size equals: 1.
	self assert: (model allWithType: FAMIXJSProperty) first isBoundToThis.
	self assert: jsType isProperty.
	self assert: jsType getValue equals: '_refCount++'.
	self assert: jsType getName equals: '_refCount'.


]

{ #category : #visiting }
JSDataLoaderTests >> testVisitVarDeclaratorBinaryExpressionThisExpression [
	"The stack is used to indicate (simulate) that we are inside a function"
	| prop |
	aJSDataLoader context push: FAMIXJSFunction new.
	aJSDataLoader visitJSON: (self jsonFor: #varDeclaratorBinaryExpressionThisExpression).
	
	self assert: model entities size equals: 2.
	self assert: (model allWithType: FAMIXJSProperty) size equals: 2.
	prop := (model allWithType: FAMIXJSProperty) detect: [:p | p name = 'diameter'].
	self assert: prop jsValue equals: 'radius*2'.
	prop := (model allWithType: FAMIXJSProperty) detect: [:p | p name = 'radius'].
	self assert: prop jsValue isNil.

]

{ #category : #visiting }
JSDataLoaderTests >> testVisitVarDeclaratorObjectExpressionWithProperties [
	| propertyNoParent |
	aJSDataLoader visitJSON: (self jsonFor: #varDeclaratorObjectExpressionWithProperties).
	
	self assert: model entities size equals: 8.
	self assert: (model allWithType: FAMIXJSObject) size equals: 1.
	self assert: (model allWithType: FAMIXJSProperty) size equals: 6.
	self assert: (model allWithType: FAMIXJSFunction) size equals: 1.
	
	self assert: (model allWithType: FAMIXJSObject) first name equals: 'myCircle'.
	propertyNoParent := (model allWithType: FAMIXJSProperty) select: [ :p | p parentType isNil ].
	self assert: propertyNoParent size equals: 1.
	self assert: propertyNoParent first name equals: 'myCircle'.
	self assert: (model allWithType: FAMIXJSObject) first jsProperties size equals: 3.
	
	self assert: ((model allWithType: FAMIXJSObject) first jsProperties anySatisfy: [:p |
		p name = 'getArea' ]).
	self assert: (model allWithType: FAMIXJSFunction) first name equals: 'getArea'.

]

{ #category : #visiting }
JSDataLoaderTests >> testVisitVarDeclatorFunctionExpression [
	aJSDataLoader visitJSON: (self jsonFor: #varDeclaratorFunctionExpression).
	
	self assert: model entities size equals: 2.
	self assert: (model allWithType: FAMIXJSFunction) size equals: 1.
	self assert: (model allWithType: FAMIXJSProperty) size equals: 1.
	self assert: (model allWithType: FAMIXJSFunction) first name equals: 'Mammal'.
	self assert: (model allWithType: FAMIXJSProperty) first name equals: 'Mammal'.

]

{ #category : #visiting }
JSDataLoaderTests >> testVisitVarDeclatorInitNewExist [
	| fct obj |
	fct := aJSDataLoader createJSFunction: 'circle' parent: nil.
	aJSDataLoader visitJSON: (self jsonFor: #varDeclaratorInitNew).
	
	self assert: model entities size equals: 2.
	self assert: (model allWithType: FAMIXJSObject) size equals: 1.
	obj := (model allWithType: FAMIXJSObject) first.
	self assert: obj name equals: 'smallCircle'.
	self assert: obj jsBEntity class equals: FAMIXJSFunction.
	self assert: obj jsBEntity name equals: 'circle'.

]

{ #category : #visiting }
JSDataLoaderTests >> testVisitVarDeclatorInitNewUnknown [
	| obj |
	aJSDataLoader visitJSON: (self jsonFor: #varDeclaratorInitNew).
	
	self assert: model entities size equals: 2.
	self assert: (model allWithType: FAMIXJSObject) size equals: 1.
	obj := (model allWithType: FAMIXJSObject) first.
	self assert: obj name equals: 'smallCircle'.
	self assert: obj jsBEntity class equals: FAMIXJSFunction.
	self assert: obj jsBEntity name equals: 'circle'.
	self assert: obj jsBEntity isStub.
]

{ #category : #visiting }
JSDataLoaderTests >> testVisitVarDeclatorNotBoundToThis [

	aJSDataLoader visitJSON: (self jsonFor: #varDeclaratorNotBoundToThis).
	
	self assert: model entities size equals: 1.
	self assert: model entities first class equals: FAMIXJSProperty.
	self assert: model entities first name equals: '_commands'.
	self assert: model entities first jsValue equals: 'Class to define circles.'.
	self deny: model entities first isBoundToThis.

]

{ #category : #visiting }
JSDataLoaderTests >> testVisitVarDeclatorNotBoundToThisInsideFct [
	"The stack is used to indicate (simulate) that we are inside a function"
	aJSDataLoader context push: FAMIXJSFunction new.
	aJSDataLoader visitJSON: (self jsonFor: #varDeclaratorNotBoundToThis).
	
	self assert: model entities size equals: 1.
	self assert: model entities first class equals: FAMIXJSProperty.
	self assert: model entities first name equals: '_commands'.
	self assert: model entities first jsValue = 'Class to define circles.'.
	self deny: model entities first isBoundToThis.

]

{ #category : #visiting }
JSDataLoaderTests >> testVisitVarDeclatorObjectExpression [
	| obj | 
	aJSDataLoader context push: FAMIXJSFunction new.
	aJSDataLoader visitJSON: (self jsonFor: #varDeclaratorObjectExpression).
	
	self assert: model entities size equals: 2.
	self assert: (model allWithType: FAMIXJSProperty) size equals: 1.
	self assert: (model allWithType: FAMIXJSObject) size equals: 1.
	obj := (model allWithType: FAMIXJSObject) first.
	self assert: (model allWithType: FAMIXJSProperty) first name equals: '_commands'.
	self assert: (model allWithType: FAMIXJSProperty) first jsValue equals: obj.

]

{ #category : #visiting }
JSDataLoaderTests >> testVisitVarDeclatorObjectExpressionEndOfScope [
	| obj prop01 prop02 | 
	aJSDataLoader context push: FAMIXJSFunction new.
	aJSDataLoader visitJSON: (self jsonFor: #varDeclaratorObjectExpression).
	aJSDataLoader context pop.
	aJSDataLoader visitJSON: (self jsonFor: #varDeclaratorNotBoundToThis).
	
	self assert: model entities size equals: 3.
	self assert: (model allWithType: FAMIXJSProperty) size equals: 2.
	self assert: (model allWithType: FAMIXJSObject) size equals: 1.
	obj := (model allWithType: FAMIXJSObject) first.
	prop01 := (model allWithType: FAMIXJSProperty) detect: [:p | p jsValue = obj].
	prop02 := (model allWithType: FAMIXJSProperty) detect: [:p | p jsValue = 'Class to define circles.'].
	self assert: prop01 name equals: '_commands'.
	self assert: prop02 name equals: '_commands'.

]

{ #category : #visiting }
JSDataLoaderTests >> testVisitVarDeclatorObjectExpressionNoFct [
	| obj |
	aJSDataLoader visitJSON: (self jsonFor: #varDeclaratorObjectExpression).
	
	self assert: model entities size equals: 2.
	self assert: (model allWithType: FAMIXJSObject) size equals: 1.
	self assert: (model allWithType: FAMIXJSObject) first name equals: '_commands'.
	obj := (model allWithType: FAMIXJSObject) first.
	self assert: (model allWithType: FAMIXJSProperty) size equals: 1.
	self assert: (model allWithType: FAMIXJSProperty) first name equals: '_commands'.
	self assert: (model allWithType: FAMIXJSProperty) first jsValue equals: obj.

]
