class Crack{
  //fields
  ArrayList<PVector> points = new ArrayList<PVector>();
  float K, theta, lengths, distanceTravelled;
  int potentialCracks, splitNum;
  PVector startPos, currEndPos, currEndPosV;
  boolean canSplit, splitOff;
  color c;
  
  //constructors
  Crack(float k, PVector SP){
    this.K = k;
    this.lengths = k/10; //the length is tenth of the energy
    this.startPos = SP;
    this.points.add(startPos);
    this.currEndPos = SP;
    this.theta = random(0, 2*PI); //start the line in a random angle
    this.currEndPosV = PVector.div(new PVector (this.lengths*cos(theta), this.lengths*sin(theta)), this.K/50); //the speed of the crack will be the length of the line divided by energy/50
    this.splitOff = false; //statement used to confirm the crackline has split already
    this.canSplit = false; //did the current generation of crack reach it's final length, if it did it can split
    this.distanceTravelled = 0; //how far the current gen travelled so far.
    this.splitNum = 0; //how many time did it split
    this.c = color(Cred, Cgreen, Cblue); //the colour of the crack
  }
  
  Crack(float k, PVector SP, float angle, int SN){ //this is for creating the new generation of the crack. The main different is it will continue off where the old one did. this is done to keep track of how many generation of cracks are created
    this.K = k;
    this.lengths = k/10;
    this.startPos = SP;
    this.points.add(startPos);
    this.currEndPos = SP;
    this.theta = angle + random(-PI/2, PI/2);
    this.currEndPosV = PVector.div(new PVector (this.lengths*cos(theta), this.lengths*sin(theta)), this.K/50);
    this.splitOff = false;
    this.canSplit = false;
    this.potentialCracks = int(random(5));
    this.distanceTravelled = 0; 
    this.splitNum = SN;
    this.c = color(Cred, Cgreen, Cblue);

  }
  
  
  //methods
  void drawCrack(){ //draws the crack
    for(int i = 0; i < points.size()-1; i++){
      if(rainbow){ //if the user wants rainbow mode the colour of the crack will be constantly changing
        stroke(random(255), random(255), random(255));
      }
      else{
        stroke(c); //or the user can use the default colour or their custom colour
      }
      drawLine(points.get(i), points.get(i+1)); //draws the line
    }
        
    if(distanceTravelled <= lengths){ //if the crack hasn't travelled the set distance it has, it will keep going
      this.currEndPos = PVector.add(currEndPos, currEndPosV);
    }
    
    else { //if it did it will create another crack
        this.canSplit = true;
    }
    
    createCrack(); //checks if it can create more crack
    
  }
  
  void createCrack(){
    if(this.canSplit == true && this.splitOff == false && ((this.splitNum < NumberOfSplit)|| unlimitedCrack)){ //this checks if the crack has met the prerequisite to split off
      for(int i = 0; i <= log(this.K)/log(14); i++){//if it does it will create a new crack for this number of times base off of this experiment equation for the best result.
        Crack newCrack = new Crack((this.K*rateOfLose)/log(this.K)/log(14), currEndPos, this.theta, this.splitNum+1); //the log(this.K)/log(14) is there to help control the power of K, or else it will cause massive spikes
        cracks.add(newCrack); //it will then add the new crack into the arraylist
        splitOff = true; //this is to confirm that the current crack split off and no longer able to create anymore cracks after the method ends
      }
    }
  }
  
  void changeDirection(){
    if(int(random(100)) < 50){ //there will be a 50/50 chance of the line splitting in different dirction
      this.theta += random(-PI/6, PI/6); //if it did it will first create the difference in angle
      this.points.add(currEndPos); //add the currentpoint into the arraylist of points
      this.currEndPosV = new PVector ((this.K/100)*cos(theta), (this.K/100)*sin(theta)); //change and create the new velocity
      distanceTravelled += PVector.dist(points.get(points.size()-1), points.get(points.size()-2)); //it will then calculate how far the crack has travelled
    }
  }
}
