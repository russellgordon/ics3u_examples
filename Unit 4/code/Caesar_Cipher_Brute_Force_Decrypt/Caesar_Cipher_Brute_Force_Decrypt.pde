// Key to use for Caesar shift
int shift = 0;

// Ciphertext to be examined
String cipherText = "YbWmW`cdYX]U";
//String cipherText = ": tq~q3,mxƒm…,s{zzm,nq,mz{€tq~,y{z€muz,U3y,mxƒm…,s{zzm,ƒmzzm,ymwq,u€,y{‚q";
//String cipherText = "VY\\OW*SZ]_W*NYVY\\*]S^*KWO^";
//String cipherText = "GFHTS";
//String cipherText = "AVXR. WHFG QB VG.";
//String cipherText = "LO*cY_\\]OVP*LOMK_]O*KX*Y\\SQSXKV*S]*aY\\^R*WY\\O*^RKX*K*MYZc";
//String cipherText = "TCUNV";
//String cipherText = "VTXLTK VBIAXK VHWX AHFXPHKD";
//String cipherText = "QYUXeOT[";

// Font to display text with
PFont serif;

// This runs once
void setup() {

  // Create canvas
  size(800, 600);

  // No automatic looping / drawing
  noLoop();

  // Load the font
  serif = loadFont("Helvetica-24.vlw");

  // Set the font to be used
  textFont(serif);

  // Black fill for text
  fill(0, 0, 0);
}

// This runs forever (normally) but in this sketch runs
// whenever redraw() is called
void draw() {
}

// This responds to key presses
void keyPressed() {

  // Clear the screen
  background(255, 255, 255);

  // Print the text on screen
  // See: http://www.processing.org/reference/text_.html
  text("Cipher text is: ", 30, 30, width-60, 30);
  text(cipherText, 30, 60, width-60, 120);
  println("cipherText is: " + cipherText);

  // When the right arrow key is pressed, increment the shift and display
  // decryption based on this key.
  if (key == CODED) {
    if (keyCode == RIGHT) {
      shift += 1;
    }

    if (keyCode == LEFT) {
      shift -= 1;
    }

    // Display results with this key
    text("Shifting left through alphabet by: " + shift, 30, 180, width-60, 30);
    println("Shifting left through alphabet by: " + shift); 
    text("New text: ", 30, 240, width-60, 30);
    println("New text: ");
    println(decrypt(cipherText, shift));
    text(decrypt(cipherText, shift), 30, 300, width-60, 120);
  }

  // Update the screen
  redraw();
}

// decrypt
//
// Purpose: Uses a Caesar shift to attempt to decrypt the given phrase
//
// Parameters:    scrambled    String containing the ciphertext / scrambled text
//                shiftBy      How much to shift the value of each character by
//
// Returns:       The possibly unscrambled text
String decrypt(String scrambled, int shiftBy) {

  String unscrambled = "";

  // Create new string that may contain unscrambled text
  for (int i = 0; i < scrambled.length(); i++) {

    // Build the string (with shifted characters)
    unscrambled += char(int(scrambled.charAt(i) - shiftBy));
  }

  return unscrambled;
}
