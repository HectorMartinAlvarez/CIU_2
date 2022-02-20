PShape obj;

Shape current;
Shape previous;

ArrayList<PShape> saved = new ArrayList<PShape>();

int mode = 1;

boolean skip = false;
float zoom = 1.0;
int i = 0;
int axis;
int index = 0;

void setup() {
  size(900, 900, P3D);
  axis = (int)width/3;
  current = new Shape();
  previous = new Shape();
}
void draw() {
  background(0);
  switch(mode){
    case 1:
      textSize(25);
      textAlign(LEFT);
      text("'Left Click' - Draw", 10, height-190);
      text("'E' - Create Shape", 10, height-155);
      text("'R' - Clear Drawing", 10, height-120);
      text("'A' - Saved Shape", 10, height-85);
      text("'Z' - Undo", 10, height-50);
      stroke(255);
      strokeWeight(5);
      line(axis, 0, axis, height);
      stroke(255, 255, 0);
      strokeWeight(1);
      lines();
      break;
    case 2:
      text("'+' - Zoom In", 10, height-185);
      text("'-' - Zoom Out", 10, height-155);
      text("'C' - Change Color", 10, height-120);
      text("'S' - Save Shape", 10, height-85);
      text("'D' - Discard Shape", 10, height-50);
      translate(450, 555, 0);
      rotateY(radians(i++));
      scale(zoom);
      pushMatrix();
      translate(150, 100, 0);
      shapeMode(CENTER);
      rotateZ(radians(45));
      shape(obj);
      popMatrix();
      break;
    case 3:
      textSize(40);
      textAlign(LEFT);
      triangle(20,65, 90,30, 90,110);
      triangle(width-20,65, width-90,30, width-90,110);
      text("'A'",110,80);
      text("'D'",width-150,80);
      textSize(25);
      text("'+' - Zoom In", 10, height-185);
      text("'-' - Zoom Out", 10, height-155);
      text("'C' - Change Color", 10, height-120);
      text("'R' - Remove Shape", 10, height-85);
      text("'Q' - Return", 10, height-50);
      if(saved.size() > 0){
        translate(450, 555, 0);
        rotateY(radians(i++));
        scale(zoom);
        pushMatrix();
        translate(150, 100, 0);
        shapeMode(CENTER);
        rotateZ(radians(45));
        shape(saved.get(index));
        popMatrix();
      }else{
        textAlign(CENTER);
        textSize(40);
        text("No Saved Shapes", width/2, height/2);
      }
      break;
  }
}

void lines() {
  pushMatrix();
  translate(axis, 0);
  for (int i = 0; i < current.size()-1; i++) {
    line(current.get(i).getX(), current.get(i).getY(), current.get(i+1).getX(), current.get(i+1).getY());
  }
  popMatrix();
}

void keyPressed() {
  switch(mode){
    case 1:
      switch(key){
        case 'r':
        case 'R':
          previous.set(current.copy());
          current.clear();
          mode = 1;
          i = 0;
          break;
        case 'z':
        case 'Z':
          ArrayList<Point> temp = current.copy();
          current.set(previous.copy());
          previous.set((ArrayList)temp.clone());
          break;
        case 'e':
        case 'E':
          if(current.size() >= 4){
            previous.set(current.copy());
            current.centerShape();
            make3D(current.copy());
            current.clear();
            mode = 2;
          }
          break;
        case 'a':
        case 'A':
          mode = 3;
          break;
      }
      break;
    case 2:
      switch(key){
        case 's':
        case 'S':
          saved.add(obj);
        case 'd':
        case 'D':
          mode = 1;
          i = 0;
          break;
        case 'c':
        case 'C':
          obj.setFill(color(random(130, 255), random(130, 255), random(130, 255)));
          break;
        case '+':
          zoom += 0.05;
          break;
        case '-':
          zoom -= 0.05;
          break;
      }
      break;
    case 3:
      switch(key){
        case 'a':
        case 'A':
          if(index == 0){
            index = saved.size()-1; 
          }else{
           index--; 
          }
          break;
        case 'd':
        case 'D':
          if(index >= saved.size()-1){
            index = 0;
          }else{
           index++; 
          }
          break;
        case 'q':
        case 'Q':
          mode = 1;
          break;
        case 'r':
        case 'R':
          saved.remove(index);
          if(index > 0) index--;
          break;
        case 'c':
        case 'C':
          saved.get(index).setFill(color(random(130, 255), random(130, 255), random(130, 255)));
          break;
        case '+':
          zoom += 0.05;
          break;
        case '-':
          zoom -= 0.05;
          break;
        }
  }
}

void mouseClicked() {
  if (mouseX > axis) {
    Point i = new Point(mouseX-(axis), mouseY, 0);
    current.add(i);
  }
}

void mouseDragged() {
  if (mouseX > axis) {
    if(skip){
      Point i = new Point(mouseX-(axis), mouseY, 0);
      current.add(i); 
      skip = !skip;
    }else{
      skip = !skip;
    }
  }
}

void mousePressed(){
  previous.set(current.copy());
}

void make3D(ArrayList<Point> points) {

    int angle = 360 / 15;
    float radianes = angle * PI / 180;

    obj = createShape();
    obj.beginShape(TRIANGLE_STRIP);
    obj.stroke(255);
    obj.fill(0, 0, 255);
    obj.strokeWeight(1);
    
    Point currentLevelPoint, nextLevelPoint;

    for (int i = 0; i < points.size() - 1; i++) {

      currentLevelPoint = points.get(i);
      nextLevelPoint = points.get(i + 1);

      obj.vertex(currentLevelPoint.getX(), currentLevelPoint.getY(), currentLevelPoint.getZ());
      obj.vertex(nextLevelPoint.getX(), nextLevelPoint.getY(), nextLevelPoint.getZ());

      for (int j = angle; j <= 360; j += angle) {
        currentLevelPoint = points.get(i);
        currentLevelPoint = new Point(newX(currentLevelPoint, radianes), 
          currentLevelPoint.getY(), 
          newZ(currentLevelPoint, radianes));
        obj.vertex(currentLevelPoint.getX(), currentLevelPoint.getY(), currentLevelPoint.getZ());

        nextLevelPoint = points.get(i + 1);
        nextLevelPoint = new Point(newX(nextLevelPoint, radianes), 
          nextLevelPoint.getY(), 
          newZ(nextLevelPoint, radianes));
        obj.vertex(nextLevelPoint.getX(), nextLevelPoint.getY(), nextLevelPoint.getZ());

        radianes = (angle + j) * PI / 180;
      }
    }
    obj.endShape();
}

int newX(Point point, float radianes) {
  return (int) (point.getX() * cos(radianes) - point.getZ() * sin(radianes));
}

int newZ(Point point, float radianes) {
  return (int) (point.getX() * sin(radianes) + point.getZ() * cos(radianes));
}
