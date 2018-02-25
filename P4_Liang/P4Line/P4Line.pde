/*Data Visualization
 Project 4
 Part I Bar Chart with interaction
 
 data file is President.csv
  data file is President.csv
   data file is President.csv
    data file is President.csv
 
 Yu Liang 2/22/2017*/
Table table; //table for csv
int distX = 80;  //location of the bottom left point of the chart
int distY = 450;
float info; //data info to show when mouse click
int value;

void setup() 
{
  size(800, 600);
  background(255);
  selectInput("Input the CSV:  data file is President.csv", "FileSelected"); //load the csv file
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
    //X-axis
    stroke(255, 2, 2);
    line (distX, distY, distX + 8 * 40, distY);
    fill(0);
    for (int i = 0; i < table.getRowCount(); i++) {
      text(table.getInt(i, 0), distX+20*(1+i*2)-3, distY + 15);
    }

    //line chart
    stroke(0);
    fill(0,0,255);
    for (int i = 0; i < table.getRowCount()-1; i++) {
      line (distX+40*(i+1)-10, 450-table.getFloat((i), 2)*3, 
            distX+40*(i+2)-10, 450-table.getFloat((i+1), 2)*3);
      ellipse(distX+40*(i+1)-10, 450-table.getFloat((i), 2)*3, 10, 10);
      ellipse(distX+40*(i+2)-10, 450-table.getFloat((i+1), 2)*3, 10, 10);
    }
    fill(0);

    fill(value);
    text("Click the blue circle to show data information", 550, 270);
    text(info, 550, 300);
    fill(0);
    
   
    
   

    //left y-axis
    stroke(255, 2, 2);
    line(distX, distY, distX, distY-300);

    //tick marks
    float[] col1 = new float[table.getRowCount()]; //create an array to save a col for max col

    for (int i = 0; i < table.getRowCount(); i++) {
      col1[i] = table.getFloat(i, 1); //save a col value to an array
      //max(col) is max of the col(1)  ceil(max(col))
      //println(ceil(max(col)));
    }
    for (int i = 0; i < max(col1)/2-1; i++) {
      line(distX, distY-60*(i+1), distX+5, distY-60*(i+1));
      text((i+1)*20, distX-15, distY-60*(i+1)+5);
    }
    
    //title
    noStroke();
    fill(0);
    text("Precentage Difference for President Compaign", distX + 30, distY - 330);

     
        //legend line chart
    text("Seat Difference", distX + 330, distY - 220);
    stroke(0);
   fill(0,0,255);
    ellipse(distX + 380, distY - 205, 10, 10);
  }

frameRate(12);
  println( mouseX + "-" +mouseY);
}

 void mouseClicked() {
  for (int i = 0; i < table.getRowCount(); i++){
   if ( value == 0 && distX+40*(i+1)-10-5< mouseX && mouseX < distX+40*(i+1)-10+5 && 450-table.getFloat((i), 2)*3+5> mouseY && mouseY > 450-table.getFloat((i), 2)*3-5) {
    info = table.getFloat(i, 2);
     
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