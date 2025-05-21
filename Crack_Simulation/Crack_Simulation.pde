import g4p_controls.*;
import processing.sound.*;

ArrayList<Crack> cracks = new ArrayList<Crack>();
ArrayList<Thunder> thunders = new ArrayList<Thunder>();

int startedTime, diffTime;
int numCracks = 0;
int continues = 0; //this is used for checking when to turn on cracking effects.
float simEnergy, widths;
boolean clicked, playCrack;
String mode = "Crack";
String playSound = "play";
SoundFile thunder, rain, cracking;

//adjustable settings

////crack setting
float rateOfLose = 0.99; //how fast the crack looses energy
float energyRate = 50; //energy multiplier
int NumberOfSplit = 10;
boolean unlimitedCrack = false;
boolean rainbow = false;
int Cred = 0;
int Cgreen = 0;
int Cblue = 0;

//Thunder setting
float lengthMultiplier = 10;
float thunderDuration = 0.5; //how long the thunder stays on screen
float genLimit = 2; //this sets the limit on how many generation of thunders we can have
boolean flashON = false; //if the flash should be turned on or not
boolean isRaining = true;
int Tred = 214;
int Tgreen = 242;
int Tblue = 24;

////adjustable setting for thunder background
int numberDrop = 500; //number of rain dropllets
int dropSize = 10; //size of the water drops
int dropSpeed = 10; //speed of the water drops

void setup(){
  frameRate(60);
  clicked = false;
  playCrack = false;
  
  
  size(1000, 800);
  createGUI();
  Mode.setText("Current Mode: "+ mode); //sets the mode text to the current mode
  thunder = new SoundFile(this, "ThunderSFX.mp3"); //load the soundfile
  rain = new SoundFile(this, "RainSFX.mp3");
  cracking = new SoundFile(this, "CrackingSFX.mp3");

 
  rainDrops = new PVector[numberDrop]; //create the PVector for number of raindrops
  for(int i = 0; i < numberDrop; i++){ //randomize the rainDrops' position
    rainDrops[i] = new PVector((int) random(width), (int) random(height));
  }
}

void draw(){
  background(255);
  presentColourValue();
  if(mode == "Crack"){ //if the current mode is crack do the following
    rain.stop(); //stop playing the rain adudio from thunder
    playSound = "play";//this is to reset the statement so when the rain audio is play again it can be played
    
    stroke(0); //default adjustment for the texts
    strokeWeight(1);
      for(int i = 0; i < cracks.size(); i++){      
      cracks.get(i).drawCrack(); //it will draw the cracks that are currenlty present and also create future cracks
      
      if(cracks.get(i).lengths > cracks.get(i).distanceTravelled){ //checks if the crack has travelled the amount of distance it was suppose to travel
        cracks.get(i).changeDirection(); //it will change the direction the crack will travel
      }
    }
    drawBar(); //this draws the power bar
    changeGUICrack(); //this will adjust the text in the editor gui
  }
  
  if(mode == "Thunder"){ //if the current mode is thunder do the folloinwg
    rainSFX(playSound); //play the sound effect
    playSound = "playing"; 
    drawBackgroundThunder(); //draws the background for the thunder
    strokeWeight(5); //chnages the stroke size for the thunder
    for(int i = 0; i < thunders.size(); i++){ //draw the thunder
      thunders.get(i).drawThunder();
      if(thunders.get(i).show == false){ //if the thunder has existed beyond the duration limit it will dissappear
        thunders.remove(i); 
      }
    }
    strokeWeight(4); //reset the stroke size to normal
    changeGUIThunder(); //set the text in the editor gui
  }

}
