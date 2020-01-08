/*
 * Original example code authored by Daniel Shiffman.
 * See: http://processing.org/examples/noise2d.html
 *
 * Modified by Russell Gordon. 
 */

// How much of a jump through Perlin noise space to make
float increment = 0.004; // Adjust this to change how dense clouds are (0.02 is pretty dense, 0.005 pretty sparse)

// This function runs once only.
void setup() {

  // Create canvas.
  size(640, 360);

  // Set colour mode to Hue-Saturation-Brightness model
  colorMode(HSB, 360, 100, 100, 100);
}

// This function runs repeatedly.
void draw() {

  // Allow us to set pixels in an image individually.
  loadPixels();

  // Base the x-axis offset through Perlin noise space on the mouse horizontal position
  // This lets us pick a "patch" of the X-axis that has a pleasing cloud pattern by
  // changing the starting position in Perlin noise space.
  float xoff = 0.0+mouseX;

  // Adjust the level of detail based on the vertical position of the mouse
  float detail = map(mouseY, 0, height, 0.1, 0.6);
  noiseDetail(8, detail);

  // For every x,y coordinate on the canvas, calculate a noise value
  // and produce pixel that ranges between vibrant blue and white
  for (int x = 0; x < width; x++) {

    xoff += increment;   // Increment xoff with each additional column 
    float yoff = 0.0;   // For every xoff, start yoff at 0 (OHH.. this is the KEY to a cloud like pattern.. stay in SAME PATCH of space on Y-axis as we move along X-axis in Perlin noise space)

    // Paint the pixels in this column of the canvas
    for (int y = 0; y < height; y++) {

      yoff += increment; // Increment yoff

      // Calculate noise and scale by 100 to find a saturation value
      float saturation = noise(xoff, yoff) * 100;

      // Try using this line instead (difference between Perlin noise and regular random number generation) 
      //float saturation = random(0,100);

      // Set each pixel onscreen to something in the range of blue to white
      // See:
      // http://www.processing.org/tutorials/pixels/
      // 
      // and the section "Pixels, pixels, and more pixels"
      //
      // ... for explanation of how Processing handles images and pixels
      pixels[y*width+x] = color(199, saturation, 90);
    }
  }

  // Now that we have set all the pixels, show the result on screen.
  updatePixels();
}

// keyPressed
//
// Responds when keyboard keys are pressed.
void keyPressed() {

  // Export a PNG file of the on-screen image when 's' is pressed.
  // Will be created in same folder as the .PDE file
  if (key == 's') {
    saveFrame("clouds-########.png");
  }
}
