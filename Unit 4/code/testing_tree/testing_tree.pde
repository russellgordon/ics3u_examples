float endOfBase= random(75, 200);
PFont font;
void setup() {
  size(700, 700);
  translate(width/2, height);
  scale(0.3, 0.3);
  rotate(radians(-90));
  font = loadFont("Helvetica-24.vlw");
  textFont(font, 96);
  drawTree(4, 20);// with 3 generations of base, left branch right branch
}

void drawTree(int depth, int thicknes) {

  if (depth>0) {
    //draw base
    stroke(225, 0, 0); // red
    strokeWeight(thicknes);
    line(0, 0, endOfBase, 0);

    //move to end of base
    translate(endOfBase, 0);

    //draw left branch
    pushMatrix();
    rotate(radians(random(-30, -270)));
    stroke(0, 255, 0); // green
    strokeWeight(thicknes);
    line(0, 0, endOfBase, 0);
    translate(endOfBase, 0);
    text(int(g.strokeWeight), 0, 0);  // print current stroke weight on screen
    drawTree(depth-1, thicknes-3);
    popMatrix();

    //draw right branch
    //move to end of base
    pushMatrix();
    rotate(radians(random(20, 50)));
    stroke(0, 0, 255); // blue
    strokeWeight(thicknes);
    line(0, 0, endOfBase, 0);
    translate(endOfBase, 0);
    text(int(g.strokeWeight), 0, 0); // print current stroke weight on screen
    drawTree(depth-1, thicknes-3);
    popMatrix();
  }
}
