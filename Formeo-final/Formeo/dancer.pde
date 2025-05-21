class Dancer{
  //fields
  float size;
  PVector location, goingTo, velocity;
  String name;
  boolean selected;
  color colour;
  
  //constructor
  Dancer(String n){
    this.location = new PVector (400, 300);
    this.name = n;
    this.size = 10;
    this.selected = false;
    this.colour = color(140, 140, 140);
  }
  
  //methods
  void drawDancer(){
    if(this.selected == true)
      fill(0, 255, 0);
    
    else
      fill(colour);
    
    circle(location.x, location.y, 30);
    fill(0);
    text(name, location.x-5, location.y+5);
  }
  
  void move(){
    this.location.add(velocity);
  }
  
  void goingTowards(PVector t){
    this.goingTo = t;
    PVector travelling = PVector.sub(t, location); //the distance the ball will travel
    velocity = new PVector(travelling.x/60, travelling.y/60);
  }
}
