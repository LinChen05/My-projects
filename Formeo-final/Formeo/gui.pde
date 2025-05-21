/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

synchronized public void MainPan(PApplet appc, GWinData data) { //_CODE_:Main:834305:
  appc.background(230);
} //_CODE_:Main:834305:

public void Player(GImageButton source, GEvent event) { //_CODE_:PauRes:449477:
  if(music.isPlaying()){
    music.pause();
  }
  else{
    music.play();
  }
} //_CODE_:PauRes:449477:

public void goB(GImageButton source, GEvent event) { //_CODE_:Backwards:823985:
  time -= 5;
  music.jump(time);
} //_CODE_:Backwards:823985:

public void imgButton4_click1(GImageButton source, GEvent event) { //_CODE_:forward:507411:
  time += 5;
  music.jump(time);
} //_CODE_:forward:507411:

public void percent(GSlider source, GEvent event) { //_CODE_:songTime:985586:
  music.jump(music.duration()*songTime.getValueF());
  duration = int(music.duration()*songTime.getValueF());
} //_CODE_:songTime:985586:

public void AddF(GImageButton source, GEvent event) { //_CODE_:FormationIncrement:412917:
   float e = formations.get(a).formationTiming;
   formations.add(new Formation(duration));
   formations.get(formations.size()-1).formationTiming = e+2;
   a=formations.size()-1;
} //_CODE_:FormationIncrement:412917:

public void AddDance(GImageButton source, GEvent event) { //_CODE_:DancerIncrement:555451:
  for (int i =0; i < formations.size();i++) {
      PVector mouse = new PVector(width/2, height/2);
      formations.get(i).goHere.add(mouse);
     }
    dancers.add(new Dancer("New Guy"));
} //_CODE_:DancerIncrement:555451:

public void RemoveF(GImageButton source, GEvent event) { //_CODE_:FormationDecrement:936896:
  formations.remove(a);
} //_CODE_:FormationDecrement:936896:

public void RemoveD(GImageButton source, GEvent event) { //_CODE_:DancerDecrement:610835:
  for (int i =0; i < dancers.size();i++) {
   if(dancers.get(i).selected == true) {
   dancers.remove(i);
     for (int e =0; e < formations.size(); e++) {
       formations.get(e).goHere.remove(i);
     }
   }
  }
} //_CODE_:DancerDecrement:610835:

public void Minute(GTextField source, GEvent event) { //_CODE_:Minutes:951467:
  min = int(Minutes.getText());
  time = sec+min*60;
  duration = int(time);
  music.jump(time);
} //_CODE_:Minutes:951467:

public void Second(GTextField source, GEvent event) { //_CODE_:Seconds:775212:
  sec = int(Seconds.getText());
  time = sec + min*60; //time is needed to calculate how many seconds that are jumped to
  duration = int(time);
  music.jump(time);
} //_CODE_:Seconds:775212:

public void Naming(GTextField source, GEvent event) { //_CODE_:Name:994843:
  for(int i = 0; i <= dancers.size(); i++){
    if(dancers.get(i).selected  == true){
      dancers.get(i).name = Name.getText();
    }
  }
} //_CODE_:Name:994843:

public void saveAll(GButton source, GEvent event) { //_CODE_:savebutton:397230:
  saves();
  launch(sketchPath("formation.txt"));
} //_CODE_:savebutton:397230:

public void Load_Formation(GButton source, GEvent event) { //_CODE_:Load:324197:
  selectInput("Select a file to process:", "fileSelected");
} //_CODE_:Load:324197:

