<!--

@license Apache-2.0

Copyright (c) 2025 The Stdlib Authors.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

-->

# JavaScript Style Guide

> _An opinionated style guide for writing JavaScript._

## Table of Contents

1.  [Introduction](#introduction)
2.  [General Principles](#general-principles)
3.  [Whitespace](#whitespace)
4.  [Semicolons](#semicolons)
5.  [Parentheses](#parentheses)
6.  [Variables](#variables)
7.  [Strings](#strings)
8.  [Arrays](#arrays)
9.  [Functions](#functions)
10. [Strict Mode](#strict-mode)
11. [Arguments](#arguments)
12. [Regular Expressions](#regular-expressions)
13. [Blocks](#blocks)
14. [Equality](#equality)
15. [Errors](#errors)
16. [Comments](#comments)
17. [Naming](#naming)
18. [This](#this)
19. [Classes](#classes)
20. [Setters and Getters](#setters-and-getters)
21. [Method Chaining](#method-chaining)
22. [Documentation](#documentation)
23. [Performance](#performance)
24. [Modularity](#modularity)
25. [Client-side JavaScript](#client-side-javascript)
26. [Dependencies](#dependencies)
27. [Best Practices](#best-practices)
28. [Code Complexity](#code-complexity)
29. [Node.js Conventions](#nodejs-conventions)
30. [ES2015 Restrictions](#es2015-restrictions)
31. [stdlib Custom Rules](#stdlib-custom-rules)
32. [Additional Resources](#additional-resources)
33. [License](#license)

## Introduction

Always abide by the **Law of Code Style Consistency**, or, in other words, _when in Rome, do as the Romans do_. 

While the code base to which you want to contribute may be a horrific mess in terms of aesthetic appearance and style, style consistency takes precedence over personal preference and canon. The more consistent a code base is in terms of style, the more readers of the code can focus on what the code does rather than deciphering changes in style.

So, even if your peers commit various _faux pas_ outlined below, as long as you are contributing to their code base, abide by their conventions.

A code base--module, repository, application, library, etc--should always appear to have a single author and not be a schizophrenic franken-mess. This stated, for those opportunities where you are the primary author, you should lead by example and write clean, readable, and testable code.

Hopefully, most of the conventions outlined below will help enable you to do so.

## General Principles

-   Prefer standards to non-standards.
-   Do one thing and do one thing well.
-   Keep your code clean. Create feature branches for experimental development, extensive annotations, and/or alternative implementations.

<!-- <rule-set> -->

* * *

## Whitespace

<!-- <rule> -->

### Rule: Use tab indentation

##### Reason

[Tab indentation][tab-indentation] allows a developer to specify the space indentation equivalent in her editor. For example, in [Sublime Text][sublime-text], you can specify in your user preferences

```text
"tab_width": 4
```

##### Notes

-   Even if you must use spaces, **never** mix tabs and spaces. This is formatting hell, as a simple find-and-replace is useless in the face of such chaos.

##### Enforcement

This project contains an [`.editorconfig`][editorconfig] file to be used in conjunction with IDE and/or browser plugins.

-   [sublime text][sublime-text-editorconfig]
-   [atom][atom-editorconfig]
-   [chrome][chrome-editorconfig]
-   [vscode][vscode-editorconfig]

<!-- </rule> -->

<!-- <rule> -->

### Rule: Include a space before leading brace

##### Reason

Including `1` space before a leading brace improves readability.

##### Bad Example

<!-- eslint-disable space-before-blocks -->

```javascript
// Do not...
function query(){
    // Do something...
}
```

##### Good Example

```javascript
// Do...
function query() {
    // Do something...
}
```

##### Enforcement

ESLint rule: [`space-before-blocks`][eslint-space-before-blocks]

<!-- </rule> -->

<!-- <rule> -->

### Rule: Include spaces around arguments

##### Reason

Including `1` space before and after arguments improves readability.

##### Bad Example

<!-- eslint-disable comma-spacing -->

```javascript
// Do not...
function test(arg1,arg2,arg3) {
    // Do something...
}
```

##### Good Example

```javascript
// Do...
function test( arg1, arg2, arg3 ) {
    // Do something...
}
```

##### Enforcement

ESLint rules: [`comma-spacing`][eslint-comma-spacing], [`space-in-parens`][eslint-space-in-parens]

<!-- </rule> -->

<!-- <rule> -->

### Rule: Include spaces around array indices

##### Reason

Including `1` space before and after `array` indices improves readability.

##### Bad Example

```javascript
// Do not...
var foo = bar[10];
```

##### Good Example

```javascript
// Do...
var foo = bar[ 10 ];
```

##### Notes

-   Use discretion when using spaces around `array` indices buried in braces.

    ```javascript
    // Okay:
    var foo = myFunction( ( a === b ) ? bar[0] : bar[1] );
    ```

##### Enforcement

ESLint rule: [`computed-property-spacing`][eslint-computed-property-spacing]

<!-- </rule> -->

<!-- <rule> -->

### Rule: Include spaces around operators

##### Reason

Including `1` space before and after operators improves readability.

##### Bad Example

```javascript
// Do not...
var a=1+1;
```

##### Good Example

```javascript
// Do...
var a = 1 + 1;
```

##### Notes

-   Use discretion when operators are contained within complex expressions and `string` concatenation.

    ```javascript
    // Okay...
    var str = 'This is a long string by '+firstName+' '+lastName+', which may keep going and going and...';

    // Okay...
    var n = ((x+y+z)*(t-w-v)) + 5;
    ```

##### Enforcement

ESLint rule: [`space-infix-ops`][eslint-space-infix-ops]

<!-- </rule> -->

<!-- <rule> -->

### Rule: No spaces around unary operators

##### Reason

Immediate juxtaposition makes evident what is being affected.

##### Bad Example

<!-- eslint-disable space-unary-ops, no-plusplus -->

```javascript
// Do not...
x = ++ y;
z = z ++;
```

##### Good Example

<!-- eslint-disable no-plusplus -->

```javascript
// Do...
x = ++y;
z = z++;
```

##### Enforcement

ESLint rule: [`space-unary-ops`][eslint-space-unary-ops]

<!-- </rule> -->

<!-- <rule> -->

### Rule: Include a space after comment marks

##### Reason

Including `1` space after comment marks improves readability.

##### Bad Example

<!-- eslint-disable spaced-comment -->

```javascript
// Do not...

//This is a single-line comment.

/*
*This is a mult-
*line comment.
*/
```

##### Good Example

```javascript
// Do...

// This is a single-line comment.

/*
* This is a multi-
* line comment.
*/
```

##### Enforcement

ESLint rule: [`spaced-comment`][eslint-spaced-comment]

<!-- </rule> -->

<!-- <rule> -->

### Rule: No multi-line comment indentation

##### Reason

Some IDEs have a tendency to auto-indent based on the previous line, thus pushing all subsequent lines `1` character to the right.

##### Bad Example

```javascript
// Do not...

/*
 * This is a multi-line comment.
 * The comment continues and continues...
 * ...until it no longer does.
 */
```

##### Good Example

```javascript
// Do...

/*
* This is a multi-line comment.
* The comment continues and continues...
* ...until it no longer does.
*/
```

##### Enforcement

In general, hard to automatically enforce. Mostly enforced through code review.

<!-- </rule> -->

<!-- <rule> -->

### Rule: Indent chained methods

##### Reason

Indentation improves readability.

##### Bad Example

```javascript
// Do not...
var svg = d3.select( '.main' ).append( 'svg:svg' ).attr( 'class', 'canvas' ).attr( 'data-id', Date.now() ).attr( 'width', 100 ).attr( 'height', 100 );
```

##### Good Example

```javascript
// Do...
var svg = d3.select( '.main' )
    .append( 'svg:svg' )
    .attr( 'class', 'canvas' )
    .attr( 'data-id', Date.now() )
    .attr( 'width', 100 )
    .attr( 'height', 100 );
```

##### Enforcement

Hard to automatically enforce. Mostly through code review. TODO: partial enforcement via lint rule.

<!-- </rule> -->

<!-- <rule> -->

### Rule: No newlines between conditions

##### Reason

Newline is unnecessary.

##### Bad Example

```javascript
// Do not...
if ( foo === bar ) {
    // Do something...
}
else {
    // Do something different...
}
```

##### Good Example

```javascript
// Do...
if ( foo === bar ) {
    // Do something...
} else {
    // Do something different...
}
```

##### Notes

-   Use discretion when faced with multiple conditions.

    ```javascript
    // Do...
    if ( foo === bar ) {
        // Do something...
    } else if ( foo === beep ) {
        // Do something else...
    } else if ( bar === bar ) {
        // Do something more...
    } else {
        // Do something different...
    }

    // Okay...
    if ( foo === bar ) {
        // Do something...
    }
    else if ( foo === beep ) {
        // Do something else...
    }
    else if ( baz === bar ) {
        // Do something more...
    }
    else {
        // Do something different...
    }
    ```

-   Use discretion when documenting conditions.

    ```javascript
    // Okay...

    // `bar` can only equal `foo` when...
    if ( foo === bar ) {
        // Do something...
    }
    // `beep` can only equal `foo` when...
    else if ( foo === beep ) {
        // Do something else...
    }
    // This pathway should rarely be taken...
    else if ( baz === bar ) {
        // Do something more...
    }
    // `foo` equals `bap`
    else {
        // Do something different...
    }
    ```

##### Enforcement

Code review.

<!-- </rule> -->

<!-- <rule> -->

### Rule: No case indentation

##### Reason

Indenting the `case` keyword within `switch` statements results in excessive indentation.

##### Bad Example

<!-- eslint-disable indent -->

```javascript
// Do not...
switch ( foo ) {
    case 'bar':
        // Do something...
        break;
    case 'beep':
        // Do something...
        break;
    default:
        // Do something...
}
```

##### Good Example

```javascript
// Do...
switch ( foo ) {
case 'bar':
    // Do something...
    break;
case 'beep':
    // Do something...
    break;
default:
    // Do something...
}
```

##### Enforcement

ESLint rule: [`indent`][eslint-indent]

<!-- </rule> -->

<!-- <rule-set> -->

<!-- <rule-set> -->

* * *

## Semicolons

<!-- <rule> -->

### Rule: Use semicolons

##### Reason

While semicolons are [not required][ecma-262] in most cases due to [automatic semicolon insertion][ecma-262], prefer to be explicit in specifying when a statement ends. Additionally, in certain REPL environments, semicolons acquire special meaning; notably, they silence return value output.

##### Bad Example

<!-- eslint-disable semi -->

```javascript
// Do not...
var bar = foo()
```

##### Good Example

```javascript
// Do...
var bar = foo();
```

##### Enforcement

ESLint rule: [`semi`][eslint-semi]

<!-- </rule> -->

<!-- </rule-set> -->

<!-- <rule-set> -->

* * *

## Parentheses

<!-- <rule> -->

### Rule: Include around ternary test condition

##### Reason

Including parentheses around the test condition in ternary operators improves readability.

##### Bad Example

<!-- eslint-disable stdlib/ternary-condition-parentheses -->

```javascript
// Do not...
var foo = a === b ? a*3 : b/4;
```

##### Good Example

```javascript
// Do...
var foo = ( a === b ) ? a*3 : b/4;
```

##### Enforcement

TODO

<!-- </rule> -->

<!-- </rule-set> -->

<!-- <rule-set> -->

* * *

## Variables

<!-- <rule> -->

### Rule: Declare variables at top of scope

##### Reason

Doing so makes variable hoisting explicit.

##### Bad Example

```javascript
// Do not...
function myFunction() {
    var foo = 3;

    if ( foo ) {
        // Do something...
    }
    var bar = foo * 5;
}
```

##### Good Example

```javascript
// Do...
function myFunction() {
    var foo = 3;
    var bar;

    if ( foo ) {
        // Do something...
    }
    bar = foo * 5;
}
```

##### Enforcement

ESLint rule: [`vars-on-top`][eslint-vars-on-top]. Code review.

<!-- </rule> -->

<!-- <rule> -->

### Rule: Declare variables separately

##### Reason

Adding, removing, and reordering variables is easier. Additionally, `git` diffs are cleaner.

##### Bad Example

<!-- eslint-disable one-var -->

```javascript
// Do not...
var boop = 'hello',
    beep = false,
    bar = null,
    foo = 3;
```

##### Good Example

```javascript
// Do...
var boop = 'hello';
var beep = false;
var bar = null;
var foo = 3;
```

##### Enforcement

ESLint rule: [`one-var`][eslint-one-var]

<!-- </rule> -->

<!-- <rule> -->

### Rule: Declare variables on separate lines

##### Reason

Declaring variables on separate lines improves readability.

##### Bad Example

<!-- eslint-disable max-statements-per-line -->

```javascript
// Do not...
var beep; var boop;
var bop; var bap; var i;
```

##### Good Example

```javascript
// Do...
var beep;
var boop;
var bop;
var bap;
var i;
```

##### Enforcement

ESLint rule: [`max-statements-per-line`][eslint-max-statements-per-line]

<!-- </rule> -->

<!-- <rule> -->

### Rule: Declare assigned variables first

##### Reason

Visual alignment and thus improved readability.

##### Bad Example

```javascript
// Do not...
var beep;
var foo = 3;
var boop;
var bar = null;
```

##### Good Example

```javascript
// Do...
var bar = null;
var foo = 3;
var beep;
var boop;
```

##### Enforcement

Code review.

<!-- </rule> -->

<!-- <rule> -->

### Rule: Order variable declarations based on character length

##### Reason

Visual alignment and thus improved readability.

##### Bad Example

```javascript
// Do not...
var a;
var foo;
var b;
var ii;
var bar;
```

##### Good Example

```javascript
// Do...
var foo;
var bar;
var ii;
var a;
var b;
```

##### Enforcement

Code review.

<!-- </rule> -->

<!-- </rule-set> -->

<!-- <rule-set> -->

* * *

## Strings

<!-- <rule> -->

### Rule: Use single quotes

##### Reason

Reserve double quotes for in-string parenthetical references or quotes. Additionally, single quotes consume less visual space.

##### Bad Example

<!-- eslint-disable quotes -->

```javascript
// Do not...
var str = "Hello";
```

##### Good Example

```javascript
// Do...
var str = 'Hello';
```

##### Enforcement

ESLint rule: [`quotes`][eslint-quotes]

<!-- </rule> -->

<!-- <rule> -->

### Rule: No template strings

##### Reason

Immediate evaluation prevents a template being stored in a variable. Token syntax is fixed. Whitespace sensitivity causes alignment issues, especially within nested code blocks.

##### Notes

-   A function which performs string concatenation is equivalently effective.

##### Enforcement

ESLint rule: [`no-restricted-syntax`][eslint-no-restricted-syntax]. Code review.

<!-- </rule> -->

<!-- </rule-set> -->

<!-- <rule-set> -->

* * *

## Arrays

<!-- <rule> -->

### Rule: Use literal syntax for empty array

##### Reason

Instantiation with the `new` operator is unnecessary.

##### Bad Example

<!-- eslint-disable no-array-constructor -->

```javascript
// Do not...
var arr = new Array();
```

##### Good Example

```javascript
// Do...
var arr = [];
```

##### Enforcement

Code review.

<!-- </rule> -->

<!-- <rule> -->

### Rule: Use new keyword when length is known

##### Reason

Allows compiler to pre-allocate memory.

##### Bad Example

<!-- eslint-disable stdlib/no-builtin-math -->

```javascript
// Do not...
var arr = [];
var i;
for ( i = 0; i < 100; i++ ) {
    arr.push( Math.random() );
}
```

##### Good Example

<!-- eslint-disable stdlib/no-builtin-math -->

```javascript
// Do...
var arr = new Array( 100 );
var i;
for ( i = 0; i < arr.length; i++ ) {
    arr[ i ] = Math.random();
}
```

##### Notes

-   Do **not** use the `new` operator if the `array` length is **very large** due to how compilers handle "fast" elements. Instead, to ensure "fast" elements,

    <!-- eslint-disable stdlib/no-builtin-math -->

    ```javascript
    var arr;
    var i;

    arr = [];
    for ( i = 0; i < 1e7; i++ ) {
        arr.push( Math.random() );
    }
    ```

##### Enforcement

Code review.

<!-- </rule> -->

<!-- <rule> -->

### Rule: Use a for loop to convert array-like objects

##### Reason

More explicit and efficient. Additionally, passing the `arguments` object to any function leads to optimization hell.

##### Bad Example

```javascript
// Do not...
var args = Array.prototype.slice.call( arguments );
```

##### Good Example

```javascript
// Do...
var nargs = arguments.length;
var args = new Array( nargs );
var i;
for ( i = 0; i < nargs; i++ ) {
    args[ i ] = arguments[ i ];
}
```

##### Enforcement

Code review.

<!-- </rule> -->

<!-- <rule> -->

### Rule: Copy approach depends on array length

##### Reason

When copying a small `array`, using `Array#slice()` incurs a function overhead which outweighs benefits. Thus, a `for` loop is more efficient. For larger `arrays`, function cost is comparable to or less than loop cost in addition to the runtime engine being able to optimize for copying large chunks of memory. 

##### Small Array Example

<!-- eslint-disable stdlib/no-builtin-math -->

```javascript
// Do...
var arr = new Array( 10 );
var out = new Array( arr.length );
var i;
for ( i = 0; i < arr.length; i++ ) {
    arr[ i ] = Math.random();
}
// Copy...
for ( i = 0; i < arr.length; i++ ) {
    out[ i ] = arr[ i ];
}
```

##### Large Array Example

<!-- eslint-disable stdlib/no-builtin-math -->

```javascript
// Do...
var arr = new Array( 10000 );
var out;
var i;
for ( i = 0; i < arr.length; i++ ) {
    arr[ i ] = Math.random();
}
// Copy...
out = arr.slice();
```

##### Enforcement

Code review.

<!-- </rule> -->

<!-- </rule-set> -->

<!-- <rule-set> -->

* * *

## Objects

<!-- <rule> -->

### Rule: Split properties over multiple lines

##### Reason

Splitting `object` properties over multiple lines improves readability.

##### Bad Example

<!-- eslint-disable object-curly-newline, no-restricted-syntax, object-property-newline, max-statements-per-line -->

```javascript
// Do not...
var obj = { 'a': null, 'b': 5, 'c': function c() { return true; }, 'd': ( foo === bar ) ? foo : bar };
```

##### Good Example

<!-- eslint-disable no-restricted-syntax -->

```javascript
// Do...
var obj = {
    'a': null,
    'b': 5,
    'c': function c() {
        return true;
    },
    'd': ( foo === bar ) ? foo : bar
};
```

##### Enforcement

Code review.

<!-- </rule> -->

<!-- <rule> -->

### Rule: No object value alignment

##### Reason

For complex `objects`, matching properties and their corresponding values becomes more difficult, thus hindering readability.

##### Bad Example

<!-- eslint-disable key-spacing -->

```javascript
// Do not...
var obj = {
    'prop'     : true,
    'attribute': 'foo',
    'name'     : 'bar'
};
```

##### Good Example

```javascript
// Do...
var obj = {
    'prop': true,
    'attribute': 'foo',
    'name': 'bar'
};
```

##### Enforcement

Code review.

<!-- </rule> -->

<!-- <rule> -->

### Rule: No trailing comma

##### Reason

An object which includes a trailing comma is not valid JSON.

##### Bad Example

<!-- eslint-disable comma-dangle -->

```javascript
// Do not...
var obj = {
    'prop': true,
    'attribute': 'foo',
    'name': 'bar', // <= DON'T
};
```

##### Good Example

```javascript
// Do...
var obj = {
    'prop': true,
    'attribute': 'foo',
    'name': 'bar'
};
```

##### Enforcement

ESLint rule: [`comma-dangle`][eslint-comma-dangle]

<!-- <rule> -->

<!-- <rule> -->

### Rule: No object literal shorthand

##### Reason

Unnecessary syntactic sugar. In complex objects, shorthand notation decreases readability. Prefer making key-value pairs explicit.

##### Bad Example

<!-- eslint-disable object-property-newline, object-shorthand, object-curly-newline -->

```javascript
var foo = 'beep';
var x = true;
var y = 10;

var obj = { foo, 'baz': 'boop', x, y };
```

##### Good Example

```javascript
var foo = 'beep';
var x = true;
var y = 10;

var obj = {
    'foo': foo,
    'baz': 'boop',
    'x': x,
    'y': y
};
```

##### Enforcement

ESLint rule: [`object-shorthand`][eslint-object-shorthand]. Code review.

<!-- </rule> -->

<!-- <rule-set> -->

<!-- <rule-set> -->

* * *

## Functions

<!-- <rule> -->

### Rule: Declare functions using function statements

##### Reason

Declaring `functions` using [function statements][function-statements], rather than [function expressions][function-expressions], (1) avoids problems encountered due to [hoisting][hoisting] and (2) minimizes the use of anonymous `functions`.

##### Bad Example

<!-- eslint-disable func-style, func-names, no-restricted-syntax -->

```javascript
// Do not...
var beep = function () {
    console.log( 'boop' );
};
```

##### Good Example

```javascript
// Do...
function beep() {
    console.log( 'boop' );
}
```

##### Enforcement

ESLint rule: [`func-style`][eslint-func-style]

<!-- </rule> -->

<!-- <rule> -->

### Rule: Declare functions at highest possible scope

##### Reason

Minimizes closures and helps to prevent nested callback hell.

##### Bad Example

```javascript
// Do not...
function beep() {
    boop();
    function boop() {
        // Do something...
    }
}
```

##### Good Example

```javascript
// Do...
function beep() {
    boop();
}

function boop() {
    // Do something...
}
```

##### Enforcement

Code review. Look for excessive indentation.

<!-- </rule> -->

<!-- <rule> -->

### Rule: No declarations within loops or conditions

##### Reason

Declaring within loops and conditions may result in repeated function creation, and variables in the outer scope may change leading to subtle bugs.

##### Bad Example

<!-- eslint-disable no-restricted-syntax, block-scoped-var -->

```javascript
// Do not...
function beep( idx, clbk ) {
    clbk( 'beep'+idx );
}
for ( var i = 0; i < 10; i++ ) {
    beep( i, function bop( msg ) {
        console.log( msg );
    });
}
```

##### Good Example

```javascript
// Do...
function beep( idx, clbk ) {
    clbk( 'beep'+idx );
}
function bop( msg ) {
    console.log( msg );
}

for ( var i = 0; i < 10; i++ ) {
    beep( i, bop );
}
```

##### Bad Example

<!-- eslint-disable no-restricted-syntax, no-loop-func -->

```javascript
// Do not...
for ( var i = 0; i < 10; i++ ) {
    setTimeout( function onTimeout() {
        console.log( i );
    }, 1000 );
}
```

##### Good Example

```javascript
// Do...
function clbk( idx ) {
    return onTimeout;

    function onTimeout() {
        console.log( idx );
    }
}
for ( var i = 0; i < 10; i++ ) {
    setTimeout( clbk( i ), 1000 );
}
```

##### Bad Example

<!-- eslint-disable no-inner-declarations, stdlib/no-builtin-math -->

```javascript
// Do not...
var i = Math.random() * 20;
if ( i < 11 ) {
    bap();
    function bap() {
        // Do something...
    }
}
```

##### Good Example

<!-- eslint-disable stdlib/no-builtin-math -->

```javascript
// Do...
function bap() {
    // Do something...
}
var i = Math.random() * 20;
if ( i < 11 ) {
    bap();
}
```

##### Enforcement

ESLint rules: [`no-loop-func`][eslint-no-loop-func], [`no-inner-declarations`][eslint-no-inner-declarations]

<!-- </rule> -->

<!-- <rule> -->

### Rule: Parentheses around immediately invoked function expressions

##### Reason

Makes a clear distinction between a `function` declaration and one that is immediately invoked.

##### Bad Example

<!-- eslint-skip -->

```javascript
// Do not...
function init() {
    // Do something...
}();
```

##### Good Example

<!-- eslint-disable no-restricted-syntax -->

```javascript
// Do...
(function init() {
    // Do something...
})();
```

##### Enforcement

ESLint rule: [`wrap-iife`][eslint-wrap-iife]

<!-- </rule> -->

<!-- <rule> -->

### Rule: Declare enclosed functions below return statement

##### Reason

Reduces noise when first attempting to understand implementation flow, especially if enclosed functions are documented.

##### Bad Example

<!-- eslint-disable no-use-before-define, stdlib/no-builtin-math -->

```javascript
// Don't...
function getEquation( a, b, c ) {
    /**
    * Computes a complex equation.
    *
    * @private
    * @param {number} e - dynamic value
    * @returns {number} equation output
    */
    function eqn( e ) {
        return e - d + ( 15 * a ) + ( Math.pow( b, 1 / c ) );
    }
    var d;

    a *= 3;
    b = a / 5;
    c = Math.pow( b, 3 );

    d = a + ( b / c );

    return eqn;
}
```

##### Good Example

<!-- eslint-disable stdlib/no-builtin-math -->

```javascript
// Do...
function getEquation( a, b, c ) {
    var d;

    a *= 3;
    b = a / 5;
    c = Math.pow( b, 3 );

    d = a + ( b / c );

    return eqn;

    /**
    * Computes a complex equation.
    *
    * @private
    * @param {number} e - dynamic value
    * @returns {number} equation output
    */
    function eqn( e ) {
        return e - d + ( 15 * a ) + ( Math.pow( b, 1 / c ) );
    }
}
```

##### Enforcement

ESLint rule: [`stdlib/no-unnecessary-nested-functions`][eslint-stdlib-no-unnecessary-nested-functions]. Code review.

<!-- </rule> -->

<!-- <rule> -->

### Rule: Use primitive expressions over functional counterparts

##### Reason

Function calls introduce additional overhead and, often, functional counterparts do not save space, a frequently cited benefit.

##### Bad Example

<!-- eslint-disable no-restricted-syntax -->

```javascript
// Do not...
var squared = arr.map( function square( value ) {
    return value * value;
});
```

##### Good Example

```javascript
var squared = new Array( arr.length );

// Do...
for ( var i = 0; i < arr.length; i++ ) {
    squared[ i ] = arr[ i ] * arr[ i ];
}
```

##### Enforcement

Code review.

<!-- </rule> -->

<!-- <rule> -->

### Rule: No arrow functions

##### Reason

(1) They are not needed. (2) The syntax allows too much style variability.

<!-- eslint-disable arrow-body-style, no-restricted-syntax, func-style, arrow-parens, max-statements-per-line -->

```javascript
// No braces:
var f = x => x + 1;

// Some braces:
f = (x, y) => x + y;

// Some other braces:
f = x => { x += 20; return x.toString(); };

// Many braces:
f = (x, y) => { x += y; return x.toString(); };
```

(3) Implicit `returns` can lead to subtle bugs and require a constant mental model as to what is returned and when.

<!-- eslint-skip -->

```javascript
var y = x => x;
z = y( 10 );
// returns 10

y = x => { x };
z = y( 10 );
// returns undefined

y = ( x ) => { x };
z = y( 10 );
// returns undefined

y = ( x ) => x;
z = y( 10 );
// returns 10

y = ( x ) => { return x };
z = y( 10 );
// returns 10

y = x => return x;
z = y( 10 );
// => Uncaught SyntaxError: Unexpected token return
```

##### Bad Example

<!-- eslint-disable arrow-body-style, no-restricted-syntax, arrow-parens -->

```javascript
var squared = arr.map( x => x*x );
```

##### Good Example

```javascript
function square( x ) {
    return x * x;
}

var squared = arr.map( square );
```

##### Enforcement

Code review.

<!-- </rule> -->

<!-- <rule> -->

### Rule: Error-first asynchronous callbacks

##### Reason

This follows the Node.js callback convention.

##### Good Example

```javascript
// Do...
function clbk( error, value ) {
    if ( error ) {
        return;
    }
    console.log( value );
}

function onResponse( error, response, body ) {
    if ( error ) {
        clbk( error );
        return;
    }
    clbk( null, body );
}

request({
    'method': 'GET',
    'uri': 'http://127.0.0.1'
}, onResponse );
```

##### Notes

-   If no errors, the `error` argument should be `null`.

##### Enforcement

Code review.

<!-- </rule> -->

<!-- <rule> -->

### Rule: No promises

##### Reason

Error handling in `promises` is ill-defined. These primitives originated primarily due to poor coding practices when using callbacks rather than out of existential need.

##### Enforcement

Code review.

<!-- </rule> -->

<!-- <rule> -->

### Rule: Prefer closures and function factories

##### Reason

Avoids nested callback hell.

##### Bad Example

```javascript
// Do not...
function deferredComputation( value ) {
    return compute;
    function compute() {
        return cube();
        function cube() {
            var v;
            v = mult( value, value );
            v = mult( v, value );
            return v;
            function mult( x, y ) {
                return x * y;
            }
        }
    }
}
```

##### Good Example

```javascript
// Do...
function mult( x, y ) {
    return x * y;
}
function cube( value ) {
    var v;
    v = mult( value, value );
    v = mult( v, value );
    return v;
}
function deferred( value ) {
    return compute;

    function compute() {
        return cube( value );
    }
}
function deferredComputation( value ) {
    return deferred( value );
}
```

##### Enforcement

Code review.

<!-- </rule> -->

<!-- <rule> -->

### Rule: Name all functions

##### Reason

Named `functions` are easier to find in stack traces and consequently debug.

##### Bad Example

<!-- eslint-disable no-restricted-syntax, func-names -->

```javascript
// Do not...

function beep( f ) {
    f();
}

beep( function () {
    console.log( 'boop' );
});
```

##### Good Example

```javascript
// Do...

function beep( f ) {
    f();
}
function boop() {
    console.log( 'boop' );
}

beep( boop );
```

##### Enforcement

ESLint rule: [`func-names`][eslint-func-names]

<!-- </rule> -->

<!-- </rule-set> -->

<!-- <rule-set> -->

* * *

## Strict Mode

<!-- <rule> -->

### Rule: Use strict mode

##### Reason

Writing JavaScript in [strict mode][strict-mode] discourages bad practices, avoids silent errors, and can result in better performance, as the compiler can make certain assumptions about the code.

##### Good Example

<!-- eslint-skip -->

```javascript
'use strict';

NaN = null; // throws an Error
```

##### Notes

-   Prefer [strict mode][strict-mode] for a whole script. If not possible, use [strict mode][strict-mode] for each available `function`.

    ```javascript
    function beep() {
        'use strict';

        delete Object.prototype; // throws an Error
    }
    ```

##### Enforcement

ESLint rule: [`strict`][eslint-strict]

<!-- </rule> -->

<!-- </rule-set> -->

<!-- <rule-set> -->

* * *

## Arguments

<!-- <rule> -->

### Rule: Never pass the arguments variable to another function

##### Reason

Doing so automatically puts the `function` in optimization hell.

##### Bad Example

```javascript
// Do not...
function fcn() {
    var out = foo( arguments );
}
```

##### Good Example

```javascript
// Do...
function fcn() {
    var nargs = arguments.length;
    var args = new Array( nargs );
    var out;
    var i;

    for ( i = 0; i < nargs; i++ ) {
        args[ i ] = arguments[ i ];
    }
    out = foo( args );
}
```

##### Enforcement

Code review.

<!-- </rule> -->

<!-- <rule> -->

### Rule: Reassign input arguments when using the arguments variable

##### Reason

Recycling variables when mentioning `arguments` in a `function` body prevents compiler optimization.

##### Bad Example

```javascript
// Do not...
function fcn( value, options ) {
    var err;
    if ( arguments.length < 2 ) {
        options = value;
    }
    err = validate( options );
    if ( err ) {
        throw err;
    }
    // ...
}
```

##### Good Example

```javascript
// Do...
function fcn( value, options ) {
    var opts;
    var err;

    if ( arguments.length < 2 ) {
        opts = value;
    } else {
        opts = options;
    }
    err = validate( opts );
    if ( err ) {
        throw err;
    }
    // ...
}
```

##### Enforcement

Code review.

<!-- </rule> -->

<!-- <rule-set> -->

<!-- <rule-set> -->

* * *

## Regular Expressions

<!-- <rule> -->

### Rule: Assign to variables

##### Reason

Ensures a regular expression is only created once and improves readability.

##### Bad Example

```javascript
// Do not...
function beep( str ) {
    if ( /\.+/.test( str ) ) {
        // Do something...
    }
}

beep();
```

##### Good Example

```javascript
// Do...
var RE = /\.+/;

function beep( str ) {
    if ( RE.test( str ) ) {
        // Do something...
    }
}

beep();
```

##### Enforcement

Code review.

<!-- </rule> -->

<!-- <rule> -->

### Rule: Document regular expressions

##### Reason

Regular expressions are error prone and difficult to understand without thorough examination.

##### Good Example

<!-- eslint-disable no-useless-escape -->

```javascript
/**
* Matches parts of a regular expression string.
*
* Regular expression: `/^\/((?:\\\/|[^\/])+)\/([imgy]*)$/`
*
* `/^\/`
*
* -   match a string that begins with a `/`
*
* `()`
*
* -   capture
*
* `(?:)+`
*
* -   capture, but do not remember, a group of characters which occur one or more times
*
* `\\\/`
*
* -   match the literal `\/`
*
* `|`
*
* -   OR
*
* `[^\/]`
*
* -   anything which is not the literal `\/`
*
* `\/`
*
* -   match the literal `/`
*
* `([imgy]*)`
*
* -   capture any characters matching `imgy` occurring zero or more times
*
* `$/`
*
* -   string end
*
* @constant
* @type {RegExp}
* @default /^\/((?:\\\/|[^\/])+)\/([imgy]*)$/
*/
var RE = /^\/((?:\\\/|[^\/])+)\/([imgy]*)$/;
```

##### Enforcement

Code review.

<!-- </rule> -->

<!-- </rule-set> -->

<!-- <rule-set> -->

* * *

## Blocks

<!-- <rule> -->

### Rule: Use curly braces

##### Reason

Not using them is a common source of bugs.

##### Bad Example

<!-- eslint-disable curly -->

```javascript
// Do not...
function beep() {
    if ( foo === bar ) return true;
}
```

##### Good Example

```javascript
// Do...
function beep() {
    if ( foo === bar ) {
        return true;
    }
}
```

##### Enforcement

ESLint rule: [`curly`][eslint-curly]

<!-- </rule> -->

<!-- <rule> -->

### Rule: Place leading brace on same line

##### Reason

Avoids unnecessary newline character.

##### Bad Example

```javascript
// Do not...
if ( foo === bar )
{
    // Do something...
}

function query()
{
    // Do something...
}
```

##### Good Example

```javascript
// Do...
if ( foo === bar ) {
    // Do something...
}

function query() {
    // Do something...
}
```

##### Enforcement

ESLint rule: [`brace-style`][eslint-brace-style]

<!-- </rule> -->

<!-- <rule> -->

### Rule: Early return

##### Reason

Doing so reduces code branching and indentation.

##### Bad Example

```javascript
// Do not...
function foo( value ) {
    var str;
    if ( value === 'bar' ) {
        str = 'Hello';
    } else {
        str = 'Goodbye';
    }
    return str;
}
```

##### Good Example

```javascript
// Do...
function foo( value ) {
    if ( value === 'bar' ) {
        return 'Hello';
    }
    return 'Goodbye';
}
```

##### Enforcement

Code review.

<!-- </rule> -->

<!-- <rule> -->

### Rule: Early continue

##### Reason

Reduces code branching and indentation.

##### Bad Example

```javascript
// Do not...
for ( var i = 0; i < 10; i++ ) {
    if ( i !== 5 ) {
        // Do something...
    }
}
```

##### Good Example

```javascript
// Do...
for ( var i = 0; i < 10; i++ ) {
    if ( i === 5 ) {
        continue;
    }
    // Do something...
}
```

##### Enforcement

Code review.

<!-- </rule> -->

<!-- </rule-set> -->

<!-- <rule-set> -->

* * *

## Equality

<!-- <rule> -->

### Rule: Use strict equality

##### Reason

Not enforcing type equality is a source of bugs.

##### Bad Example

<!-- eslint-disable eqeqeq -->

```javascript
// Do not...
if ( foo != bar ) {
    // Do something...
}
```

##### Good Example

```javascript
// Do...
if ( foo === bar ) {
    // Do something...
}
```

##### Enforcement

ESLint rule: [`eqeqeq`][eslint-eqeqeq]

<!-- </rule> -->

<!-- </rule-set> -->

<!-- <rule-set> -->

* * *

## Errors

<!-- <rule> -->

### Rule: Provide descriptive error messages

##### Reason

Simplifies debugging.

##### Bad Example

```javascript
// Do not...
var err = new Error( '1' );
```

##### Good Example

```javascript
// Do...
var err = new TypeError( 'invalid argument. Window option must be a positive integer. Value: `' + value + '`.' );
```

##### Enforcement

Code review.

<!-- </rule> -->

<!-- <rule> -->

### Rule: Fail fast

##### Reason

Throw and provide tailored `error` messages if expected conditions are not met. Doing so facilitates debugging and eases code maintenance (see [programmer errors](https://www.joyent.com/developers/node/design/errors)).

##### Bad Example

```javascript
// Don't...

/**
* Beep boop.
*
* @param {Function} clbk - callback
*/
function boop( clbk ) {
    clbk();
}
```

##### Good Example

```javascript
// Do...

/**
* Beep boop.
*
* @param {Function} clbk - callback
*/
function beep( clbk ) {
    if ( !arguments.length ) {
        throw new Error( 'insufficient input arguments. Must provide a callback function.' );
    }
    clbk();
}
```

##### Enforcement

Code review.

<!-- </rule> -->

<!-- <rule> -->

### Rule: Perform dynamic type checking

##### Reason

For public facing APIs, dynamic type checking makes contracts explicit, facilitates testing, and helps mitigate the presence of subtle bugs.

##### Bad Example

```javascript
// Do not...
function bar( opts ) {
    // What happens if `opts` or `opts.ssl` are not objects???
    var key = opts.ssl.key;
}
```

##### Good Example

```javascript
// Do...
function foo( opts ) {
    if ( !isObject( opts ) ) {
        throw new TypeError( 'invalid argument. Options argument must be an object. Value: `' + opts + '`.' );
    }
}
```

##### Notes

-   When performing dynamic type checks, **always** include the invalid value in the `error` message. Doing so makes debugging and logging easier.

    ```javascript
    // Do...
    function bop( len ) {
        if ( !isPositiveInteger( len ) ) {
            throw new TypeError( 'invalid argument. Length must be a positive integer. Value: `' + len + '`.' );
        }
    }

    // Do not...
    function bap( len ) {
        if ( !isPositiveInteger( len ) ) {
            throw new Error( 'invalid value.' );
        }
    }
    ```

##### Enforcement

-   Unit tests
-   Code review

<!-- </rule> -->

<!-- <rule> -->

### Rule: Never trap uncaught exceptions

##### Reason

Not crashing upon encountering an [`uncaughtException`][uncaught-exception] leaves your application in an undefined state and can result in memory leaks.

##### Bad Example

```javascript
// DO NOT...
function onError( error ) {
    console.error( 'Caught exception. Err: %s', error.message );
}
process.on( 'uncaughtException', onError );
```

##### Okay Example

<!-- eslint-disable no-process-exit -->

```javascript
// Okay...
function onError( error ) {
    console.error( 'Caught exception. Err: %s', error.message );
    process.exit( 1 ); // <= THIS IS KEY!!!!
}
process.on( 'uncaughtException', onError );
```

##### Enforcement

Code review.

<!-- </rule> -->

<!-- <rule> -->

### Rule: Error-first asynchronous callbacks

##### Reason

Designing asynchronous APIs in this fashion matches the [convention][errbacks] found in Node.js core. If no `error` occurs, the first parameter when invoking the callback should be `null`.

##### Bad Example

```javascript
// Do not...
function badAsync( clbk ) {
    setTimeout( done, 1000 );
    function done() {
        clbk( 'beep' );
    }
}
```

##### Good Example

```javascript
// Do...
function goodAsync( clbk ) {
    setTimeout( done, 1000 );
    function done() {
        clbk( null, 'beep' );
    }
}
```

##### Enforcement

Code review.

<!-- </rule> -->

<!-- <rule> -->

### Rule: Return status codes

##### Reason

[Status codes][http-status-codes] provide information as to the cause and nature of an HTTP request error.

##### Bad Example

```javascript
// Do not...
response
    .send( 200 )
    .json({
        'success': false
    });
```

##### Good Example

```javascript
// Do...
response
    .status( 502 )
    .json({
        'status': 502,
        'message': 'unable to connect to remote database.'
    });
```

##### Enforcement

Code review.

<!-- </rule> -->

<!-- </rule-set> -->

<!-- <rule-set> -->

* * *

## Comments

<!-- <rule> -->

### Rule: Use multi-line comment syntax for multi-line comments

##### Reason

Fewer characters per line compared to using multiple single-line comment identifiers.

##### Bad Example

```javascript
// Do not...

// Beep boop.
//
// @param {number} x - first argument
// @param {number} y - second argument
function beep( x, y ) {
    // Do something...
}
```

##### Good Example

```javascript
// Do...

/**
* Beep boop.
*
* @param {number} x - first argument
* @param {number} y - second argument
*/
function beep( x, y ) {
    // Do something...
}
```

##### Enforcement

Code review.

<!-- </rule> -->

<!-- <rule> -->

### Rule: Use JSDoc

##### Reason

[JSDoc][jsdoc] provides structured source code documentation.

##### Bad Example

```javascript
// Do not...
function transform( str ) {
    return str + ' has been transformed.';
}
```

##### Good Example

```javascript
// Do...

/**
* String transformer.
*
* @param {string} str - string to be transformed.
* @returns {string} transformed string
*
* @example
* var out = transform( 'beep' );
* // returns 'beep has been transformed.'
*/
function transform( str ) {
    return str + ' has been transformed.';
}
```

##### Notes

-   Be sure to include parameters, parameter types, return types (if any), errors (if any can be thrown), and examples.
-   Use Markdown syntax for extended comments.

##### Enforcement

ESLint rules: [`require-jsdoc`][eslint-require-jsdoc], [`valid-jsdoc`][eslint-valid-jsdoc]

<!-- </rule> -->

<!-- <rule> -->

### Rule: use single-line comment syntax for single-line comments

##### Reason

Fewer characters than using multi-line syntax for single-line comments.

##### Bad Example

```javascript
// Do not...

/* Set the default value to null. */
var foo = bar || null;
```

##### Good Example

```javascript
// Do...

// Set the default value to null.
var foo = bar || null;
```

##### Notes

-   In general, prefer placing the comment above the comment subject and place an empty line above the comment.

    <!-- eslint-disable stdlib/empty-line-before-comment -->

    ```javascript
    // Okay for short comments (sometimes)...
    var foo = bar || null; // bar can be `0`

    // Do not...
    var beep = 'beep';
    // Comment about `boop`...
    var boop = 'boop';
    // Comment about `bap`...
    var bap = 'bap';
    ```

##### Enforcement

ESLint rule: [`stdlib/empty-line-before-comment`][eslint-stdlib-empty-line-before-comment]. Code review.

<!-- </rule> -->

<!-- <rule> -->

### Rule: Use annotations

##### Reason

Code annotations provide search identifiers.

##### FIXME

Use `// FIXME:` to annotate problems.

<!-- eslint-disable no-warning-comments -->

```javascript
function foo() {
    // FIXME: misses the case where value is 0. Want to check if value is not numeric.
    if ( !value ) {
        return false;
    }
}
```

##### TODO

Use `// TODO:` to annotate tasks.

<!-- eslint-disable no-warning-comments -->

```javascript
function Ctor() {
    // TODO: make `name` property value publicly accessible.
    this.name = 'foobar';

    return this;
}
```

##### HACK

Use `// HACK:` to annotate fragile/non-general solutions.

<!-- eslint-disable no-warning-comments -->

```javascript
// HACK: temporary fix; host and port should be abstracted to another module handling configuration.
var host = '127.0.0.1';
var port = 7331;
```

##### WARNING

Use `// WARNING:` to annotate possible gotchas/pitfalls.

<!-- eslint-disable no-warning-comments -->

```javascript
// WARNING: shared reference of a mutable object; possible side effects.
var a = b = {};
```

##### OPTIMIZE

Use `// OPTIMIZE:` to annotate code which needs optimizing.

<!-- eslint-disable no-warning-comments -->

```javascript
// OPTIMIZE: use a loop rather than recursion
function factorial( x ) {
    if ( x <= 1 ) {
        return 1;
    }
    return x * factorial( x-1 );
}
```

##### NOTE

Use `// NOTE:` to annotate questions, comments, or anything which does not fit under `TODO`, `FIXME`, `HACK`, `WARNING`, `OPTIMIZE` which should be brought to a user's attention.

<!-- eslint-disable stdlib/no-builtin-math -->

```javascript
// NOTE: consider optimizing this for large arrays (len > 64K).
var arr = new Array( len );
for ( var i = 0; i < len; i++ ) {
    arr[ i ] = Math.random();
}
```

##### Enforcement

Code review.

<!-- </rule> -->

<!-- </rule-set> -->

<!-- <rule-set> -->

* * *

## Naming

<!-- <rule> -->

### Rule: Use camelCase for variables

##### Reason

Standard JavaScript convention for `functions`, `objects`, instances, and variables.

##### Bad Example

```javascript
// Do not...
function testfunction() {
    // Do something...
}

var MyObject = {};

var reallylongvariablename = 0;
```

##### Good Example

```javascript
// Do...
function testFunction() {
    // Do something...
}

var myObject = {};

var myInstance = new Ctor();
```

##### Enforcement

ESLint rule: [`camelcase`][eslint-camelcase]

<!-- </rule> -->

<!-- <rule> -->

### Rule: Use PascalCase for constructors and classes

##### Reason

Standard JavaScript convention for constructors and classes.

##### Bad Example

```javascript
// Do not...
function roboRobot() {
    this.name = 'Boop';
    return this;
}

var robo = new roboRobot();
```

##### Good Example

```javascript
// Do...
function RoboRobot() {
    this.name = 'Beep';
    return this;
}

var robo = new RoboRobot();
```

##### Enforcement

ESLint rule: [`new-cap`][eslint-new-cap]

<!-- </rule> -->

<!-- <rule> -->

### Rule: Prefix private properties with an underscore

##### Reason

Standard JavaScript convention when naming private properties.

##### Bad Example

```javascript
// Do not...
function Robot() {
    this.__private__ = true;
    this.private_ = true;
    return this;
}
```

##### Good Example

```javascript
// Do...
function Robot() {
    this._private = true;
    return this;
}
```

##### Enforcement

ESLint rule: [`no-underscore-dangle`][eslint-no-underscore-dangle]

<!-- </rule> -->

<!-- <rule> -->

### Rule: Name all functions

##### Reason

Named `functions` are easier to find in stack traces and consequently debug.

##### Bad Example

<!-- eslint-disable no-restricted-syntax, func-names -->

```javascript
// Do not...
request({
    'method': 'GET',
    'uri': 'http://127.0.0.1'
}, function ( error, response, body ) {
    if ( error ) {
        throw error;
    }
    // Do something...
});
```

##### Good Example

```javascript
// Do...
function onResponse( error, response, body ) {
    if ( error ) {
        throw error;
    }
    // Do something...
}

request({
    'method': 'GET',
    'uri': 'http://127.0.0.1'
}, onResponse );
```

##### Bad Example

<!-- eslint-disable no-restricted-syntax, arrow-body-style, arrow-parens -->

```javascript
// Do not...
var arr = [ 1, 2, 3 ];
var out = arr.map( x => x * x );
```

##### Good Example

```javascript
// Do...
function square( x ) {
    return x * x;
}
var arr = [ 1, 2, 3 ];
var out = arr.map( square );
```

##### Enforcement

ESLint rule: [`func-names`][eslint-func-names]

<!-- </rule> -->

<!-- <rule> -->

### Rule: Use all CAPS for constants

##### Reason

Standard JavaScript convention when naming constants. Using all capital letters provides a visual identifier as to a variable's nature when reading source code.

##### Bad Example

```javascript
// Do not...
var value = 3.14;
```

##### Good Example

```javascript
// Do...
var VALUE = 3.14;
```

##### Bad Example

```javascript
// Do not...
const value = 3.14;
```

##### Good Example

```javascript
// Do...
const VALUE = 3.14;
```

##### Enforcement

Code review.

<!-- </rule> -->

<!-- </rule-set> -->

<!-- <rule-set> -->

* * *

## This

### Rule: Use self

##### Reason

Common JavaScript convention when caching a reference to `this`.

##### Good Example

```javascript
// Do...
function Robot( name ) {
    var self = this;
    if ( !(this instanceof Robot) ) {
        return new Robot( name );
    }
    this.name = name;
    this.greet = greet;

    return this;

    function greet() {
        return 'Hello! My name is ' + self.name + '.';
    }
}
```

##### Enforcement

ESLint rule: [`consistent-this`][eslint-consistent-this]

<!-- </rule> -->

<!-- <rule> -->

### Rule: Avoid using bind

##### Reason

The use of `bind` incurs a significant performance penalty (TODO: ref). Appropriate use of closures can accomplish the same result without performance penalties.

##### Bad Example

```javascript
// Do not...
function greet() {
    return this.name;
}

function Robot() {
    var fcn;
    if ( !(this instanceof Robot) ) {
        return new Robot();
    }
    this.name = 'Beep';
    this.greet = greet.bind( this );
    return this;
}
```

##### Good Example

```javascript
// Do...
function greeting( ctx ) {
    return greet;

    function greet() {
        return 'Hello! My name is ' + ctx.name + '.';
    }
}

function Robot() {
    if ( !(this instanceof Robot) ) {
        return new Robot();
    }
    this.name = 'Beep';
    this.greet = greeting( this );
    return this;
}
```

##### Enforcement

Code review.

<!-- </rule> -->

<!-- </rule-set> -->

<!-- <rule-set> -->

* * *

## Classes

### Rule: Allow class instantiation without new operator

##### Reason

Allows class consumers to alias the class constructor.

##### Bad Example

```javascript
// Do not...
function Robot() {
    return this;
}

// Alias:
var createRobot = Robot;

var robo = createRobot(); // => fails
```

##### Good Example

```javascript
// Do...
function Robot() {
    if ( !(this instanceof Robot) ) {
        return new Robot();
    }
    return this;
}

// Alias:
var createRobot = Robot;

var robo = createRobot();
```

##### Enforcement

-   Unit tests
-   Code review

<!-- </rule> -->

<!-- </rule-set> -->

<!-- <rule-set> -->

* * *

## Setters and Getters

<!-- <rule> -->

### Rule: Combine set/get into single method

##### Reason

Simplifies a class interface.

##### Bad Example

<!-- eslint-disable no-restricted-syntax -->

```javascript
// Do not...
Robot.prototype.setName = function set( name ) {
    if ( typeof name !== 'string' ) {
        throw new Error( 'invalid input value. Name must be a string. Value: `' + name + '`.' );
    }
    this._name = name;
    return this;
};

Robot.prototype.getName = function get() {
    return this._name;
};
```

##### Good Example

<!-- eslint-disable no-restricted-syntax -->

```javascript
// Do...
Robot.prototype.name = function robotName( name ) {
    if ( !arguments.length ) {
        return this._name;
    }
    if ( typeof name !== 'string' ) {
        throw new Error( 'invalid input value. Name must be a string. Value: `' + name + '`.' );
    }
    this._name = name;
    return this;
};
```

##### Enforcement

Code review.

<!-- </rule> -->

<!-- <rule> -->

### Rule: Perform dynamic type checking

##### Reason

While checks do incur computational cost, not providing such checks can entail a considerable drain on a developer's time. Subtle bugs can arise from using unexpected types. Be explicit in what you expect and write tests confirming your expectations. Your stringency helps other developers debug their own code.

##### Bad Example

<!-- eslint-disable no-restricted-syntax -->

```javascript
// Do not...
Stream.prototype.window = function streamWindow( win ) {
    if ( !arguments.length ) {
        return this._window;
    }
    this._window = win;
    return this;
};
```

##### Good Example

<!-- eslint-disable no-restricted-syntax, stdlib/no-builtin-math -->

```javascript
// Do...
Stream.prototype.window = function streamWindow( win ) {
    if ( !arguments.length ) {
        return this._window;
    }
    if ( typeof win !== 'number' || win !== win ) {
        throw new Error( 'invalid argument. Window size must be numeric. Value: `' + win + '`.' );
    }
    if ( Math.floor( win ) !== win || win <= 0 ) {
        throw new Error( 'invalid argument. Window size must be a positive integer. Value: `' + win + '`.' );
    }
    this._window = win;
    return this;
};
```

##### Enforcement

Code review.

<!-- </rule> -->

<!-- </rule-set> -->

<!-- <rule-set> -->

* * *

## Method Chaining

<!-- <rule> -->

### Rule: Create fluent interfaces by returning this context

##### Reason

Returning `this` enables method chaining and creates a [fluent interface][fluent-interface]. Such interfaces provide a terse syntax for describing flow.

##### Good Example

<!-- eslint-disable no-restricted-syntax -->

```javascript
function Robot() {
    if ( !(this instanceof Robot) ) {
        return new Robot();
    }
    this._name = '';
    this._color = 'black';
    return this;
}

Robot.prototype.name = function robotName( name ) {
    if ( !arguments.length ) {
        return this._name;
    }
    if ( typeof name !== 'string' ) {
        throw new Error( 'invalid input value.' );
    }
    this._name = name;
    return this;
};

Robot.prototype.color = function robotColor( color ) {
    if ( !arguments.length ) {
        return this._color;
    }
    if ( typeof color !== 'string' ) {
        throw new Error( 'invalid input value.' );
    }
    this._color = color;
    return this;
};

var robo = new Robot();

robo.name( 'Robo' )
    .color( 'pink' );
```

##### Enforcement

Code review.

<!-- </rule> -->

<!-- </rule-set> -->

<!-- <rule-set> -->

* * *

## Documentation

<!-- <rule> -->

### Rule: Always document source code

##### Reason

Code is read more often than it is written. Prefer too much documentation to too little.

##### Bad Example

<!-- eslint-disable valid-jsdoc -->

```javascript
// Do not...

/**
* Calculates auto-correlation.
*/
function autocorr( vector ) {
    // Calculate...
}
```

##### Good Example

<!-- eslint-disable valid-jsdoc -->

```javascript
// Do...

/**
* Calculate the auto-correlation of an input vector. To calculate the auto-correlation using an FFT, the data is padded to have length 2^n, where `n` is the next power of 2 greater than the vector length. For more details, consult [link][link].
*
* [link]: http://example.com
*
* @param {number[]} vector - 1d array
* @returns {number} auto-correlation
*
* @example
* var arr = [ 1, 6, 5, 4, 7, 2, 3, 1 ];
* var v = autocorr( arr );
*/
function autocorr( vector ) {
    // Calculate...
}
```

##### Notes

-   For client-side JavaScript, if you are concerned about file size, build/include a distributable file, stripped of comments and minified. Keep source code annotated.
-   **Always** include example/demo code that is easily runnable.
-   Do **not** claim that your code is self-documenting. Your code is not. **Period.**
-   Do **not** rely on tests as your **sole** source of documentation. While tests are documentation, annotating your source provides greater insight and a means to explain why you made particular design choices.
-   **Always** make your documentation **beautiful**. Take as much pride in your documentation as you do in your code.

##### Enforcement

Code review.

<!-- </rule> -->

<!-- </rule-set> -->

<!-- <rule-set> -->

* * *

## Performance

<!-- <rule> -->

### Rule: Prefer simplicity and readability

##### Reason

Performance optimization, particularly of the premature variety, often comes with the cost of obscuring implementation details and the presence of more bugs.

##### Bad Example

```javascript
// Do not...
var y = ( x >> 0 );

// Avoid using a bitshift unless you really need to. Possible subtle bug in the above is that `x` is converted to a signed 32-bit integer.
```

##### Good Example

<!-- eslint-disable stdlib/no-builtin-math -->

```javascript
// Do...
var y = Math.floor( x );
```

##### Notes

-   Take JSPerf tests with a grain of salt, as results can vary significantly from browser to browser and across browser versions.

##### Enforcement

Code review.

<!-- </rule> -->

<!-- </rule-set> -->

<!-- <rule-set> -->

* * *

## Modularity

### Rule: Do one thing, do one thing well

##### Reason

Testing, debugging, maintainability, composition, focused interfaces, and interchangeability.

##### Notes

-   Every file within a Node module should be **less than** `200` lines of code. The only exceptions are tests files, which are generally 2-3x the length of the files they test. If a file is longer than `200` lines, the code is undoubtedly too complex, not maintainable, hard to test, and needs to be refactored into smaller sub-modules. Ideally, an individual file should **never** be longer than `80` lines.
-   Prefer only **1** `function` per file. A file which contains fewer functions is easier to test, read, and maintain. This is particularly **true** for Node modules.
-   **Always** bear in mind the single responsibility principle.
-   **Always** strive for reusability.

##### Enforcement

-   Look for parts of an implementation which can be extracted into reusable components.
-   Code review 

<!-- </rule> -->

<!-- </rule-set> -->

<!-- <rule-set> -->

* * *

## Client-side JavaScript

### Rule: Prefer native equivalents

##### Reason

Relying on monolithic libraries, such as jQuery, for DOM manipulation leads to code bloat. Often the functionality provided by such libraries can be accomplished using either native JavaScript [equivalents][native-dom-equivalents] or a small, focused library.

##### Bad Example

```javascript
// Do not...
var el = jQuery( '#main' );
```

##### Good Example

```javascript
// Do...
var el = document.querySelector( '#main' );
```

##### Enforcement

Code review.

<!-- </rule> -->

<!-- <rule> -->

### Rule: Wrap in immediately invoked function expressions

##### Reason

Prevents variable leakage.

##### Good Example

<!-- eslint-disable no-restricted-syntax -->

```javascript
// Do...
(function foo() {
    'use strict';

    var beep = 'boop';

    // ...
})();
```

##### Enforcement

Code review.

<!-- </rule> -->

<!-- <rule> -->

### Rule: Namespace global variables

##### Reason

Helps minimize global variable name collisions.

##### Bad Example

<!-- eslint-disable no-restricted-syntax -->

```javascript
// Do not...
window.start = function start() {
    // Do something...
};
window.name = 'App';
```

##### Good Example

<!-- eslint-disable no-restricted-syntax -->

```javascript
// Do...
var myApp = {};
myApp.name = 'App';
myApp.start = function start() {
    // Do something...
};

window.myApp = myApp;
```

##### Enforcement

Code review.

<!-- </rule> -->

<!-- </rule-set> -->

<!-- <rule-set> -->

* * *

## Dependencies

<!-- <rule> -->

### Rule: Avoid large dependencies

##### Reason

Often, more focused modules are available which can accomplish the same task. In general, be **explicit** in what you require.

##### Notes

-   In particular, avoid the following libraries:

    -   underscore
    -   lodash
    -   async

##### Enforcement

Code review.

<!-- </rule> -->

<!-- <rule> -->

### Rule: Vet any dependencies used

##### Reason

Any dependency you use becomes **your** responsibility. Demand the same level of robustness and correctness in your dependencies as you do in your code.

##### Notes

-   While GitHub stars and downloads are rough indicators, place more emphasis on the following:

    -   Code quality

        -   conciseness
        -   maintainability

    -   Documentation

        -   APIs
        -   examples

    -   Test cases

-   For most cases, do **not** place much weight on how recently the module was updated. Small, focused, well-written modules should not require much updating.

##### Enforcement

Code review.

<!-- </rule> -->

<!-- </rule-set> -->

<!-- <rule-set> -->

* * *

## Best Practices

<!-- <rule> -->

### Rule: No eval

##### Reason

`eval` introduces security risks and makes code harder to debug and optimize.

##### Enforcement

ESLint rule: [`no-eval`][eslint-no-eval]

<!-- </rule> -->

<!-- <rule> -->

### Rule: No extending native prototypes

##### Reason

Modifying native prototypes can cause unexpected behavior for other code that depends on them.

##### Enforcement

ESLint rule: [`no-extend-native`][eslint-no-extend-native]

<!-- </rule> -->

<!-- <rule> -->

### Rule: Guard for-in loops

##### Reason

`for...in` iterates over inherited properties. Always use `hasOwnProperty` to filter.

##### Bad Example

<!-- eslint-disable guard-for-in -->

```javascript
// Do not...
var key;
for ( key in obj ) {
    console.log( key );
}
```

##### Good Example

```javascript
// Do...
var key;
for ( key in obj ) {
    if ( hasOwnProp( obj, key ) ) {
        console.log( key );
    }
}
```

##### Enforcement

ESLint rule: [`guard-for-in`][eslint-guard-for-in]

<!-- </rule> -->

<!-- <rule> -->

### Rule: Switch statements must have a default case

##### Reason

Ensures all branches are handled explicitly. The default case should be last.

##### Enforcement

ESLint rules: [`default-case`][eslint-default-case], [`default-case-last`][eslint-default-case-last]

<!-- </rule> -->

<!-- <rule> -->

### Rule: Throw Error objects, not literals

##### Reason

Error objects capture a stack trace, which is essential for debugging.

##### Bad Example

<!-- eslint-disable no-throw-literal -->

```javascript
// Do not...
throw 'error';
throw 0;
throw { 'message': 'error' };
```

##### Good Example

```javascript
// Do...
throw new Error( 'something went wrong.' );
throw new TypeError( 'invalid argument. Must provide a string.' );
```

##### Enforcement

ESLint rule: [`no-throw-literal`][eslint-no-throw-literal]

<!-- </rule> -->

<!-- <rule> -->

### Rule: Always provide radix to parseInt

##### Reason

Omitting the radix can lead to unexpected results, especially with strings starting with `0`.

##### Bad Example

<!-- eslint-disable radix -->

```javascript
// Do not...
var num = parseInt( '071' );
```

##### Good Example

```javascript
// Do...
var num = parseInt( '071', 10 );
```

##### Enforcement

ESLint rule: [`radix`][eslint-radix]

<!-- </rule> -->

<!-- <rule> -->

### Rule: No floating decimal points

##### Reason

Floating decimal points make numbers harder to distinguish from the `.` operator.

##### Bad Example

<!-- eslint-disable no-floating-decimal -->

```javascript
// Do not...
var x = .5;
var y = 2.;
```

##### Good Example

```javascript
// Do...
var x = 0.5;
var y = 2.0;
```

##### Enforcement

ESLint rule: [`no-floating-decimal`][eslint-no-floating-decimal]

<!-- </rule> -->

<!-- <rule> -->

### Rule: No new wrappers for primitives

##### Reason

Using `new` with `String`, `Number`, or `Boolean` creates wrapper objects, which behave unexpectedly with `typeof` checks.

##### Enforcement

ESLint rule: [`no-new-wrappers`][eslint-no-new-wrappers]

<!-- </rule> -->

<!-- <rule> -->

### Rule: No increment/decrement operators outside of for loops

##### Reason

Using `++` and `--` as standalone statements can be error-prone due to automatic semicolon insertion. They are acceptable within `for` loop update expressions.

##### Bad Example

<!-- eslint-disable no-plusplus -->

```javascript
// Do not...
var x = 1;
x++;
```

##### Good Example

```javascript
// Do...
var x = 1;
x += 1;
```

##### Enforcement

ESLint rule: [`no-plusplus`][eslint-no-plusplus]

<!-- </rule> -->

<!-- <rule> -->

### Rule: Always quote object property names

##### Reason

Quoting all property names ensures consistency and avoids confusion about which property names require quoting (e.g., reserved words, names with hyphens).

##### Bad Example

<!-- eslint-disable quote-props -->

```javascript
// Do not...
var obj = {
    foo: true,
    bar: 'baz'
};
```

##### Good Example

```javascript
// Do...
var obj = {
    'foo': true,
    'bar': 'baz'
};
```

##### Enforcement

ESLint rule: [`quote-props`][eslint-quote-props]

<!-- </rule> -->

<!-- <rule> -->

### Rule: No nested ternary operators

##### Reason

Nested ternary operators decrease readability significantly. Use `if`/`else` instead.

##### Enforcement

ESLint rule: [`no-nested-ternary`][eslint-no-nested-ternary]

<!-- </rule> -->

<!-- <rule> -->

### Rule: No use of undefined

##### Reason

Use `void 0` instead of `undefined` if an explicit `undefined` value is needed, or simply leave a variable uninitialized. The identifier `undefined` can be shadowed in older environments.

##### Bad Example

<!-- eslint-disable no-undefined, no-undef-init -->

```javascript
// Do not...
var x = undefined;
```

##### Good Example

```javascript
// Do...
var x;
```

##### Enforcement

ESLint rules: [`no-undefined`][eslint-no-undefined], [`no-undef-init`][eslint-no-undef-init]

<!-- </rule> -->

<!-- </rule-set> -->

<!-- <rule-set> -->

* * *

## Code Complexity

The following limits are enforced to keep code maintainable and readable.

<!-- <rule> -->

### Rule: Maximum line length of 80 characters

##### Reason

Long lines hinder readability, especially in side-by-side diffs. Comments, URLs, strings, template literals, and regular expressions are excluded from this limit.

##### Enforcement

ESLint rule: [`max-len`][eslint-max-len] (warning)

<!-- </rule> -->

<!-- <rule> -->

### Rule: Maximum nesting depth of 5

##### Reason

Deeply nested code is difficult to read and often signals that the code should be refactored.

##### Enforcement

ESLint rule: [`max-depth`][eslint-max-depth]

<!-- </rule> -->

<!-- <rule> -->

### Rule: Maximum 300 lines per file

##### Reason

Large files are harder to navigate, understand, and test. Prefer splitting into smaller, focused modules.

##### Notes

-   Blank lines and comments are excluded from the count.

##### Enforcement

ESLint rule: [`max-lines`][eslint-max-lines] (warning)

<!-- </rule> -->

<!-- <rule> -->

### Rule: Maximum 200 lines per function

##### Reason

Long functions are difficult to understand and test. Prefer extracting logic into smaller helper functions.

##### Notes

-   Blank lines, comments, and IIFEs are excluded from the count.

##### Enforcement

ESLint rule: [`max-lines-per-function`][eslint-max-lines-per-function] (warning)

<!-- </rule> -->

<!-- <rule> -->

### Rule: Maximum 10 function parameters

##### Reason

A large number of parameters suggests that a function is doing too much or that an options object should be used instead.

##### Enforcement

ESLint rule: [`max-params`][eslint-max-params]

<!-- </rule> -->

<!-- <rule> -->

### Rule: Maximum 3 nested callbacks

##### Reason

Excessive nesting of callbacks makes code difficult to follow. Prefer named functions or control flow utilities.

##### Enforcement

ESLint rule: [`max-nested-callbacks`][eslint-max-nested-callbacks]

<!-- </rule> -->

<!-- </rule-set> -->

<!-- <rule-set> -->

* * *

## Node.js Conventions

The following rules apply to Node.js and CommonJS code.

<!-- <rule> -->

### Rule: Use module.exports

##### Reason

Using `module.exports` instead of `exports` avoids a common source of confusion where reassigning `exports` breaks the module.

##### Bad Example

```javascript
// Do not...
exports.foo = 1;
exports.bar = 2;
```

##### Good Example

```javascript
// Do...
module.exports = {
    'foo': 1,
    'bar': 2
};
```

##### Enforcement

ESLint rule: [`node/exports-style`][eslint-node-exports-style]

<!-- </rule> -->

<!-- <rule> -->

### Rule: Use path.join for file paths

##### Reason

String concatenation for paths is fragile and platform-dependent.

##### Bad Example

```javascript
// Do not...
var foo = require( __dirname + '/foo.js' );
```

##### Good Example

```javascript
// Do...
var join = require( 'path' ).join;
var foo = require( join( __dirname, 'foo.js' ) );
```

##### Enforcement

ESLint rule: [`node/no-path-concat`][eslint-node-no-path-concat]

<!-- </rule> -->

<!-- <rule> -->

### Rule: Handle callback errors

##### Reason

Ignoring error arguments in callbacks can mask bugs and lead to silent failures.

##### Enforcement

ESLint rule: [`node/handle-callback-err`][eslint-node-handle-callback-err]

<!-- </rule> -->

<!-- <rule> -->

### Rule: Return callbacks to prevent multiple invocations

##### Reason

When a callback is called inside a conditional branch, failing to `return` after the call can result in the callback being invoked more than once.

##### Bad Example

```javascript
// Do not...
function foo( x, clbk ) {
    if ( x === true ) {
        clbk();
    }
    clbk();
}
```

##### Good Example

```javascript
// Do...
function foo( x, clbk ) {
    if ( x === true ) {
        return clbk();
    }
    clbk();
}
```

##### Enforcement

ESLint rule: [`node/callback-return`][eslint-node-callback-return]

<!-- </rule> -->

<!-- <rule> -->

### Rule: Avoid process.env

##### Reason

Use the `@stdlib` environment utilities rather than accessing `process.env` directly.

##### Enforcement

ESLint rule: [`node/no-process-env`][eslint-node-no-process-env]

<!-- </rule> -->

<!-- <rule> -->

### Rule: No new require

##### Reason

Using `new` with `require` combines two operations and is confusing.

##### Bad Example

```javascript
// Do not...
var foo = new require( 'foo' );
```

##### Good Example

```javascript
// Do...
var Foo = require( 'foo' );
var foo = new Foo();
```

##### Enforcement

ESLint rule: [`node/no-new-require`][eslint-node-no-new-require]

<!-- </rule> -->

<!-- </rule-set> -->

<!-- <rule-set> -->

* * *

## ES2015 Restrictions

This project targets Node.js 0.12+ compatibility and prefers ES5-era constructs. The following ES2015+ features are restricted.

<!-- <rule> -->

### Rule: No object shorthand

##### Reason

Shorthand notation decreases readability in complex objects. Prefer making key-value pairs explicit.

##### Enforcement

ESLint rule: [`object-shorthand`][eslint-object-shorthand] (set to `never`)

<!-- </rule> -->

<!-- <rule> -->

### Rule: No restricted syntax

##### Reason

Several ES2015+ syntactic constructs are restricted to maintain ES5 compatibility and stylistic consistency: arrow functions, class declarations, class expressions, destructuring, `for...of` loops, generators, rest/spread elements, `import`/`export` declarations, and tagged template expressions.

##### Enforcement

ESLint rule: [`no-restricted-syntax`][eslint-no-restricted-syntax]

<!-- </rule> -->

<!-- <rule> -->

### Rule: Restricted imports

##### Reason

To maintain the project's philosophy of small, focused modules, the following packages may not be imported or required: `lodash`, `underscore`, and `async`.

##### Enforcement

ESLint rules: [`no-restricted-imports`][eslint-no-restricted-imports], [`node/no-restricted-require`][eslint-node-no-restricted-require]

<!-- </rule> -->

<!-- </rule-set> -->

<!-- <rule-set> -->

* * *

## stdlib Custom Rules

The project includes custom ESLint rules specific to stdlib conventions. These are defined in `etc/eslint/rules/stdlib.js`.

### Comments and Formatting

<!-- <rule> -->

### Rule: Capitalize comments

##### Reason

Consistent capitalization improves readability and professionalism. Certain whitelisted terms (e.g., `eslint`, `ndarray`, `stdlib`) are excepted.

##### Bad Example

<!-- eslint-disable stdlib/capitalized-comments -->

```javascript
// Do not...
function square( x ) {
    var out;

    // square the number:
    out = x * x;
    return out;
}
```

##### Good Example

```javascript
// Do...
function square( x ) {
    var out;

    // Square the number:
    out = x * x;
    return out;
}
```

##### Enforcement

ESLint rule: [`stdlib/capitalized-comments`][eslint-stdlib-capitalized-comments] (warning)

<!-- </rule> -->

<!-- <rule> -->

### Rule: Empty line before comments

##### Bad Example

<!-- eslint-disable stdlib/empty-line-before-comment -->

```javascript
// Do not...
function square( x ) {
    var out;
    // Square the number:
    out = x * x;
    return out;
}
```

##### Good Example

```javascript
// Do...
function square( x ) {
    var out;

    // Square the number:
    out = x * x;
    return out;
}
```

##### Enforcement

ESLint rule: [`stdlib/empty-line-before-comment`][eslint-stdlib-empty-line-before-comment]

<!-- </rule> -->

<!-- <rule> -->

### Rule: No empty comments

##### Bad Example

<!-- eslint-disable stdlib/no-empty-comments -->

```javascript
// Do not...
function square( x ) {
    var out;

    //
    out = x * x;
    return out;
}
```

##### Good Example

```javascript
// Do...
function square( x ) {
    var out;

    // Square the number:
    out = x * x;
    return out;
}
```

##### Enforcement

ESLint rule: [`stdlib/no-empty-comments`][eslint-stdlib-no-empty-comments]

<!-- </rule> -->

<!-- <rule> -->

### Rule: Use section headers to organize code

##### Reason

Section header comments (e.g., `// MAIN //`, `// EXPORTS //`) organize source files into clearly delineated sections.

##### Bad Example

<!-- eslint-disable stdlib/section-headers -->

```javascript
// Do not...

// EXPORTS

module.exports = {};
```

##### Good Example

```javascript
// Do...

// EXPORTS //

module.exports = {};
```

##### Enforcement

ESLint rule: [`stdlib/section-headers`][eslint-stdlib-section-headers]

<!-- </rule> -->

<!-- <rule> -->

### Rule: Empty lines around section headers

##### Bad Example

<!-- eslint-disable stdlib/section-header-empty-lines -->

```javascript
// Do not...

// EXPORTS //
module.exports = {};
```

##### Good Example

```javascript
// Do...

// EXPORTS //

module.exports = {};
```

##### Enforcement

ESLint rule: [`stdlib/section-header-empty-lines`][eslint-stdlib-section-header-empty-lines]

<!-- </rule> -->

### Doctest Conventions

<!-- <rule> -->

### Rule: Doctest return annotations must match actual output

##### Bad Example

```javascript
// Do not...
/**
* Squares a number.
*
* @param {number} x - input value
* @returns {number} x*x
*
* @example
* var y = square( 3.0 );
* // returns 12.0
*/
function square( x ) {
    return x * x;
}
```

##### Good Example

```javascript
// Do...
/**
* Squares a number.
*
* @param {number} x - input value
* @returns {number} x*x
*
* @example
* var y = square( 3.0 );
* // returns 9.0
*/
function square( x ) {
    return x * x;
}
```

##### Enforcement

ESLint rule: [`stdlib/jsdoc-doctest`][eslint-stdlib-jsdoc-doctest]

<!-- </rule> -->

<!-- <rule> -->

### Rule: Doctest return annotations for real values must include decimal points

##### Bad Example

```javascript
// Do not...
/**
* @example
* var y = square( 3.0 );
* // returns 9
*/
```

##### Good Example

```javascript
// Do...
/**
* @example
* var y = square( 3.0 );
* // returns 9.0
*/
```

##### Enforcement

ESLint rule: [`stdlib/jsdoc-doctest-decimal-point`][eslint-stdlib-jsdoc-doctest-decimal-point]

<!-- </rule> -->

<!-- <rule> -->

### Rule: Use correct doctest markers

##### Reason

Use `// returns` for assignment return annotations and `// =>` for `console.log` output annotations.

##### Bad Example

<!-- eslint-disable stdlib/doctest-marker -->

```javascript
// Do not...
var x = 3.0;
// => 3.0

console.log( 'Hello World' );
// returns 'Hello World'
```

##### Good Example

```javascript
// Do...
var x = 3.0;
// returns 3.0

console.log( 'Hello World' );
// => 'Hello World'
```

##### Enforcement

ESLint rules: [`stdlib/doctest-marker`][eslint-stdlib-doctest-marker], [`stdlib/jsdoc-doctest-marker`][eslint-stdlib-jsdoc-doctest-marker]

<!-- </rule> -->

<!-- <rule> -->

### Rule: Doctest annotation spacing

##### Reason

Require exactly one space between the marker and the value.

##### Bad Example

<!-- eslint-disable stdlib/doctest-annotation-spacing -->

```javascript
// Do not...
var v = 3.14;
// returns             3.14

var x = true;
//  returns true
```

##### Good Example

```javascript
// Do...
var v = 3.14;
// returns 3.14
```

##### Enforcement

ESLint rule: [`stdlib/doctest-annotation-spacing`][eslint-stdlib-doctest-annotation-spacing]

<!-- </rule> -->

<!-- <rule> -->

### Rule: Quote property names in doctest return annotations

##### Bad Example

<!-- eslint-disable stdlib/doctest-quote-props -->

```javascript
// Do not...
/* returns
    {
        a: 1,
        b: true
    }
*/
```

##### Good Example

```javascript
// Do...
/* returns
    {
        'a': 1,
        'b': true
    }
*/
```

##### Enforcement

ESLint rule: [`stdlib/doctest-quote-props`][eslint-stdlib-doctest-quote-props]

<!-- </rule> -->

### JSDoc Markdown

The project enforces extensive Markdown formatting rules within JSDoc comments.

<!-- <rule> -->

### Rule: Use 2-character blockquote indentation in JSDoc

##### Bad Example

```javascript
// Do not...
/**
* Squares a number.
*
* >   This is a blockquote.
*/
```

##### Good Example

```javascript
// Do...
/**
* Squares a number.
*
* > This is a blockquote.
*/
```

##### Enforcement

ESLint rule: [`stdlib/jsdoc-blockquote-indentation`][eslint-stdlib-jsdoc-blockquote-indentation]

<!-- </rule> -->

<!-- <rule> -->

### Rule: Use fenced code blocks in JSDoc

##### Bad Example

```javascript
// Do not...
/**
* Squares a number.
*
*     y = x;
*/
```

##### Good Example

```javascript
// Do...
/**
* Squares a number.
*
* ```javascript
* y = x;
* ```
*/
```

##### Enforcement

ESLint rule: [`stdlib/jsdoc-code-block-style`][eslint-stdlib-jsdoc-code-block-style]

<!-- </rule> -->

<!-- <rule> -->

### Rule: Fenced code blocks must specify a language

##### Bad Example

```javascript
// Do not...
/**
* Squares a number.
*
* ```
* y = x;
* ```
*/
```

##### Good Example

```javascript
// Do...
/**
* Squares a number.
*
* ```javascript
* y = x;
* ```
*/
```

##### Enforcement

ESLint rule: [`stdlib/jsdoc-fenced-code-flag`][eslint-stdlib-jsdoc-fenced-code-flag]

<!-- </rule> -->

<!-- <rule> -->

### Rule: Use backtick fenced code markers

##### Enforcement

ESLint rule: [`stdlib/jsdoc-fenced-code-marker`][eslint-stdlib-jsdoc-fenced-code-marker]

<!-- </rule> -->

<!-- <rule> -->

### Rule: Use underscore for emphasis in JSDoc

##### Bad Example

```javascript
// Do not...
/**
* Squares a *number*.
*/
```

##### Good Example

```javascript
// Do...
/**
* Squares a _number_.
*/
```

##### Enforcement

ESLint rule: [`stdlib/jsdoc-emphasis-marker`][eslint-stdlib-jsdoc-emphasis-marker]

<!-- </rule> -->

<!-- <rule> -->

### Rule: Use ATX-style headings in JSDoc

##### Enforcement

ESLint rule: [`stdlib/jsdoc-heading-style`][eslint-stdlib-jsdoc-heading-style]

<!-- </rule> -->

<!-- <rule> -->

### Rule: First heading in JSDoc must be level 2

##### Enforcement

ESLint rule: [`stdlib/jsdoc-first-heading-level`][eslint-stdlib-jsdoc-first-heading-level]

<!-- </rule> -->

<!-- <rule> -->

### Rule: JSDoc descriptions must be complete sentences

##### Enforcement

ESLint rule: [`stdlib/jsdoc-leading-description-sentence`][eslint-stdlib-jsdoc-leading-description-sentence]

<!-- </rule> -->

<!-- <rule> -->

### Rule: Require an empty line before `@example` tags

##### Enforcement

ESLint rule: [`stdlib/jsdoc-empty-line-before-example`][eslint-stdlib-jsdoc-empty-line-before-example]

<!-- </rule> -->

<!-- <rule> -->

### Rule: Require spacing between require statements and code in JSDoc examples

##### Enforcement

ESLint rule: [`stdlib/jsdoc-example-require-spacing`][eslint-stdlib-jsdoc-example-require-spacing]

<!-- </rule> -->

<!-- <rule> -->

### Rule: Use tab-size indentation for JSDoc list items

##### Enforcement

ESLint rule: [`stdlib/jsdoc-list-item-indent`][eslint-stdlib-jsdoc-list-item-indent]

<!-- </rule> -->

<!-- <rule> -->

### Rule: No raw HTML in JSDoc

##### Enforcement

ESLint rule: [`stdlib/jsdoc-no-html`][eslint-stdlib-jsdoc-no-html]

<!-- </rule> -->

<!-- <rule> -->

### Rule: No literal URLs in JSDoc

##### Reason

URLs must be wrapped in angle brackets or use Markdown link syntax.

##### Enforcement

ESLint rule: [`stdlib/jsdoc-no-literal-urls`][eslint-stdlib-jsdoc-no-literal-urls]

<!-- </rule> -->

<!-- <rule> -->

### Rule: Unix linebreaks only in JSDoc

##### Enforcement

ESLint rule: [`stdlib/jsdoc-linebreak-style`][eslint-stdlib-jsdoc-linebreak-style]

<!-- </rule> -->

### Require and Module Conventions

<!-- <rule> -->

### Rule: Spaces inside require parentheses

##### Bad Example

<!-- eslint-disable stdlib/require-spaces -->

```javascript
// Do not...
var foo = require('@stdlib/foo');
```

##### Good Example

```javascript
// Do...
var foo = require( '@stdlib/foo' );
```

##### Enforcement

ESLint rule: [`stdlib/require-spaces`][eslint-stdlib-require-spaces]

<!-- </rule> -->

<!-- <rule> -->

### Rule: Require statements must follow a defined order

##### Reason

Require statements must be ordered: built-in modules first, then external packages, then `@stdlib` packages, then relative paths.

##### Bad Example

<!-- eslint-disable stdlib/require-order -->

```javascript
// Do not...
var validate = require( './validate.js' );
var math = require( '@stdlib/math' );
var debug = require( 'debug' );
var fs = require( 'fs' );
```

##### Good Example

```javascript
// Do...
var fs = require( 'fs' );
var debug = require( 'debug' );
var math = require( '@stdlib/math' );
var validate = require( './validate.js' );
```

##### Enforcement

ESLint rule: [`stdlib/require-order`][eslint-stdlib-require-order]

<!-- </rule> -->

<!-- <rule> -->

### Rule: No empty lines between require statements

##### Bad Example

<!-- eslint-disable stdlib/no-empty-lines-between-requires -->

```javascript
// Do not...
var foo = require( 'foo' );

var bar = require( 'bar' );
```

##### Good Example

```javascript
// Do...
var foo = require( 'foo' );
var bar = require( 'bar' );
```

##### Enforcement

ESLint rule: [`stdlib/no-empty-lines-between-requires`][eslint-stdlib-no-empty-lines-between-requires]

<!-- </rule> -->

<!-- <rule> -->

### Rule: Require file extensions for local paths

##### Reason

Local `require` paths must include file extensions (`.js`, `.json`, or `.node`).

##### Bad Example

<!-- eslint-disable stdlib/require-file-extensions -->

```javascript
// Do not...
var debug = require( 'debug/src/browser' );
```

##### Good Example

```javascript
// Do...
var debug = require( 'debug/src/browser.js' );
```

##### Enforcement

ESLint rule: [`stdlib/require-file-extensions`][eslint-stdlib-require-file-extensions]

<!-- </rule> -->

<!-- <rule> -->

### Rule: Require calls must be assigned to a variable

##### Bad Example

<!-- eslint-disable stdlib/no-unassigned-require -->

```javascript
// Do not...
require( '@stdlib' );
```

##### Good Example

```javascript
// Do...
var stdlib = require( '@stdlib' );
```

##### Enforcement

ESLint rule: [`stdlib/no-unassigned-require`][eslint-stdlib-no-unassigned-require]

<!-- </rule> -->

<!-- <rule> -->

### Rule: No self require

##### Bad Example

<!-- eslint-disable stdlib/no-self-require -->

```javascript
// Do not...
var self = require( __filename );
```

##### Good Example

```javascript
// Do...
var other = require( './other.js' );
```

##### Enforcement

ESLint rule: [`stdlib/no-self-require`][eslint-stdlib-no-self-require]

<!-- </rule> -->

<!-- <rule> -->

### Rule: No dynamic require

##### Reason

Require calls must use string literals, not computed expressions.

##### Bad Example

<!-- eslint-disable stdlib/no-dynamic-require -->

```javascript
// Do not...
var pkg = '@stdlib/math/base/special/betainc';
var betainc = require( pkg );
```

##### Good Example

```javascript
// Do...
var betainc = require( '@stdlib/math/base/special/betainc' );
```

##### Enforcement

ESLint rule: [`stdlib/no-dynamic-require`][eslint-stdlib-no-dynamic-require]

<!-- </rule> -->

<!-- <rule> -->

### Rule: No nested require property access

##### Bad Example

<!-- eslint-disable stdlib/no-nested-require -->

```javascript
// Do not...
var special = require( '@stdlib' ).math.base.special;
```

##### Good Example

```javascript
// Do...
var special = require( '@stdlib/math/base/special' );
```

##### Enforcement

ESLint rule: [`stdlib/no-nested-require`][eslint-stdlib-no-nested-require]

<!-- </rule> -->

<!-- <rule> -->

### Rule: No explicit index.js in require paths

##### Bad Example

<!-- eslint-disable stdlib/no-require-index -->

```javascript
// Do not...
var debug = require( 'debug/index.js' );
```

##### Good Example

```javascript
// Do...
var debug = require( 'debug' );
```

##### Enforcement

ESLint rule: [`stdlib/no-require-index`][eslint-stdlib-no-require-index]

<!-- </rule> -->

### Code Conventions

<!-- <rule> -->

### Rule: Wrap ternary conditions in parentheses

##### Bad Example

<!-- eslint-disable stdlib/ternary-condition-parentheses -->

```javascript
// Do not...
var bool = randu() > 0.5 ? 1 : 0;
```

##### Good Example

```javascript
// Do...
var bool = ( randu() > 0.5 ) ? 1 : 0;
```

##### Enforcement

ESLint rule: [`stdlib/ternary-condition-parentheses`][eslint-stdlib-ternary-condition-parentheses]

<!-- </rule> -->

<!-- <rule> -->

### Rule: No spaces between opening bracket and nested object/array at end of line

##### Bad Example

<!-- eslint-disable stdlib/eol-open-bracket-spacing -->

```javascript
// Do not...
log( {
    'foo': true
});

log( [
    1,
    2,
    3
]);
```

##### Good Example

```javascript
// Do...
log({
    'foo': true
});

log([
    1,
    2,
    3
]);
```

##### Enforcement

ESLint rule: [`stdlib/eol-open-bracket-spacing`][eslint-stdlib-eol-open-bracket-spacing]

<!-- </rule> -->

<!-- <rule> -->

### Rule: Uppercase names for required constants

##### Bad Example

<!-- eslint-disable stdlib/uppercase-required-constants -->

```javascript
// Do not...
var eps = require( '@stdlib/constants/math/float64-eps' );
```

##### Good Example

```javascript
// Do...
var EPS = require( '@stdlib/constants/math/float64-eps' );
```

##### Enforcement

ESLint rule: [`stdlib/uppercase-required-constants`][eslint-stdlib-uppercase-required-constants]

<!-- </rule> -->

<!-- <rule> -->

### Rule: Order variable declarations by descending length

##### Reason

Variable declarations must be ordered: assigned variables first, then unassigned, sorted by descending character length.

##### Bad Example

<!-- eslint-disable stdlib/vars-order -->

```javascript
// Do not...
function fizzBuzz() {
    var i;
    var out;

    for ( i = 1; i <= 100; i++ ) {
        out = ( i % 5 === 0 ) ? 'Buzz' : i;
        console.log( out );
    }
}
```

##### Good Example

```javascript
// Do...
function fizzBuzz() {
    var out;
    var i;

    for ( i = 1; i <= 100; i++ ) {
        out = ( i % 5 === 0 ) ? 'Buzz' : i;
        console.log( out );
    }
}
```

##### Enforcement

ESLint rule: [`stdlib/vars-order`][eslint-stdlib-vars-order]

<!-- </rule> -->

<!-- <rule> -->

### Rule: No string concatenation in error messages

##### Bad Example

<!-- eslint-disable stdlib/no-error-string-concat -->

```javascript
// Do not...
throw new Error( 'invalid argument. Value: `' + value + '`.' );
```

##### Good Example

```javascript
// Do...
throw new Error( 'unexpected error.' );
throw new Error( format( 'invalid argument. Value: `%s`.', value ) );
```

##### Enforcement

ESLint rule: [`stdlib/no-error-string-concat`][eslint-stdlib-no-error-string-concat]

<!-- </rule> -->

<!-- <rule> -->

### Rule: No built-in Math object

##### Reason

Use `@stdlib/math` packages instead of the built-in `Math` object.

##### Bad Example

<!-- eslint-disable stdlib/no-builtin-math -->

```javascript
// Do not...
var out = Math.exp( 2.0 );
// returns ~7.389
```

##### Good Example

```javascript
// Do...
var exp = require( '@stdlib/math/base/special/exp' );

var out = exp( 2.0 );
// returns ~7.389
```

##### Enforcement

ESLint rule: [`stdlib/no-builtin-math`][eslint-stdlib-no-builtin-math]

<!-- </rule> -->

<!-- <rule> -->

### Rule: No built-in BigInt

##### Reason

Use `@stdlib/bigint/ctor` instead of the built-in `BigInt` constructor.

##### Bad Example

<!-- eslint-disable stdlib/no-builtin-big-int -->

```javascript
// Do not...
var x = BigInt( 123 );
```

##### Good Example

```javascript
// Do...
var BigInt = require( '@stdlib/bigint/ctor' );

var x = BigInt( 123 );
```

##### Enforcement

ESLint rule: [`stdlib/no-builtin-big-int`][eslint-stdlib-no-builtin-big-int]

<!-- </rule> -->

<!-- <rule> -->

### Rule: Use `new` with RegExp constructors

##### Bad Example

<!-- eslint-disable stdlib/new-cap-regexp -->

```javascript
// Do not...
var re = RegExp( '[0-9]' );
```

##### Good Example

```javascript
// Do...
var re = new RegExp( '[0-9]' );
```

##### Enforcement

ESLint rule: [`stdlib/new-cap-regexp`][eslint-stdlib-new-cap-regexp]

<!-- </rule> -->

<!-- <rule> -->

### Rule: No variable redeclaration

##### Reason

Do not redeclare variables, including built-in globals.

##### Bad Example

<!-- eslint-disable stdlib/no-redeclare -->

```javascript
// Do not...
var a = 'beep';
// ...
var a = 'boop';
```

##### Good Example

```javascript
// Do...
var a = 'beep';
// ...
a = 'boop';
```

##### Enforcement

ESLint rule: [`stdlib/no-redeclare`][eslint-stdlib-no-redeclare]

<!-- </rule> -->

<!-- <rule> -->

### Rule: Require specified globals explicitly

##### Reason

Built-in globals such as `Float32Array`, `Buffer`, `Promise`, and others must be explicitly required from `@stdlib` packages rather than used as bare globals.

##### Bad Example

<!-- eslint-disable stdlib/require-globals -->

```javascript
// Do not...
var arr = new Float32Array();
```

##### Good Example

```javascript
// Do...
var Float32Array = require( '@stdlib/array/float32' );

var arr = new Float32Array();
```

##### Enforcement

ESLint rule: [`stdlib/require-globals`][eslint-stdlib-require-globals]

<!-- </rule> -->

<!-- </rule-set> -->

* * *

## Additional Resources

-   [Airbnb JavaScript Style Guide][airbnb]
-   [Idiomatic.js][idiomatic-js]
-   [Popular Convention][popular-convention]
-   [JavaScript Quality Guide][quality-guide]
-   [Unix Philosophy][unix-philosophy]

## License

This document may be reused under a [Creative Commons Attribution-ShareAlike License][license].

<section class="links">

[tab-indentation]: http://lea.verou.me/2012/01/why-tabs-are-clearly-superior/

[sublime-text]: http://www.sublimetext.com/

[editorconfig]: http://editorconfig.org/

[sublime-text-editorconfig]: https://github.com/sindresorhus/editorconfig-sublime

[atom-editorconfig]: https://github.com/sindresorhus/atom-editorconfig

[chrome-editorconfig]: https://chrome.google.com/webstore/detail/github-editorconfig/bppnolhdpdfmmpeefopdbpmabdpoefjh?hl=en-US

[vscode-editorconfig]: https://marketplace.visualstudio.com/items?itemName=EditorConfig.EditorConfig

[ecma-262]: http://www.ecma-international.org/publications/files/ECMA-ST/Ecma-262.pdf

[function-statements]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/function

[function-expressions]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/function

[hoisting]: https://github.com/buildfirst/buildfirst/tree/master/ch05/04_hoisting

[strict-mode]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Strict_mode

[uncaught-exception]: https://nodejs.org/api/process.html#process_event_uncaughtexception

[errbacks]: https://nodejs.org/api/fs.html

[http-status-codes]: https://en.wikipedia.org/wiki/List_of_HTTP_status_codes

[jsdoc]: https://jsdoc.app/

[fluent-interface]: https://en.wikipedia.org/wiki/Fluent_interface

[native-dom-equivalents]: http://www.sitepoint.com/jquery-vs-raw-javascript-1-dom-forms/

[airbnb]: https://github.com/airbnb/javascript

[idiomatic-js]: https://github.com/rwaldron/idiomatic.js/

[popular-convention]: https://web.archive.org/web/20150701000000/http://sideeffect.kr/popularconvention/#javascript

[quality-guide]: https://github.com/bevacqua/js

[unix-philosophy]: http://www.catb.org/~esr/writings/taoup/html/ch01s06.html

[license]: https://creativecommons.org/licenses/by-sa/4.0/

[eslint-space-before-blocks]: https://eslint.org/docs/rules/space-before-blocks

[eslint-comma-spacing]: https://eslint.org/docs/rules/comma-spacing

[eslint-space-in-parens]: https://eslint.org/docs/rules/space-in-parens

[eslint-computed-property-spacing]: https://eslint.org/docs/rules/computed-property-spacing

[eslint-space-infix-ops]: https://eslint.org/docs/rules/space-infix-ops

[eslint-space-unary-ops]: https://eslint.org/docs/rules/space-unary-ops

[eslint-spaced-comment]: https://eslint.org/docs/rules/spaced-comment

[eslint-indent]: https://eslint.org/docs/rules/indent

[eslint-semi]: https://eslint.org/docs/rules/semi

[eslint-stdlib-ternary-condition-parentheses]: https://github.com/stdlib-js/eslint-plugin-stdlib

[eslint-vars-on-top]: https://eslint.org/docs/rules/vars-on-top

[eslint-one-var]: https://eslint.org/docs/rules/one-var

[eslint-max-statements-per-line]: https://eslint.org/docs/rules/max-statements-per-line

[eslint-quotes]: https://eslint.org/docs/rules/quotes

[eslint-no-restricted-syntax]: https://eslint.org/docs/rules/no-restricted-syntax

[eslint-comma-dangle]: https://eslint.org/docs/rules/comma-dangle

[eslint-object-shorthand]: https://eslint.org/docs/rules/object-shorthand

[eslint-func-style]: https://eslint.org/docs/rules/func-style

[eslint-no-loop-func]: https://eslint.org/docs/rules/no-loop-func

[eslint-no-inner-declarations]: https://eslint.org/docs/rules/no-inner-declarations

[eslint-wrap-iife]: https://eslint.org/docs/rules/wrap-iife

[eslint-stdlib-no-unnecessary-nested-functions]: https://github.com/stdlib-js/eslint-plugin-stdlib

[eslint-func-names]: https://eslint.org/docs/rules/func-names

[eslint-strict]: https://eslint.org/docs/rules/strict

[eslint-curly]: https://eslint.org/docs/rules/curly

[eslint-brace-style]: https://eslint.org/docs/rules/brace-style

[eslint-eqeqeq]: https://eslint.org/docs/rules/eqeqeq

[eslint-require-jsdoc]: https://eslint.org/docs/rules/require-jsdoc

[eslint-valid-jsdoc]: https://eslint.org/docs/rules/valid-jsdoc

[eslint-stdlib-empty-line-before-comment]: https://github.com/stdlib-js/eslint-plugin-stdlib

[eslint-camelcase]: https://eslint.org/docs/rules/camelcase

[eslint-new-cap]: https://eslint.org/docs/rules/new-cap

[eslint-no-underscore-dangle]: https://eslint.org/docs/rules/no-underscore-dangle

[eslint-consistent-this]: https://eslint.org/docs/rules/consistent-this

[eslint-no-eval]: https://eslint.org/docs/rules/no-eval

[eslint-no-extend-native]: https://eslint.org/docs/rules/no-extend-native

[eslint-guard-for-in]: https://eslint.org/docs/rules/guard-for-in

[eslint-default-case]: https://eslint.org/docs/rules/default-case

[eslint-default-case-last]: https://eslint.org/docs/rules/default-case-last

[eslint-no-throw-literal]: https://eslint.org/docs/rules/no-throw-literal

[eslint-radix]: https://eslint.org/docs/rules/radix

[eslint-no-floating-decimal]: https://eslint.org/docs/rules/no-floating-decimal

[eslint-no-new-wrappers]: https://eslint.org/docs/rules/no-new-wrappers

[eslint-no-plusplus]: https://eslint.org/docs/rules/no-plusplus

[eslint-quote-props]: https://eslint.org/docs/rules/quote-props

[eslint-no-nested-ternary]: https://eslint.org/docs/rules/no-nested-ternary

[eslint-no-undefined]: https://eslint.org/docs/rules/no-undefined

[eslint-no-undef-init]: https://eslint.org/docs/rules/no-undef-init

[eslint-max-len]: https://eslint.org/docs/rules/max-len

[eslint-max-depth]: https://eslint.org/docs/rules/max-depth

[eslint-max-lines]: https://eslint.org/docs/rules/max-lines

[eslint-max-lines-per-function]: https://eslint.org/docs/rules/max-lines-per-function

[eslint-max-params]: https://eslint.org/docs/rules/max-params

[eslint-max-nested-callbacks]: https://eslint.org/docs/rules/max-nested-callbacks

[eslint-node-exports-style]: https://github.com/mysticatea/eslint-plugin-node/blob/master/docs/rules/exports-style.md

[eslint-node-no-path-concat]: https://github.com/mysticatea/eslint-plugin-node/blob/master/docs/rules/no-path-concat.md

[eslint-node-handle-callback-err]: https://github.com/mysticatea/eslint-plugin-node/blob/master/docs/rules/handle-callback-err.md

[eslint-node-callback-return]: https://github.com/mysticatea/eslint-plugin-node/blob/master/docs/rules/callback-return.md

[eslint-node-no-process-env]: https://github.com/mysticatea/eslint-plugin-node/blob/master/docs/rules/no-process-env.md

[eslint-node-no-new-require]: https://github.com/mysticatea/eslint-plugin-node/blob/master/docs/rules/no-new-require.md

[eslint-no-restricted-imports]: https://eslint.org/docs/rules/no-restricted-imports

[eslint-node-no-restricted-require]: https://github.com/mysticatea/eslint-plugin-node/blob/master/docs/rules/no-restricted-require.md

[eslint-stdlib-capitalized-comments]: https://github.com/stdlib-js/eslint-plugin-stdlib

[eslint-stdlib-no-empty-comments]: https://github.com/stdlib-js/eslint-plugin-stdlib

[eslint-stdlib-section-headers]: https://github.com/stdlib-js/eslint-plugin-stdlib

[eslint-stdlib-section-header-empty-lines]: https://github.com/stdlib-js/eslint-plugin-stdlib

[eslint-stdlib-jsdoc-doctest]: https://github.com/stdlib-js/eslint-plugin-stdlib

[eslint-stdlib-jsdoc-doctest-decimal-point]: https://github.com/stdlib-js/eslint-plugin-stdlib

[eslint-stdlib-doctest-marker]: https://github.com/stdlib-js/eslint-plugin-stdlib

[eslint-stdlib-jsdoc-doctest-marker]: https://github.com/stdlib-js/eslint-plugin-stdlib

[eslint-stdlib-doctest-annotation-spacing]: https://github.com/stdlib-js/eslint-plugin-stdlib

[eslint-stdlib-doctest-quote-props]: https://github.com/stdlib-js/eslint-plugin-stdlib

[eslint-stdlib-jsdoc-blockquote-indentation]: https://github.com/stdlib-js/eslint-plugin-stdlib

[eslint-stdlib-jsdoc-code-block-style]: https://github.com/stdlib-js/eslint-plugin-stdlib

[eslint-stdlib-jsdoc-fenced-code-flag]: https://github.com/stdlib-js/eslint-plugin-stdlib

[eslint-stdlib-jsdoc-fenced-code-marker]: https://github.com/stdlib-js/eslint-plugin-stdlib

[eslint-stdlib-jsdoc-emphasis-marker]: https://github.com/stdlib-js/eslint-plugin-stdlib

[eslint-stdlib-jsdoc-heading-style]: https://github.com/stdlib-js/eslint-plugin-stdlib

[eslint-stdlib-jsdoc-first-heading-level]: https://github.com/stdlib-js/eslint-plugin-stdlib

[eslint-stdlib-jsdoc-leading-description-sentence]: https://github.com/stdlib-js/eslint-plugin-stdlib

[eslint-stdlib-jsdoc-empty-line-before-example]: https://github.com/stdlib-js/eslint-plugin-stdlib

[eslint-stdlib-jsdoc-example-require-spacing]: https://github.com/stdlib-js/eslint-plugin-stdlib

[eslint-stdlib-jsdoc-list-item-indent]: https://github.com/stdlib-js/eslint-plugin-stdlib

[eslint-stdlib-jsdoc-no-html]: https://github.com/stdlib-js/eslint-plugin-stdlib

[eslint-stdlib-jsdoc-no-literal-urls]: https://github.com/stdlib-js/eslint-plugin-stdlib

[eslint-stdlib-jsdoc-linebreak-style]: https://github.com/stdlib-js/eslint-plugin-stdlib

[eslint-stdlib-require-spaces]: https://github.com/stdlib-js/eslint-plugin-stdlib

[eslint-stdlib-require-order]: https://github.com/stdlib-js/eslint-plugin-stdlib

[eslint-stdlib-no-empty-lines-between-requires]: https://github.com/stdlib-js/eslint-plugin-stdlib

[eslint-stdlib-require-file-extensions]: https://github.com/stdlib-js/eslint-plugin-stdlib

[eslint-stdlib-no-unassigned-require]: https://github.com/stdlib-js/eslint-plugin-stdlib

[eslint-stdlib-no-self-require]: https://github.com/stdlib-js/eslint-plugin-stdlib

[eslint-stdlib-no-dynamic-require]: https://github.com/stdlib-js/eslint-plugin-stdlib

[eslint-stdlib-no-nested-require]: https://github.com/stdlib-js/eslint-plugin-stdlib

[eslint-stdlib-no-require-index]: https://github.com/stdlib-js/eslint-plugin-stdlib

[eslint-stdlib-eol-open-bracket-spacing]: https://github.com/stdlib-js/eslint-plugin-stdlib

[eslint-stdlib-uppercase-required-constants]: https://github.com/stdlib-js/eslint-plugin-stdlib

[eslint-stdlib-vars-order]: https://github.com/stdlib-js/eslint-plugin-stdlib

[eslint-stdlib-no-error-string-concat]: https://github.com/stdlib-js/eslint-plugin-stdlib

[eslint-stdlib-no-builtin-math]: https://github.com/stdlib-js/eslint-plugin-stdlib

[eslint-stdlib-no-builtin-big-int]: https://github.com/stdlib-js/eslint-plugin-stdlib

[eslint-stdlib-new-cap-regexp]: https://github.com/stdlib-js/eslint-plugin-stdlib

[eslint-stdlib-no-redeclare]: https://github.com/stdlib-js/eslint-plugin-stdlib

[eslint-stdlib-require-globals]: https://github.com/stdlib-js/eslint-plugin-stdlib

</section>

<!-- /.links -->
