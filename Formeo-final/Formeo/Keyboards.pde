void keyPressed(){
  if(key == 'j'){ //adjusting the music through d and f key
    time -= 5;
    music.jump(time);
  }
  
    
  else if(key =='k'){
    time += 5;
    music.jump(time);
  }
    
  else if(key == 'l'){
    time = 0;
    music.jump(time);
    a= 0;
  }
  
  else if (key == CODED){ 
    if(keyCode == RIGHT){//next formation 
     a = a+1; }
    else if(keyCode == LEFT){//prev formation 
     a = a-1; }}
}
  
void mouseDragged() { //dragging teh dancers around and updating the formation's position
   for (int i =0; i < dancers.size();i++) {
     if (dist(mouseX, mouseY, dancers.get(i).location.x, dancers.get(i).location.y) < 40) {
       formations.get(a).goHere.get(i).x = mouseX;
       formations.get(a).goHere.get(i).y = mouseY;
       dancers.get(i).location.x = mouseX;
       dancers.get(i).location.y = mouseY;
     }
     
   } 
}

void mouseClicked(){ //this selects the dancers for when they will be either deleted or have their name changed
   for (int i =0; i < dancers.size();i++) {
     if (dist(mouseX, mouseY, dancers.get(i).location.x, dancers.get(i).location.y) < 40) {
       if(dancers.get(i).selected == true)
         dancers.get(i).selected = false;
         
       else
         dancers.get(i).selected = true;
     }
   }
}