synchronized public void win_draw3(PApplet appc, GWinData data) { //_CODE_:window3:638260:
  appc.background(230);
  ///This whole line until the end is to the set the buttons to be visible or not
  formationOne.setVisible(true);
  formationTwo.setVisible(true);
  formationThree.setVisible(true);
  formationFour.setVisible(true);
  formationFive.setVisible(true);
  formationSix.setVisible(true);
  formationSeven.setVisible(true);
  formationEight.setVisible(true);
  formationNine.setVisible(true);
  formationTen.setVisible(true);
  formationEleven.setVisible(true);
  formationTwelve.setVisible(true);
  formationThirteen.setVisible(true);
  formationFourteen.setVisible(true);
  formationFifteen.setVisible(true);
  formationSixteen.setVisible(true);
  formationSeventeen.setVisible(true);
  formationEighteen.setVisible(true);
  formationNineteen.setVisible(true);
  formationTwenty.setVisible(true);
  formationTwentyOne.setVisible(true);
  formationTwentyTwo.setVisible(true);
  formationTwentyThree.setVisible(true);
  formationTwentyFour.setVisible(true);
  formationTwentyFive.setVisible(true);
  formationTwentySix.setVisible(true);
  formationTwentySeven.setVisible(true);
  formationTwentyEight.setVisible(true);
  formationTwentyNine.setVisible(true);
  formationThirty.setVisible(true);
  if (formations.size() < 31) {
    formationThirty.setVisible(false);
  }
  
  if (formations.size() < 30) {
    formationTwentyNine.setVisible(false);
  }
  
  if (formations.size() < 29) {
    formationTwentyEight.setVisible(false);
  }
  
  if (formations.size() < 28) {
    formationTwentySeven.setVisible(false);
  }
  
  if (formations.size() < 27) {
    formationTwentySix.setVisible(false);
  }
  
  if (formations.size() < 26) {
    formationTwentyFive.setVisible(false);
  }
  
  if (formations.size() < 25) {
    formationTwentyFour.setVisible(false);
  }
  
  if (formations.size() < 24) {
    formationTwentyThree.setVisible(false);
  }
  
  if (formations.size() < 23) {
    formationTwentyTwo.setVisible(false);
  }
  
  if (formations.size() < 22) {
    formationTwentyOne.setVisible(false);
  }
  
  if (formations.size() < 21) {
    formationTwenty.setVisible(false);
  }
  
  if (formations.size() < 20) {
    formationNineteen.setVisible(false);
  }
  
  if (formations.size() < 19) {
    formationEighteen.setVisible(false);
  }
  
  if (formations.size() < 18) {
    formationSeventeen.setVisible(false);
  }
  
  if (formations.size() < 17) {
    formationSixteen.setVisible(false);
  }
  
  if (formations.size() < 16) {
    formationFifteen.setVisible(false);
  }
  
  if (formations.size() < 15) {
    formationFourteen.setVisible(false);
  }
  
  if (formations.size() < 14) {
    formationThirteen.setVisible(false);
  }
  
  if (formations.size() < 13) {
    formationTwelve.setVisible(false);
  }
  
  if (formations.size() < 12) {
    formationEleven.setVisible(false);
  }
  
  if (formations.size() < 11) {
    formationTen.setVisible(false);
  }
  
  if (formations.size() < 10) {
    formationNine.setVisible(false);
  }
  
  if (formations.size() < 9) {
    formationEight.setVisible(false);
  }
  
  if (formations.size() < 8) {
    formationSeven.setVisible(false);
  }
  
  if (formations.size() < 7) {
    formationSix.setVisible(false);
  }
  
  if (formations.size() < 6) {
    formationFive.setVisible(false);
  }
  
  if (formations.size() < 5) {
    formationFour.setVisible(false);
  }
  
  if (formations.size() < 4) {
    formationThree.setVisible(false);
  }
  
  if (formations.size() < 3) {
    formationTwo.setVisible(false);
  }
  
  if (formations.size() < 2) {
    formationOne.setVisible(false);
  }
  ///The rest is for selecting the formations
  formationOne.setLocalColor(4, color(140));
  formationTwo.setLocalColor(4, color(140));
  formationThree.setLocalColor(4, color(140));
  formationFour.setLocalColor(4, color(140));
  formationFive.setLocalColor(4, color(140));
  formationSix.setLocalColor(4, color(140));
  formationSeven.setLocalColor(4, color(140));
  formationEight.setLocalColor(4, color(140));
  formationNine.setLocalColor(4, color(140));
  formationTen.setLocalColor(4, color(140));
  formationEleven.setLocalColor(4, color(140));
  formationTwelve.setLocalColor(4, color(140));
  formationThirteen.setLocalColor(4, color(140));
  formationFourteen.setLocalColor(4, color(140));
  formationFifteen.setLocalColor(4, color(140));
  formationSixteen.setLocalColor(4, color(140));
  formationSeventeen.setLocalColor(4, color(140));
  formationEighteen.setLocalColor(4, color(140));
  formationNineteen.setLocalColor(4, color(140));
  formationTwenty.setLocalColor(4, color(140));
  formationTwentyOne.setLocalColor(4, color(140));
  formationTwentyTwo.setLocalColor(4, color(140));
  formationTwentyThree.setLocalColor(4, color(140));
  formationTwentyFour.setLocalColor(4, color(140));
  formationTwentyFive.setLocalColor(4, color(140));
  formationTwentySix.setLocalColor(4, color(140));
  formationTwentySeven.setLocalColor(4, color(140));
  formationTwentyEight.setLocalColor(4, color(140));
  formationTwentyNine.setLocalColor(4, color(140));
  formationThirty.setLocalColor(4, color(140));
  
  if(a == 1)
      formationOne.setLocalColor(4, color(0, 255, 0));
  if(a == 2)
      formationTwo.setLocalColor(4, color(0, 255, 0));
  if(a == 3)
      formationThree.setLocalColor(4, color(0, 255, 0));
  if(a == 4)
      formationFour.setLocalColor(4, color(0, 255, 0));
  if(a == 5)
      formationFive.setLocalColor(4, color(0, 255, 0));
  if(a == 6)
      formationSix.setLocalColor(4, color(0, 255, 0));
  if(a == 7)
      formationSeven.setLocalColor(4, color(0, 255, 0));
  if(a == 8)
      formationEight.setLocalColor(4, color(0, 255, 0));
  if(a == 9)
      formationNine.setLocalColor(4, color(0, 255, 0));
  if(a == 10)
      formationTen.setLocalColor(4, color(0, 255, 0));
  if(a == 11)
      formationEleven.setLocalColor(4, color(0, 255, 0));
  if(a == 12)
      formationTwelve.setLocalColor(4, color(0, 255, 0));
  if(a == 13)
      formationThirteen.setLocalColor(4, color(0, 255, 0));
  if(a == 14)
      formationFourteen.setLocalColor(4, color(0, 255, 0));
  if(a == 15)
      formationFifteen.setLocalColor(4, color(0, 255, 0));
  if(a == 16)
      formationSixteen.setLocalColor(4, color(0, 255, 0));
  if(a == 17)
      formationSeventeen.setLocalColor(4, color(0, 255, 0));
  if(a == 18)
      formationEighteen.setLocalColor(4, color(0, 255, 0));
  if(a == 19)
      formationNineteen.setLocalColor(4, color(0, 255, 0));
  if(a == 20)
      formationTwenty.setLocalColor(4, color(0, 255, 0));
  if(a == 21)
      formationTwentyOne.setLocalColor(4, color(0, 255, 0));
  if(a == 22)
      formationTwentyTwo.setLocalColor(4, color(0, 255, 0));
  if(a == 23)
      formationTwentyThree.setLocalColor(4, color(0, 255, 0));
  if(a == 24)
      formationTwentyFour.setLocalColor(4, color(0, 255, 0));
  if(a == 25)
      formationTwentyFive.setLocalColor(4, color(0, 255, 0));
  if(a == 26)
      formationTwentySix.setLocalColor(4, color(0, 255, 0));
  if(a == 27)
      formationTwentySeven.setLocalColor(4, color(0, 255, 0));
  if(a == 28)
      formationTwentyEight.setLocalColor(4, color(0, 255, 0));
  if(a == 29)
      formationTwentyNine.setLocalColor(4, color(0, 255, 0));
  if(a == 30)
      formationThirty.setLocalColor(4, color(0, 255, 0));
} //_CODE_:window3:638260:

