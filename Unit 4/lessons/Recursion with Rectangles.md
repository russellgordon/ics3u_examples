# Recursion with Rectangles

[Piet Mondrian](http://en.wikipedia.org/wiki/Piet_Mondrian) was a Dutch artist known for his work with images involving colourful rectangles.

Try to imitate the style of his paintings by reproducing this example:

<img src="http://answers.oreilly.com/index.php?app=core&module=attach&section=attach&attach_rel_module=post&attach_id=738" />

Create a recursive program that further divides the first four squares that appear into smaller subdivisions with bold primary colours.

Aim for something like the following:

<img src="http://answers.oreilly.com/index.php?app=core&module=attach&section=attach&attach_rel_module=post&attach_id=739" />

To get started on this task, either with a group in class, or on your own in your sketchbook, make a plan:

<img src="http://russellgordon.ca/BSS/ics3u/images/mondrian-plan.jpg" />

Based on this plan, write some code to produce the rectangles:

<img src="http://russellgordon.ca/BSS/ics3u/images/mondrian-rectangles-1.jpg" />[Example on GitHub](https://github.com/bsscs/ics3u-examples/blob/850babcf9d6935ca55ab796815e71006fcbd62b3/Unit%204/code/Mondrian_Rectangles/Mondrian_Rectangles.pde)

You might have written the code such that *literal values* were provided for the arguments when invoking the *rect()* function.

That is, you may have done the arithmetic on the top-left corner co-ordinates – (x, y) – for each rectangle in your head.  Ditto for the width and height.

To be able to see the recipe, or algorithm, for the recursive function that you'll use to draw further rectangles – here is a suggestion: write out the arithmetic that you completed in your head.

*Make your thinking visible.*

Something like this:

<img src="http://russellgordon.ca/BSS/ics3u/images/mondrian-plan-2.jpg" />

If you write the code to [better expose your thinking](https://github.com/bsscs/ics3u-examples/blob/86ff0f3f46204c6401cea397d8bcdc28f4a186fe/Unit%204/code/Mondrian_Rectangles/Mondrian_Rectangles.pde), it's easier to identify where to use the built-in system variables that Processing provides – and where to use your own randomly generated variables.

For example, based on plan illustrated above, you could make revisions to replace the literal value of 500 for the height with the system variable *height*.  You could do the same with the width.  [Here's an example](https://github.com/bsscs/ics3u-examples/blob/3d637e3433ba32916b413fc602c47148ed946a44/Unit%204/code/Mondrian_Rectangles/Mondrian_Rectangles.pde).


