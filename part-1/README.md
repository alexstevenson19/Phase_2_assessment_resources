# Part 1: JavaScript Objects
## Summary

In Part 1 of the assessment, we're going to write JavaScript.  Specifically,
we're going to define a pair of custom objects:  `SalesTeam` and `Employee`.
Each of these custom objects will have properties and behaviors specific to
itself.  Tests have been written to guide you through the development of each
object.

### Reading Jasmine Tests

The tests describing the behaviors of our custom objects have been written
using Jasmine, which might be unfamiliar to you.  That's perfectly fine.  We
won't be writing any Jasmine tests today &mdash; just reading them.  Jasmine's
syntax is very similar to RSpec's; we'll see `describe()` and `it()` &mdash;
only in JavaScript, not Ruby.  When we call either of these functions, instead
of passing a block as we would in Ruby, we'll pass a function.

The files containing the tests are located within the `spec/` directory; the
files are named `employee-spec.js` and `sales-team-spec.js`.  Read through them
as you need to.

### Running Jasmine Tests

We won't run the tests from the command line.  Instead we'll run them in the
browser, by opening the file `SpecRunner.html`.  This HTML file loads the
Jasmine JavaScript library, the application code that we'll write, and the
files containing the tests.  It runs the tests and then displays the outcome of
the tests in the browser.

## Releases

### Release 0: Employee

We'll start by focusing on the tests describing our employee (see
`spec/employee_spec.js`).  To run the tests, open the file `SpecRunner.html` in
a browser. On the command line navigate to the `part-1` directory and then run

```
$ open SpecRunner.html
```

You are also provided an English-language version of the tests below.

#### Context

Assume we create an instance of `Employee` that is initialized with a first name
and an `Array` of numbers representing their sales. You may assume this
happens before each test.

#### Tests

* The new instance's first name matches the one that was passed in during initialization
* The new instance's `sales` Array has the same sales values as the sales values that were passed in during initialization
* The new instance's `totalSales()` method returns a total sales value based on summing all the sales' values
* The new instance's `averageSales()` method returns an average sale value that is computed based on the values of the sales that were passed in during initialization

Once all the tests are passing, you're done!

### Release 1: SalesTeam

Once the tests for the custom `Employee` object pass, move on to the
`SalesTeam` object type.  Just as above, start by fixing the first test in
`spec/sales-team.js`. To make the test in `spec/sales-team.js` pass you will
make edits to `salesTeam.js`. Continue onward by fixing the remaining tests.

You are also provided an English-language version of the tests below.

#### Context

Assume that four `Employee`s are created. A new instance of `SalesTeam` is
initialized with an Array of these `Employee`s.  You may assume this
initialization happens before each test.

#### Tests

* The new instances `employees` Array has the same scores as the scores that were passed in during initialization
* The new instance's method `find` method searches through the `employees` Array to find the one whose first name matches
* The new instance's method `topPerformer` method searches through the `employees` Array to find the one whose average sale is highest

### TIP

Keep in mind that a Jasmine test _is just JavaScript_: this means that you can
use tools like `console.log()` or `debugger` or any of your Chrome dev tools to
"get inside" the test or inside your `Employee` or `SalesTeam` implementations.

Also, while JavaScript may be relatively new to you, recall that it provides
a _wealth_ of methods to help you implement your custom methods.  `Array.prototype`
implements methods such as `sort` among others.  Consult the
[Array.prototype][proto] page.

Just because the _form_ is unfamiliar, don't forget your training!

## Conclusion

Once all the tests have passed, you have completed Part 1 of the assessment. If
you haven't done so already, commit your changes and move on to Part 2.

[proto]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/prototype