public void button1_click1(GButton source, GEvent event) { //_CODE_:formationOne:956172:
  a = 1;
} //_CODE_:formationOne:956172:

public void button1_click2(GButton source, GEvent event) { //_CODE_:formationTwo:966306:
  a = 2;
} //_CODE_:formationTwo:966306:

public void button1_click3(GButton source, GEvent event) { //_CODE_:formationThree:687900:
  a = 3;
} //_CODE_:formationThree:687900:

public void button1_click4(GButton source, GEvent event) { //_CODE_:formationFour:757134:
  a = 4;
} //_CODE_:formationFour:757134:

public void button1_click5(GButton source, GEvent event) { //_CODE_:formationFive:322085:
  a = 5;
} //_CODE_:formationFive:322085:

public void button1_click6(GButton source, GEvent event) { //_CODE_:formationSix:676550:
  a = 6;
} //_CODE_:formationSix:676550:

public void button1_click7(GButton source, GEvent event) { //_CODE_:formationSeven:706924:
  a = 7;
} //_CODE_:formationSeven:706924:

public void button1_click8(GButton source, GEvent event) { //_CODE_:formationEight:615089:
  a = 8;
} //_CODE_:formationEight:615089:

public void button1_click9(GButton source, GEvent event) { //_CODE_:formationNine:414166:
  a = 9;
} //_CODE_:formationNine:414166:

