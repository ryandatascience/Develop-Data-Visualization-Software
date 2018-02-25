/*Data Visualization
 Project 4
 Part III scatter plot
 
 data file is srsatact.csv
 
 Yu Liang 2/22/2017*/
 
Table table; //table for csv
int distX = 80;  //location of the bottom left point of the chart
int distY = 450;
float info1;
float info2;//data info to show when mouse click
int value;

void setup() 
{
  size(800, 600);
  background(255);
  selectInput("Input the CSV:", "FileSelected"); //load the csv file
  //noLoop(); //run draw only once
}

void FileSelected(File selection) 
{
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
  println("User selected" + selection.getAbsolutePath());
  table = loadTable(selection.getAbsolutePath(), "header"); //load table from select input csv
  redraw();
  }
}

void draw()
{
  background(255);
  if (table == null) return;
  else {
    

//scatter plot
  fill(255);
  rect(120, 135, 400, 400);
  
  
     //tick marks
    float[] col1 = new float[table.getRowCount()]; //create an array to save a col for max col

    for (int i = 0; i < table.getRowCount(); i++) {
      col1[i] = table.getFloat(i, 2); //save a col value to an array
      //max(col) is max of the col(1)  ceil(max(col))
      //println(ceil(max(col)));
    }
    float[] col2 = new float[table.getRowCount()]; //create an array to save a col for max col

    for (int j = 0; j < table.getRowCount(); j++) {
      col2[j] = table.getFloat(j, 2); //save a col value to an array
      //max(col) is max of the col(1)  ceil(max(col))
      //println(ceil(max(col)));
    }    

    
 fill(0);
   text(int(min(col1)), 100, 145);
   text(int(max(col1)), 100, 545);
   //text(max(col2), 500, 545);
   //text(min(col2), 120, 545);
 
  text("GPA Scores", 300, 550);
  text("ACT Scores", 50, 300);
  fill(255);
  if (mousePressed){
  ellipse( mouseX, mouseY, 2, 2 );
  println( "x: " + mouseX + " y: " + mouseY);
  }  
  
  fill(0,0,255);
  if (table == null) return;
  else {
        for (int i = 0; i < table.getRowCount(); i++){
       
          ellipse(table.getFloat(i, 2) * 15 - 100 , table.getFloat(i, 3) * 150 -100 , 5, 5);   
    }
  }
  
//interaction
    fill(value);
    text("Click the blue circle to show data information", 550, 270);
    text(int(info1), 550, 300);
    text(",   "+ (info2), 570, 300);
    fill(0);
    
 
    
    //title
    noStroke();
    fill(0);
    text("Precentage Difference for President Compaign", distX + 30, distY - 330);

     
    //legend line chart
    text("student ACT GPA",  550, distY - 220);
    stroke(0);
    fill(0,0,255);
    ellipse(580, distY - 205, 5, 5);
  }

frameRate(12);
  println( mouseX + "-" +mouseY);
}

 void mouseClicked() {
    for (int i = 0; i < table.getRowCount(); i++){
   
  if ( value == 0 && 
  table.getFloat(i, 2) * 15 - 100-3 < mouseX && mouseX < table.getFloat(i, 2) * 15 - 100+3 
  && table.getFloat(i, 3) * 150 -100+3> mouseY && mouseY > table.getFloat(i, 3) * 150 -100-3) {
    info1 = int(table.getFloat((i), 2));
    info2 = table.getFloat((i), 3);



}
    }
}

//void mouseClicked() {
//  if (
//  value == 0 && 
//  distX+20*(1+0*2)< mouseX && mouseX < distX+20*(1+0*2)+20) {
//    value = 255;
//  } else {
//    value = 0;
//  }
//}