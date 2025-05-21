ArrayList<String> names = new ArrayList<String>();
String[] data, dataRow, dataNames;
String songPath, dataColumn, path, musicPath, filteredNames;
int numDancer, numFormation, x, y;



void saves(){
  Save.println(musicPath); //printing the path, number of dancers and formations into the text document
  Save.println(dancers.size());
  Save.println(formations.size());
  for(int i = 0; i < dancers.size();i++){ //puts the name of the dancers as an arraylist so it can be placed in a single row in the text file
    names.add(dancers.get(i).name);
  }
  
  Save.println(names);
  
  for(int i = 1; i < formations.size(); i++){ //printing out every positions of the dancers from each formation. the formations are split by being on a differennt rows on the text.
    if(i != formations.size()){
      for(int j = 0; j < dancers.size(); j++){
        Save.print(formations.get(i).goHere.get(j));
        Save.print("\t");
      }
        Save.println();
        Save.println(formations.get(i).formationTiming);
    }
    
    else{ //this else statment is needed to make sure there won't be a empty space row from println, instead just using print
      for(int j = 0; j < dancers.size(); j++){
      Save.print(formations.get(i).goHere.get(j));
      Save.print("\t");
    }
    Save.println();
    Save.print(formations.get(i).formationTiming);
    }
  }
  
  Save.flush(); // Writes the remaining data to the file
  Save.close(); // Finishes the file
}

void load(){
  noLoop();
  PVector thisOne; //the location of the dancer that will be added into the formation
  
  formations.clear(); //renews the formations of the formations and dancers
  dancers.clear();
  
  music = new SoundFile(this, data[0]);//find the song path
  
  Formation first = new Formation(0); //this is here to replicate the orginal set up, formation 0 is needed so the first formation can be 1
  formations.add(first);
  
  filteredNames = data[3].substring(data[3].indexOf("[")+1, data[3].indexOf("]")); //this is to get rid of the square brackets at the end of the strings
  dataNames = filteredNames.split(","); //split the names into arrays
  
  for(int j = 4; j < data.length; j+= 2){ //will start at the 4th line of the text file to find the x and y coordinates of the dancers
    dataRow = data[j].split("\t");
    duration = int(data[j+1]); //duration or the time of the formation is always one line below, so that will be the value of j plus one
    formations.add(new Formation(duration)); //creates an arraylist for formations
    
    
    for(int i = 0; i < dataRow.length; i++){
      dataColumn = dataRow[i].substring(dataRow[i].indexOf("[")+1, dataRow[i].indexOf("]")); //gets rid of the square brackets
      x = int(dataColumn.substring(1,dataColumn.indexOf(","))); //finds the x and y coordinate
      y = int(dataColumn.substring(dataColumn.indexOf(",")+2, dataColumn.indexOf(",", dataColumn.indexOf(",")+1) ));
      thisOne = new PVector (x, y); //putting them togther as a vector
      formations.get(formations.size()-1).goHere.add(thisOne); //add the x and y into the new formation
    }
  } 
  loadDancers(); //due to unknonw reasons loading dancers doesn't work within this function, so another function had to be created to fix the issue
  loop();
  int b = formations.size()-2;
  a = b;
  println(a);
}

void fileSelected(File selection) {//this lilne is needed to translate the path to the actual file itself.
  music = null;
  if (selection == null) {
  } else {
    path = selection.getAbsolutePath(); 
    if(path.endsWith(".mp3")){//detects of sort of file was imported into the program, making sure the correct file is going to the correct place.
      musicPath = path;
      music = new SoundFile(this, musicPath);
    }
    
    else if(path.endsWith(".txt")){
      data = loadStrings(path);//if it is a text file it will be treated as a saved file that will be loaded
      load();
    }
  }
  
}

void loadDancers(){
  for(int i = 0; i < dataNames.length; i++){
    dancers.add(new Dancer(dataNames[i]));
  }
}
