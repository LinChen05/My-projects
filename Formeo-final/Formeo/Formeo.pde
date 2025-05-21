import g4p_controls.*;
import processing.sound.*;

int numFormations = 0, duration = 0, previousSec = second();
SoundFile music;
float sec = 0, min = 0, time = 0;
Dancer Lin = new Dancer("Lin");

ArrayList<Formation> formations = new ArrayList<Formation>(); //holds all the formations
ArrayList<Dancer> dancers = new ArrayList<Dancer>(); //holds all the dancers (formations only hold pvector instruction) 

int a = 0; //current formation number 

PrintWriter Save;

void setup(){
  Save = createWriter("formation.txt"); 
  music = new SoundFile(this, "Meet Again");
  frameRate(60);
  size(1000, 800);
  createGUI();
  
  dancers.add(Lin);
  Formation first = new Formation(5);
  formations.add(first);
}

void draw(){
  if(music != null){
    if(previousSec != second() && music.isPlaying()){
      duration += 1;
      previousSec = second();
    }
  }
  
  for(int i = 0; i < formations.size(); i++){ //
    if(formations.get(i).formationTiming == duration && formations.get(i).formationTiming>0){ //&& formations.get(i).formationTiming>0
      a = i;
    }
  }
  
  background(255);
  int timeMin = int(duration/60);
  int timeSec = int(duration%60); 
  
  if(formations != null){
    formations.get(a).beOnScreen();
  }
  
  timer.setText(timeMin + " : " + timeSec);
}
