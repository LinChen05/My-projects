class Formation {
  ArrayList<PVector> goHere; 
  float formationTiming; 
  PVector thisOne; //im just using this to make some random formations to test stuff
  
  
  Formation(float f) {
    goHere = new ArrayList<PVector>();
    for (int i = 0; i < dancers.size();i++) {
       if (formations.size()==0) {
         thisOne = new PVector (random(1000), random(800));} 
       else {
         thisOne = new PVector (formations.get(a).goHere.get(i).x, formations.get(a).goHere.get(i).y);
     }
       goHere.add(thisOne);
     }  
    formationTiming = f;
  }
  
  
  //methods 
  void beOnScreen() {
    for (int i =0; i < dancers.size();i++) {
      dancers.get(i).goingTowards(goHere.get(i));
      dancers.get(i).move();
      dancers.get(i).drawDancer();
    }
  }
}
