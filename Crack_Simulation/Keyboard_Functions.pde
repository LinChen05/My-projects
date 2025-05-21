void keyPressed(){ //this clears out the effects on screen
  if(key == 'c'){
    cracks.clear(); //clears the cracks
  }
  
  if(key == 'r'){ //resets all the values in the program
    if(mode == "Crack"){
      rateOfLose = 0.99; //how fast the crack looses energy
      energyRate = 50; //energy multiplier
      NumberOfSplit = 10; //how many generations of crack is allowed
      unlimitedCrack = false;
      rainbow = false;
      Cred = 0;
      Cgreen = 0;
      Cblue = 0;
    }
    
    else{
      lengthMultiplier = 10;
      thunderDuration = 0.5; //how long the thunder stays on screen
      genLimit = 2; //this is pi/thetaAdjustment
      flashON = false; //if the flash should be turned on or not
      isRaining = true;
      Tred = 214;
      Tgreen = 242;
      Tblue = 24;
    }
  }
}
