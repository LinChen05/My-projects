Intersection[][] inter;
Road[][] roadV, roadH;
Car[] car;
PVector start, distance;
int fps = 60;
int size = 75;

////////////////////changeable varible
//controlling how many intersections there are per row and columns
int rows = 5;
int columns = 5;
//control the max and min of time for a stop light to changge
int minTime = 2;
int maxTime = 5;

//control the number of cars and the min and max speed of the cars.
int numCar = 15;
int minSpeed = 5;
int maxSpeed = 9;




void setup(){
  frameRate(fps);
  size(displayWidth, displayHeight);
  
  //intersection  
  inter = new Intersection[rows][columns]; 
  distance = new PVector(width/(2*columns+1), height/(2*rows+1)); //this sets up the distance between the intersections

  //road
  roadH = new Road[rows][columns-1]; //the roads are divided into two groups, vertical and horiztonal.
  roadV = new Road[rows-1][columns];
  
  //car
  car = new Car[numCar];
  
  //creating the intersection
  for(int i = 0; i < rows; i++){
   for(int i2 = 0; i2 < columns; i2++){
      inter[i][i2] = new Intersection(distance.y+(i*2*distance.y),  distance.x+(i2*2*distance.x));
   }
 }
 
 
 //The roads (in order vertical and horiztonal road)
 for(int i = 0; i < rows-1; i++){
   for(int i2 = 0; i2 < columns; i2++){
      roadV[i][i2] = new Road(inter[i][i2], inter[i+1][i2]);
   }
 }
 
 
 for(int i = 0; i < rows; i++){
   for(int i2 = 0; i2 < columns-1; i2++){
      roadH[i][i2] = new Road(inter[i][i2], inter[i][i2+1]);
   }
 }
 
 ///////creates cars
 for(int i = 0; i < numCar; i++){
    car[i] = new Car(i, (int) random(minSpeed, maxSpeed));
  }
}

void draw(){
  background(200, 200, 200);
  for(int i = 0; i < rows-1; i++){
    for(int i2 = 0; i2 < columns; i2++){
      roadV[i][i2].display("vertical");
   }
 }
 
 
  for(int i = 0; i < rows; i++){
    for(int i2 = 0; i2 < columns-1; i2++){
      roadH[i][i2].display("horizontal");
     }
   }

  for(int i = 0; i < rows; i++){
   for(int i2 = 0; i2 < columns; i2++){
     inter[i][i2].display();
     inter[i][i2].assignLight();
     
   }
  }
  
  for(int i = 0; i < numCar; i++){
    car[i].move();
  }
  
  for(int i = 0; i < numCar; i++){
    car[i].display();
  }
  
}
