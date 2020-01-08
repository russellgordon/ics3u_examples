// NOTE: How to use this program (when it is running):
//
//       d         Instructs the metaphorical 'turtle' to draw based on the newly re-written word
//  right arrow    Program re-writes the current word based on production rules to create new word
//
// NOTE: To make this program draw a different shape on screen, you just need to change
//       the axiom, production rules, angle of rotation for the turtle, initial placement of turtle,
//       and how the line segment length should be reduced each time a word is re-written -- look
//       for line of code that begins like this -- the denominator needs to be changed:
//
//          // Set the line length for this round of drawing
//          currentLineLength = lineLength / pow(3, rewriteCount);
//
//       See this document in our G+ community for details:
//
//       http://bit.ly/1cWm5sK
//
//       This document has some examples of other L-systems that you can try:
//
//       http://bit.ly/1kG2Aoo
//
//

// Contains the starting, or intial, word (axiom)
String axiom = "F++F++F";

// Contains the existing word
String existingWord = "";

// Contains the new (re-written) word
String newWord = "";

// Tracks how many times existing word has been re-written
// In other words, how many generations of replacements have occured. 
int rewriteCount = 0;

// Tracks what character we are currently inspecting in the existing word
int currentCharacter = 0;

// Will contain all the rules that apply for this L-system
StringDict rules; 

// Defines the line segment length for n = 0 (if we press 'd' to draw the axiom)
float lineLength = 300;

// Will contain the line segment length for the current generation of the drawing
float currentLineLength = 0;

// Initial x-position of the turtle
int xPosition = 250;

// Initial y-position of the turtle
int yPosition = 400;

// Initial direction of the turtle (0 degrees: right, 90 degrees: down, 180 degrees: left,
//                                  270 degrees: up).
int direction = 0;

// Angle of rotation for the turtle (when a + or a - is processed)
float angle = 60; 

// Optimal number of word re-writes that should occur
// (You can directly control how many re-writes occur with the right arrow key)
int n = 4;

// Whether to show on-screen results (easier to follow, but slower)
// or whether to show results in the console (harder to see what's going on, but program runs faster)
boolean debug = true; 

// setup
//
// Purpose: A built-in function, Processing runs this once.
//
void setup() {

  // Create the canvas
  size(800, 600);

  // White background
  background(255, 255, 255);

  // Black text
  fill(0, 0, 0);

  // Set text size
  textSize(24);

  // Slow down the refresh rate
  frameRate(1);

  // Create the string dictionary object
  // What this line of code does...
  // "Using the StringDict class, create a new StringDict object, named 'rules' "
  rules = new StringDict();

  // Add rules (key-value pairs)
  //         key     value
  //
  // Some L-systems have more than one rule for replacements.
  // Just add another ".set" line for additional rules
  rules.set("F", "F-F++F-F");

  // Before any re-writes, the existing word is set to the axiom
  existingWord = axiom;
  newWord = existingWord;
  rewriteCount = 0;
  
  // Print information about the current state of the L-system
  printLSystemState();

}

// draw
//
// Purpose: A built-in function, Processing runs this repeatedly, unless stopped with noLoop();
//
void draw() {

}

// printLSystemState
//
// Purpose: Prints information about what is currently happening in the L-system.
//
void printLSystemState() {
  
  // Print the axiom
  if (debug == true) {
    text("The axiom is: " + axiom, 0, 25);
  } else {
    println("The axiom is: " + axiom);
  }

  // Print the existing word
  if (debug == true) {
    text("The existing word: " + existingWord, 0, 50, width, 200);
  } else {
    println("The existing word: " + existingWord);
  }

  // Print what generation of replacement this is
  if (debug == true) {
    text("Have re-written word this many times: " + rewriteCount, 0, 275);    
  } else {
    println("Have re-written word this many times: " + rewriteCount);
  }
}

// rewriteWord
// 
// Purpose: Take existing word, iterate over each character, make replacements
//          where needed based on the production rules.
//
void rewriteWord() {

  // Paint the background again to clear previous work
  background(255, 255, 255);

  // Print information about current state of L-system to screen
  printLSystemState();

  //Iterate over each character
  for (currentCharacter= 0; currentCharacter < existingWord.length(); currentCharacter++) {

    // Check each character - if it matches a rule, replace it
    if ( existingWord.charAt(currentCharacter) == 'F') {
      // replace
      newWord += rules.get("F");
    } 
    else {
      // copy the character directly
      newWord += existingWord.charAt(currentCharacter);
    }
  }

  // Print the new word
  if (debug == true) {
    text("New word is: " + newWord, 0, 350, width, 200);
  } else {
    println("New word is: " + newWord);
    println("That's " + rewriteCount + " rewrites.");
  }
  
}

// keyPressed
// 
// Purpose: A built-in function, Processing runs this any time a keyboard key is pressed.
//
void keyPressed() {

  // When the right arrow key is pressed, do another round of replacement
  if (key == CODED) {
    if (keyCode == RIGHT) {

      // New word from last time becomes existing word for this round of replacement
      existingWord = newWord;

      // Need to reset these variables to get ready for another round of replacement 
      newWord = "";
      rewriteCount += 1;

      rewriteWord();
    }
  }
  
  // Draw the newly re-written word
  if (key == 'd') {
    turtleDraw();
  }
}

// turtleDraw
//
// Purpose: When invoked, the 'metaphorical' or imaginary turtle draws on-screen based on
//          the contents of the newly re-written word
//
void turtleDraw() {

  // Get the turtle into it's starting position 
  translate(xPosition, yPosition);
  rotate(radians(direction));

  // Place a dot to show where the turtle is
  ellipse(0, 0, 10, 10);

  // Set the line length for this round of drawing
  currentLineLength = lineLength / pow(3, rewriteCount);

  // Iterate  
  for (currentCharacter= 0; currentCharacter < newWord.length(); currentCharacter++) {

    // Check each character - draw or rotate as necessary
    if ( newWord.charAt(currentCharacter) == 'F') {
      // Draw a segment
      line(0, 0, currentLineLength, 0);
      translate(currentLineLength, 0);
    } 
    else if ( newWord.charAt(currentCharacter) == '+') {
      // Turn left      
      rotate(radians(-angle));
    }
    else if ( newWord.charAt(currentCharacter) == '-') {
      // Turn right
      rotate(radians(angle));
    }
  }
}