public void button1_click10(GButton source, GEvent event) { //_CODE_:formationTen:968302:
  a = 10;
} //_CODE_:formationTen:968302:

public void button1_click11(GButton source, GEvent event) { //_CODE_:formationEleven:771580:
  a = 11;
} //_CODE_:formationEleven:771580:

public void button1_click12(GButton source, GEvent event) { //_CODE_:formationTwelve:918587:
  a = 12;
} //_CODE_:formationTwelve:918587:

public void button1_click13(GButton source, GEvent event) { //_CODE_:formationThirteen:794779:
  a = 13;
} //_CODE_:formationThirteen:794779:

public void button1_click14(GButton source, GEvent event) { //_CODE_:formationFourteen:418010:
  a = 14;
} //_CODE_:formationFourteen:418010:

public void button1_click15(GButton source, GEvent event) { //_CODE_:formationFifteen:299910:
  a = 15;
} //_CODE_:formationFifteen:299910:

public void button1_click16(GButton source, GEvent event) { //_CODE_:formationSixteen:299850:
  a = 16;
} //_CODE_:formationSixteen:299850:

public void button1_click17(GButton source, GEvent event) { //_CODE_:formationSeventeen:259721:
  a = 17;
} //_CODE_:formationSeventeen:259721:

public void button1_click18(GButton source, GEvent event) { //_CODE_:formationEighteen:257926:
  a = 18;
} //_CODE_:formationEighteen:257926:

public void button1_click19(GButton source, GEvent event) { //_CODE_:formationNineteen:459628:
  a = 19;
} //_CODE_:formationNineteen:459628:

public void button1_click20(GButton source, GEvent event) { //_CODE_:formationTwenty:215859:
  a = 20;
} //_CODE_:formationTwenty:215859:

public void button1_click21(GButton source, GEvent event) { //_CODE_:formationTwentyOne:401818:
  a = 21;
} //_CODE_:formationTwentyOne:401818:

public void button1_click22(GButton source, GEvent event) { //_CODE_:formationTwentyTwo:385110:
  a = 22;
} //_CODE_:formationTwentyTwo:385110:

public void button1_click23(GButton source, GEvent event) { //_CODE_:formationTwentyThree:821560:
  a = 23;
} //_CODE_:formationTwentyThree:821560:

public void button1_click24(GButton source, GEvent event) { //_CODE_:formationTwentyFour:289153:
  a = 24;
} //_CODE_:formationTwentyFour:289153:

public void button1_click25(GButton source, GEvent event) { //_CODE_:formationTwentyFive:256626:
 a = 25;
} //_CODE_:formationTwentyFive:256626:

public void button1_click26(GButton source, GEvent event) { //_CODE_:formationTwentySix:923776:
 a = 26;
} //_CODE_:formationTwentySix:923776:

public void button1_click27(GButton source, GEvent event) { //_CODE_:formationTwentySeven:860593:
  a = 27;
} //_CODE_:formationTwentySeven:860593:

public void button1_click28(GButton source, GEvent event) { //_CODE_:formationTwentyEight:271093:
  a = 28;
} //_CODE_:formationTwentyEight:271093:

