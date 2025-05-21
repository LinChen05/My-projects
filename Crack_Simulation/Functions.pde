PVector[] rainDrops;

void drawLine(PVector a, PVector b){//making lines much easier to write when it is needed
  line(a.x, a.y, b.x, b.y);
}

void drawBar(){//this draws the bar based on how long the user press the button
  if(clicked == true){
    widths += 1;
  }
  
  else{
    widths = 0;
  }
  
  if(widths <= 255*2){ //goes from green to red and finally to black
    fill(widths, 255-widths/2, 0);
  }
  
  else{
    fill(255*2-widths/2, 0, 0);
  }
  
  rect(0, 0, widths, 50); //draws the bar on top
}

void drawBackgroundThunder(){//creates the background for the thunder effect
  background(20, 18, 115);
  fill(2, 122, 12);
  rect(0, 600, width, height);
  for(int i = 0; i < width/50; i++){//this draws the cloud in the sky
    noStroke();
    fill(88, 88, 94);
    circle(i*100, 50, 200);
  }
  stroke(0);
  strokeWeight(3);
  if(isRaining){//if the raining setting is turned on, the rain will be drawn
    raining();
  }
}

void raining(){ //creates the rain
  for(int i = 0; i < numberDrop; i++){
    if(rainDrops[i].y > height){
      rainDrops[i].y = 0;
    }
    stroke(8, 30, 204);
    strokeWeight(1.5);
    rainDrops[i] = PVector.add(rainDrops[i], new PVector(0, dropSpeed));
    drawLine(rainDrops[i], new PVector(rainDrops[i].x, rainDrops[i].y + dropSize));
  }
  stroke(0);
}

void rainSFX(String a){ //this prevent the rain from being played multiple times at the same time. Without this the audio would be overlapping itself.
  if(a == "play"){//if the audio can be played it will play the rain effect
    rain.loop();//what loop does it play the audio on repeat even after it ends.
  }
}

void changeGUIThunder(){ //change the textbox into the new value and also present the current value
  String statement;
  label2.setText("Thunder Setting:");
  RateLoss.setText("Generation limits: " + genLimit);
  energyMult.setText("Thunder duration (s): " + thunderDuration);
  Num_split.setText("Length Multiplier: " +  lengthMultiplier);
  rainbowG.setText("Flash Mode");
  unlimitedCrackG.setText("Rain");

  if(isRaining){
    statement = "ON";
  }
  else{
    statement = "OFF";
  }
  buttonU.setText(statement);
  
  if(flashON){
    statement = "ON";
  }
  else{
    statement = "OFF";
  }
  buttonR.setText(statement);

  Mode.setText("Current Mode: "+ mode);
}

void changeGUICrack(){//changes the text for the crack effect
  String statement;
  label2.setText("Crack Setting:");
  RateLoss.setText("Rate of Loss " + rateOfLose);
  energyMult.setText("energy Multiplier " + energyRate);
  Num_split.setText("Number of Split " + NumberOfSplit);
  rainbowG.setText("raindbow Mode");
  unlimitedCrackG.setText("Unlimited Cracks");

  
  if(unlimitedCrack){
    statement = "ON";
  }
  else{
    statement = "OFF";
  }
  buttonU.setText(statement);
  
  if(rainbow){
    statement = "ON";
  }
  else{
    statement = "OFF";
  }
  buttonR.setText(statement);

  Mode.setText("Current Mode: "+ mode);
}

void presentColourValue(){ //present the current rgb value 
  if(mode == "Crack"){
    label1.setText("R: " + Cred);
    G.setText("G: " + Cgreen);
    B.setText("B: " + Cblue);
  }
  
  else{
    label1.setText("R: " + Tred);
    G.setText("G: " + Tgreen);
    B.setText("B: " + Tblue);
  }
}
