// Contains the starting, or intial, word (axiom)
String axiom = "F+F";

// Contains the existing word
String existingWord = "";

// Contains the new (re-written) word
String newWord = "";

// Tracks how many times existing word has been re-written
int rewriteCount = 0;

// Tracks what character we are currently inspecting in the existing word
int currentCharacter = 0;

// Will contain all the rules that apply for this L-system
StringDict rules; 

// This function runs once.
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
  // "Using the StringDict class, create a new StringDict object, named 'rules' "
  rules = new StringDict();

  // Add rules (key-value pairs)
  //         key     value
  rules.set("F", "F-F");

  // For the first re-write, the existing word is set to the axiom
  existingWord = axiom;
  rewriteCount = 1;
}

// This function runs repeatedly ( unless we stop it with noLoop() )
void draw() {

  // Re-paint the background
  background(255, 255, 255); // white

  // Print text to the screen
  // Arguments:
  //   string, x, y
  text("The axiom is: " + axiom, 0, 25);

  // Print the existing word
  text("The existing word: " + existingWord, 0, 50, width, 200);

  // Print what generation of replacement this is
  text("Have re-written word this many times: " + rewriteCount, 0, 275);

  // Show what character we are inspecting
  text("Current character is: " + currentCharacter, 0, 325);

  // Check each character - if it matches a rule, replace it
  if ( existingWord.charAt(currentCharacter) == 'F') {
    // replace
    newWord += rules.get("F");
    fill(255, 0, 0); 
    text("replacement occurred", width/2, 325);
    fill(0, 0, 0);
  } 
  else {
    // copy the character directly
    newWord += existingWord.charAt(currentCharacter);
  }
  
  // Print the new word
  text("New word is: " + newWord, 0, 350, width, 200);

  // Stop before we go out of bounds... past the end of the string
  if (currentCharacter == existingWord.length() - 1 ) {
    noLoop();
  }
  
  // Advance to next character in existing word
  currentCharacter += 1;
}


// Responds to key presses
void keyPressed() {
  
  // When the right arrow key is pressed, do another round of replacement
  if (key == CODED) {
    if (keyCode == RIGHT) {
      
      // New word from last time becomes existing word for this round of replacement
      existingWord = newWord;
      
      // Need to reset these variables to get ready for another round of replacement 
      newWord = "";
      rewriteCount += 1;
      currentCharacter = 0;
      
      // Make draw() function start looping again, so next level of replacement begins
      loop();
      
    }
    
  }
  
}
