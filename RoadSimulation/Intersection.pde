class Intersection{
  //fields
  Boolean vertical, horizontal, haveCar;
  PVector location;
  color[] c;
  int timer;
  
  //constructors
  Intersection(float y, float x){
    this.haveCar = false;
    this.c = new color[2];
    this.location = new PVector(x, y);
    this.timer = int(random(5, 7));
    
    
    if(random(0,1) < 0.5){//randomdize the colour of the horizontal and vertical lights.
      vertical = false; //false is red light
      horizontal = true; //true is green light
    }
    else{
      vertical = true;
      horizontal = false;
    }
    
  }
  
  //methods
  void assignLight(){ //this gives the lights it's colours
    if(vertical == true){
      c[0] = color(0, 255, 0);
      c[1] = color(255, 0, 0);
    }
    
    else{
      c[1] = color(0, 255, 0);
      c[0] = color(255, 0, 0);
    }
    
    
    if(frameCount%(30*timer) == 0){ //. Using the frameCount has a way to set a timer, after the time passes the lights will switch colours
      if(vertical == true){
        vertical = false;
        horizontal = true;
      }
      else{
        vertical = true;
        horizontal = false;
      }
    }
  }
  
  void display(){
    fill(255);
    rectMode(CENTER);
    square(location.x, location.y, size); //the intersection
    
    fill(c[0]);
    circle(location.x, location.y-size/2, size/5); //vertical path lights
    circle(location.x, location.y + size/2, size/5);
    
    fill(c[1]);
    circle(location.x -size/2, location.y, size/5); //horizontal path lights
    circle(location.x +size/2, location.y , size/5);
       
      
    }
  }
