Class {
	#name : #JSClassFinderTests,
	#superclass : #TestCase,
	#instVars : [
		'aJSClassFinder',
		'classModel',
		'famixJSModel'
	],
	#category : #'JSFamixLoader-Tests'
}

{ #category : #running }
JSClassFinderTests class >> createExample2DumpFileAran: fileName [
	| working |
	"Setting up the environment"
	working := FileSystem disk workingDirectory.
	working / fileName writeStreamDo: [ :stream | 
		stream nextPutAll: ';CallExpression;50;21;50;52;demo.js;';cr. 
		stream nextPutAll: 'bind;CallExpression;54;13;54;31;demo.js;{l1,l2,l3,toStringL1P1} [Square]';cr. 
		stream nextPutAll: 'bind;CallExpression;54;13;54;31;demo.js;{l1,l2,l3,toStringL1P1} [Square]';cr. 
		stream nextPutAll: 'bind;CallExpression;54;13;54;31;demo.js;{l1,l2,l3,toStringL1P1} [NewSquare]';cr. 
		stream nextPutAll: 'bind;CallExpression;5;13;54;31;demo.js;{l1,l2,l3,toStringL1P1} [Square]';cr. 
		stream nextPutAll: ';CallExpression;54;13;54;31;demo.js;{l1,l2,l3,toStringL1P1} [Square]';cr. 
		stream nextPutAll: 'bind;CallExpression;54;3;54;31;demo.js;{l1,l2,l3,toStringL1P1} [Square]';cr. 
		stream nextPutAll: 'send;CallExpression;54;32;54;52;demo.js; [Ellipse] [Circle]';cr. 
		stream nextPutAll: 'sort;CallExpression;55;11;55;52;demo.js; [NotAClass]';cr. 
		stream nextPutAll: 'hello;CallExpression;50;21;50;52;demo.js; [Triangle]';cr. 
		stream nextPutAll: 'x = 1; y = 3';cr.
	].

]

{ #category : #running }
JSClassFinderTests class >> createExample2DumpFileFlow: fileName [
	| working |
	"Setting up the environment"
	working := FileSystem disk workingDirectory.
	working / fileName writeStreamDo: [ :stream | 
	stream nextPutAll: '2048-FlowFiles.js:584:55-60: number';cr. 
	stream nextPutAll: '2048-FlowFiles.js:193:9-12: {mergedFrom: null | null | $Subtype<null | null | [any, any]> | $Subtype<null | null | [any, any]>, previousPosition: null | {x: number, y: number} | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}>, value: number | number | number | number | $Subtype<number> | $Subtype<number>, x: number, y: number}';cr.
	stream nextPutAll: '2048-FlowFiles.js:193:16-63: {mergedFrom: null | null | $Subtype<null | null | [any, any]> | $Subtype<null | null | [any, any]>, previousPosition: null | {x: number, y: number} | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}>, value: number | number | number | number | $Subtype<number> | $Subtype<number>, x: number, y: number} | {x: , y: }';cr.
	stream nextPutAll: '2048-FlowFiles.js:193:20-23: (position: void | {x: , y: }, value: number) => void';cr. 
	stream nextPutAll: '2048-FlowFiles.js:193:25-28: {actuator: {bestContainer: HTMLElement, messageContainer: HTMLElement, score: number, scoreContainer: HTMLElement, tileContainer: HTMLElement}, grid: {cells: Array<Array<{mergedFrom: $Subtype<null | null | [any, any]> | $Subtype<null | null | [any, any]> | null | null | $Subtype<null | null | [any, any]> | $Subtype<null | null | [any, any]> | [any, any] | null | null | $Subtype<null | null | [any, any]> | $Subtype<null | null | [any, any]> | null | null | null | null | [any, any] | $Subtype<null | null | [any, any]> | $Subtype<null | null | [any, any]>, previousPosition: $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | null | {x: number, y: number} | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}>, value: $Subtype<number> | $Subtype<number> | number | number | number | number | $Subtype<number> | $Subtype<number> | $Subtype<number> | number | number | number | number | $Subtype<number> | $Subtype<number> | number | number | number | number | $Subtype<number> | $Subtype<number> | number | number | number | number | $Subtype<number> | $Subtype<number> | number | number | number | number | number | number | number | number | $Subtype<number> | $Subtype<number> | $Subtype<number>, x: number, y: number} | null | null | null | null | null | null | null | null | {mergedFrom: $Subtype<null | null | [any, any]> | $Subtype<null | null | [any, any]> | null | null | $Subtype<null | null | [any, any]> | $Subtype<null | null | [any, any]> | [any, any] | null | null | $Subtype<null | null | [any, any]> | $Subtype<null | null | [any, any]> | null | null | null | null | [any, any] | $Subtype<null | null | [any, any]> | $Subtype<null | null | [any, any]>, previousPosition: $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | null | {x: number, y: number} | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}>, value: $Subtype<number> | $Subtype<number> | number | number | number | number | $Subtype<number> | $Subtype<number> | $Subtype<number> | number | number | number | number | $Subtype<number> | $Subtype<number> | number | number | number | number | $Subtype<number> | $Subtype<number> | number | number | number | number | $Subtype<number> | $Subtype<number> | number | number | number | number | number | number | number | number | $Subtype<number> | $Subtype<number> | $Subtype<number>, x: number, y: number} | {mergedFrom: $Subtype<null | null | [any, any]> | $Subtype<null | null | [any, any]> | null | null | $Subtype<null | null | [any, any]> | $Subtype<null | null | [any, any]> | [any, any] | null | null | $Subtype<null | null | [any, any]> | $Subtype<null | null | [any, any]> | null | null | null | null | [any, any] | $Subtype<null | null | [any, any]> | $Subtype<null | null | [any, any]>, previousPosition: $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | null | {x: number, y: number} | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}>, value: $Subtype<number> | $Subtype<number> | number | number | number | number | $Subtype<number> | $Subtype<number> | $Subtype<number> | number | number | number | number | $Subtype<number> | $Subtype<number> | number | number | number | number | $Subtype<number> | $Subtype<number> | number | number | number | number | $Subtype<number> | $Subtype<number> | number | number | number | number | number | number | number | number | $Subtype<number> | $Subtype<number> | $Subtype<number>, x: number, y: number} | null | null | null | null | null | null | null | null | {mergedFrom: $Subtype<null | null | [any, any]> | $Subtype<null | null | [any, any]> | null | null | $Subtype<null | null | [any, any]> | $Subtype<null | null | [any, any]> | [any, any] | null | null | $Subtype<null | null | [any, any]> | $Subtype<null | null | [any, any]> | null | null | null | null | [any, any] | $Subtype<null | null | [any, any]> | $Subtype<null | null | [any, any]>, previousPosition: $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | null | {x: number, y: number} | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}>, value: $Subtype<number> | $Subtype<number> | number | number | number | number | $Subtype<number> | $Subtype<number> | $Subtype<number> | number | number | number | number | $Subtype<number> | $Subtype<number> | number | number | number | number | $Subtype<number> | $Subtype<number> | number | number | number | number | $Subtype<number> | $Subtype<number> | number | number | number | number | number | number | number | number | $Subtype<number> | $Subtype<number> | $Subtype<number>, x: number, y: number} | {mergedFrom: $Subtype<null | null | [any, any]> | $Subtype<null | null | [any, any]> | null | null | $Subtype<null | null | [any, any]> | $Subtype<null | null | [any, any]> | [any, any] | null | null | $Subtype<null | null | [any, any]> | $Subtype<null | null | [any, any]> | null | null | null | null | [any, any] | $Subtype<null | null | [any, any]> | $Subtype<null | null | [any, any]>, previousPosition: $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | null | {x: number, y: number} | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}>, value: $Subtype<number> | $Subtype<number> | number | number | number | number | $Subtype<number> | $Subtype<number> | $Subtype<number> | number | number | number | number | $Subtype<number> | $Subtype<number> | number | number | number | number | $Subtype<number> | $Subtype<number> | number | number | number | number | $Subtype<number> | $Subtype<number> | number | number | number | number | number | number | number | number | $Subtype<number> | $Subtype<number> | $Subtype<number>, x: number, y: number} | null | null | null | null | null | null | null | null | {mergedFrom: $Subtype<null | null | [any, any]> | $Subtype<null | null | [any, any]> | null | null | $Subtype<null | null | [any, any]> | $Subtype<null | null | [any, any]> | [any, any] | null | null | $Subtype<null | null | [any, any]> | $Subtype<null | null | [any, any]> | null | null | null | null | [any, any] | $Subtype<null | null | [any, any]> | $Subtype<null | null | [any, any]>, previousPosition: $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | null | {x: number, y: number} | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}>, value: $Subtype<number> | $Subtype<number> | number | number | number | number | $Subtype<number> | $Subtype<number> | $Subtype<number> | number | number | number | number | $Subtype<number> | $Subtype<number> | number | number | number | number | $Subtype<number> | $Subtype<number> | number | number | number | number | $Subtype<number> | $Subtype<number> | number | number | number | number | number | number | number | number | $Subtype<number> | $Subtype<number> | $Subtype<number>, x: number, y: number} | {mergedFrom: $Subtype<null | null | [any, any]> | $Subtype<null | null | [any, any]> | null | null | $Subtype<null | null | [any, any]> | $Subtype<null | null | [any, any]> | [any, any] | null | null | $Subtype<null | null | [any, any]> | $Subtype<null | null | [any, any]> | null | null | null | null | [any, any] | $Subtype<null | null | [any, any]> | $Subtype<null | null | [any, any]>, previousPosition: $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | null | {x: number, y: number} | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}>, value: $Subtype<number> | $Subtype<number> | number | number | number | number | $Subtype<number> | $Subtype<number> | $Subtype<number> | number | number | number | number | $Subtype<number> | $Subtype<number> | number | number | number | number | $Subtype<number> | $Subtype<number> | number | number | number | number | $Subtype<number> | $Subtype<number> | number | number | number | number | number | number | number | number | $Subtype<number> | $Subtype<number> | $Subtype<number>, x: number, y: number} | null | null | null | null | null | null | null | null | {mergedFrom: $Subtype<null | null | [any, any]> | $Subtype<null | null | [any, any]> | null | null | $Subtype<null | null | [any, any]> | $Subtype<null | null | [any, any]> | [any, any] | null | null | $Subtype<null | null | [any, any]> | $Subtype<null | null | [any, any]> | null | null | null | null | [any, any] | $Subtype<null | null | [any, any]> | $Subtype<null | null | [any, any]>, previousPosition: $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | null | {x: number, y: number} | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}>, value: $Subtype<number> | $Subtype<number> | number | number | number | number | $Subtype<number> | $Subtype<number> | $Subtype<number> | number | number | number | number | $Subtype<number> | $Subtype<number> | number | number | number | number | $Subtype<number> | $Subtype<number> | number | number | number | number | $Subtype<number> | $Subtype<number> | number | number | number | number | number | number | number | number | $Subtype<number> | $Subtype<number> | $Subtype<number>, x: number, y: number}>>, size: number}, inputManager: {eventTouchend: string, eventTouchmove: string, eventTouchstart: string, events: {keepPlaying: Array<(_: any) => void>, move: Array<(_: any) => void>, restart: Array<(_: any) => void>}}, keepPlaying: boolean | boolean | (() => void), over: boolean | boolean | $Subtype<boolean> | $Subtype<boolean>, score: number, size: number, startTiles: number, storageManager: {bestScoreKey: string, gameStateKey: string, storage: }, won: boolean | boolean | $Subtype<boolean>}'; cr.
	stream nextPutAll: '2048-FlowFiles.js:193:25-33: {cells: Array<Array<{mergedFrom: $Subtype<null | null | [any, any]> | $Subtype<null | null | [any, any]> | null | null | $Subtype<null | null | [any, any]> | $Subtype<null | null | [any, any]> | [any, any] | null | null | $Subtype<null | null | [any, any]> | $Subtype<null | null | [any, any]> | null | null | null | null | [any, any] | $Subtype<null | null | [any, any]> | $Subtype<null | null | [any, any]>, previousPosition: $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | null | {x: number, y: number} | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}>, value: $Subtype<number> | $Subtype<number> | number | number | number | number | $Subtype<number> | $Subtype<number> | $Subtype<number> | number | number | number | number | $Subtype<number> | $Subtype<number> | number | number | number | number | $Subtype<number> | $Subtype<number> | number | number | number | number | $Subtype<number> | $Subtype<number> | number | number | number | number | number | number | number | number | $Subtype<number> | $Subtype<number> | $Subtype<number>, x: number, y: number} | null | null | null | null | null | null | null | null | {mergedFrom: $Subtype<null | null | [any, any]> | $Subtype<null | null | [any, any]> | null | null | $Subtype<null | null | [any, any]> | $Subtype<null | null | [any, any]> | [any, any] | null | null | $Subtype<null | null | [any, any]> | $Subtype<null | null | [any, any]> | null | null | null | null | [any, any] | $Subtype<null | null | [any, any]> | $Subtype<null | null | [any, any]>, previousPosition: $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | null | {x: number, y: number} | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}>, value: $Subtype<number> | $Subtype<number> | number | number | number | number | $Subtype<number> | $Subtype<number> | $Subtype<number> | number | number | number | number | $Subtype<number> | $Subtype<number> | number | number | number | number | $Subtype<number> | $Subtype<number> | number | number | number | number | $Subtype<number> | $Subtype<number> | number | number | number | number | number | number | number | number | $Subtype<number> | $Subtype<number> | $Subtype<number>, x: number, y: number} | {mergedFrom: $Subtype<null | null | [any, any]> | $Subtype<null | null | [any, any]> | null | null | $Subtype<null | null | [any, any]> | $Subtype<null | null | [any, any]> | [any, any] | null | null | $Subtype<null | null | [any, any]> | $Subtype<null | null | [any, any]> | null | null | null | null | [any, any] | $Subtype<null | null | [any, any]> | $Subtype<null | null | [any, any]>, previousPosition: $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | null | {x: number, y: number} | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}>, value: $Subtype<number> | $Subtype<number> | number | number | number | number | $Subtype<number> | $Subtype<number> | $Subtype<number> | number | number | number | number | $Subtype<number> | $Subtype<number> | number | number | number | number | $Subtype<number> | $Subtype<number> | number | number | number | number | $Subtype<number> | $Subtype<number> | number | number | number | number | number | number | number | number | $Subtype<number> | $Subtype<number> | $Subtype<number>, x: number, y: number} | null | null | null | null | null | null | null | null | {mergedFrom: $Subtype<null | null | [any, any]> | $Subtype<null | null | [any, any]> | null | null | $Subtype<null | null | [any, any]> | $Subtype<null | null | [any, any]> | [any, any] | null | null | $Subtype<null | null | [any, any]> | $Subtype<null | null | [any, any]> | null | null | null | null | [any, any] | $Subtype<null | null | [any, any]> | $Subtype<null | null | [any, any]>, previousPosition: $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | null | {x: number, y: number} | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}>, value: $Subtype<number> | $Subtype<number> | number | number | number | number | $Subtype<number> | $Subtype<number> | $Subtype<number> | number | number | number | number | $Subtype<number> | $Subtype<number> | number | number | number | number | $Subtype<number> | $Subtype<number> | number | number | number | number | $Subtype<number> | $Subtype<number> | number | number | number | number | number | number | number | number | $Subtype<number> | $Subtype<number> | $Subtype<number>, x: number, y: number} | {mergedFrom: $Subtype<null | null | [any, any]> | $Subtype<null | null | [any, any]> | null | null | $Subtype<null | null | [any, any]> | $Subtype<null | null | [any, any]> | [any, any] | null | null | $Subtype<null | null | [any, any]> | $Subtype<null | null | [any, any]> | null | null | null | null | [any, any] | $Subtype<null | null | [any, any]> | $Subtype<null | null | [any, any]>, previousPosition: $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | null | {x: number, y: number} | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}>, value: $Subtype<number> | $Subtype<number> | number | number | number | number | $Subtype<number> | $Subtype<number> | $Subtype<number> | number | number | number | number | $Subtype<number> | $Subtype<number> | number | number | number | number | $Subtype<number> | $Subtype<number> | number | number | number | number | $Subtype<number> | $Subtype<number> | number | number | number | number | number | number | number | number | $Subtype<number> | $Subtype<number> | $Subtype<number>, x: number, y: number} | null | null | null | null | null | null | null | null | {mergedFrom: $Subtype<null | null | [any, any]> | $Subtype<null | null | [any, any]> | null | null | $Subtype<null | null | [any, any]> | $Subtype<null | null | [any, any]> | [any, any] | null | null | $Subtype<null | null | [any, any]> | $Subtype<null | null | [any, any]> | null | null | null | null | [any, any] | $Subtype<null | null | [any, any]> | $Subtype<null | null | [any, any]>, previousPosition: $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | null | {x: number, y: number} | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}>, value: $Subtype<number> | $Subtype<number> | number | number | number | number | $Subtype<number> | $Subtype<number> | $Subtype<number> | number | number | number | number | $Subtype<number> | $Subtype<number> | number | number | number | number | $Subtype<number> | $Subtype<number> | number | number | number | number | $Subtype<number> | $Subtype<number> | number | number | number | number | number | number | number | number | $Subtype<number> | $Subtype<number> | $Subtype<number>, x: number, y: number} | {mergedFrom: $Subtype<null | null | [any, any]> | $Subtype<null | null | [any, any]> | null | null | $Subtype<null | null | [any, any]> | $Subtype<null | null | [any, any]> | [any, any] | null | null | $Subtype<null | null | [any, any]> | $Subtype<null | null | [any, any]> | null | null | null | null | [any, any] | $Subtype<null | null | [any, any]> | $Subtype<null | null | [any, any]>, previousPosition: $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | null | {x: number, y: number} | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}>, value: $Subtype<number> | $Subtype<number> | number | number | number | number | $Subtype<number> | $Subtype<number> | $Subtype<number> | number | number | number | number | $Subtype<number> | $Subtype<number> | number | number | number | number | $Subtype<number> | $Subtype<number> | number | number | number | number | $Subtype<number> | $Subtype<number> | number | number | number | number | number | number | number | number | $Subtype<number> | $Subtype<number> | $Subtype<number>, x: number, y: number} | null | null | null | null | null | null | null | null | {mergedFrom: $Subtype<null | null | [any, any]> | $Subtype<null | null | [any, any]> | null | null | $Subtype<null | null | [any, any]> | $Subtype<null | null | [any, any]> | [any, any] | null | null | $Subtype<null | null | [any, any]> | $Subtype<null | null | [any, any]> | null | null | null | null | [any, any] | $Subtype<null | null | [any, any]> | $Subtype<null | null | [any, any]>, previousPosition: $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | null | {x: number, y: number} | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}>, value: $Subtype<number> | $Subtype<number> | number | number | number | number | $Subtype<number> | $Subtype<number> | $Subtype<number> | number | number | number | number | $Subtype<number> | $Subtype<number> | number | number | number | number | $Subtype<number> | $Subtype<number> | number | number | number | number | $Subtype<number> | $Subtype<number> | number | number | number | number | number | number | number | number | $Subtype<number> | $Subtype<number> | $Subtype<number>, x: number, y: number}>>, size: number}'; cr.
	stream nextPutAll: '2048-FlowFiles.js:193:25-55: void'; cr.
	stream nextPutAll: '2048-FlowFiles.js:193:58-62: number'; cr.
	].

]

{ #category : #running }
JSClassFinderTests class >> createExample3DumpFileAran: fileName [
	| working |
	"Setting up the environment"
	working := FileSystem disk workingDirectory.
	working / fileName writeStreamDo: [ :stream | 
		stream nextPutAll: ';CallExpression;50;21;50;52;demo.js;';cr. 
		stream nextPutAll: 'bind;CallExpression;54;13;54;31;demo.js;{l1,l2,l3,toStringL1P1} [Square]';cr. 
		stream nextPutAll: 'bind;CallExpression;54;13;54;31;demo.js;{l1,l2,l3,toStringL1P1} [Square]';cr. 
		stream nextPutAll: 'bind;CallExpression;54;13;54;31;demo.js;{l1,l2,l3,toStringL1P1} [NewSquare]';cr. 
		stream nextPutAll: 'setColor;CallExpression;5;13;54;31;demo.js;{} ';cr. 
		stream nextPutAll: ';CallExpression;54;13;54;31;demo.js;{l1,l2,l3,toStringL1P1} [Square]';cr. 
		stream nextPutAll: 'bind;CallExpression;54;3;54;31;demo.js;{l1,l2,l3,toStringL1P1} [Square]';cr. 
		stream nextPutAll: 'send;CallExpression;54;32;54;52;demo.js; [Ellipse] [Circle]';cr. 
		stream nextPutAll: 'sort;CallExpression;55;11;55;52;demo.js; [NotAClass]';cr. 
		stream nextPutAll: 'hello;CallExpression;50;21;50;52;demo.js; [Triangle]';cr. 
		stream nextPutAll: 'x = 1; y = 3';cr.
	].

]

{ #category : #running }
JSClassFinderTests class >> createExample3DumpFileFlow: fileName [
"To test FCs with types unkown or undefined"
	| working |
	"Setting up the environment"
	working := FileSystem disk workingDirectory.
	working / fileName writeStreamDo: [ :stream | 
	stream nextPutAll: '2048-FlowFiles.js:584:55-60: ';cr. 
	stream nextPutAll: '2048-FlowFiles.js:193:9-12: {mergedFrom: null | null | $Subtype<null | null | [any, any]> | $Subtype<null | null | [any, any]>, previousPosition: null | {x: number, y: number} | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}>, value: number | number | number | number | $Subtype<number> | $Subtype<number>, x: number, y: number}
2048-FlowFiles.js:193:16-63: {mergedFrom: null | null | $Subtype<null | null | [any, any]> | $Subtype<null | null | [any, any]>, previousPosition: null | {x: number, y: number} | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}>, value: number | number | number | number | $Subtype<number> | $Subtype<number>, x: number, y: number}
2048-FlowFiles.js:193:20-23: (position: void | {x: , y: }, value: number) => void';cr. 
	].

]

{ #category : #running }
JSClassFinderTests class >> createExampleDumpFileAran: fileName [
	| working |
	"Setting up the environment"
	working := FileSystem disk workingDirectory.
	working / fileName writeStreamDo: [ :stream | 
		stream nextPutAll: ';CallExpression;50;21;50;52;OtherFile.js;';cr. 
		stream nextPutAll: 'bind;CallExpression;54;13;54;31;demo.js;{l1,l2,l3,toStringL1P1} [Square]';cr. 
		stream nextPutAll: 'bind;CallExpression;54;13;54;31;demo.js; [Square]';cr. 
		stream nextPutAll: 'sort;CallExpression;55;11;55;52;demo.js; [Array]';cr. 
		stream nextPutAll: 'sort;CallExpression;55;11;55;52;demo.js; [Triangle]';cr. 
		stream nextPutAll: 'x = 1; y = 3';cr.
	].

]

{ #category : #running }
JSClassFinderTests class >> createExampleDumpFileFlow: fileName [
	| working |
	"Setting up the environment"
	working := FileSystem disk workingDirectory.
	working / fileName writeStreamDo: [ :stream | 
	stream nextPutAll: '2048-FlowFiles.js:584:55-60: number';cr. 
	stream nextPutAll: '2048-FlowFiles.js:585:7-10: {bestContainer: HTMLElement, messageContainer: HTMLElement, score: number, scoreContainer: HTMLElement, tileContainer: HTMLElement}';cr. 
	stream nextPutAll: '2048-FlowFiles.js:585:7-41: void';cr.
	stream nextPutAll: '2048-FlowFiles.js:585:25-31: HTMLDivElement';cr.
	stream nextPutAll: '2048-FlowFiles.js:585:34-40: [string, any, string]';cr.
	stream nextPutAll: '2048-FlowFiles.js:585:44-50: {x: string, y: string}';cr.
	stream nextPutAll: '2048-FlowFiles.js:587:14-17: {mergedFrom: $Subtype<null | null | [any, any]> | $Subtype<null | null | [any, any]> | null | null | null | null | [any, any] | $Subtype<null | null | [any, any]> | $Subtype<null | null | [any, any]>, previousPosition: $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | null | {x: number, y: number} | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}>, value: $Subtype<number> | $Subtype<number> | number | number | number | number | $Subtype<number> | $Subtype<number> | $Subtype<number> | number | number | number | number | number | number | number | number | $Subtype<number> | $Subtype<number>, x: number, y: number}';cr.
	].

]

{ #category : #running }
JSClassFinderTests >> createFamixAttribute: fieldName class: aClass [
	| field |
	field := FAMIXAttribute new name: fieldName.
	field parentType: aClass.
	aJSClassFinder classModel add: field.
	^ field

]

{ #category : #running }
JSClassFinderTests >> createFamixClass: aConstructorFct package: aPackage [
	| c |
	c := (FAMIXClass new name: (aConstructorFct name)).
	c jsFunction: aConstructorFct.
	c parentPackage: aPackage.
	c creationPattern: #new.
	aJSClassFinder classModel add: c.
	^ c

]

{ #category : #running }
JSClassFinderTests >> createFamixFileAnchor: fileName [ 
	| fa |
	fa := (FAMIXFileAnchor new fileName: fileName).
	aJSClassFinder classModel add: fa.
	^ fa

]

{ #category : #running }
JSClassFinderTests >> createFamixInheritance: aSuper subclass: aSub [
	| inh |
	inh := FAMIXInheritance new subclass: aSub.
	inh superclass: aSuper.
	aJSClassFinder classModel add: inh.
	^ inh

]

{ #category : #running }
JSClassFinderTests >> createFamixMethod: aFunction class: aClass [
	| m |
	m := (FAMIXMethod new name: (aFunction name)).
	m parentType: aClass.
	m isPublic: true.
	m jsFunction: aFunction.
	aJSClassFinder classModel add: m.
	^ m

]

{ #category : #running }
JSClassFinderTests >> createFamixPackage: packageName [
	| p |
	p := (FAMIXPackage new name: packageName).
	aJSClassFinder classModel add: p.
	^ p

]

{ #category : #running }
JSClassFinderTests >> createJSFunctionCall: aCaller callee: aCallee [
	| call |
	call := FAMIXJSCall new.
	call caller: aCaller.
	call callee: aCallee.
	call visited: false.
	aJSClassFinder famixJSModel add: call.
	^ call

]

{ #category : #running }
JSClassFinderTests >> createJSFunctionNamed: aString [
	| fct |
	fct := FAMIXJSFunction new name: aString.
	fct isStub: false.
	fct isArgument: false.
	fct filePath: ''.
	aJSClassFinder famixJSModel add: fct.
	^ fct

]

{ #category : #running }
JSClassFinderTests >> createJSObjectNamed: aString [
	| obj |
	obj := FAMIXJSObject new name: aString.
	aJSClassFinder famixJSModel add: obj.
	^ obj

]

{ #category : #running }
JSClassFinderTests >> createJSParameter: paramName parent: aFunction [
	| p |

	p := FAMIXJSParameter new. 
	p name: paramName.
	p parentType: aFunction.
	aJSClassFinder famixJSModel add: p.
	^p

]

{ #category : #running }
JSClassFinderTests >> createJSPropertyNamed: aString parent: aParent [
	| prop |
	prop := FAMIXJSProperty new name: aString.
	prop parentType: aParent.
	aJSClassFinder famixJSModel add: prop.
	^ prop

]

{ #category : #running }
JSClassFinderTests >> createJSPrototypeForFct: aFunction [
	| proto |
	proto := FAMIXJSPrototype new.
	proto jsOwnerFunction: aFunction.
	aFunction jsPrototype: proto.
	aJSClassFinder famixJSModel add: proto.
	^ proto

]

{ #category : #accessing }
JSClassFinderTests >> famixJSModel: anObject [
	famixJSModel := anObject
]

{ #category : #running }
JSClassFinderTests >> setUp [
	"Create the necessary objects to test the class JSClassFinder"
	aJSClassFinder := JSClassFinder new famixJSModel: MooseModel new.
	classModel := aJSClassFinder classModel.
	famixJSModel := aJSClassFinder famixJSModel.

]

{ #category : #metrics }
JSClassFinderTests >> testClassUsageRatio [
	| c01 c02 c03 fct01 proto01 obj01 pck  |
	pck := (self createFamixPackage: 'file1').
	c01 := self createFamixClass: (self createJSFunctionNamed: 'c1') package: pck.	
	c01 creationPattern: #new.	
	c02 := self createFamixClass: (self createJSFunctionNamed: 'c2') package: pck.	
	c02 creationPattern: #nonew.	
	c03 := self createFamixClass: (self createJSFunctionNamed: 'c3') package: pck.	
	c03 creationPattern: #singleton.	

	self createFamixMethod: (self createJSFunctionNamed: 'm1') class: c01.
	"aJSClassFinder ensureJSMethod: (FAMIXJSProperty new name:'m1') parent: c01."
	self createFamixMethod: (self createJSFunctionNamed: 'm2') class: c02.
	"aJSClassFinder ensureJSMethod: (FAMIXJSProperty new name:'m2') parent: c02."
	self createFamixMethod: (self createJSFunctionNamed: 'm3') class: c03.
	"aJSClassFinder ensureJSMethod: (FAMIXJSProperty new name:'m3') parent: c03.
	aJSClassFinder famixJSModel: MooseModel new."

	fct01 := self createJSFunctionNamed: 'Mammal'.
	proto01 := self createJSPrototypeForFct: fct01.
	fct01 jsPrototype: proto01.
	obj01 := self createJSObjectNamed: nil.
	obj01 jsBEntity: fct01.
	self createJSFunctionNamed: 'getName1'.
	"self createJSFunctionNamed: 'getName2'.
	self createJSFunctionNamed: 'getName3'.
	self createJSFunctionNamed: 'getName4'.
	self createJSFunctionNamed: 'getName5'.
	self createJSFunctionNamed: 'getName6'.
	self createJSFunctionNamed: 'getName7'."
	
	self assert: aJSClassFinder classUsageRatio equals: 0.5.

]

{ #category : #'creating elements' }
JSClassFinderTests >> testCreateCollectionForJSCallExpression [
	| fctMammal fctSetSound  fc01  aTarget  fc02 |
	"Set up the environment"
	fctMammal := self createJSFunctionNamed: 'Mammal'.
	fctSetSound := self createJSFunctionNamed: 'setSound'.
	fc01 := self createJSFunctionCall: fctMammal callee: fctSetSound.  
	fc01 locInfo: (FAMIXFileAnchor new startLine: 12; startColumn: 1; endLine: 12; endColumn: 21; yourself).
	fc02 := self createJSFunctionCall: fctMammal callee: 'HTMLDivElement'.  
	fc02 locInfo: (FAMIXFileAnchor new startLine: 12; startColumn: 1; endLine: 12; endColumn: 21; yourself).
	"Tests"
	aTarget := JSClassFinder createCollectionForJSCallExpression: fc01 calleeTypes: 'number'. 
	self assert: aTarget size equals: 8.
	self assert: (aTarget at:1) equals: 'setSound'.
	self assert: (aTarget at:3) equals: 12.
	self assert: (aTarget at:4) equals: 1.
	aTarget := JSClassFinder createCollectionForJSCallExpression: fc02 calleeTypes: 'Mammal'. 
	self assert: (aTarget at:1) equals: 'HTMLDivElement'.
	self assert: (aTarget at:5) equals: 12.
	self assert: (aTarget at:6) equals: 21.
	self assert: (aTarget at:7) equals: ''. "fileName"
	self assert: (aTarget at:8) equals: 'Mammal'.
	
]

{ #category : #'creating elements' }
JSClassFinderTests >> testCreateJSCallExpressionsForFlow [
	| fctMammal fctSetSound  fc01  aTarget classMammal fc02 |
	"Set up the environment"
	fctMammal := (self createJSFunctionNamed: 'Mammal').
	classMammal := self createFamixClass: fctMammal package: (self createFamixPackage: 'file1').
	fctSetSound := self createJSFunctionNamed: 'setSound'.
	fctSetSound parentType: fctMammal.
	self createFamixMethod: fctSetSound class: classMammal.
	fc01 := self createJSFunctionCall: fctMammal callee: fctSetSound.  
	fc01 locInfo: (FAMIXFileAnchor new startLine: 12; startColumn: 1; endLine: 12; endColumn: 21; yourself).
	fc02 := self createJSFunctionCall: fctMammal callee: 'HTMLDivElement'.  
	fc02 locInfo: (FAMIXFileAnchor new startLine: 12; startColumn: 1; endLine: 12; endColumn: 21; yourself).
	"Tests"
	aTarget := aJSClassFinder createJSCallExpressionsForFlow: fc01 stringFlow: '25-31: number'. 
	self assert: aTarget isNil.
	aTarget := aJSClassFinder createJSCallExpressionsForFlow: fc01 stringFlow: '3-21: number'. 
	self assert: (aTarget isMemberOf: JSCallExpFunction).
	self assert: (aTarget classification) equals: #InternalFct.
	aTarget := aJSClassFinder createJSCallExpressionsForFlow: fc02 stringFlow: '3-21: number'. 
	self assert: (aTarget isMemberOf: JSCallExpFunction).
	self assert: (aTarget classification) equals: #ApiJS.
	aTarget := aJSClassFinder createJSCallExpressionsForFlow: fc01 stringFlow: '5-21: null | [any, any]'. 
	self assert: (aTarget isMemberOf: JSCallExpression).
	self assert: (aTarget classification) equals: #MultipleTypes.
	aTarget := aJSClassFinder createJSCallExpressionsForFlow: fc01 stringFlow: '5-21: {bestContainer: HTMLElement, messageContainer: HTMLElement, score: number, scoreContainer: HTMLElement, tileContainer: HTMLElement}'. 
	self assert: (aTarget isMemberOf: JSCallExpObject).
	self assert: (aTarget classification) equals: #OtherObj.
	classMammal jsType: (aJSClassFinder getJSClassTypeWithoutPrototype: classMammal).
	aTarget := aJSClassFinder createJSCallExpressionsForFlow: fc01 stringFlow: '5-21: {setSound: () => number}'. 
	self assert: (aTarget isMemberOf: JSCallExpObject).
	self assert: (aTarget classification) equals: #Class.
	
]

{ #category : #'creating elements' }
JSClassFinderTests >> testCreateJSCallExpressionsForFlowMoreThanOneLine [
	| fctMammal fctSetSound  fc01  aTarget   |
	"Set up the environment"
	fctMammal := (self createJSFunctionNamed: 'Mammal').
	fctSetSound := self createJSFunctionNamed: 'setSound'.
	fctSetSound parentType: fctMammal.
	fc01 := self createJSFunctionCall: fctMammal callee: fctSetSound.  
	fc01 locInfo: (FAMIXFileAnchor new startLine: 12; startColumn: 1; endLine: 13; endColumn: 2; yourself).
	"Tests"
	aTarget := aJSClassFinder createJSCallExpressionsForFlow: fc01 stringFlow: '2,29:1: () => void'. 
	self assert: (aTarget isMemberOf: JSCallExpFunction).
	self assert: (aTarget classification) equals: #InternalFct.
	
]

{ #category : #metrics }
JSClassFinderTests >> testDataOrientedClassRatio [
	| c01 c02 c03 p01 pck |
	pck := (self createFamixPackage: 'file1').
	c01 := self createFamixClass: (self createJSFunctionNamed: 'c1') package: pck.	
	c01 creationPattern: #new.	
	c02 := self createFamixClass: (self createJSFunctionNamed: 'c2') package: pck.	
	c02 creationPattern: #nonew.	
	c03 := self createFamixClass: (self createJSFunctionNamed: 'c3') package: pck.	
	c03 creationPattern: #singleton.	
	
	"c01 := aJSClassFinder ensureJSClass: 'c1' pattern: #new package: 'file1'.
	c02 := aJSClassFinder ensureJSClass: 'c2' pattern: #nonew package: 'file1'.
	c03 := aJSClassFinder ensureJSClass: 'c3' pattern: #singleton package: 'file1'."
	p01 := FAMIXJSProperty new.
	p01 name: 'a1'.
	aJSClassFinder ensureJSAttribute: p01 parent: c01.
	p01 name: 'a2'.
	aJSClassFinder ensureJSAttribute: p01 parent: c01.
	p01 name: 'a3'.
	aJSClassFinder ensureJSAttribute: p01 parent: c02.
	p01 name: 'a4'.
	aJSClassFinder ensureJSAttribute: p01 parent: c02.
	p01 name: 'a5'.
	aJSClassFinder ensureJSAttribute: p01 parent: c03.
	self createFamixMethod: (self createJSFunctionNamed: 'm1') class: c01.
	"aJSClassFinder ensureJSMethod: (FAMIXJSProperty new name:'m1') parent: c01."
	self createFamixMethod: (self createJSFunctionNamed: 'm2') class: c01.
	"aJSClassFinder ensureJSMethod: (FAMIXJSProperty new name:'m2') parent: c01."
	self createFamixMethod: (self createJSFunctionNamed: 'm3') class: c02.
	"aJSClassFinder ensureJSMethod: (FAMIXJSProperty new name:'m3') parent: c02."
	self createFamixMethod: (self createJSFunctionNamed: 'm4') class: c03.
	"aJSClassFinder ensureJSMethod: (FAMIXJSProperty new name:'m4') parent: c03."
	
	self assert: aJSClassFinder dataOrientedClassRatio equals: 0.5.

]

{ #category : #'creating elements' }
JSClassFinderTests >> testEnsureJSAttributeComposedName [
	| c01 a01  p01 f |
	f := self createJSFunctionNamed: 'c1'.
	c01 := self createFamixClass: f package: (self createFamixPackage: 'file1').	
	"c01 := aJSClassFinder ensureJSClass: 'c1' pattern: #new package: 'file1'."
	p01 := FAMIXJSProperty new.
	p01 name: 'teste.a1'.
	p01 parentType: f.
	a01 := aJSClassFinder ensureJSAttribute: p01 parent: c01.
	self assert: (classModel allWithType: FAMIXAttribute) first name equals: 'teste.a1'.

	p01 := FAMIXJSProperty new.
	p01 name: 'novoTeste1'.
	p01 parentType: f.
	a01 := aJSClassFinder ensureJSAttribute: p01 parent: c01.
	p01 := FAMIXJSProperty new.
	p01 name: 'novoTeste1.a1'.
	p01 parentType: f.
	a01 := aJSClassFinder ensureJSAttribute: p01 parent: c01.
	self assert: (classModel allWithType: FAMIXAttribute) size equals: 2.
	self assert: ((classModel allWithType: FAMIXAttribute) at:2) name equals: 'novoTeste1'.

]

{ #category : #'creating elements' }
JSClassFinderTests >> testEnsureJSAttributeExist [
	| c01 a01 a02 p01 f |
	f := self createJSFunctionNamed: 'c1'.
	c01 := self createFamixClass: f package: (self createFamixPackage: 'file1').	
	"c01 := aJSClassFinder ensureJSClass: 'c1' pattern: #new package: 'file1'."
	p01 := FAMIXJSProperty new.
	p01 name: 'a1'.
	p01 parentType: f.
	a01 := aJSClassFinder ensureJSAttribute: p01 parent: c01.
	a02 := aJSClassFinder ensureJSAttribute: p01 parent: c01.
	
	self assert: classModel entities size equals: 3.
	self assert: a01 equals: a02.
	self assert: (classModel allWithType: FAMIXPackage) size equals: 1.
	self assert: (classModel allWithType: FAMIXAttribute) size equals: 1.
	self assert: (classModel allWithType: FAMIXAttribute) first name equals: 'a1'.
	self assert: (classModel allWithType: FAMIXAttribute) first jsBEntity equals: f.

]

{ #category : #'creating elements' }
JSClassFinderTests >> testEnsureJSClassExist [
	| c01 c02 fct01 |
	fct01 := self createJSFunctionNamed: 'c1'.
	c01 := aJSClassFinder ensureJSClass: fct01 pattern: #new package: 'file1'.
	c02 := aJSClassFinder ensureJSClass: fct01 pattern: #new package: 'file1'.
	
	self assert: classModel entities size equals: 2.
	self assert: c01 equals: c02.
	self assert: (classModel allWithType: FAMIXPackage) size equals: 1.
	self assert: (classModel allWithType: FAMIXClass) size equals: 1.
	self assert: (classModel allWithType: FAMIXClass) first name equals: 'c1'.
	self deny: (classModel allWithType: FAMIXClass) first isStub.
]

{ #category : #'creating elements' }
JSClassFinderTests >> testEnsureJSClassInheritanceExist [
	| c01 c02 ih01 ih02 fct01 fct02 |
	fct01 := self createJSFunctionNamed: 'c1'.
	fct02 := self createJSFunctionNamed: 'c2'.
	c01 := aJSClassFinder ensureJSClass: fct01 pattern: #new package: 'file1'.
	"c01 := aJSClassFinder ensureJSClass: 'c1' pattern: #new package: 'file1'."
	c02 := aJSClassFinder ensureJSClass: fct02 pattern: #new package: 'file1'.
	"c02 := aJSClassFinder ensureJSClass: 'c2' pattern: #new package: 'file1'."
	ih01 := aJSClassFinder ensureJSClassInheritance: c01 super: c02.
	ih02 := aJSClassFinder ensureJSClassInheritance: c01 super: c02.
	
	self assert: classModel entities size equals: 4.
	self assert: ih01 equals: ih02.
	self assert: (classModel allWithType: FAMIXInheritance) size equals: 1.
	self assert: (classModel allWithType: FAMIXInheritance) first subclass name equals: 'c1'.
	self assert: (classModel allWithType: FAMIXInheritance) first superclass name equals: 'c2'.

]

{ #category : #'creating elements' }
JSClassFinderTests >> testEnsureJSMethodExist [
	| c01 m01 m02 fct01 |
	fct01 := self createJSFunctionNamed: 'c1'.
	c01 := aJSClassFinder ensureJSClass: fct01 pattern: #new package: 'file1'.
	"c01 := aJSClassFinder ensureJSClass: 'c1' pattern: #new package: 'file1'."
	m01 := aJSClassFinder ensureJSMethod: (FAMIXJSProperty new name:'m1') parent: c01.
	m02 := aJSClassFinder ensureJSMethod: (FAMIXJSProperty new name:'m1') parent: c01.
	
	self assert: classModel entities size equals: 3.
	self assert: m01 equals: m02.
	self assert: (classModel allWithType: FAMIXMethod) size equals: 1.
	self assert: (classModel allWithType: FAMIXMethod) first name equals: 'm1'.

]

{ #category : #'search and filtering' }
JSClassFinderTests >> testExistJSClass [
	| class01 |
	"Set up the environment"
	aJSClassFinder classModel: MooseModel new.
	class01 := FAMIXClass new name: 'Mammal'.
	class01 creationPattern: #new.
	aJSClassFinder classModel add: class01.
	
	self deny: (aJSClassFinder existJSClass: 'test' pattern: #new).
	self deny: (aJSClassFinder existJSClass: class01 name pattern: #nonew).
	self assert: (aJSClassFinder existJSClass: class01 name pattern: #new).

]

{ #category : #'search and filtering' }
JSClassFinderTests >> testFilterJSClassesNew [
	|  class01 class02 class03 m01 a01 pck |
	"aJSClassFinder classModel: MooseModel new."
	pck := (self createFamixPackage: '').
	class01 := self createFamixClass: (self createJSFunctionNamed: 'Circle') package: pck.
	"class01 := (FAMIXClass new name: 'Circle') creationPattern: #new."
	"aJSClassFinder classModel add: class01."
	class02 := self createFamixClass: (self createJSFunctionNamed: 'Rectangle') package: pck.
	"class02 := (FAMIXClass new name: 'Rectangle') creationPattern: #new.
	aJSClassFinder classModel add: class02."
	class03 := self createFamixClass: (self createJSFunctionNamed: 'Ellipse') package: pck.
	"class03 := (FAMIXClass new name: 'Ellipse') creationPattern: #new.
	aJSClassFinder classModel add: class03."
	
	m01 := (self createFamixMethod: (self createJSFunctionNamed: 'getArea') class: class02).
	a01 := (self createFamixAttribute: 'sideA' class: class02).
	self createFamixInheritance: class02 subclass: class01.
	
	self assert: aJSClassFinder classModel entities size equals: 7.

	aJSClassFinder filterJSClassesNew. "<-- real target of the test"
	
	self assert: aJSClassFinder classModel entities size equals: 6.
	
	self assert: (aJSClassFinder classModel allWithType: FAMIXClass) size equals: 2.
	self assert: ((aJSClassFinder classModel allWithType: FAMIXClass) detect: [ :c | c name = 'Circle' ] ifNone:[ nil ]) isNotNil.
	self assert: ((aJSClassFinder classModel allWithType: FAMIXClass) detect: [ :c | c name = 'Rectangle' ] ifNone:[ nil ]) isNotNil.

	self assert: (aJSClassFinder classModel allWithType: FAMIXMethod) size equals: 1.
	self assert: (aJSClassFinder classModel allWithType: FAMIXAttribute) size equals: 1.

]

{ #category : #'search and filtering' }
JSClassFinderTests >> testFilterJSClassesNoNewAndSingleton [
	|  class01 class02 class03 m01 a01 classTemp pck |
	"aJSClassFinder classModel: MooseModel new."
	pck := (self createFamixPackage: '').
	class01 := self createFamixClass: (self createJSFunctionNamed: 'Circle') package: pck.
	"class01 := (FAMIXClass new name: 'Circle') creationPattern: #new.
	aJSClassFinder classModel add: class01."
	class02 := self createFamixClass: (self createJSFunctionNamed: 'Rectangle') package: pck.
	class02 creationPattern: #nonew.
	"class02 := (FAMIXClass new name: 'Rectangle') creationPattern: #nonew.
	aJSClassFinder classModel add: class02."
	class03 := self createFamixClass: (self createJSFunctionNamed: 'Ellipse') package: pck.
	class03 creationPattern: #singleton.
	"class03 := (FAMIXClass new name: 'Ellipse') creationPattern: #singleton.
	aJSClassFinder classModel add: class03."
	
	m01 := self createFamixMethod: (self createJSFunctionNamed: 'getArea') class: class02.
	a01 := FAMIXAttribute new name: 'sideA'.
	a01 parentType: class01.
	aJSClassFinder classModel add: a01.
	
	aJSClassFinder filterJSClassesNoNewAndSingleton. "<-- real target of the test"
	
	self assert: aJSClassFinder classModel entities size equals: 5.
	
	self assert: (aJSClassFinder classModel allWithType: FAMIXClass) size equals: 2.
	classTemp := (aJSClassFinder classModel allWithType: FAMIXClass) detect: [ :objClass | objClass name = 'Circle' ] ifNone:[ nil ].
	self assert: classTemp isNotNil.
	classTemp := (aJSClassFinder classModel allWithType: FAMIXClass) detect: [ :objClass | objClass name = 'Rectangle' ] ifNone:[ nil ].
	self assert: classTemp isNotNil.
	
	self assert: (aJSClassFinder classModel allWithType: FAMIXMethod) size equals: 1.
	self assert: (aJSClassFinder classModel allWithType: FAMIXAttribute) size equals: 1.

]

{ #category : #'search and filtering' }
JSClassFinderTests >> testFilterJSClassesNoNewAndSingletonRemoveNonew [
	|  class01 class02 class03 m01 a01 inh01 classTemp |
	aJSClassFinder classModel: MooseModel new.
	class01 := (FAMIXClass new name: 'Circle') creationPattern: #new.
	aJSClassFinder classModel add: class01.
	class02 := (FAMIXClass new name: 'Rectangle') creationPattern: #nonew.
	aJSClassFinder classModel add: class02.
	class03 := (FAMIXClass new name: 'Ellipse') creationPattern: #singleton.
	aJSClassFinder classModel add: class03.
	
	m01 := FAMIXMethod new name: 'getArea'.
	m01 parentType: class01.
	aJSClassFinder classModel add: m01.
	
	a01 := FAMIXAttribute new name: 'sideA'.
	a01 parentType: class02.
	aJSClassFinder classModel add: a01.
	
	inh01 := FAMIXInheritance new.
	inh01 superclass: class01.
	inh01 subclass: class03.
	aJSClassFinder classModel add: inh01.
	
	aJSClassFinder filterJSClassesNoNewAndSingleton. "<-- real target of the test"
	
	self assert: aJSClassFinder classModel entities size equals: 4.
	
	self assert: (aJSClassFinder classModel allWithType: FAMIXClass) size equals: 2.
	classTemp := (aJSClassFinder classModel allWithType: FAMIXClass) detect: [ :objClass | objClass name = 'Circle' ] ifNone:[ nil ].
	self assert: classTemp isNotNil.
	classTemp := (aJSClassFinder classModel allWithType: FAMIXClass) detect: [ :objClass | objClass name = 'Ellipse' ] ifNone:[ nil ].
	self assert: classTemp isNotNil.
	
	self assert: (aJSClassFinder classModel allWithType: FAMIXMethod) size equals: 1.
	self assert: (aJSClassFinder classModel allWithType: FAMIXAttribute) size equals: 0.
	self assert: (aJSClassFinder classModel allWithType: FAMIXInheritance) size equals: 1.

]

{ #category : #accessing }
JSClassFinderTests >> testFirstNameField [
	self assert: (JSClassFinder firstNameField: '') equals: ''. 
	self assert: (JSClassFinder firstNameField: 'actuator') equals: 'actuator'. 
	self assert: (JSClassFinder firstNameField: 'inputManager.on') equals: 'inputManager'. 
	self assert: (JSClassFinder firstNameField: 'grid.cells.x') equals: 'grid'. 
	
]

{ #category : #accessing }
JSClassFinderTests >> testFunctionCallsInClassesToInternalFct [
	| fct01 fct02  p01 p02 list p03 fctGetSound fctGetName fctSetName |
	"Set up the environment"
	fct01 := (self createJSFunctionNamed: 'Mammal').
	self createFamixClass: fct01 package: (self createFamixPackage: 'file1').
	fct02 := self createJSFunctionNamed: 'setSound'.
	self createJSFunctionCall: fct01 callee: fct02.  "Callee is a FAMIXJSFunction (ok)"

	self createJSFunctionCall: fct01 callee: 'externalFunction'. "Callee is not an internal function (not ok)"

	fctGetSound := self createJSFunctionNamed: 'getSound'.
	self createJSFunctionCall: fct01 callee: 'getSound'. "Callee is the name of an internal function (ok)"

	fctGetName := self createJSFunctionNamed: 'getName'.
	p01 := self createJSPropertyNamed: 'getName' parent: fct01.
	"Callee is a property whose name is from an internal function (ok)"
	self createJSFunctionCall: fct01 callee: p01. 

	p02 := self createJSPropertyNamed: 'unknown' parent: fct01.
	"Callee is a property whose name is NOT from an internal function (not ok)"
	self createJSFunctionCall: fct01 callee: p02. 

	p03 := self createJSPropertyNamed: 'setName' parent: fct01.
	fctSetName := self createJSFunctionNamed: 'setName'.
	p03 jsValue: fctSetName.
	self createJSFunctionCall: fct01 callee: p03. "Callee is a property linked to an internal function (ok)"

	"Tests for function 1"
	list := aJSClassFinder functionCallsInClassesToInternalFct.
	
	self assert: list size equals: 4. 
	self assert: (list detect: [ :prop | (prop callee = fct02) & (prop calleeCandidates size = 1) & (prop calleeCandidates first = fct02) ] ifNone: [ nil ]) isNotNil.
	self assert: (list detect: [ :prop | (prop callee = 'externalFunction') & (prop calleeCandidates isEmpty) ] ifNone: [ nil ]) isNil.
	self assert: (list detect: [ :prop | (prop callee = 'getSound') & (prop calleeCandidates size = 1) & (prop calleeCandidates first = fctGetSound) ] ifNone: [ nil ]) isNotNil.
	self assert: (list detect: [ :prop | (prop callee = p01) & (prop calleeCandidates size = 1) & (prop calleeCandidates first = fctGetName) ] ifNone: [ nil ]) isNotNil.
	self assert: (list detect: [ :prop | (prop callee = p02) & (prop calleeCandidates isEmpty) ] ifNone: [ nil ]) isNil.
	self assert: (list detect: [ :prop | (prop callee = p03) & (prop calleeCandidates size = 1) & (prop calleeCandidates first = fctSetName) ] ifNone: [ nil ]) isNotNil.
	
]

{ #category : #accessing }
JSClassFinderTests >> testFunctionCallsInClassesToUniqueClassFct [
	| fct01   p01  list p03 fctGetSound fctGetName fctSetName pck fctCat clsCat fctSetSound fctToString p02 |
	"Set up the environment"
	pck := self createFamixPackage: 'file1'.
	fct01 := self createJSFunctionNamed: 'Mammal'.
	self createFamixClass: fct01 package: pck.
	fctCat := self createJSFunctionNamed: 'Cat'.
	clsCat := self createFamixClass: fctCat package: pck.
	fctSetSound := self createJSFunctionNamed: 'setSound'.
	fctSetSound parentType: fctCat.
	self createFamixMethod: fctSetSound class: clsCat.
	self createJSFunctionCall: fct01 callee: fctSetSound.  "Call from class to class (ok)"

	self createJSFunctionCall: fct01 callee: 'externalFunction'. "Callee is not an internal function (not ok)"

	fctGetSound := self createJSFunctionNamed: 'getSound'.
	self createJSFunctionCall: fct01 callee: 'getSound'. "getSound is not a method (not ok)"

	fctGetName := self createJSFunctionNamed: 'getName'.
	self createFamixMethod: fctGetName class: clsCat.
	p01 := self createJSPropertyNamed: 'getName' parent: fct01.
	"Callee is a property whose name is from a method (ok)"
	self createJSFunctionCall: fct01 callee: p01. 

	p03 := self createJSPropertyNamed: 'setName' parent: fct01.
	fctSetName := self createJSFunctionNamed: 'setName'.
	p03 jsValue: fctSetName.
	self createJSFunctionCall: fct01 callee: p03. "Callee is a property linked to an internal function that is not a method (not ok)"

	fctToString := self createJSFunctionNamed: 'toString'.
	self createFamixMethod: fctToString class: clsCat.
	p02 := self createJSPropertyNamed: 'toString' parent: fct01.
	p02 jsValue: fctToString.
	self createJSFunctionCall: fct01 callee: p02. "Callee is a property linked to an internal function that is a method (ok)"

	"Tests for function 1"
	list := aJSClassFinder functionCallsInClassesToUniqueClassFct.
	
	self assert: list size equals: 3. 
	self assert: (list detect: [ :prop | prop callee = fctSetSound ] ifNone: [ nil ]) isNotNil.
	self assert: (list detect: [ :prop | prop callee = 'externalFunction' ] ifNone: [ nil ]) isNil.
	self assert: (list detect: [ :prop | prop callee = 'getSound' ] ifNone: [ nil ]) isNil.
	self assert: (list detect: [ :prop | prop callee = p01 ] ifNone: [ nil ]) isNotNil.
	self assert: (list detect: [ :prop | prop callee = p02 ] ifNone: [ nil ]) isNotNil.
	self assert: (list detect: [ :prop | prop callee = p03 ] ifNone: [ nil ]) isNil.
	
]

{ #category : #accessing }
JSClassFinderTests >> testFunctionCallsInClassesToUniqueDifferentClassFct [
	| fct01   p01  list p03 fctGetSound fctGetName fctSetName pck fctCat clsCat fctSetSound   |
	"Set up the environment"
	pck := self createFamixPackage: 'file1'.
	fct01 := self createJSFunctionNamed: 'Mammal'.
	self createFamixClass: fct01 package: pck.
	fctCat := self createJSFunctionNamed: 'Cat'.
	clsCat := self createFamixClass: fctCat package: pck.
	fctSetSound := self createJSFunctionNamed: 'setSound'.
	fctSetSound parentType: fctCat.
	self createFamixMethod: fctSetSound class: clsCat.
	self createJSFunctionCall: fct01 callee: fctSetSound.  "Call from class to class (ok)"

	fctGetSound := self createJSFunctionNamed: 'getSound'.
	self createJSFunctionCall: fct01 callee: 'getSound'. "getSound is not a method (not ok)"

	fctGetName := self createJSFunctionNamed: 'getName'.
	self createFamixMethod: fctGetName class: clsCat.
	p01 := self createJSPropertyNamed: 'getName' parent: fct01.
	"Callee is a property whose name is from a method (ok)"
	self createJSFunctionCall: fct01 callee: p01. 

	p03 := self createJSPropertyNamed: 'setName' parent: fctCat.
	fctSetName := self createJSFunctionNamed: 'setName'.
	self createFamixMethod: fctSetName class: clsCat.
	p03 jsValue: fctSetName.
	self createJSFunctionCall: fctCat callee: p03. "Callee is a property linked to an internal function that is a method from the same class (not ok)"

	"Tests for function 1"
	list := aJSClassFinder functionCallsInClassesToUniqueDifferentClassFct.
	
	self assert: list size equals: 2. 
	self assert: (list detect: [ :prop | prop callee = fctSetSound ] ifNone: [ nil ]) isNotNil.
	self assert: (list detect: [ :prop | prop callee = 'getSound' ] ifNone: [ nil ]) isNil.
	self assert: (list detect: [ :prop | prop callee = p01 ] ifNone: [ nil ]) isNotNil.
	self assert: (list detect: [ :prop | prop callee = p03 ] ifNone: [ nil ]) isNil.
	
]

{ #category : #'search and filtering' }
JSClassFinderTests >> testGetAllOrderedFunctionCallsForFlow [
	| fc01 list fctMammal fctCat fctSetSound  fc02   fc03      |

	"Set up the environment"
	fctMammal := (self createJSFunctionNamed: 'Mammal').
	fctCat := (self createJSFunctionNamed: 'Cat').
	fctSetSound := self createJSFunctionNamed: 'setSound'.
	fctSetSound parentType: fctCat.
	fc01 := self createJSFunctionCall: fctMammal callee: fctSetSound.  
	fc01 locInfo: (self createFamixFileAnchor: 'Mammal.js').
	fc01 locInfo startLine: 15.
	fc01 locInfo endLine: 15.
	fc01 locInfo startColumn: 10.
	fc01 locInfo endColumn: 13.

	fc02 := self createJSFunctionCall: fctCat callee: fctMammal. 
	fc02 locInfo: (self createFamixFileAnchor: 'Cat.js').
	fc02 locInfo startLine: 10.
	fc02 locInfo endLine: 10.
	fc02 locInfo startColumn: 1.
	fc02 locInfo endColumn: 12.

	fc03 := self createJSFunctionCall: fctMammal callee: fctCat. 
	fc03 locInfo: (self createFamixFileAnchor: 'Mammal.js').
	fc03 locInfo startLine: 6.
	fc03 locInfo endLine: 6.
	fc03 locInfo startColumn: 3.
	fc03 locInfo endColumn: 9.

	list := aJSClassFinder getAllOrderedFunctionCallsForFlow. " <-- Real target of the test"
	
	self assert: list size equals: 3. 
	self assert: (list at:1) locInfo startLine equals: 10.
	self assert: (list at:1) locInfo fileName equals: 'Cat.js'.
	self assert: (list at:2) locInfo startLine equals: 6.
	self assert: (list at:2) locInfo fileName equals: 'Mammal.js'.
	self assert: (list at:3) locInfo startLine equals: 15.
	self assert: (list at:3) locInfo fileName equals: 'Mammal.js'.

]

{ #category : #'search and filtering' }
JSClassFinderTests >> testGetAllValidFamixJSFunctions [
	|  list   fctSetSound           |

	"Set up the environment"
	self createJSFunctionNamed: 'Mammal'.
	fctSetSound := self createJSFunctionNamed: 'setSound'.
	fctSetSound isStub: true.

	list := aJSClassFinder getAllValidFamixJSFunctions. " <-- Real target of the test"
	
	self assert: list size equals: 1. 
	self assert: (list at:1) name equals: 'Mammal'.

]

{ #category : #'search and filtering' }
JSClassFinderTests >> testGetCollectionListOfStringTypes [
	| resultCollection  |
	resultCollection := OrderedCollection new.
	"Invalid inputs result in an empty collection"
	self assert: (JSClassFinder getCollectionListOfStringTypes: '') equals: resultCollection.
	self assert: (JSClassFinder getCollectionListOfStringTypes: 'string') equals: resultCollection.
	"Valid inputs"
	resultCollection add: (#('x' 'y') asSortedCollection).
	self assert: (JSClassFinder getCollectionListOfStringTypes: '{x: number, y: number}') equals: resultCollection.
	resultCollection add: (#('x' 'y') asSortedCollection).
	resultCollection add: (#('p1' 'p2' 'x' 'y') asSortedCollection).
	resultCollection add: (#('print()') asSortedCollection).
	self assert: (JSClassFinder getCollectionListOfStringTypes: '{print: (obj: {p1: {x: number, y: number}, p2: {x: number, y: number}, x: number, y: number}) => string}' lookIntoInternalObjects: true) equals: resultCollection.
	resultCollection := OrderedCollection new.
	resultCollection add: (#('getArea()' 'getArea2()' 'radius') asSortedCollection).
	self assert: (JSClassFinder getCollectionListOfStringTypes: '{getArea: () => number, getArea2: () => number, radius: number}') equals: resultCollection.
	" Tests it with 'lookIntoInternalObjects = false'"
	resultCollection := OrderedCollection new.
	resultCollection add: (#('p1' 'p2' 'x' 'y') asSortedCollection).
	resultCollection add: (#('print()') asSortedCollection).
	self assert: (JSClassFinder getCollectionListOfStringTypes: '{print: (obj: {p1: {x: number, y: number}, p2: {x: number, y: number}, x: number, y: number}) => string}') equals: resultCollection.
	" Test with the last field with a empty type"
	resultCollection := OrderedCollection new.
	resultCollection add: (#('bestScoreKey' 'gameStateKey' 'storage') asSortedCollection).
	self assert: (JSClassFinder getCollectionListOfStringTypes: '{bestScoreKey: string, gameStateKey: string, storage: }') equals: resultCollection.
	" Test with logical ORs"
	resultCollection := OrderedCollection new.
	resultCollection add: (#('mergedFrom' 'previousPosition' 'value' 'x' 'y') asSortedCollection).
	self assert: (JSClassFinder getCollectionListOfStringTypes: '{mergedFrom: $Subtype<null | null | [any, any]> | $Subtype<null | null | [any, any]> | null | null | null | null | [any, any] | $Subtype<null | null | [any, any]> | $Subtype<null | null | [any, any]>, previousPosition: $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}> | {x: number, y: number} | null | null | {x: number, y: number} | $Subtype<null | {x: number, y: number}> | $Subtype<null | {x: number, y: number}>, value: $Subtype<number> | $Subtype<number> | number | number | number | number | $Subtype<number> | $Subtype<number> | $Subtype<number> | number | number | number | number | number | number | number | number | $Subtype<number> | $Subtype<number>, x: number, y: number}') equals: resultCollection.
]

{ #category : #'search and filtering' }
JSClassFinderTests >> testGetConstructorCallsWithoutNew [
	| fc01 list fctMammal classMammal |

	"Set up the environment"
	fctMammal := self createJSFunctionNamed: 'Mammal'.
	classMammal := self createFamixClass: fctMammal package: (self createFamixPackage: 'test').
	fc01 := self createJSFunctionCall: nil callee: fctMammal name.  

	list := aJSClassFinder getConstructorCallsWithoutNew: classMammal. " <-- Real target of the test"
	
	self assert: list size equals: 1. 
	self assert: (list select: [ :fc | fc callee = 'Mammal']) size equals: 1.

]

{ #category : #'search and filtering' }
JSClassFinderTests >> testGetFlowCalleeObjectType [
	|  pck fct01  clsMammal  fct05   attConfig  |
	"Set up the environment"
	pck := self createFamixPackage: 'file1'.

	fct01 := self createJSFunctionNamed: 'Mammal'.
	clsMammal := self createFamixClass: fct01 package: pck.

	fct05 := self createJSFunctionNamed: 'setSound'.
	fct05 parentType: fct01.
	self createFamixMethod: fct05 class: clsMammal.
	
	attConfig := self createFamixAttribute: 'config' class: clsMammal.
	attConfig jsBEntity: fct05. 

	"Recording class jsType"
	clsMammal jsType: (aJSClassFinder getJSClassTypeWithoutPrototype: clsMammal).

	self assert: (aJSClassFinder getFlowCalleeObjectType: '{print: (obj: {p1: {x: number, y: number}, p2: {x: number, y: number}, x: number, y: number}) => string}') equals: '[OtherObject]'.
	self assert: (aJSClassFinder getFlowCalleeObjectType: '{setSound: () => number, config: number}') equals: '[Mammal]'.
	self assert: (aJSClassFinder getFlowCalleeObjectType: 'number') equals: ''.

]

{ #category : #'search and filtering' }
JSClassFinderTests >> testGetFunctionCallNotVisitedByLineNumber [
	| fc01 list fctMammal fctCat fctSetSound  fc02   fc03      |

	"Set up the environment"
	fctMammal := (self createJSFunctionNamed: 'Mammal').
	fctCat := (self createJSFunctionNamed: 'Cat').
	fctSetSound := self createJSFunctionNamed: 'setSound'.
	fctSetSound parentType: fctCat.
	fc01 := self createJSFunctionCall: fctMammal callee: fctSetSound.  
	fc01 locInfo: (self createFamixFileAnchor: 'Mammal.js').
	fc01 locInfo startLine: 15.
	fc01 locInfo startColumn: 10.
	fc01 locInfo endColumn: 13.

	fc02 := self createJSFunctionCall: fctCat callee: fctMammal. 
	fc02 locInfo: (self createFamixFileAnchor: 'Cat.js').
	fc02 locInfo startLine: 10.
	fc02 locInfo startColumn: 1.
	fc02 locInfo endColumn: 12.

	fc03 := self createJSFunctionCall: fctMammal callee: fctCat. 
	fc03 locInfo: (self createFamixFileAnchor: 'Mammal.js').
	fc03 locInfo startLine: 10.
	fc03 locInfo startColumn: 23.
	fc03 locInfo endColumn: 29.

	list := aJSClassFinder getFunctionCallNotVisitedByLineNumber: 10 column: 1. " <-- Real target of the test"
	
	self assert: list size equals: 1. 
	self assert: (list select: [ :fc | fc locInfo startColumn = 1 ]) size equals: 1.

]

{ #category : #accessing }
JSClassFinderTests >> testGetJSClassTypeWithoutPrototype [
	| fct01 fct02 fct03   proto01 proto02  p02  p04 p05    p08 fct05  fct06 p10 pck clsMammal clsCat attConfig attBreed attName2 |
	"Set up the environment"
	pck := self createFamixPackage: 'file1'.

	fct01 := self createJSFunctionNamed: 'Mammal'.
	proto01 := self createJSPrototypeForFct: fct01.
	fct01 jsPrototype: proto01.
	clsMammal := self createFamixClass: fct01 package: pck.

	p08 := self createJSPropertyNamed: 'setSound' parent: fct01.
	fct05 := self createJSFunctionNamed: 'setSound'.
	fct05 parentType: fct01.
	self createFamixMethod: fct05 class: clsMammal.
	
	fct06 := self createJSFunctionNamed: 'config'.
	fct06 parentType: fct05.
	p10 := self createJSPropertyNamed: 'config' parent: fct05.
	attConfig := self createFamixAttribute: 'config' class: clsMammal.
	attConfig jsBEntity: fct05. 
	
	fct02 := self createJSFunctionNamed: 'Cat'.
	p05 := self createJSPropertyNamed: 'breed' parent: fct02.
	clsCat := self createFamixClass: fct02 package: pck.
	attBreed := self createFamixAttribute: 'breed' class: clsCat.
	attBreed jsBEntity: fct02.

	p02 := self createJSPropertyNamed: 'getName' parent: proto01.
	fct03 := self createJSFunctionNamed: 'getName'.
	fct03 parentType: proto01.
	self createFamixMethod: fct03 class: clsMammal.

	proto02 := self createJSPrototypeForFct: fct02.
	fct02 jsPrototype: proto02.
	p04 := self createJSPropertyNamed: 'name2' parent: proto02.
	attName2 := self createFamixAttribute: 'name2' class: clsCat.
	attName2 jsBEntity: proto02.

	"Tests"
	self assert: (aJSClassFinder getJSClassTypeWithoutPrototype: clsMammal) equals: #('setSound()' 'config') asSortedCollection. 
	self assert: (aJSClassFinder getJSClassTypeWithoutPrototype: clsCat) equals: #('breed') asSortedCollection. 
	
]

{ #category : #accessing }
JSClassFinderTests >> testGetJSFunctionProperties [
	| fct01 fct02 fct03 fct04 obj01 proto01 proto02 p01 p02 p03 p04 p05 p06 list p07 p08 fct05 p09 fct06 p10 |
	"Set up the environment"
	fct01 := self createJSFunctionNamed: 'Mammal'.
	proto01 := self createJSPrototypeForFct: fct01.
	fct01 jsPrototype: proto01.
	p02 := self createJSPropertyNamed: 'getName' parent: proto01.
	p08 := self createJSPropertyNamed: 'setSound' parent: fct01.
	fct05 := self createJSFunctionNamed: 'setSound'.
	fct05 parentType: fct01.
	p09 := self createJSPropertyNamed: 'sound' parent: fct05.
	fct06 := self createJSFunctionNamed: 'config'.
	fct06 parentType: fct05.
	p10 := self createJSPropertyNamed: 'config' parent: fct05.
	
	fct02 := self createJSFunctionNamed: 'Cat'.
	p05 := self createJSPropertyNamed: 'breed' parent: fct02.

	fct03 := self createJSFunctionNamed: 'getName'.
	fct03 parentType: proto01.
	p01 := self createJSPropertyNamed: 'name' parent: fct03.
	p02 jsValue: fct03.
	p06 := self createJSPropertyNamed: 'birthDate' parent: fct03.

	obj01 := self createJSObjectNamed: 'obj01'.
	obj01 jsBEntity: nil.
	p03 := self createJSPropertyNamed: 'setName' parent: obj01.

	fct04 := self createJSFunctionNamed: 'setName'.
	fct04 parentType: obj01.
	p07 := self createJSPropertyNamed: 'auxName' parent: fct04.

	proto02 := self createJSPrototypeForFct: fct02.
	fct02 jsPrototype: proto02.
	proto02 parentObj: obj01.
	p04 := self createJSPropertyNamed: 'name2' parent: proto02.

	"Tests for function 1"
	list := aJSClassFinder getJSFunctionProperties: fct01 lookInsideInnerFunctions: true.
	self assert: list size equals:  6. 
	self assert: (list detect: [ :prop | prop name = 'getName' ] ifNone: [ nil ]) isNotNil.
	self assert: (list detect: [ :prop | prop name = 'name' ] ifNone: [ nil ]) isNotNil.
	self assert: (list detect: [ :prop | prop name = 'birthDate' ] ifNone: [ nil ]) isNotNil.
	self assert: (list detect: [ :prop | prop name = 'setSound' ] ifNone: [ nil ]) isNotNil.
	self assert: (list detect: [ :prop | prop name = 'sound' ] ifNone: [ nil ]) isNotNil.
	self assert: (list detect: [ :prop | prop name = 'config' ] ifNone: [ nil ]) isNotNil.
	list := aJSClassFinder getJSFunctionProperties: fct01 lookInsideInnerFunctions: false.
	self assert: list size equals:  2. 
	self assert: (list detect: [ :prop | prop name = 'getName' ] ifNone: [ nil ]) isNotNil.
	self assert: (list detect: [ :prop | prop name = 'setSound' ] ifNone: [ nil ]) isNotNil.
	"function 2"
	list := aJSClassFinder getJSFunctionProperties: fct02 lookInsideInnerFunctions: true.
	self assert: list size equals:  3. 
	self assert: (list detect: [ :prop | prop name = 'breed' ] ifNone: [ nil ]) isNotNil.
	self assert: (list detect: [ :prop | prop name = 'setName' ] ifNone: [ nil ]) isNotNil.
	self assert: (list detect: [ :prop | prop name = 'name2' ] ifNone: [ nil ]) isNotNil.
	list := aJSClassFinder getJSFunctionProperties: fct02 lookInsideInnerFunctions: false.
	self assert: list size equals:  3. 
	self assert: (list detect: [ :prop | prop name = 'breed' ] ifNone: [ nil ]) isNotNil.
	self assert: (list detect: [ :prop | prop name = 'setName' ] ifNone: [ nil ]) isNotNil.
	self assert: (list detect: [ :prop | prop name = 'name2' ] ifNone: [ nil ]) isNotNil.
	"function 3"
	list := aJSClassFinder getJSFunctionProperties: fct03 lookInsideInnerFunctions: true.
	self assert: list size equals:  2. 
	self assert: (list detect: [ :prop | prop name = 'name' ] ifNone: [ nil ]) isNotNil.
	self assert: (list detect: [ :prop | prop name = 'birthDate' ] ifNone: [ nil ]) isNotNil.
	list := aJSClassFinder getJSFunctionProperties: fct03 lookInsideInnerFunctions: false.
	self assert: list size equals:  2. 
	self assert: (list detect: [ :prop | prop name = 'name' ] ifNone: [ nil ]) isNotNil.
	self assert: (list detect: [ :prop | prop name = 'birthDate' ] ifNone: [ nil ]) isNotNil.
	"function 4"
	list := aJSClassFinder getJSFunctionProperties: fct04 lookInsideInnerFunctions: true.
	self assert: list size equals:  1. 
	self assert: (list detect: [ :prop | prop name = 'auxName' ] ifNone: [ nil ]) isNotNil.
	list := aJSClassFinder getJSFunctionProperties: fct04 lookInsideInnerFunctions: false.
	self assert: list size equals:  1. 
	self assert: (list detect: [ :prop | prop name = 'auxName' ] ifNone: [ nil ]) isNotNil.
	"function 5"
	list := aJSClassFinder getJSFunctionProperties: fct05 lookInsideInnerFunctions: true.
	self assert: list size equals:  2. 
	self assert: (list detect: [ :prop | prop name = 'sound' ] ifNone: [ nil ]) isNotNil.
	self assert: (list detect: [ :prop | prop name = 'config' ] ifNone: [ nil ]) isNotNil.
	list := aJSClassFinder getJSFunctionProperties: fct05 lookInsideInnerFunctions: false.
	self assert: list size equals:  2. 
	self assert: (list detect: [ :prop | prop name = 'sound' ] ifNone: [ nil ]) isNotNil.
	self assert: (list detect: [ :prop | prop name = 'config' ] ifNone: [ nil ]) isNotNil.
	"function 6"
	list := aJSClassFinder getJSFunctionProperties: fct06 lookInsideInnerFunctions: true.
	self assert: list size equals:  0. 
	list := aJSClassFinder getJSFunctionProperties: fct06 lookInsideInnerFunctions: false.
	self assert: list size equals:  0. 
	
]

{ #category : #'search and filtering' }
JSClassFinderTests >> testGetMethodAliases [
	| list fctMammal classMammal fctReleaseSound fctGetSound m01 m02 m03 |

	"Set up the environment"
	fctMammal := self createJSFunctionNamed: 'Mammal'.
	fctGetSound := self createJSFunctionNamed: 'fctGetSound'.
	fctReleaseSound := self createJSFunctionNamed: 'fctReleaseSound'.
	classMammal := self createFamixClass: fctMammal package: (self createFamixPackage: 'test').
	m01 := self createFamixMethod: fctReleaseSound class: classMammal.
	fctReleaseSound name: 'fctFreeSound'.
	m02 := self createFamixMethod: fctReleaseSound class: classMammal.
	m03 := self createFamixMethod: fctGetSound class: classMammal.
	
	list := aJSClassFinder getMethodAliases: m01. " <-- Real target of the test"
	self assert: list size equals: 1. 
	self assert: (list select: [ :m | m name = 'fctFreeSound']) size equals: 1.
	list := aJSClassFinder getMethodAliases: m02. " <-- Real target of the test"
	self assert: list size equals: 1. 
	self assert: (list select: [ :m | m name = 'fctReleaseSound']) size equals: 1.
	list := aJSClassFinder getMethodAliases: m03. " <-- Real target of the test"
	self assert: list size equals: 0. 

]

{ #category : #'search and filtering' }
JSClassFinderTests >> testGetOptionalFeatures [
	| list fctMammal classMammal fctGetName fctGetSound pck fctBird classBird |

	"Set up the environment"
	pck := self createFamixPackage: 'test'.
	fctBird := self createJSFunctionNamed: 'Bird'.
	classBird := self createFamixClass: fctBird package: pck.
	fctGetSound := self createJSFunctionNamed: 'getSound'.
	self createFamixMethod: fctGetSound class: classBird.
	fctGetSound filePath: fctBird filePath. 

	fctMammal := self createJSFunctionNamed: 'Mammal'.
	classMammal := self createFamixClass: fctMammal package: pck.
	fctGetName := self createJSFunctionNamed: 'getName'.
	self createFamixMethod: fctGetName class: classMammal.
	fctGetName filePath: fctMammal filePath. 

	list := aJSClassFinder getOptionalFeatures: classBird. " <-- Real target of the test"
	self assert: list size equals: 0.
	list := aJSClassFinder getOptionalFeatures: classMammal. " <-- Real target of the test"
	self assert: list size equals: 0.
	fctGetName filePath: '\User\test\mammal.js'.
	list := aJSClassFinder getOptionalFeatures: classMammal. " <-- Real target of the test"
	self assert: list size equals: 1. 

]

{ #category : #'search and filtering' }
JSClassFinderTests >> testGetOrderedAttributes [
	| class01 a01 a02 class02 a03 a04 list |
	class01 := self createFamixClass: (self createJSFunctionNamed: 'Mammal') package: (self createFamixPackage: '').
	a01 := (self createFamixAttribute: 'name' class: class01).
	a01 sourceAnchor: (self createFamixFileAnchor: 'Animals/Mammal.js').
	a01 sourceAnchor startLine: 15.
	a01 sourceAnchor startColumn: 10.
	a01 sourceAnchor endColumn: 13.
	a02 := (self createFamixAttribute: 'color' class: class01).
	a02 sourceAnchor: (self createFamixFileAnchor: 'Animals/Mammal.js').
	a02 sourceAnchor startLine: 10.
	a02 sourceAnchor startColumn: 1.
	a02 sourceAnchor endColumn: 12.
	class02 := self createFamixClass: (self createJSFunctionNamed: 'Reptile') package: (self createFamixPackage: '').
	a03 := (self createFamixAttribute: 'name' class: class02).
	a03 sourceAnchor: (self createFamixFileAnchor: 'Animals/Reptile.js').
	a03 sourceAnchor startLine: 6.
	a03 sourceAnchor startColumn: 3.
	a03 sourceAnchor endColumn: 9.
	a04 := (self createFamixAttribute: 'temperature' class: class02).
	a04 sourceAnchor: (self createFamixFileAnchor: 'Animals/Reptile.js').
	a04 sourceAnchor startLine: 120.
	a04 sourceAnchor startColumn: 21.
	a04 sourceAnchor endColumn: 22.
	
	list := aJSClassFinder getOrderedAttributes. "<-- real target of the test"
	self assert: (list at:1) sourceAnchor startLine equals: 10.
	self assert: (list at:1) sourceAnchor fileName equals: 'Animals/Mammal.js'.
	self assert: (list at:2) sourceAnchor startLine equals: 15.
	self assert: (list at:2) sourceAnchor fileName equals: 'Animals/Mammal.js'.
	self assert: (list at:3) sourceAnchor startLine equals: 6.
	self assert: (list at:3) sourceAnchor fileName equals: 'Animals/Reptile.js'.
	self assert: (list at:4) sourceAnchor startLine equals: 120.
	self assert: (list at:4) sourceAnchor fileName equals: 'Animals/Reptile.js'.

]

{ #category : #'search and filtering' }
JSClassFinderTests >> testGetOrderedFunctionCalls [
	| fc01 list fctMammal fctCat fctSetSound fctGetSound fc02 fctGetName p01 fc03 p03 fctSetName fc04 classMammal classCat |

	"Set up the environment"
	fctMammal := (self createJSFunctionNamed: 'Mammal').
	classMammal := self createFamixClass: fctMammal package: (self createFamixPackage: 'Mammal').
	fctCat := (self createJSFunctionNamed: 'Cat').
	classCat := self createFamixClass: fctCat package: (self createFamixPackage: 'Cat').
	fctSetSound := self createJSFunctionNamed: 'setSound'.
	fctSetSound parentType: fctCat.
	self createFamixMethod: fctSetSound class: classCat.
	fc01 := self createJSFunctionCall: fctMammal callee: fctSetSound.  "fctSetSound is a method in other class (ok)"
	fc01 locInfo: (self createFamixFileAnchor: 'Mammal.js').
	fc01 locInfo startLine: 15.
	fc01 locInfo startColumn: 10.
	fc01 locInfo endColumn: 13.

	fctGetSound := self createJSFunctionNamed: 'getSound'.
	fctGetSound parentType: fctCat.
	fc02 := self createJSFunctionCall: fctMammal callee: 'getSound'. "fctGetSound is a method in other class (ok)"
	fc02 locInfo: (self createFamixFileAnchor: 'Mammal.js').
	fc02 locInfo startLine: 10.
	fc02 locInfo startColumn: 1.
	fc02 locInfo endColumn: 12.

	fctGetName := self createJSFunctionNamed: 'getName'.
	fctGetName parentType: fctMammal.
	self createFamixMethod: fctGetName class: classMammal.
	p01 := self createJSPropertyNamed: 'getName' parent: fctMammal.
	"Callee is a property whose name is from an internal function, but caller and callee belong to the same class (not ok)"
	fc03 := self createJSFunctionCall: fctMammal callee: p01. 
	fc03 locInfo: (self createFamixFileAnchor: 'Mammal.js').
	fc03 locInfo startLine: 6.
	fc03 locInfo startColumn: 3.
	fc03 locInfo endColumn: 9.

	p03 := self createJSPropertyNamed: 'setName' parent: fctMammal.
	fctSetName := self createJSFunctionNamed: 'setName'.
	fctSetName parentType: fctMammal.
	self createFamixMethod: fctSetName class: classMammal.
	p03 jsValue: fctSetName.
	fc04 := self createJSFunctionCall: fctCat callee: p03. "Callee is a property linked to an internal function (ok)"
	fc04 locInfo: (self createFamixFileAnchor: 'Cat.js').
	fc04 locInfo startLine: 120.
	fc04 locInfo startColumn: 21.
	fc04 locInfo endColumn: 22.

	list := aJSClassFinder getOrderedFunctionCalls. " <-- Real target of the test"
	
	self assert: list size equals: 3. 
	self assert: (list at:1) locInfo startLine equals: 120.
	self assert: (list at:1) locInfo fileName equals: 'Cat.js'.
	self assert: (list at:2) locInfo startLine equals: 10.
	self assert: (list at:2) locInfo fileName equals: 'Mammal.js'.
	self assert: (list at:3) locInfo startLine equals: 15.
	self assert: (list at:3) locInfo fileName equals: 'Mammal.js'.

]

{ #category : #'search and filtering' }
JSClassFinderTests >> testGetParentClass [
	| fctMammal classMammal classCat fctCat |
	"Set up the environment"
	fctMammal := (self createJSFunctionNamed: 'Mammal').
	classMammal := self createFamixClass: fctMammal package: (self createFamixPackage: 'Mammal').
	fctCat := self createJSFunctionNamed: 'Cat'.
	classCat := self createFamixClass: fctCat package: (self createFamixPackage: 'Cat').
	self createFamixInheritance: classMammal subclass: classCat. 
	
	self assert: (aJSClassFinder getParentClass: classMammal) equals: nil. 
	self assert: (aJSClassFinder getParentClass: classCat) equals: classMammal. 
	self assert: (aJSClassFinder getParentClass: nil) equals: nil. 

]

{ #category : #'search and filtering' }
JSClassFinderTests >> testGetStaticDataProperties [
	| list fctMammal classMammal proto p01 |

	"Set up the environment"
	fctMammal := self createJSFunctionNamed: 'Mammal'.
	classMammal := self createFamixClass: fctMammal package: (self createFamixPackage: 'test').
	proto := self createJSPrototypeForFct: fctMammal.
	p01 := self createJSPropertyNamed: 'name1' parent: proto.
	"attName1 := self createFamixAttribute: 'name1' class: classMammal.
	attName1 jsBEntity: proto.
"
	list := aJSClassFinder getStaticDataProperties: classMammal. " <-- Real target of the test"
	self assert: list size equals: 1.
	p01 jsValue: (self createJSFunctionNamed: 'setSound'). 
	list := aJSClassFinder getStaticDataProperties: classMammal. " <-- Real target of the test"
	self assert: list size equals: 0. 

]

{ #category : #validation }
JSClassFinderTests >> testIsAClass [
	|  fctCat   pck |
	fctCat := self createJSFunctionNamed: 'Cat'.
	pck := self createFamixPackage: ''.
	self createFamixClass: fctCat package: pck.

	self assert: (aJSClassFinder isAClass: 'Cat').
	self deny: (aJSClassFinder isAClass: 'Dog').
	

]

{ #category : #validation }
JSClassFinderTests >> testIsAClassOrMethodByFunction [
	| fct01 fctCat fctGetName fctConfig pck |
	fctCat := self createJSFunctionNamed: 'Cat'.
	pck := (self createFamixPackage: '').
	fctGetName := self createJSFunctionNamed: 'getName'.
	self createFamixMethod: fctGetName class: (self createFamixClass: fctCat package: pck).
	fctConfig := self createJSFunctionNamed: 'config'.
	fct01 := self createJSFunctionNamed: ''.
	fct01 parentType: fctGetName.

	self assert: (aJSClassFinder isAClassOrMethodByFunction: fctCat).
	self assert: (aJSClassFinder isAClassOrMethodByFunction: fctGetName).
	self assert: (aJSClassFinder isAClassOrMethodByFunction: fct01).
	self deny: (aJSClassFinder isAUniqueValidFunctionName: fctConfig).
	

]

{ #category : #validation }
JSClassFinderTests >> testIsAPropertyClass [
	| prop01 proto01 fct01 fct02 obj01 |
	fct01 := self createJSFunctionNamed: 'Mammal'.
	fct02 := self createJSFunctionNamed: 'Cat'.
	proto01 := FAMIXJSPrototype new.
	proto01 jsOwnerFunction: fct01.
	fct01 jsPrototype: proto01.
	aJSClassFinder famixJSModel add: proto01.
	obj01 := FAMIXJSObject new.
	aJSClassFinder famixJSModel add: obj01.
	prop01 := FAMIXJSProperty new name:'Test'.
	aJSClassFinder famixJSModel add: prop01.

	prop01 parentType: proto01.
	prop01 isBoundToThis: false.
	self assert: (JSClassFinder isAPropertyClass: prop01).
	
	prop01 parentType: obj01.
	self assert: (JSClassFinder isAPropertyClass: prop01).

	prop01 parentType: fct02.
	self deny: (JSClassFinder isAPropertyClass: prop01).

	prop01 parentType: fct02.
	prop01 isBoundToThis: true.
	self assert: (JSClassFinder isAPropertyClass: prop01).

]

{ #category : #validation }
JSClassFinderTests >> testIsAUniqueValidFunctionName [
	| fct02 |
	fct02 := self createJSFunctionNamed: 'Cat'.

	self deny: (aJSClassFinder isAUniqueValidFunctionName: 'Der').
	self assert: (aJSClassFinder isAUniqueValidFunctionName: 'Cat').
	fct02 isStub: true.
	self deny:( aJSClassFinder isAUniqueValidFunctionName: 'Cat').
	

]

{ #category : #validation }
JSClassFinderTests >> testIsThisUsedBeforeSuper [
	| fc01 fctCat fctMammal pck classCat classMammal |
	fctMammal := self createJSFunctionNamed: 'Mammal'.
	fctCat := self createJSFunctionNamed: 'Cat'.
	fctCat locFirstThisExp: (FAMIXFileAnchor new startLine:'11'; startColumn: '1').
	pck := (self createFamixPackage: '').
	classMammal := self createFamixClass: fctMammal package: pck.
	classCat := self createFamixClass: fctCat package: pck.
	"Inheritance"
	self createFamixInheritance: classMammal subclass: classCat.
	"Function calls"
	fc01 := self createJSFunctionCall: fctCat callee: 'Mammal.call'.  
	fc01 locInfo: (FAMIXFileAnchor new startLine:'12'; startColumn: '10').

	self assert: (aJSClassFinder isThisUsedBeforeSuper: classCat).
	fctCat locFirstThisExp startLine: '12'; startColumn: '1'.
	self assert: (aJSClassFinder isThisUsedBeforeSuper: classCat).
	fctCat locFirstThisExp startColumn: '20'.
	self deny: (aJSClassFinder isThisUsedBeforeSuper: classCat).
	fctCat locFirstThisExp startLine: '13'; startColumn: '1'.
	self deny: (aJSClassFinder isThisUsedBeforeSuper: classCat).
	

]

{ #category : #'string access' }
JSClassFinderTests >> testLastSubString [
	self assert: (JSClassFinder lastSubString: '' after: $.) equals: ''.
	self assert: (JSClassFinder lastSubString: 'Object.defineProperty' after: $.) equals: 'defineProperty'.	
	self assert: (JSClassFinder lastSubString: 'Object.defineProperty.add' after: $.) equals: 'add'.		
]

{ #category : #'search and filtering' }
JSClassFinderTests >> testLocateClassByFunctionLine [
	| fctMammal fctSetSound target classMammal m |
	"Setting up the environment"
	fctMammal := (self createJSFunctionNamed: 'Mammal').
	classMammal := self createFamixClass: fctMammal package: (self createFamixPackage: 'file1').
	fctSetSound := self createJSFunctionNamed: 'setSound'.
	m := self createFamixMethod: fctSetSound class: classMammal.
	"LOC info"
	fctMammal locInfo: (FAMIXFileAnchor new startLine:'12'; startColumn: '1'; endLine: '21').
	fctSetSound locInfo: (FAMIXFileAnchor new startLine:'1'; startColumn: '1'; endLine: '10').
	"Tests"
	target := aJSClassFinder locateClassByFunctionLine: '2'. "<- Real target of this test"
	self assert: target equals: classMammal.
	target := aJSClassFinder locateClassByFunctionLine: '12'. "<- Real target of this test"
	self assert: target equals: classMammal.
	target := aJSClassFinder locateClassByFunctionLine: '100'. "<- Real target of this test"
	self assert: target isNil.
	"Test when FAMIXMethod>>jsFunction is a String"
	m jsFunction: 'setSound'.
	target := aJSClassFinder locateClassByFunctionLine: '2'. "<- Real target of this test"
	self assert: target equals: classMammal.
	
]

{ #category : #'search and filtering' }
JSClassFinderTests >> testLocateClassByMethodOrConstructorFunction [
	| class01   class02   fctMammal  fctGetName fctSetColor fctReptile fctGetSound fctInner |
	fctMammal := self createJSFunctionNamed: 'Mammal'.
	class01 := self createFamixClass: fctMammal package: (self createFamixPackage: '').
	fctGetName := self createJSFunctionNamed: 'getName'.
	self createFamixMethod: fctGetName class: class01.
	fctSetColor := self createJSFunctionNamed: 'setColor'.
	fctReptile := self createJSFunctionNamed: 'Reptile'.
	class02 := self createFamixClass: fctReptile package: (self createFamixPackage: '').
	fctGetSound := self createJSFunctionNamed: 'getSound'.
	self createFamixMethod: fctGetSound class: class02.
	fctInner := self createJSFunctionNamed: ''.
	fctInner parentType: fctGetSound.
	
	self assert: (class01 = (aJSClassFinder locateClassByMethodOrConstructorFunction: fctMammal)).
	self assert: (class02 = (aJSClassFinder locateClassByMethodOrConstructorFunction: fctGetSound)).
	self assert: (class02 = (aJSClassFinder locateClassByMethodOrConstructorFunction: fctInner)).
	self assert: (aJSClassFinder locateClassByMethodOrConstructorFunction: fctSetColor) isNil.

]

{ #category : #'search and filtering' }
JSClassFinderTests >> testLocateFunctionCallByLineColumn [
	| fctMammal fctSetSound  fc01 fcTarget |
	"Set up the environment"
	fctMammal := (self createJSFunctionNamed: 'Mammal').
	self createFamixClass: fctMammal package: (self createFamixPackage: 'file1').
	fctSetSound := self createJSFunctionNamed: 'setSound'.
	fc01 := self createJSFunctionCall: fctMammal callee: fctSetSound.  
	fc01 locInfo: (FAMIXFileAnchor new startLine:'12'; startColumn: '1').
	"Tests"
	fcTarget := aJSClassFinder locateFunctionCallByLine: '12' column: '1'. "<- Real target of this test"
	self assert: fcTarget equals: fc01.
	fcTarget := aJSClassFinder locateFunctionCallByLine: '1' column: '1'. "<- Real target of this test"
	self assert: fcTarget isNil.
	
]

{ #category : #'search and filtering' }
JSClassFinderTests >> testLookForPosOfTheClosing [
	self assert: (JSClassFinder lookForPosOfTheClosing: '') equals: 0.
	self assert: (JSClassFinder lookForPosOfTheClosing: 'number') equals: 0.
	self assert: (JSClassFinder lookForPosOfTheClosing: '[any, any]') equals: 10.
	self assert: (JSClassFinder lookForPosOfTheClosing: '(obj: {x: number, (y)}, x:, y: number}) => string}') equals: 39.
	self assert: (JSClassFinder lookForPosOfTheClosing: '{print: (obj: {p1: {x: number, y: number}, p2: {x: number, y: number}, x: number, y: number}) => string}') equals: 104.
	self assert: (JSClassFinder lookForPosOfTheClosing: '<Array<{mergedFrom: $Subtype<null | null | [any, any]> | $Subtype<null | null | [any, any]>}> | null | null> | $Subtype<null | null | [any, any]>') equals: 108.
]

{ #category : #'search and filtering' }
JSClassFinderTests >> testLookForTheEndOfFirstWord [
	self assert: (JSClassFinder lookForTheEndOfFirstWord: '') equals: 0.
	self assert: (JSClassFinder lookForTheEndOfFirstWord: '(obj: {x: number, (y)}, x:, y: number}) => string}') equals: 0.
	self assert: (JSClassFinder lookForTheEndOfFirstWord: 'print: (obj: {p1: {x: number, y: number}, p2: {x: number, y: number}, x: number, y: number}) => string') equals: 5.
	self assert: (JSClassFinder lookForTheEndOfFirstWord: 'number') equals: 6.
]

{ #category : #metrics }
JSClassFinderTests >> testNumberOfAttributes [
	| c01 c02 c03 p01 |
	c01 := aJSClassFinder ensureJSClass: (self createJSFunctionNamed: 'c1') pattern: #new package: 'file1'.
	c02 := aJSClassFinder ensureJSClass: (self createJSFunctionNamed: 'c2') pattern: #nonew package: 'file1'.
	c03 := aJSClassFinder ensureJSClass: (self createJSFunctionNamed: 'c3') pattern: #singleton package: 'file1'.
	p01 := FAMIXJSProperty new.
	p01 name: 'a1'.
	aJSClassFinder ensureJSAttribute: p01 parent: c01.
	p01 name: 'a2'.
	aJSClassFinder ensureJSAttribute: p01 parent: c01.
	p01 name: 'a3'.
	aJSClassFinder ensureJSAttribute: p01 parent: c02.
	p01 name: 'a4'.
	aJSClassFinder ensureJSAttribute: p01 parent: c03.
	
	self assert: aJSClassFinder numberOfAttributes  equals: 3.
	self assert: (aJSClassFinder numberOfAttributes: c01)  equals: 2.
	self assert: (aJSClassFinder numberOfAttributes: c02)  equals: 1.
	self assert: (aJSClassFinder numberOfAttributes: c03)  equals: 0.

]

{ #category : #metrics }
JSClassFinderTests >> testNumberOfClasses [
	|  |
	aJSClassFinder ensureJSClass: (self createJSFunctionNamed: 'c1')  pattern: #new package: 'file1'.
	aJSClassFinder ensureJSClass: (self createJSFunctionNamed: 'c2')  pattern: #nonew package: 'file1'.
	aJSClassFinder ensureJSClass: (self createJSFunctionNamed: 'c3')  pattern: #singleton package: 'file1'.
	
	self assert: aJSClassFinder numberOfClasses equals: 2.

]

{ #category : #metrics }
JSClassFinderTests >> testNumberOfFunctionCallsInClasses [
	| c01 c02 c03  pck fct01 m01 fct02 fct011 fct03 |
	pck := (self createFamixPackage: 'file1').
	fct01 := self createJSFunctionNamed: 'c1'.
	c01 := self createFamixClass: fct01 package: pck.	
	c02 := self createFamixClass: (self createJSFunctionNamed: 'c2') package: pck.	
	c03 := self createFamixClass: (self createJSFunctionNamed: 'c3') package: pck.	
	fct011 := self createJSFunctionNamed: 'm1'.	
	m01 := self createFamixMethod: fct011 class: c01.
	fct02 := self createJSFunctionNamed: 'f2'.
	fct03 := self createJSFunctionNamed: 'f3'.
	self createJSFunctionCall: fct01 callee: fct02. "The caller is a class constructor"
	self createJSFunctionCall: fct02 callee: fct03.
	self createJSFunctionCall: fct02 callee: fct011.
	self createJSFunctionCall: fct011 callee: fct03. "The caller is a method"
	
	self assert: aJSClassFinder numberOfFunctionCallsInClasses equals: 2.

]

{ #category : #metrics }
JSClassFinderTests >> testNumberOfFunctions [
	"Set up the environment"
	| f obj |
	f := FAMIXJSFunction new name: 'circle'.
	f isStub: true. 
	famixJSModel add: f.
	famixJSModel add: FAMIXJSFunction new. "function with no name"
	f := FAMIXJSFunction new name: 'circle2D'.
	obj := FAMIXJSObject new.
	f parentType: obj.
	famixJSModel add: f.
	famixJSModel add: (FAMIXJSFunction new name: 'ellipse').
	famixJSModel add: FAMIXJSProperty new.
	
	self assert: aJSClassFinder numberOfFunctions equals: 2.

]

{ #category : #metrics }
JSClassFinderTests >> testNumberOfMethods [
	| c01 c02 c03 |
	c01 := aJSClassFinder ensureJSClass: (self createJSFunctionNamed: 'c1')  pattern: #new package: 'file1'.
	c02 := aJSClassFinder ensureJSClass: (self createJSFunctionNamed: 'c2')  pattern: #nonew package: 'file1'.
	c03 := aJSClassFinder ensureJSClass: (self createJSFunctionNamed: 'c3')  pattern: #singleton package: 'file1'.
	aJSClassFinder ensureJSMethod: (FAMIXJSProperty new name:'m1') parent: c01.
	aJSClassFinder ensureJSMethod: (FAMIXJSProperty new name:'m2') parent: c01.
	aJSClassFinder ensureJSMethod: (FAMIXJSProperty new name:'m3') parent: c02.
	aJSClassFinder ensureJSMethod: (FAMIXJSProperty new name:'m4') parent: c03.
	
	self assert: aJSClassFinder numberOfMethods  equals: 3.
	self assert: (aJSClassFinder numberOfMethods: c01)  equals: 2.
	self assert: (aJSClassFinder numberOfMethods: c02)  equals: 1.
	self assert: (aJSClassFinder numberOfMethods: c03)  equals: 0.

]

{ #category : #metrics }
JSClassFinderTests >> testNumberOfMethodsWithUniqueFunctionName [
	| c01 c02 c03 f f2 |
	c01 := aJSClassFinder ensureJSClass: (self createJSFunctionNamed: 'c1')  pattern: #new package: 'file1'.
	c02 := aJSClassFinder ensureJSClass: (self createJSFunctionNamed: 'c2')  pattern: #nonew package: 'file1'.
	c03 := aJSClassFinder ensureJSClass: (self createJSFunctionNamed: 'c3')  pattern: #singleton package: 'file1'.
	f := FAMIXJSFunction new name: 'circle'.
	famixJSModel add: f.
	f2 := FAMIXJSFunction new name: 'circle'.
	famixJSModel add: f2.
	aJSClassFinder ensureJSMethod: ((FAMIXJSProperty new name:'m1') jsValue: f) parent: c01.
	aJSClassFinder ensureJSMethod: ((FAMIXJSProperty new name:'m2') jsValue: f2) parent: c01.
	aJSClassFinder ensureJSMethod: (FAMIXJSProperty new name:'m3') parent: c02.
	aJSClassFinder ensureJSMethod: (FAMIXJSProperty new name:'m4') parent: c03.
	
	self assert: aJSClassFinder numberOfMethodsWithUniqueFunctionName equals: 2.

]

{ #category : #'search and filtering' }
JSClassFinderTests >> testSearchDynamicJSMultipleTypes [
	| lstCallExpressionAran  |
	"Setting up the environment"
	self class createExampleDumpFileAran: 'tempMultipleTypesAran.txt'.

	"Tests"
	lstCallExpressionAran := aJSClassFinder searchDynamicJSTypes: 'tempMultipleTypesAran.txt' source: 'demo.js'. 
	self assert: lstCallExpressionAran size equals: 2.
	self assert: (lstCallExpressionAran select: [ :ce | (ce classification = #MultipleTypes) and: [ ce functionName = 'sort' ] ]) size equals: 1.
	self assert: (lstCallExpressionAran select: [ :ce | ce classification = #Unknown ]) size equals: 0.

]

{ #category : #'search and filtering' }
JSClassFinderTests >> testSearchDynamicJSTypes [
	| lstCallExpressionAran  |
	"Setting up the environment"
	self class createExample2DumpFileAran: 'temp.txt'.

	"Tests"
	lstCallExpressionAran := aJSClassFinder searchDynamicJSTypes: 'temp.txt' source: 'demo.js'. 
	self assert: lstCallExpressionAran size equals: 8.
	self assert: (lstCallExpressionAran select: [ :ce | ce class = JSCallExpression ]) size equals: 1.
	self assert: (lstCallExpressionAran select: [ :ce | ce class = JSCallExpFunction ]) size equals: 0.
	self assert: (lstCallExpressionAran select: [ :ce | ce class = JSCallExpObject ]) size equals: 7.	
]

{ #category : #'search and filtering' }
JSClassFinderTests >> testSearchDynamicJSTypesClassification [
	| lstCallExpressionAran  pck fctCircle classCircle fctTriangle fctSquare fctEllipse fctSetColor |
	"Setting up the environment"
	self class createExample3DumpFileAran: 'tempTypesClassification.txt'.

	pck := self createFamixPackage: 'file1'.
	fctCircle := (self createJSFunctionNamed: 'Circle').
	classCircle := self createFamixClass: fctCircle package: pck.
	fctTriangle := (self createJSFunctionNamed: 'Triangle').
	self createFamixClass: fctTriangle package: pck.
	fctSquare := (self createJSFunctionNamed: 'Square').
	self createFamixClass: fctSquare package: pck.
	fctEllipse := (self createJSFunctionNamed: 'Ellipse').
	self createFamixClass: fctEllipse package: pck.
	fctSetColor := self createJSFunctionNamed: 'setColor'.
	self createFamixMethod: fctSetColor class: classCircle.
	"LOC info"
	"fctSetColor locInfo: (FAMIXFileAnchor new startLine:'52'; startColumn: '1'; endLine: '61').
	fctCircle locInfo: (FAMIXFileAnchor new startLine:'12'; startColumn: '1'; endLine: '21').
	fctTriangle locInfo: (FAMIXFileAnchor new startLine:'1'; startColumn: '1'; endLine: '10').
	fctEllipse locInfo: (FAMIXFileAnchor new startLine:'22'; startColumn: '1'; endLine: '40').
	fctSquare locInfo: (FAMIXFileAnchor new startLine:'42'; startColumn: '1'; endLine: '48')."

	"Tests"
	lstCallExpressionAran := aJSClassFinder searchDynamicJSTypes: 'tempTypesClassification.txt' source: 'demo.js'.
	self assert: (lstCallExpressionAran anySatisfy: [ :ce | ce functionName = 'setColor' ]).
	self assert: (lstCallExpressionAran select: [ :ce | ce classification = #Anonymous ]) size equals: 1.
	self assert: (lstCallExpressionAran select: [ :ce | ce classification = #Unknown ]) size equals: 0.
	self assert: (lstCallExpressionAran select: [ :ce | ce classification = #InternalFct ]) size equals: 1.	
	self assert: (lstCallExpressionAran select: [ :ce | ce classification = #MultipleTypes ]) size equals: 1.		
	self assert: (lstCallExpressionAran select: [ :ce | ce classification = #Class ]) size equals: 4.	
	self assert: (lstCallExpressionAran select: [ :ce | ce classification = #OtherObj ]) size equals: 1.		
		
]

{ #category : #'search and filtering' }
JSClassFinderTests >> testSearchJSAssociationByInstantiation [
	| fct02 fct01 fct03 p01 c01 c02 prototype01  p03     obj01 p02 obj02 c03 |
	"Set up the environment"
	fct01 := self createJSFunctionNamed: 'Mammal'.
	fct02 := self createJSFunctionNamed: 'getName'.
	fct02 parentType: fct01.
	fct03 := self createJSFunctionNamed: 'Test'.
	"Property p03 (class Mammal) makes reference to class Test"
	p03 := self createJSPropertyNamed:'test' parent: fct01.
	p03 isBoundToThis: true.
	obj01 := self createJSObjectNamed: 'objTest'.
	obj01 jsBEntity: fct03.
	p03 jsValue: obj01.
	"Property p01 (class Mammal) does not make reference to any other class"
	p01 := self createJSPropertyNamed:'getName' parent: fct01.
	fct01 jsProperties: p01.
	p01 isBoundToThis: true.
	p01 jsValue: fct02.
	"Prototype for fct01"
	prototype01 := self createJSPrototypeForFct: fct01.
	fct01 jsPrototype: prototype01.
	"Property p02 (class Test) makes reference to the prototype of the class Mammal"
	p02 := self createJSPropertyNamed:'testAnimal' parent: fct03.
	p02 isBoundToThis: false.
	obj02 := self createJSObjectNamed: 'objTest'.
	obj02 jsBEntity: prototype01.
	p02 jsValue: obj02.
	"Classes"	
	c01 := self createFamixClass: fct01 package: (self createFamixPackage: '').	
	aJSClassFinder classModel add: ((FAMIXMethod new name:'getName') parentType: c01).
	c02 := self createFamixClass: fct03 package: (self createFamixPackage: '').	
	c03 := self createFamixClass: (self createJSFunctionNamed: 'TestInvocation') package: (self createFamixPackage: '').	
	
"	aJSClassFinder searchJSAssociationByInstantiation: p03 class: c01. ""<- Real target of the test"
	"aJSClassFinder searchJSAssociationByInstantiation: p02 class: c02. ""<- Real target of the test"
"TODO"
	self assert: (classModel allWithType: FAMIXReference) size equals: 0.

]

{ #category : #'search and filtering' }
JSClassFinderTests >> testSearchJSAssociationByInvocation [
	| fct02 fct01 fct03 p01 c01 c02 prototype01 fct04 fct05 fct06 fct07 c03 |
	"Set up the environment" 
	fct01 := self createJSFunctionNamed: 'Point'.
	fct02 := self createJSFunctionNamed: 'toString'.
	fct02 parentType: fct01.
	fct02 isStub: false.
	"Line"
	fct03 := self createJSFunctionNamed: 'Line'.
	fct04 := self createJSFunctionNamed: 'toStringP1'.
	fct04 invocations: fct02.
	fct04 parentType: fct03.
	fct05 := self createJSFunctionNamed: 'toStringP2'.
	fct05 invocations: fct04.
	fct05 parentType: fct03.
	"Triangle"
	fct06 := self createJSFunctionNamed: 'Triangle'.
	fct07 := self createJSFunctionNamed: 'toStringL1P1'.
	fct07 invocations: fct02.
	fct07 parentType: fct06.
	"Property p01 (class Mammal) does not make reference to any other class"
	p01 := self createJSPropertyNamed:'toString' parent: fct01.
	fct01 jsProperties: p01.
	p01 isBoundToThis: true.
	p01 jsValue: fct02.
	"Prototype for fct01"
	prototype01 := self createJSPrototypeForFct: fct01.
	fct01 jsPrototype: prototype01.
	"Classes"	
	c01 := self createFamixClass: fct01 package: (self createFamixPackage: '').	
	c02 := self createFamixClass: fct03 package: (self createFamixPackage: '').	
	c03 := self createFamixClass: fct06 package: (self createFamixPackage: '').	
	self createFamixMethod: fct04 class: c02.
	self createFamixMethod: fct05 class: c02.
	self createFamixMethod: fct07 class: c03.
	
	aJSClassFinder searchJSAssociationByInvocation: fct04 class: c02. "<- Real target of the test"
	aJSClassFinder searchJSAssociationByInvocation: fct05 class: c02. "<- Real target of the test"
	aJSClassFinder searchJSAssociationByInvocation: fct07 class: c03. "<- Real target of the test"

	self assert: (classModel allWithType: FAMIXInvocation) size equals: 2.
	self assert: ((classModel allWithType: FAMIXInvocation) detect: [ :vk | (vk sender name = 'toStringP1') & (vk receiver name = 'Point') ] ifNone: [ nil ]) isNotNil.
	self assert: ((classModel allWithType: FAMIXInvocation) detect: [ :vk | (vk sender name = 'toStringL1P1') & (vk receiver name = 'Point')] ifNone: [ nil ]) isNotNil.
	"self assert: (classModel allWithType: FAMIXInvocation) first receiver name equals: 'Point'."

]

{ #category : #'search and filtering' }
JSClassFinderTests >> testSearchJSAttributes [
	| fct02 fct01 fct03 p01  prototype01  p03 p04 p05 p06 a01 |
	"Set up the environment"
	fct01 := self createJSFunctionNamed: 'Mammal'.
	fct02 := self createJSFunctionNamed: 'getName'.
	fct02 parentType: fct01.
	fct03 := self createJSFunctionNamed: 'Test'.
	"Attribute p03 - there is one method with the same name - it must not be created"
	p03 := self createJSPropertyNamed:'getName' parent: fct01.
	p03 isBoundToThis: true.
	p03 jsValue: 'fct02(..)'.
	"method"
	p01 := self createJSPropertyNamed:'getName' parent: fct01.
	fct01 jsProperties: p01.
	p01 isBoundToThis: true.
	p01 jsValue: fct02.
	"Prototype"
	prototype01 := self createJSPrototypeForFct: fct01.
	fct01 jsPrototype: prototype01.
	"Attribute p04 - it must be create normally"
	p04 := self createJSPropertyNamed:'name' parent: prototype01.
	p04 isBoundToThis: true.
	p04 jsValue: 'myName'.
	p04 locInfo: FAMIXFileAnchor new.
	p04 locInfo fileName: '/Users/Test/testP04.js'.
	"Attribute p05 - it must be create normally"
	p05 := self createJSPropertyNamed:'age' parent: fct03.
	p05 isBoundToThis: true.
	p05 jsValue: '23'.
	p05 locInfo: FAMIXFileAnchor new.
	p05 locInfo fileName: '/Users/Test/testP05.js'.
	"Attribute p06 - Not bound to this. It must not be create."
	p06 := self createJSPropertyNamed:'country' parent: fct03.
	p06 isBoundToThis: false.
	p06 jsValue: 'any'.
	"Classes"	
	aJSClassFinder classModel add: (FAMIXClass new name:'Mammal').
	aJSClassFinder classModel add: ((FAMIXMethod new name:'getName') parentType: (classModel allWithType: FAMIXClass) entities first).
	aJSClassFinder classModel add: (FAMIXClass new name:'Test').
	
	aJSClassFinder searchJSAttributes. "<- Real target of the test"

	self assert: classModel entities size equals: 5.
	self assert: (classModel allWithType: FAMIXMethod) size equals: 1.
	self assert: (classModel allWithType: FAMIXAttribute) size equals: 2.
	a01 := ((classModel allWithType: FAMIXAttribute) detect: [ :m | (m name = 'name') ] ifNone: [ nil ]).
	self assert: a01 sourceAnchor fileName equals: '/Users/Test/testP04.js'.
	"self assert: ((classModel allWithType: FAMIXAttribute) detect: [ :m | (m name = 'name') and: [m sourceAnchor fileName = '\Users\Test\testP04.js'] ] ifNone: [ nil ]) isNotNil."
	self assert: ((classModel allWithType: FAMIXAttribute) detect: [ :m | (m name = 'age') & (m sourceAnchor fileName = '/Users/Test/testP05.js') ] ifNone: [ nil ]) isNotNil.

]

{ #category : #'search and filtering' }
JSClassFinderTests >> testSearchJSAttributesClassWithSameName [
	| fct02 fct01 fct03 p01 p04 p05 p06 a01 a02 c01 |
	"Set up the environment"
	fct01 := self createJSFunctionNamed: 'Mammal'.
	fct01 filePath: '\Home\Test\Mammal.js'.
	fct02 := self createJSFunctionNamed: 'getName'.
	fct02 parentType: fct01.
	fct03 := self createJSFunctionNamed: 'Mammal'.
	fct03 filePath: '\Home\Leonardo\Mammal.js'.
	"method"
	p01 := self createJSPropertyNamed:'getName' parent: fct01.
	fct01 jsProperties: p01.
	p01 isBoundToThis: true.
	p01 jsValue: fct02.
	"Attribute p04 - it must be create normally"
	p04 := self createJSPropertyNamed:'name' parent: fct02.
	p04 isBoundToThis: true.
	p04 jsValue: 'myName'.
	"Attribute p05 - it must be create normally"
	p05 := self createJSPropertyNamed:'age' parent: fct03.
	p05 isBoundToThis: true.
	p05 jsValue: '23'.
	"Attribute p06 - Not bound to this. It must not be create."
	p06 := self createJSPropertyNamed:'country' parent: fct03.
	p06 isBoundToThis: false.
	p06 jsValue: 'any'.
	"Classes"	
	c01 := ((FAMIXClass new name:'Mammal') parentPackage: (self createFamixPackage: '\Home\Test\Mammal.js')).
	aJSClassFinder classModel add: c01.
	aJSClassFinder classModel add: ((FAMIXClass new name:'Mammal') parentPackage: (self createFamixPackage: '\Home\Leonardo\Mammal.js')).
	aJSClassFinder classModel add: ((FAMIXMethod new name:'getName') parentType: c01).
	
	aJSClassFinder searchJSAttributes. "<- Real target of the test"

	self assert: classModel entities size equals: 7.
	self assert: (classModel allWithType: FAMIXMethod) size equals: 1.
	self assert: (classModel allWithType: FAMIXAttribute) size equals: 2.
	a01 := (classModel allWithType: FAMIXAttribute) detect: [ :a | a name = 'name'].
	self assert: a01 parentType name equals: 'Mammal'.
	self assert: a01 parentType parentPackage name equals: '\Home\Test\Mammal.js'.
	a02 := (classModel allWithType: FAMIXAttribute) detect: [ :a | a name = 'age'].
	self assert: a02 parentType name equals: 'Mammal'.
	self assert: a02 parentType parentPackage name equals: '\Home\Leonardo\Mammal.js'.

]

{ #category : #'search and filtering' }
JSClassFinderTests >> testSearchJSClassFunctionParentNameNil [
	| fct01 obj01 fct02 p01 |
	fct01 := self createJSFunctionNamed: nil.
	fct02 := self createJSFunctionNamed:'fct02'.
	fct02 parentType: fct01.
	obj01 := FAMIXJSObject new name: 'obj01'.
	obj01 jsBEntity: fct02.
	aJSClassFinder famixJSModel add: obj01.
	p01 := self createJSPropertyNamed: 'age' parent: fct02.
	p01 isBoundToThis: true.
	
	aJSClassFinder searchJSClasses. 
	
	self assert: classModel entities size equals: 3.
	self assert: (classModel allWithType: FAMIXPackage) size equals: 1.
	self assert: (classModel allWithType: FAMIXClass) size equals: 1.
	self assert: (classModel allWithType: FAMIXAttribute) size equals: 1.
	self assert: (classModel allWithType: FAMIXClass) first name equals: 'fct02'.

]

{ #category : #'search and filtering' }
JSClassFinderTests >> testSearchJSClassInheritancePrototype [
	| fct01 obj01 fct02 proto01 proto02 ih |
	"Set up the environment"
	fct01 := self createJSFunctionNamed: 'Mammal'.
	fct02 := self createJSFunctionNamed: 'Cat'.
	proto01 := FAMIXJSPrototype new.
	proto01 jsOwnerFunction: fct01.
	fct01 jsPrototype: proto01.
	aJSClassFinder famixJSModel add: proto01.
	obj01 := FAMIXJSObject new.
	obj01 jsBEntity: fct01 jsPrototype.
	aJSClassFinder famixJSModel add: obj01.
	proto02 := FAMIXJSPrototype new.
	proto02 jsOwnerFunction: fct02.
	fct02 jsPrototype: proto02.
	proto02 parentObj: obj01.
	aJSClassFinder famixJSModel add: proto02.
	aJSClassFinder classModel add: (FAMIXClass new name:'Mammal').
	aJSClassFinder classModel add: (FAMIXClass new name:'Cat').
	
	aJSClassFinder searchJSClassInheritance. "<- Real target of the test"

	self assert: (classModel allWithType: FAMIXInheritance) size equals: 1.
	ih := (classModel allWithType: FAMIXInheritance) first.
	self assert: ih subclass name equals: 'Cat'.
	self assert: ih superclass name equals: 'Mammal'.

]

{ #category : #'search and filtering' }
JSClassFinderTests >> testSearchJSClassInheritancePrototypeStubParent [
	| fct01 obj01 fct02 proto01 proto02  |
	"Set up the environment"
	aJSClassFinder famixJSModel: MooseModel new.
	fct01 := FAMIXJSFunction new name: 'Mammal'.
	fct01 isStub: true.
	aJSClassFinder famixJSModel add: fct01.
	fct02 := FAMIXJSFunction new name: 'Cat'.
	fct02 isStub: false.
	aJSClassFinder famixJSModel add: fct02.
	proto01 := FAMIXJSPrototype new.
	proto01 jsOwnerFunction: fct01.
	fct01 jsPrototype: proto01.
	aJSClassFinder famixJSModel add: proto01.
	obj01 := FAMIXJSObject new.
	obj01 jsBEntity: fct01 jsPrototype.
	aJSClassFinder famixJSModel add: obj01.
	proto02 := FAMIXJSPrototype new.
	proto02 jsOwnerFunction: fct02.
	fct02 jsPrototype: proto02.
	proto02 parentObj: obj01.
	aJSClassFinder famixJSModel add: proto02.
	aJSClassFinder classModel add: (FAMIXClass new name:'Mammal').
	aJSClassFinder classModel add: (FAMIXClass new name:'Cat').
	
	aJSClassFinder searchJSClassInheritance. "<- Real target of the test"
	"It is zero because superclass came from a stub fct"
	self assert: (classModel allWithType: FAMIXInheritance) size equals: 0.

]

{ #category : #'search and filtering' }
JSClassFinderTests >> testSearchJSClassSingletonObject [
	| prop01 prop02 prop03 obj01 fct01 |
	aJSClassFinder famixJSModel: MooseModel new.
	fct01 := self createJSFunctionNamed: 'getArea'.
	
	prop01 := FAMIXJSProperty new name: 'radius'.
	prop01 jsValue: 10.
	aJSClassFinder famixJSModel add: prop01.
	
	prop02 := FAMIXJSProperty new name: 'getArea'.
	prop02 jsValue: fct01.
	aJSClassFinder famixJSModel add: prop02.
	
	obj01 := FAMIXJSObject new name: 'myCircle'.
	obj01 jsProperties: prop01.
	prop01 parentType: obj01.
	obj01 jsProperties: prop02.
	prop02 parentType: obj01.
	aJSClassFinder famixJSModel add: obj01.
	
	prop03 := FAMIXJSProperty new name: 'radius'.
	prop03 parentType: fct01.
	prop03 isBoundToThis: true.
	aJSClassFinder famixJSModel add: prop03.
	fct01 jsProperties: prop03.
	
	aJSClassFinder searchJSClassesFromSingletonObjects.
	
	self assert: classModel entities size equals: 3.
	
	self assert: (classModel allWithType: FAMIXClass) size equals: 1.
	self assert: (classModel allWithType: FAMIXClass) first name equals: 'myCircle'.
	
	self assert: (classModel allWithType: FAMIXMethod) size equals: 1.
	self assert: (classModel allWithType: FAMIXMethod) first name equals: 'getArea'.
	self assert: (classModel allWithType: FAMIXMethod) first parentType name equals: 'myCircle'.
	
	self assert: (classModel allWithType: FAMIXAttribute) size equals: 1.
	self assert: (classModel allWithType: FAMIXAttribute) first name equals: 'radius'.
	self assert: (classModel allWithType: FAMIXAttribute) first parentType name equals: 'myCircle'.

]

{ #category : #'search and filtering' }
JSClassFinderTests >> testSearchJSClassWithStub [
	| fct02 fct01 fct04 fct03 p01 p02 p03 m01 m02 a01 obj01 proto01 proto02 |
	"Set up the environment"
	fct01 := self createJSFunctionNamed: 'Mammal'.
	fct01 filePath: '\Home\Test\Rat.js'.
	fct01 isStub: true.
	proto01 := self createJSPrototypeForFct: fct01.
	fct04 := self createJSFunctionNamed: 'Rat'.
	fct04 filePath: '\Home\Test\Rat.js'.
	fct04 isStub: false.
	proto02 := self createJSPrototypeForFct: fct04.
	"Object for inheritance"
	obj01 := self createJSObjectNamed: nil.
	obj01 filePath: '\Home\Test\Rat.js'.
	obj01 jsBEntity: proto01.
	proto02 parentObj: obj01.
	"Function Mammal is defined in other file (package)"
	fct01 filePath: '\Home\Leonardo\Mammal.js'.
	fct01 isStub: false.

	fct02 := self createJSFunctionNamed: 'getName'.
	fct02 parentType: fct01.
	fct03 := self createJSFunctionNamed: 'getFullName'.
	fct03 parentType: fct04.
	"Method 1"
	p01 := self createJSPropertyNamed:'getName' parent: fct01.
	fct01 jsProperties: p01.
	p01 isBoundToThis: true.
	p01 jsValue: fct02.
	"Attribute 1"
	p02 := self createJSPropertyNamed:'name' parent: fct01.
	fct01 jsProperties: p02.
	p02 isBoundToThis: true.
	p02 jsValue: 'Ratatouille'.
	"Method 2"
	p03 := self createJSPropertyNamed:'getFullName' parent: fct04.
	fct04 jsProperties: p03.
	p03 isBoundToThis: true.
	p03 jsValue: fct03.
	
	aJSClassFinder searchJSClasses. "<- Real target of the test"

	self assert: classModel entities size equals: 8. "2 methods; 1 attribute; 2 classes; 2 packages; 1 inheritance"
 	self assert: (classModel allWithType: FAMIXInheritance) size equals: 1.
 	self assert: (classModel allWithType: FAMIXPackage) size equals: 2.
 	self assert: (classModel allWithType: FAMIXClass) size equals: 2.
 	self assert: (classModel allWithType: FAMIXAttribute) size equals: 1.
 	self assert: (classModel allWithType: FAMIXMethod) size equals: 2.
	m01 := (classModel allWithType: FAMIXMethod) detect: [ :m | m name = 'getName'].
	self assert: m01 parentType name equals: 'Mammal'.
	self assert: m01 parentType parentPackage name equals: '\Home\Leonardo\Mammal.js'.
	m02 := (classModel allWithType: FAMIXMethod) detect: [ :m | m name = 'getFullName'].
	self assert: m02 parentType name equals: 'Rat'.
	self assert: m02 parentType parentPackage name equals: '\Home\Test\Rat.js'.
	a01 := (classModel allWithType: FAMIXAttribute) detect: [ :m | m name = 'name'].
	self assert: a01 parentType name equals: 'Mammal'.
	self assert: a01 parentType parentPackage name equals: '\Home\Leonardo\Mammal.js'.

]

{ #category : #'search and filtering' }
JSClassFinderTests >> testSearchJSClassesFromFunctionsWithoutNew [
	| fct01 obj01 fct02 fct03 fct05 proto01 proto02 classNoNew fct04 prop01  |
	"Set up the environment"
	"aJSClassFinder famixJSModel: MooseModel new."
	fct01 := self createJSFunctionNamed: 'Mammal'.
	fct02 := self createJSFunctionNamed: 'Cat'.
	fct03 := self createJSFunctionNamed: 'stub'.
	fct03 isStub: true.
	"aJSClassFinder famixJSModel add: ((FAMIXJSFunction new name: 'empty') isStub: false)."
	fct05 := self createJSFunctionNamed: 'stub'.
	fct05 isStub: false.
	fct04 := self createJSFunctionNamed: 'FctWithProp'.
	prop01 := FAMIXJSProperty new name: 'prop01'.
	prop01 parentType: fct04.
	proto01 := FAMIXJSPrototype new.
	proto01 jsOwnerFunction: fct01.
	fct01 jsPrototype: proto01.
	aJSClassFinder famixJSModel add: proto01.
	obj01 := FAMIXJSObject new.
	obj01 jsBEntity: fct01 jsPrototype.
	aJSClassFinder famixJSModel add: obj01.
	proto02 := FAMIXJSPrototype new.
	proto02 jsOwnerFunction: fct02.
	fct02 jsPrototype: proto02.
	proto02 parentObj: obj01.
	aJSClassFinder famixJSModel add: proto02.
	classModel add: (((FAMIXClass new name:'Mammal') creationPattern: #new) parentPackage: (self createFamixPackage: '')).
	"aJSClassFinder classModel add: ((FAMIXClass new name:'Mammal') creationPattern: #new)."
	
	aJSClassFinder searchJSClassesFromFunctionsWithoutNew. "<- Real target of the test"

	self assert: (classModel allWithType: FAMIXClass) size equals: 3.
	classNoNew := (classModel allWithType: FAMIXClass) detect:[:obj | obj name = 'Cat'].
	self assert: classNoNew creationPattern equals: #nonew.
	classNoNew := (classModel allWithType: FAMIXClass) detect:[:obj | obj name = 'FctWithProp'].
	self assert: classNoNew creationPattern equals: #nonew.

]

{ #category : #'search and filtering' }
JSClassFinderTests >> testSearchJSEmptyFunctionMethod [
	| fct01 |
	"Set up the environment"
	aJSClassFinder famixJSModel: MooseModel new.
	fct01 := FAMIXJSFunction new name: 'Mammal'.
	fct01 isStub: false.
	aJSClassFinder famixJSModel add: fct01.
	aJSClassFinder classModel add: (FAMIXClass new name:'Mammal').
	
	aJSClassFinder searchJSMethods. "<- Real target of the test"

	self assert: classModel entities size equals: 1.
	self assert: (classModel allWithType: FAMIXMethod) size equals: 0.

]

{ #category : #'search and filtering' }
JSClassFinderTests >> testSearchJSFunctionIdentifierMethod [
	| fct02 fct01 property01 m01 |
	"Set up the environment"
	aJSClassFinder famixJSModel: MooseModel new.
	fct01 := self createJSFunctionNamed: 'Mammal'.
	fct02 := self createJSFunctionNamed: 'getName'.
	fct02 parentType: fct01.
	property01 := FAMIXJSProperty new name:'getName'.
	property01 parentType: fct01.
	fct01 jsProperties: property01.
	property01 isBoundToThis: true.
	property01 isValueIdentifier: true.
	property01 jsValue: fct02 name.
	self createFamixClass: fct01 package: (self createFamixPackage: '').
	"aJSClassFinder classModel add: (FAMIXClass new name:'Mammal')."
	
	aJSClassFinder searchJSMethods. "<- Real target of the test"

	self assert: classModel entities size equals: 3.
	self assert: (classModel allWithType: FAMIXMethod) size equals: 1.
	m01 := (classModel allWithType: FAMIXMethod) first.
	self assert: m01 name equals: 'getName'.
	self assert: m01 parentType name equals: 'Mammal'.

]

{ #category : #'search and filtering' }
JSClassFinderTests >> testSearchJSMethods [
	| fct02 fct01 fct03 property01 m01 prototype01 property02 m02 |
	"Set up the environment"
	aJSClassFinder famixJSModel: MooseModel new.
	fct01 := self createJSFunctionNamed: 'Mammal'.
	fct02 := self createJSFunctionNamed: 'getName'.
	fct02 parentType: fct01.
	fct03 := self createJSFunctionNamed: 'Test'.
	"Method 1"
	property01 := FAMIXJSProperty new name:'getName'.
	property01 parentType: fct01.
	fct01 jsProperties: property01.
	property01 isBoundToThis: true.
	property01 jsValue: fct02.
	"Prototype"
	prototype01 := FAMIXJSPrototype new.
	fct01 jsPrototype: prototype01.
	"Method 2"
	property02 := FAMIXJSProperty new name:'getLastName'.
	property02 parentType: prototype01.
	prototype01 jsProperties: property02.
	property02 isBoundToThis: true.
	property02 jsValue: fct03.
	aJSClassFinder classModel add: (FAMIXClass new name:'Mammal').
	
	aJSClassFinder searchJSMethods. "<- Real target of the test"

	self assert: classModel entities size equals: 3.
	self assert: (classModel allWithType: FAMIXMethod) size equals: 2.
	m01 := (classModel allWithType: FAMIXMethod) detect: [ :m | m name = 'getName'].
	self assert: m01 name equals: 'getName'.
	self assert: m01 parentType name equals: 'Mammal'.
	m02 := (classModel allWithType: FAMIXMethod) detect: [ :m | m name = 'getLastName'].
	self assert: m02 name equals: 'getLastName'.
	self assert: m02 parentType name equals: 'Mammal'.

]

{ #category : #'search and filtering' }
JSClassFinderTests >> testSearchJSMethodsAttributesParams [
	| fct02 fct01 fct03 fct04 fct05 p01 p02 p03 p04 p05 p06 |
	"Set up the environment"
	"aJSClassFinder famixJSModel: MooseModel new."
	fct01 := self createJSFunctionNamed: 'testeFct'.
	fct01 filePath: '\Home\Test\CircleParams.js'.
	fct02 := self createJSFunctionNamed: 'radius'.
	fct02 filePath: '\Home\Test\CircleParams.js'.
	fct03 := self createJSFunctionNamed: 'definition'.
	fct03 filePath: '\Home\Test\CircleParams.js'.
	fct04 := self createJSFunctionNamed: 'Circle'.
	fct04 filePath: '\Home\Test\CircleParams.js'.
	fct04 params add: (self createJSParameter: 'radius' parent: fct04).
	fct05 := self createJSFunctionNamed: 'f'.
	fct05 filePath: '\Home\Test\CircleParams.js'.
	fct05 parentType: fct04.
	"Property 1"
	p01 := self createJSPropertyNamed:'definition' parent: fct04.
	p01 isBoundToThis: false.
	p01 jsValue: 'Class to define circles'.
	p01 isValueIdentifier: true.
	fct04 jsProperties: p01.
	"Property 2"
	p02 := self createJSPropertyNamed:'f' parent: fct04.
	p02 isBoundToThis: false.
	p02 jsValue: fct05.
	p01 isValueIdentifier: false.
	fct04 jsProperties: p02.
	"Property 3"
	p03 := self createJSPropertyNamed:'teste' parent: fct04.
	p03 isBoundToThis: true.
	p03 jsValue: 'testeFct'.
	p03 isValueIdentifier: true.
	fct04 jsProperties: p03.
	"Property 4"
	p04 := self createJSPropertyNamed:'radius' parent: fct04.
	p04 isBoundToThis: true.
	p04 jsValue: 'radius'.
	p04 isValueIdentifier: true.
	fct04 jsProperties: p04.
	"Property 5"
	p05 := self createJSPropertyNamed:'d' parent: fct04.
	p05 isBoundToThis: true.
	p05 jsValue: 'definition'.
	p05 isValueIdentifier: true.
	fct04 jsProperties: p05.
	"Property 6"
	p06 := self createJSPropertyNamed:'x' parent: fct04.
	p06 isBoundToThis: true.
	p06 jsValue: 'f'.
	p06 isValueIdentifier: true.
	fct04 jsProperties: p06.
	
	classModel add: ((FAMIXClass new name:'Circle') parentPackage: (self createFamixPackage: '\Home\Test\CircleParams.js')).
	
	aJSClassFinder searchJSMethods. "<- Real target of the test"
	aJSClassFinder searchJSAttributes. "<- Real target of the test"

	self assert: aJSClassFinder famixJSModel entities size equals: 12.
	"THE CODE BELOW IS DISABLED BECAUSE THE CODE OF FAMIXJSFunction>>findVarName: IS DISABLED"
	"self assert: classModel entities size equals: 6.
	self assert: (classModel allWithType: FAMIXMethod) size equals: 2.
	self assert: ((classModel allWithType: FAMIXMethod) detect: [ :m | m name = 'teste' ] ifNone: [ nil ]) isNotNil.
	self assert: ((classModel allWithType: FAMIXMethod) detect: [ :m | m name = 'x' ] ifNone: [ nil ]) isNotNil.
	self assert: (classModel allWithType: FAMIXAttribute) size equals: 2."

]

{ #category : #'search and filtering' }
JSClassFinderTests >> testSearchJSMethodsClassWithSameName [
	| fct02 fct01 fct03 property01 m01 property02 m02 |
	"Set up the environment"
	fct01 := self createJSFunctionNamed: 'Mammal'.
	fct01 filePath: '\Home\Test\Mammal.js'.
	fct02 := self createJSFunctionNamed: 'getName'.
	fct02 parentType: fct01.
	fct03 := self createJSFunctionNamed: 'Mammal'.
	fct03 filePath: '\Home\Leonardo\Mammal.js'.
	"Method 1"
	property01 := self createJSPropertyNamed:'getName' parent: fct01.
	fct01 jsProperties: property01.
	property01 isBoundToThis: true.
	property01 jsValue: fct02.
	"Method 2"
	property02 := self createJSPropertyNamed:'getLastName' parent: fct03.
	fct03 jsProperties: property02.
	property02 isBoundToThis: true.
	property02 jsValue: fct03.
	aJSClassFinder classModel add: ((FAMIXClass new name:'Mammal') parentPackage: (self createFamixPackage: '\Home\Test\Mammal.js')).
	aJSClassFinder classModel add: ((FAMIXClass new name:'Mammal') parentPackage: (self createFamixPackage: '\Home\Leonardo\Mammal.js')).
	
	aJSClassFinder searchJSMethods. "<- Real target of the test"

	self assert: classModel entities size equals: 6. "2 methods; 2 classes; 2 packages"
 	self assert: (classModel allWithType: FAMIXMethod) size equals: 2.
	m01 := (classModel allWithType: FAMIXMethod) detect: [ :m | m name = 'getName'].
	self assert: m01 parentType name equals: 'Mammal'.
	self assert: m01 parentType parentPackage name equals: '\Home\Test\Mammal.js'.
	m02 := (classModel allWithType: FAMIXMethod) detect: [ :m | m name = 'getLastName'].
	self assert: m02 parentType name equals: 'Mammal'.
	self assert: m02 parentType parentPackage name equals: '\Home\Leonardo\Mammal.js'.

]

{ #category : #'search and filtering' }
JSClassFinderTests >> testSearchJSTypesBaselineSolution [
"COMMENTED ON 27-July-2016"
	"|  fctHTMLActuator pck classHTMLActuator fctTest fctCall fctActuate lstCallExpression aFileAnchor fctSameName |"
	"Setting up the environment"
	"pck := self createFamixPackage: '2048Flow.js'.
	fctHTMLActuator := self createJSFunctionNamed: 'HTMLActuator'.
	classHTMLActuator := self createFamixClass: fctHTMLActuator package: pck.
	fctActuate := self createJSFunctionNamed: 'actuate'.
	self createFamixMethod: fctActuate class: classHTMLActuator.
	fctTest := self createJSFunctionNamed: 'fctTest'.

	fctSameName := self createJSFunctionNamed: 'sameName'.
	self createJSFunctionNamed: 'sameName'." "Other fct with the same name"

	"FunctionCalls info"
	"aFileAnchor := FAMIXFileAnchor new startLine: 585; startColumn: 8; endLine: 585; endColumn: 10; fileName: 'File @ 2048Flow.js'; yourself."
	"JSCallExpObject>>classification = #Class (callee is a class constructor)"
	"fctCall := self createJSFunctionCall: fctTest callee: fctHTMLActuator.  
	fctCall locInfo: aFileAnchor."
	"JSCallExpObject>>classification = #Class (callee is a method)"
	"fctCall := self createJSFunctionCall: fctTest callee: fctActuate.  
	fctCall locInfo: aFileAnchor."
	
	"JSCallExpObject>>classification = #OtherObj - We do not have this kind in the baseline solution."
	
	"JSCallExpFunction>>classification = #InternalFct"
	"fctCall := self createJSFunctionCall: fctHTMLActuator callee: fctTest.  
	fctCall locInfo: aFileAnchor."
	"JSCallExpFunction>>classification = #MultipleTypes"
	"fctCall := self createJSFunctionCall: fctHTMLActuator callee: fctSameName.  
	fctCall locInfo: aFileAnchor."
	"JSCallExpFunction>>classification = #ApiJS"
	"fctCall := self createJSFunctionCall: fctHTMLActuator callee: 'NoInternalFctName'.  
	fctCall locInfo: aFileAnchor."

	"Tests"
	"lstCallExpression := aJSClassFinder searchJSTypesBaselineSolution.
	self assert: lstCallExpression size equals: 5.
	self assert: (lstCallExpression select: [ :ce | (ce class = JSCallExpFunction) and: [ ce classification = #InternalFct ] ]) size equals: 1.
	self assert: (lstCallExpression select: [ :ce | (ce class = JSCallExpFunction) and: [ ce classification = #ApiJS ] ]) size equals: 1.
	self assert: (lstCallExpression select: [ :ce | (ce class = JSCallExpObject) and: [ ce classification = #Class ] ]) size equals: 2."	
"	self assert: (lstCallExpression select: [ :ce | (ce class = JSCallExpObject) and: [ ce classification = #OtherObj ] ]) size equals: 1."	
	"self assert: (lstCallExpression select: [ :ce | (ce class = JSCallExpression) and: [ ce classification = #MultipleTypes ] ]) size equals: 1."


]

{ #category : #'search and filtering' }
JSClassFinderTests >> testSearchStaticJSTypesForFlow [
	| lstCallExpressionFlow fctHTMLActuator pck classHTMLActuator fctTest fctCall |
	"Setting up the environment"
	self class createExampleDumpFileFlow: '2048Flow.dump'.

	pck := self createFamixPackage: '2048Flow.js'.
	fctHTMLActuator := self createJSFunctionNamed: 'HTMLActuator'.
	classHTMLActuator := self createFamixClass: fctHTMLActuator package: pck.
	self createFamixAttribute: 'bestContainer' class: classHTMLActuator.
	self createFamixAttribute: 'messageContainer' class: classHTMLActuator.
	self createFamixAttribute: 'score' class: classHTMLActuator.
	self createFamixAttribute: 'scoreContainer' class: classHTMLActuator.
	self createFamixAttribute: 'tileContainer' class: classHTMLActuator.
	"FunctionCalls info"
	fctTest := self createJSFunctionNamed: 'fctTest'.
	"JSCallExpObject>>classification = #Class"
	fctCall := self createJSFunctionCall: fctHTMLActuator callee: fctTest.  
	fctCall locInfo: (FAMIXFileAnchor new startLine: 585; startColumn: 8; endLine: 585; endColumn: 10; fileName: 'File @ 2048Flow.js'; yourself).
	"JSCallExpObject>>classification = #OtherObj"
	fctCall := self createJSFunctionCall: fctHTMLActuator callee: fctTest.  
	fctCall locInfo: (FAMIXFileAnchor new startLine: 585; startColumn: 44; endLine: 585; endColumn: 50; fileName: 'File @ 2048Flow.js'; yourself).
	"JSCallExpFunction>>classification = #InternalFct"
	fctCall := self createJSFunctionCall: fctHTMLActuator callee: fctTest.  
	fctCall locInfo: (FAMIXFileAnchor new startLine: 585; startColumn: 25; endLine: 585; endColumn: 31; fileName: 'File @ 2048Flow.js'; yourself).
	"JSCallExpFunction>>classification = #MultipleTypes"
	fctCall := self createJSFunctionCall: fctHTMLActuator callee: fctTest.  
	fctCall locInfo: (FAMIXFileAnchor new startLine: 587; startColumn: 15; endLine: 587; endColumn: 17; fileName: 'File @ 2048Flow.js'; yourself).
	"JSCallExpFunction>>classification = #ApiJS"
	fctCall := self createJSFunctionCall: fctHTMLActuator callee: 'NoInternalFctName'.  
	fctCall locInfo: (FAMIXFileAnchor new startLine: 584; startColumn: 55; endLine: 584; endColumn: 60; fileName: 'File @ 2048Flow.js'; yourself).

	"Tests"
	lstCallExpressionFlow := aJSClassFinder searchStaticJSTypesForFlow: (aJSClassFinder getAllOrderedFunctionCallsForFlow).
	self assert: lstCallExpressionFlow size equals: 5.
	self assert: (lstCallExpressionFlow select: [ :ce | (ce class = JSCallExpFunction) and: [ ce classification = #InternalFct ] ]) size equals: 1.
	self assert: (lstCallExpressionFlow select: [ :ce | (ce class = JSCallExpFunction) and: [ ce classification = #ApiJS ] ]) size equals: 1.
	self assert: (lstCallExpressionFlow select: [ :ce | (ce class = JSCallExpObject) and: [ ce classification = #Class ] ]) size equals: 1.	
	self assert: (lstCallExpressionFlow select: [ :ce | (ce class = JSCallExpObject) and: [ ce classification = #OtherObj ] ]) size equals: 2.	
	self assert: (lstCallExpressionFlow select: [ :ce | (ce class = JSCallExpression) and: [ ce classification = #MultipleTypes ] ]) size equals: 0.


]

{ #category : #'search and filtering' }
JSClassFinderTests >> testSearchStaticJSTypesForFlowMultipleTypes [
	| lstCallExpressionFlow fctGrid pck classGrid fctTest fctCall |
	"Setting up the environment"
	self class createExample2DumpFileFlow: '2048Flow-classification.dump'.

	pck := self createFamixPackage: '2048Flow-classification.js'.
	fctGrid := self createJSFunctionNamed: 'Grid'.
	classGrid := self createFamixClass: fctGrid package: pck.
	self createFamixAttribute: 'size' class: classGrid.
	self createFamixAttribute: 'cells' class: classGrid.
	"FunctionCalls info"
	fctTest := self createJSFunctionNamed: 'fctTest'.
	fctCall := self createJSFunctionCall: fctGrid callee: fctTest.  
	fctCall locInfo: (FAMIXFileAnchor new startLine: 193; startColumn: 9; endLine: 193; endColumn: 63; fileName: 'File @ 2048Flow-classification.js'; yourself).

	"Tests"
	lstCallExpressionFlow := aJSClassFinder searchStaticJSTypesForFlow: (aJSClassFinder getAllOrderedFunctionCallsForFlow).
	self assert: lstCallExpressionFlow size equals: 1.
	self assert: (lstCallExpressionFlow select: [ :ce | (ce class = JSCallExpression) and: [ ce classification = #MultipleTypes ] ]) size equals: 1.	


]

{ #category : #'search and filtering' }
JSClassFinderTests >> testSearchStaticJSTypesForFlowUnkownUndefined [
	| lstCallExpressionFlow fctHTMLActuator   fctTest fctCall |
	"Setting up the environment"
	self class createExample3DumpFileFlow: '2048Flow-Ex4.dump'.

	fctHTMLActuator := self createJSFunctionNamed: 'HTMLActuator'.
	"FunctionCalls info"
	fctTest := self createJSFunctionNamed: 'fctTest'.
	"JSCallExpObject>>classification = #Unknown"
	fctCall := self createJSFunctionCall: fctHTMLActuator callee: fctTest.  
	fctCall locInfo: (FAMIXFileAnchor new startLine: 584; startColumn: 55; endLine: 585; endColumn: 60; fileName: 'File @ 2048Flow-Ex4.js'; yourself).
	"JSCallExpObject>>classification = #Undefined"
	fctCall := self createJSFunctionCall: fctHTMLActuator callee: fctTest.  
	fctCall locInfo: (FAMIXFileAnchor new startLine: 585; startColumn: 44; endLine: 585; endColumn: 50; fileName: 'File @ 2048Flow-Ex4.js'; yourself).

	"Tests"
	lstCallExpressionFlow := aJSClassFinder searchStaticJSTypesForFlow: (aJSClassFinder getAllOrderedFunctionCallsForFlow).
	self assert: lstCallExpressionFlow size equals: 2.
	self assert: (lstCallExpressionFlow select: [ :ce | (ce class = JSCallExpression) and: [ ce classification = #Unknown ] ]) size equals: 1.
	self assert: (lstCallExpressionFlow select: [ :ce | (ce class = JSCallExpression) and: [ ce classification = #Undefined ] ]) size equals: 1.


]

{ #category : #initialization }
JSClassFinderTests >> testSetAllFunctionCallsUnvisited [
	| fc01  fctMammal fctCat fctSetSound  fc02         |

	"Set up the environment"
	fctMammal := self createJSFunctionNamed: 'Mammal'.
	fctCat := self createJSFunctionNamed: 'Cat'.
	fctSetSound := self createJSFunctionNamed: 'setSound'.
	fc01 := self createJSFunctionCall: fctMammal callee: fctSetSound.  
	fc01 visited: true.
	fc02 := self createJSFunctionCall: fctCat callee: fctMammal. 
	fc02 visited: true.

	self assert: ((aJSClassFinder famixJSModel allWithType: FAMIXJSCall) select: [ :fc | fc visited ]) size equals: 2.
	aJSClassFinder setAllFunctionCallsUnvisited. " <-- Real target of the test"
	self assert: ((aJSClassFinder famixJSModel allWithType: FAMIXJSCall) select: [ :fc | fc visited ]) size equals: 0.

]

{ #category : #metrics }
JSClassFinderTests >> testSubclassUsageRatio [
	| c01 c02 c03 |
	c01 := aJSClassFinder ensureJSClass: (self createJSFunctionNamed: 'c1')  pattern: #new package: 'file1'.
	c02 := aJSClassFinder ensureJSClass: (self createJSFunctionNamed: 'c2')  pattern: #nonew package: 'file1'.
	c03 := aJSClassFinder ensureJSClass: (self createJSFunctionNamed: 'c3')  pattern: #nonew package: 'file1'.
	aJSClassFinder ensureJSClassInheritance: c01 super: c02.
	aJSClassFinder ensureJSClassInheritance: c03 super: c02.
	
	self assert: aJSClassFinder subclassUsageRatio equals: 1.

]
