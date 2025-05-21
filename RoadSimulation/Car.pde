class Car{
  //fields
  
  PVector direction, cLocation, cCoord, goToCoord, goTo;
  int velocity, maxVelocity;
  int carNumber;
  
  int randRow;
  int randCol;
  
  //The job of the four direction is to used to reference which axis the car will travel in.
  PVector north = new PVector(0, -1);
  PVector east = new PVector(1, 0);
  PVector south = new PVector(0, 1);
  PVector west = new PVector(-1, 0);
  
  color c;
  String sideOfRoad;
  boolean foundDirection, foundCar, noCar;
  
  
  //constructors
  Car(int i, int v){
    randRow = int(random(1, rows-1)); //randomize where the car will be placed
    randCol = int(random(1, columns-1));
    
    while(inter[randRow][randCol].haveCar == true){ //this is to keep finding a spot until the car finds a intersection that doesn't have a car.
      randRow = (int)random(rows);
      randCol = (int)random(columns);
    }
    this.cCoord = new PVector(randRow, randCol); //after the while statement is finished it will add the coordinates and also the location of the intersection
    this.cLocation = inter[int(this.cCoord.y)][int(this.cCoord.x)].location;   
    inter[randRow][randCol].haveCar = true; //this is to let the car claim the intersection so no it won't share space with another car
    
    this.velocity = v; //velocity will be changing, maxVelocity is used to change the car back to it's orignal speed
    this.maxVelocity = v;
    
    this.carNumber = i; //car name is to give the car a name for it to reference when it intereacts with other cars.
    
    goWhere(); //after the car is finished it will then decide where it will go
  }
  
  
  //methods
  //////////////////////////////////draws the car
  void display(){
    fill(255, 0, 0);
    square(cLocation.x, cLocation.y, size/2 );
  }
  
  ///////////////////////////////////////this line translates numbers into directions, this method was created so the same code doesn't need to be written multiple times
  void translates(int random){ 
  PVector interSpec = inter[int(cCoord.y)][int(cCoord.x)].location; //the interSpec is the specific location of an intersection. It is used to make sure the car travels on the right side of the road
  
  if(random == 0){
      direction = north;
      cLocation = new PVector(interSpec.x+size/4, interSpec.y);
    }
    
  else if(random == 1){
    direction = south;
    cLocation = new PVector(interSpec.x-size/4, interSpec.y);
  }

  else if(random == 2){
    direction = east;
    cLocation = new PVector(interSpec.x, interSpec.y+size/4);
  }
    
  else{
    direction = west;
    cLocation = new PVector(interSpec.x, interSpec.y-size/4);
  }
}
///////////////////////////////////////////////determine which direction the car goes
 void goWhere(){ //determine which direction the car goes
  //picking a random direction the car goes at first
  int random = (int) random(3);
  translates(random);
  
  //if the car is on the edges of the map, this is to check if the car can travel in the random direction, if not it will pick from a smaller range of directions.
  if((cCoord.y == 0 && direction.y == -1) || (cCoord.y == (rows-1) && direction.y == 1)){
    translates((int) random(3,2));
  }

  if((cCoord.x == 0 && direction.x == -1) || (cCoord.x == (columns-1) && direction.x == 1)){
    translates((int) random(0,1));
  }
  
  //////////////////////////////////corner scenerios
  if((cCoord.x == 0 && cCoord.y == 0)){ //the corner scenrios are similar to the edge locations, it gives the car a smaller range of direction to go in.
    if((int) random(0,1) == 1)
        translates(1);
     else
       translates(2);
  }
  if(cCoord.x == 0 && cCoord.y == (rows-1)){
    if((int) random(0,1) == 1)
       translates(0);
     else
       translates(2);  
  }
    
  if((cCoord.x == (columns - 1) && cCoord.y == 0)){
    if((int) random(0,1) == 1)
       translates(1);
     else
       translates(3);
  }

  if((cCoord.x == (columns - 1) && cCoord.y == (rows-1))){
    if((int) random(0,1) == 1)
        translates(0);
     else
        translates(3);
  }
    //records the coordinate of the intersection is travelling towards
    goToCoord = new PVector (cCoord.x + direction.x, cCoord.y + direction.y);
    goTo = inter[int(goToCoord.y)][int(goToCoord.x)].location;
  }
  
  
  //////////////////////////////////responsbile for the car moving and checking for lights and cars
  void move(){
    cLocation = new PVector( cLocation.x+direction.x*velocity, cLocation.y +direction.y*velocity );  //updates the Location of the car as the car moves
    
    checkCar();
    
    if( dist(cLocation.x, cLocation.y, goTo.x, goTo.y) < size) //checking if the car is close enough to the intersection to see if it has to follow the stop lights.
      checkLight();
      
    if( dist(cLocation.x, cLocation.y, goTo.x, goTo.y) < 20){ //once the car is at the centre of the intersection, it will pick a new direction. The coordinate of the car will also be updated
      cCoord = goToCoord;
      goWhere();
    }
 }
///////////////////////////////////The car checking where it is going has lights
  void checkLight(){
    if((direction == north || direction == south) ){ //checking if the car is travelling vertically or horiztonally.
      if(inter[int(goToCoord.y)][int(goToCoord.x)].vertical == false) //if the vertical is false, that means the car can't travel in that direction and it's speed is set to 0
        velocity = 0;
      else
        velocity = maxVelocity; //if the statement is true, the car will continue to drive like normal, this is here for when the light turns green the car will start to drive
    }
   
    else{
      if( inter[int(goToCoord.y)][int(goToCoord.x)].horizontal == false )
      velocity = 0;
      else
        velocity = maxVelocity;
    }
  }


////////////////////////checks if there is a car in front of it
  void checkCar(){
    foundCar = false;
    noCar = true;
    
    while(foundCar != true){//until there it finds a car or can't find a car the while statement will end
      for(int i = 0; i < numCar; i++){//checking indivdual cars
        if(carNumber != i){ //this is prevent the car from comparing to itself
          if(dist(cLocation.x, cLocation.y, car[i].cLocation.x, car[i].cLocation.y) < size && dist(cLocation.x, cLocation.y, car[i].cLocation.x, car[i].cLocation.y) > size*0.9){ //checking if the car is close enough to another car. The extra statement inside is to prevent the car from entering another car.
            if(direction.x == car[i].direction.x && direction.y == car[i].direction.y){ //checks if the two cars are travelling the same direction
                if(direction == north){ //every if statement are different formula for each direction to find if the car is getting close to another car in front of it.
                  if(cLocation.y - car[i].cLocation.y > 0){
                    velocity = 0;
                    foundCar = true;
                    noCar = false;
                  }
                }
                
                if(direction == south){
                  if(cLocation.y - car[i].cLocation.y < 0){
                    velocity = 0;
                    foundCar = true;
                    noCar = false;
                  }
                }
                  
                if(direction == east){
                  if(cLocation.x - car[i].cLocation.x < 0){
                    velocity = 0;
                    foundCar = true;
                    noCar = false;
                  }
                }
                
                else{
                  if(cLocation.x - car[i].cLocation.x > 0){
                    velocity = 0;
                    foundCar = true;
                    noCar = false;
                  }
                }
              }
            }
          }
        }
        
        foundCar = true; //this ends the while loop after every car has been checked.
    }
   
   if(noCar == true) //if the loop ends and noCar is true (only false if an actual car is found in front) the car will travel like normal
     velocity = maxVelocity;

  }
}
