// encoded text to be analyzed
String cipherText = "YbWmW`cdYX]U";    

// current position being examined
int position = 0;

// Create a key-value data structure
StringDict frequency;

// This runs once
void setup() {
  
  // Create the canvas
  size(800, 600);
  
  // No automatic looping / drawing
  noLoop();
  
  // Initialize the frequency StringDict (string dictionary)
  // that will track how often a given character appears
  frequency = new StringDict();
    
}

// This runs forever (normally) but in this sketch runs/
// whenever redraw() is called
void draw() {
  
}

// This responds to key presses
void keyPressed() {
  
  // When the right arrow key is pressed, iterate over the ciphertext
  // and count the next individual character
  if (key == CODED) {
    if (keyCode == RIGHT) {
      
      // Add current character from ciphertext into the dictionary
      // (each character will be a key, the value will be how frequently it occurs)
      if (frequency.get("" + cipherText.charAt(position)) != null) {
        int newValue = int( frequency.get("" + cipherText.charAt(position))) + 1;
        frequency.set( "" + cipherText.charAt(position), "" + newValue);
      } else {
        frequency.set( "" + cipherText.charAt(position),  "" + "1");
      }
      position++;
             //<>//
    }
    
  }
  
}