public void button1_click29(GButton source, GEvent event) { //_CODE_:formationTwentyNine:629094:
  a = 29;
} //_CODE_:formationTwentyNine:629094:

public void button1_click30(GButton source, GEvent event) { //_CODE_:formationThirty:392618:
  a = 30;
} //_CODE_:formationThirty:392618:

public void ChooseSong(GButton source, GEvent event) { //_CODE_:PickSong:480976:
  if(music.isPlaying()){
    music.pause();
  }
  selectInput("Select a file to process:", "fileSelected");
  musicPath = path;
  music = new SoundFile(this, musicPath);
  duration = 0;
  
} //_CODE_:PickSong:480976:

public void textfield1_change1(GTextField source, GEvent event) { //_CODE_:TransMin:309487:
} //_CODE_:TransMin:309487:

public void SetTransSec(GTextField source, GEvent event) { //_CODE_:TransSec:389558:
} //_CODE_:TransSec:389558:

public void ConfirmTransTime(GButton source, GEvent event) { //_CODE_:Confirm:384085:
  formations.get(a).formationTiming = int(TransMin.getText())*60+int(TransSec.getText());
} //_CODE_:Confirm:384085:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setMouseOverEnabled(false);
  surface.setTitle("Sketch Window");
  Main = GWindow.getWindow(this, "Main Panel", 0, 0, 300, 200, JAVA2D);
  Main.noLoop();
  Main.setActionOnClose(G4P.KEEP_OPEN);
  Main.addDrawHandler(this, "MainPan");
  PauRes = new GImageButton(Main, 127, 2, 60, 50, new String[] { "pausPlay.png", "pausPlay.png", "pausPlay.png" } );
  PauRes.addEventHandler(this, "Player");
  Backwards = new GImageButton(Main, 39, 4, 67, 40, new String[] { "back.png", "back.png", "back.png" } );
  Backwards.addEventHandler(this, "goB");
  forward = new GImageButton(Main, 208, 7, 64, 39, new String[] { "forward.png", "forward.png", "forward.png" } );
  forward.addEventHandler(this, "imgButton4_click1");
  songTime = new GSlider(Main, 57, 59, 200, 38, 10.0);
  songTime.setLimits(0.0, 0.0, 1.0);
  songTime.setNumberFormat(G4P.DECIMAL, 2);
  songTime.setOpaque(false);
  songTime.addEventHandler(this, "percent");
  FormationIncrement = new GImageButton(Main, 26, 131, 43, 34, new String[] { "plus.png", "plus.png", "plus.png" } );
  FormationIncrement.addEventHandler(this, "AddF");
  DancerIncrement = new GImageButton(Main, 180, 133, 42, 34, new String[] { "plus.png", "plus.png", "plus.png" } );
  DancerIncrement.addEventHandler(this, "AddDance");
  FormationDecrement = new GImageButton(Main, 77, 124, 53, 52, new String[] { "minus.png", "minus.png", "minus.png" } );
  FormationDecrement.addEventHandler(this, "RemoveF");
  DancerDecrement = new GImageButton(Main, 224, 129, 67, 45, new String[] { "minus.png", "minus.png", "minus.png" } );
  DancerDecrement.addEventHandler(this, "RemoveD");
  Minutes = new GTextField(Main, 81, 90, 68, 16, G4P.SCROLLBARS_NONE);
  Minutes.setPromptText("Minutes");
  Minutes.setOpaque(true);
  Minutes.addEventHandler(this, "Minute");
  Seconds = new GTextField(Main, 168, 88, 71, 17, G4P.SCROLLBARS_NONE);
  Seconds.setPromptText("Seconds");
  Seconds.setOpaque(true);
  Seconds.addEventHandler(this, "Second");
  label1 = new GLabel(Main, 21, 113, 115, 20);
  label1.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label1.setText("Add/Del Formations");
  label1.setOpaque(false);
  Name = new GTextField(Main, 200, 174, 92, 19, G4P.SCROLLBARS_NONE);
  Name.setPromptText("Dancer's Name");
  Name.setOpaque(true);
  Name.addEventHandler(this, "Naming");
  label2 = new GLabel(Main, 185, 115, 103, 20);
  label2.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label2.setText("Add/Del Dancers");
  label2.setOpaque(false);
  timer = new GLabel(Main, 115, 51, 80, 20);
  timer.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  timer.setText("timer");
  timer.setOpaque(false);
  savebutton = new GButton(Main, 8, 166, 68, 31);
  savebutton.setText("Save Formation");
  savebutton.addEventHandler(this, "saveAll");
  Load = new GButton(Main, 77, 166, 68, 30);
  Load.setText("Load formation");
  Load.addEventHandler(this, "Load_Formation");
  window3 = GWindow.getWindow(this, "Window title", 0, 400, 250, 310, JAVA2D);
  window3.noLoop();
  window3.setActionOnClose(G4P.KEEP_OPEN);
  window3.addDrawHandler(this, "win_draw3");
  formationOne = new GButton(window3, 10, 70, 30, 30);
  formationOne.setText("1");
  formationOne.addEventHandler(this, "button1_click1");
  formationTwo = new GButton(window3, 60, 70, 30, 30);
  formationTwo.setText("2");
  formationTwo.addEventHandler(this, "button1_click2");
  formationThree = new GButton(window3, 110, 70, 30, 30);
  formationThree.setText("3");
  formationThree.addEventHandler(this, "button1_click3");
  formationFour = new GButton(window3, 160, 70, 30, 30);
  formationFour.setText("4");
  formationFour.addEventHandler(this, "button1_click4");
  formationFive = new GButton(window3, 210, 70, 30, 30);
  formationFive.setText("5");
  formationFive.addEventHandler(this, "button1_click5");
  formationSix = new GButton(window3, 10, 110, 30, 30);
  formationSix.setText("6");
  formationSix.addEventHandler(this, "button1_click6");
  formationSeven = new GButton(window3, 60, 110, 30, 30);
  formationSeven.setText("7");
  formationSeven.addEventHandler(this, "button1_click7");
  formationEight = new GButton(window3, 110, 110, 30, 30);
  formationEight.setText("8");
  formationEight.addEventHandler(this, "button1_click8");
  formationNine = new GButton(window3, 160, 110, 30, 30);
  formationNine.setText("9");
  formationNine.addEventHandler(this, "button1_click9");
  formationTen = new GButton(window3, 210, 110, 30, 30);
  formationTen.setText("10");
  formationTen.addEventHandler(this, "button1_click10");
  formationEleven = new GButton(window3, 10, 150, 30, 30);
  formationEleven.setText("11");
  formationEleven.addEventHandler(this, "button1_click11");
  formationTwelve = new GButton(window3, 60, 150, 30, 30);
  formationTwelve.setText("12");
  formationTwelve.addEventHandler(this, "button1_click12");
  formationThirteen = new GButton(window3, 108, 150, 30, 30);
  formationThirteen.setText("13");
  formationThirteen.addEventHandler(this, "button1_click13");
  formationFourteen = new GButton(window3, 160, 150, 30, 30);
  formationFourteen.setText("14");
  formationFourteen.addEventHandler(this, "button1_click14");
  formationFifteen = new GButton(window3, 210, 150, 30, 30);
  formationFifteen.setText("15");
  formationFifteen.addEventHandler(this, "button1_click15");
  formationSixteen = new GButton(window3, 10, 190, 30, 30);
  formationSixteen.setText("16");
  formationSixteen.addEventHandler(this, "button1_click16");
  formationSeventeen = new GButton(window3, 60, 190, 30, 30);
  formationSeventeen.setText("17");
  formationSeventeen.addEventHandler(this, "button1_click17");
  formationEighteen = new GButton(window3, 110, 190, 30, 30);
  formationEighteen.setText("18");
  formationEighteen.addEventHandler(this, "button1_click18");
  formationNineteen = new GButton(window3, 160, 190, 30, 30);
  formationNineteen.setText("19");
  formationNineteen.addEventHandler(this, "button1_click19");
  formationTwenty = new GButton(window3, 210, 190, 30, 30);
  formationTwenty.setText("20");
  formationTwenty.addEventHandler(this, "button1_click20");
  formationTwentyOne = new GButton(window3, 10, 230, 30, 30);
  formationTwentyOne.setText("21");
  formationTwentyOne.addEventHandler(this, "button1_click21");
  formationTwentyTwo = new GButton(window3, 60, 230, 30, 30);
  formationTwentyTwo.setText("22");
  formationTwentyTwo.addEventHandler(this, "button1_click22");
  formationTwentyThree = new GButton(window3, 110, 230, 30, 30);
  formationTwentyThree.setText("23");
  formationTwentyThree.addEventHandler(this, "button1_click23");
  formationTwentyFour = new GButton(window3, 160, 230, 30, 30);
  formationTwentyFour.setText("24");
  formationTwentyFour.addEventHandler(this, "button1_click24");
  formationTwentyFive = new GButton(window3, 210, 230, 30, 30);
  formationTwentyFive.setText("25");
  formationTwentyFive.addEventHandler(this, "button1_click25");
  formationTwentySix = new GButton(window3, 10, 270, 30, 30);
  formationTwentySix.setText("26");
  formationTwentySix.addEventHandler(this, "button1_click26");
  formationTwentySeven = new GButton(window3, 60, 270, 30, 30);
  formationTwentySeven.setText("27");
  formationTwentySeven.addEventHandler(this, "button1_click27");
  formationTwentyEight = new GButton(window3, 110, 270, 30, 30);
  formationTwentyEight.setText("28");
  formationTwentyEight.addEventHandler(this, "button1_click28");
  formationTwentyNine = new GButton(window3, 160, 270, 30, 30);
  formationTwentyNine.setText("29");
  formationTwentyNine.addEventHandler(this, "button1_click29");
  formationThirty = new GButton(window3, 210, 270, 30, 30);
  formationThirty.setText("30");
  formationThirty.addEventHandler(this, "button1_click30");
  PickSong = new GButton(window3, 10, 15, 80, 30);
  PickSong.setText("Switch Song");
  PickSong.addEventHandler(this, "ChooseSong");
  TransMin = new GTextField(window3, 108, 10, 66, 17, G4P.SCROLLBARS_NONE);
  TransMin.setPromptText("set minute");
  TransMin.setOpaque(true);
  TransMin.addEventHandler(this, "textfield1_change1");
  TransSec = new GTextField(window3, 106, 32, 67, 23, G4P.SCROLLBARS_NONE);
  TransSec.setPromptText("set second");
  TransSec.setOpaque(true);
  TransSec.addEventHandler(this, "SetTransSec");
  Confirm = new GButton(window3, 185, 18, 41, 30);
  Confirm.setText("Set Time");
  Confirm.addEventHandler(this, "ConfirmTransTime");
  Main.loop();
  window3.loop();
}

