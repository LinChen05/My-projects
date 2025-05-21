float energy;

void mousePressed(){ //if the mouse is pressed it will store when it was pressed
  startedTime = second() + minute()*60 + hour()*360;
  clicked = true; //this is to activate the bar above
}

void mouseReleased(){
  clicked = false;
  diffTime = second() + minute()*60 + hour()*360 - startedTime; //when the mouse is released how long the button is pressed is calculated
  energy = diffTime*energyRate; //then the time will be used to determine how much energy there are in the crack
  
  if(mode == "Crack"){
    for(int i = 0; i <= energy/10; i++){//this is to caculate how much splits are created at the point depending on how much energy there are.
      Crack newCrack = new Crack(energy, new PVector(mouseX, mouseY));
      cracks.add(newCrack);
      cracking.play(); //plays the crack sound effect
    }
  }
  
  else if(mode == "Thunder"){//if the mode is thunder do the following
    int ground = (int) random(100); //where should the thunderland relative to the ground
    Thunder newThunder = new Thunder(new PVector(mouseX, (int) random(150)), height- ground, height- ground, 0, thunder);
    thunders.add(newThunder);
  }
}
