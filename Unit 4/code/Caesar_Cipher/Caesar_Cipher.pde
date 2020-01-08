void setup() {
  
  // Message to encode
  // To keep things simple, use no punctuation and all UPPERCASE letters.
  // I'll explain more about this on Friday.
  String plainText = "THIS IS WHAT WILL BE ENCODED REPLACE WITH YOUR MESSAGE";
  
  // Print the plaintext message (look in bottom left corner of code window for output)
  println("The plaintext is: " + plainText);
  
  // Note that a variable with a String data type is just an array of individual characters.
  // Arrays are "zero-based" which means the first character is at the position 0.
  println("The first character of the plaintext is: " + plainText.charAt(0));
  println("The second character of the plaintext is: " + plainText.charAt(1));
  println("The fourth character of the plaintext is: " + plainText.charAt(3));
  
  // How much to shift the plaintext by in the alphabet
  int shift = 12;
  
  // Create a new string containing the ciphertext
  String cipherText = "";
  for (int i = 0; i < plainText.length(); i++) {
    // For learning purposes... print the current character of the plaintext
    println("Plaintext character is: " + plainText.charAt(i));
    
    // Print numeric equivalent of the current plainText character
    // See: http://www.asciitable.com
    println("Numeric equivalent of plaintext character is: " + int(plainText.charAt(i)));
    
    // Print numeric equivalent of the encoded character (add the shift to push down alphabet)
    println("Numeric equivalent of ciphertext character is: " + int(plainText.charAt(i) + shift));
    
    // Print ciphertext character
    println("Ciphertext character is: " + char(int(plainText.charAt(i) + shift)));
    
    // Build the ciphertext string
    cipherText += char(int(plainText.charAt(i) + shift));

  }
  
  // Print the encoded message
  println("The ciphertext message is:");
  println("");
  println(cipherText);
}
