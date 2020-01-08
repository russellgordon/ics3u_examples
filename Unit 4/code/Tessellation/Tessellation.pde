// global variables – we can use these anywhere (in setup() function and in draw() function)
int column = 0; // tracks what column we are on
int row = 0; // tracks what row we are on

// STUDENTS: You will need to change these values to match the size of your shape
int shapeWidth = 80; // tracks the width of the square my shape is made out of
int shapeHeight = 80; // tracks the height of the square my shape is made out of

// this runs once
void setup() {

  // create a square canvas that is four times as large, by area, as my starting shape's boundaries (80x80)
  // STUDENTS: Make sure canvas width is some multiple of the width of your shape – same goes for canvas height
  size(800, 800);

  // white background
  background(255, 255, 255);

  // thick stroke  
  strokeWeight(3);

  // black stroke (border)
  stroke(0);

  // slow things down
  frameRate(5);
}

// this functions loops forever (unless we tell it to stop)
void draw() {

  // use the translate shortcut (move the origin of the canvas)
  // this is what allows each shape to be drawn in a different position on the screen
  translate(column*shapeWidth, row*shapeHeight);

  // alternate fill colours for shape
  // --> uses modulus arithmetic
  // --> e.g.: 5 % 2 gives 1, the remainder after dividing
  // --> e.g.: 4 % 2 gives 0
  // STUDENTS: Try different colours!  You just need to find the RGB values for each colour.
  // Visit https://kuler.adobe.com/create/color-wheel/ to get harmonious R-ed, G-reen, B-lue colour combinations
  if (row % 2 == 0) {
    if (column % 2 == 0) {
      //    R   G   B
      fill(71, 77, 178); // blue fill when row # is even, and, column # is even
    } 
    else {
      //    R   G   B
      fill(255, 234, 152); // tan fill when row # is even, and, column # is odd
    }
  } 
  else {
    if (column % 2 == 0) {
      //    R   G   B
      fill(255, 234, 152); // tan when row # is odd, and column # is even
    } 
    else {
      //    R   G   B
      fill(71, 77, 178); // blue when row # is odd, and column # is even
    }
  }
  
  // draw my shape
  // STUDENTS: Replace this code with the code that draws your shape
  beginShape(); 
  vertex(0, 0); // starting vertex
  vertex(20, 0);
  vertex(40, 20);
  vertex(80, 0);
  vertex(80, 30); // vertex 5
  vertex(60, 50);
  vertex(80, 60);
  vertex(80, 80);
  vertex(40, 100);
  vertex(20, 80); // vertex 10
  vertex(0, 80);
  vertex(0, 60);
  vertex(-20, 50);
  vertex(0, 30);
  vertex(0, 0); // back to starting vertex
  endShape();

  // increase column count
  column++;

  // at end of first row, start new row and reset the column
  if (column > width / shapeWidth) {
    column = 0;
    row++; // increase row count
  }

  // after all rows completed, end program
  if (row > height / shapeHeight) {
    noLoop();
  }
  
}
