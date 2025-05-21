class Road{
  //fields
  PVector[] connect = new PVector[3];
  
  //constructor
  Road(Intersection i, Intersection i2){
    this.connect[0] = i.location;
    this.connect[1] = i2.location;
  }
  
  
  //method
  void display(String a){ //the string is for convience to tell if the road is vertical or not.
    fill(128);
    rectMode(CORNERS);
    
    if(a == "vertical"){ //draws the road
      rect(connect[0].x-size/2, connect[0].y, connect[1].x+size/2, connect[1].y+size/2);
      fill(255, 255, 0);
      rect(connect[0].x-size*1/20, connect[0].y, connect[1].x+size*1/20, connect[1].y);
    }
    
    else{
      rect(connect[0].x, connect[0].y-size/2, connect[1].x+size/2, connect[1].y+size/2);
      fill(255, 255, 0);
      rect(connect[0].x, connect[0].y-size*1/20, connect[1].x, connect[1].y+size*1/20);
    }
  
  }

}
  
