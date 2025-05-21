class Thunder{
  //fields
  ArrayList<PVector> points = new ArrayList<PVector>();
  PVector startingPoint;
  float K, theta, lengths, end, spawnedTime;
  int numBran, numBranches, heights;
  color c;
  boolean show;
  
  SoundFile thunder;
  
  //constructors
  Thunder(PVector SP, float EY, int h, int n, SoundFile Thu){
    this.startingPoint = SP; //where the thunder starts
    this.points.add(SP); //add the starting point into the point arraylist
    this.theta = random(PI); // how the thunder will start travelling
    this.lengths = this.points.size()*lengthMultiplier; //the length of the thunder crack
    this.end = EY; //where the thunder will end
    this.numBran = n; //generation refers to which branch it belongs to. 0 is the main branch and 1 would be attached to the main branch and 2 would be the attached to the 1 branch etc.
    this.numBranches = (int)random(2, 5); //the number of branches the thunder can have attached
    this.heights = h; //how tall the thunder is
    this.spawnedTime = second() + minute()*60 + hour()*360+millis()/1000; //when the thunder was created
    this.c = color(Tred, Tgreen, Tblue); //colour of the thunder
    this.show = true;//show the thunder
    this.thunder = Thu;//soundfile of the thunder sound effect
    if(numBran == 0){ //if this is the main branch play the sound effect
      this.thunder.play();
    }

    addPointsThunder(); //creates all the point to react the ground
    if(numBran < genLimit){ //creates new thunder if it doesn't pass the number of generation is allowed
      newBranches();
    }
  }
  
  //methods
  void drawThunder(){ //draws the thunder
    if(second() + minute()*60 + hour()*360+ millis()/1000 - spawnedTime < float(1)/60 && flashON){ //draws the flash on screen or when the thunder first spanws
      background(255);
    }
    
    else{
      if(show){ //if the thunder should be visible draw all the lines to made the thunder
        for(int i = 0; i < this.points.size()-1; i++){
          stroke(c);
          drawLine(points.get(i), points.get(i+1));
        }
        strokeWeight(4);
        stroke(0);
      }
      check(); //check if the thunder should still be shwown
    }
  }
  
  void addPointsThunder(){ //this basic bending pattern is enough to replicate how thunder acts, we just need to find it way to discourage the line from going upwards
    this.points.add(PVector.add(points.get(points.size()-1), new PVector(10*cos(theta), 10*sin(theta)))); //it will add the new point into the point arraylist
    this.theta += random(-PI/2, PI/2 ); //the difference in how the angle will change
    while(this.theta > PI || this.theta < 0){// if the change in theta causes the thunder to go off course like travelling up change the theta again
      this.theta += random(-PI/4, PI/4 );
    }
    if(this.points.get(points.size()-1).y < end){ //if the last point doesn't reach the ground it will call itself again until it reaches the point
      this.addPointsThunder();
    }
  }
  
  void newBranches(){//creates new branches
    float min = 0;
    float max = 0;
    int start = 0; //start is where the method will check in the point arraylist
    boolean finding = true;
    
    for(int i = 1; i < numBranches; i++){//for the number of branches do the folloiwng
      max = startingPoint.y+i*((points.get(points.size()-1).y - startingPoint.y)/(numBranches-1));//max is the how far the thunder and reach the ground at max accroding to where it is on the thunder it is attached to
      min = max - (points.get(points.size()-1).y - startingPoint.y)/(numBranches-1); //min is just like max, but the minimum range.
      int picked = (int) random(min, max);//it will then pick a y values between max and min
      
      while(finding){//find the point that has this y value
        if(int(this.points.get(start).y) >= picked-10 && int(this.points.get(start).y) <= picked+10){ //if it finds a point that is close enough it will end the while loop
          finding = false;
        }
        
        else{
          start++; //if not it will keep increase the start value to check the next point
        }
      }

      Thunder newThunder = new Thunder(points.get(start), points.get(start).y+ random(50, 200), heights-int(points.get(start).y),numBran+1, this.thunder); //it will then create a new thunder to the new values
      thunders.add(newThunder); //it will then add this new thunder to the thunder arraylist
    }
  }
  
  void check(){//checks if the thunder shoudl exist or depending on if it past the thunder duration
    if(second() + minute()*60 + hour()*360+ millis()/1000 - spawnedTime > thunderDuration){
      this.show = false;
    }
  }
}
