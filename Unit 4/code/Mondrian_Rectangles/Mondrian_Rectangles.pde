int recursionDepth = 0;

void setup() {

  // canvas size
  size(400, 500);

  // HSB colour model
  colorMode(HSB, 360, 100, 100);

  // background colour is white
  background(0, 0, 100);

  // thick stroke for rectangles
  strokeWeight(5);

  // black borders
  stroke(0);

  // start things off.. invoke the drawRectangles function
  drawRectangles(0, 0, width, height);
  
}

// drawRectangles
// Purpose: Sub-divide a rectangle into four smaller rectangles
//
// Parameters:   x                the x co-ordinate for the top left corner of rectangle to sub-divide
//               y                the y co-ordinate for the top left corner of rectangle to sub-divide
//               rectangleWidth   the width of the rectangle to be sub-divided
//               rectangleHeight  the height of the rectangle to be sub-divided
void drawRectangles(float x, float y, float rectangleWidth, float rectangleHeight) {
  
  // Keep track of how many times function has been called
  recursionDepth++;
  
  // Debug statements –- helpful to follow what is going on
  println("recursion depth is: " + recursionDepth);  
  println("x is " + x);
  println("y is " + y);
  println("rectangleWidth is: " + rectangleWidth);
  println("rectangleHeight is: " + rectangleHeight);
  
  // get my random width and height
  float randomWidth = random(rectangleWidth/4, rectangleWidth/4*3);
  float randomHeight = random(rectangleWidth/4, rectangleHeight/4*3);
  
  // more debug statements
  println("randomWidth is: " + randomWidth);
  println("randomHeight is: " + randomHeight);
  println("----------------------------------");

  // draw first rectangle
  fill(0, 0, 100); // white fill
  rect(x, y, randomWidth, randomHeight);

  // draw second rectangle
  fill(0, 80, 90); // red fill
  rect(x + randomWidth, y, rectangleWidth - randomWidth, randomHeight); 

  // draw third rectangle
  fill(240, 80, 90); // blue fill
  rect(x, y + randomHeight, randomWidth, rectangleHeight - randomHeight);

  // draw fourth rectangle
  fill(60, 80, 90); // yellow fill
  rect(x + randomWidth, y + randomHeight, rectangleWidth - randomWidth, rectangleHeight - randomHeight);

  // recurse (with an exit condition)
  if (randomWidth > 50 && randomHeight > 50) {
    // sub-divide fourth rectangle (bottom-right)
    drawRectangles(x + randomWidth, y + randomHeight, rectangleWidth - randomWidth, rectangleHeight - randomHeight);
  }
}