// Variable declarations 
// autogenerated do not edit
GWindow Main;
GImageButton PauRes; 
GImageButton Backwards; 
GImageButton forward; 
GSlider songTime; 
GImageButton FormationIncrement; 
GImageButton DancerIncrement; 
GImageButton FormationDecrement; 
GImageButton DancerDecrement; 
GTextField Minutes; 
GTextField Seconds; 
GLabel label1; 
GTextField Name; 
GLabel label2; 
GLabel timer; 
GButton savebutton; 
GButton Load; 
GWindow window3;
GButton formationOne; 
GButton formationTwo; 
GButton formationThree; 
GButton formationFour; 
GButton formationFive; 
GButton formationSix; 
GButton formationSeven; 
GButton formationEight; 
GButton formationNine; 
GButton formationTen; 
GButton formationEleven; 
GButton formationTwelve; 
GButton formationThirteen; 
GButton formationFourteen; 
GButton formationFifteen; 
GButton formationSixteen; 
GButton formationSeventeen; 
GButton formationEighteen; 
GButton formationNineteen; 
GButton formationTwenty; 
GButton formationTwentyOne; 
GButton formationTwentyTwo; 
GButton formationTwentyThree; 
GButton formationTwentyFour; 
GButton formationTwentyFive; 
GButton formationTwentySix; 
GButton formationTwentySeven; 
GButton formationTwentyEight; 
GButton formationTwentyNine; 
GButton formationThirty; 
GButton PickSong; 
GTextField TransMin; 
GTextField TransSec; 
GButton Confirm; 
