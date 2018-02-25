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
  selectInput("Input the CSV:data file is President.csv", "FileSelected"); //load the csv file
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

    //bar chart
    stroke(0);
    fill(66, 83, 244); //DEM party is blue
    rect (distX+20*(1+0*2), distY, 20, - table.getFloat(0, 1)*30);
    rect (distX+20*(1+1*2), distY, 20, - table.getFloat(1, 1)*30);

    fill(219, 41, 41); //REP party is red
    rect (distX+20*(1+2*2), distY, 20, - table.getFloat(2, 1)*30);
    rect (distX+20*(1+3*2), distY, 20, - table.getFloat(3, 1)*30);

    fill(66, 83, 244); //DEM party is blue
    rect (distX+20*(1+4*2), distY, 20, - table.getFloat(4, 1)*30);
    rect (distX+20*(1+5*2), distY, 20, - table.getFloat(5, 1)*30);

    fill(219, 41, 41); //REP party is red
    rect (distX+20*(1+6*2), distY, 20, - table.getFloat(6, 1)*30);

    fill(value);
    text("Click the bar to show data information", 550, 270);
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
      text((i+1)*2, distX-15, distY-60*(i+1)+5);
    }
    
    //title
    noStroke();
    fill(0);
    text("Precentage Difference for President Compaign", distX + 30, distY - 330);

     
    //legend bar chart
    fill(0);
    text("Percentage Difference", distX + 330, distY - 300);
    text("REP", distX + 330, distY - 250);
    text("DEM", distX + 330, distY - 280);
    
    stroke(0);
    fill(219, 41, 41); //REP party is red
    rect (distX + 380, distY - 265, 20, 20);
    
    fill(66, 83, 244); //DEM party is blue
    rect (distX + 380, distY - 295, 20, 20);
  }

frameRate(12);
  println( mouseX + "-" +mouseY);
}

 void mouseClicked() {
  if ( value == 0 && distX+20*(1+0*2)< mouseX && mouseX < distX+20*(1+0*2)+20 && distY> mouseY && mouseY > distY- table.getFloat(0, 1)*30) {
    info = table.getFloat(0, 1);
     
  } 
  else if( value == 0 && distX+20*(1+1*2)< mouseX && mouseX < distX+20*(1+1*2)+20 && distY> mouseY && mouseY > distY- table.getFloat(1, 1)*30)  {
    info = table.getFloat(1, 1);
   }
   else if( value == 0 && distX+20*(1+2*2)< mouseX && mouseX < distX+20*(1+2*2)+20 && distY> mouseY && mouseY > distY- table.getFloat(2, 1)*30)  {
    info = table.getFloat(2, 1);
   }
   else if( value == 0 && distX+20*(1+3*2)< mouseX && mouseX < distX+20*(1+3*2)+20 && distY> mouseY && mouseY > distY- table.getFloat(3, 1)*30)  {
    info = table.getFloat(3, 1);
   }
   else if( value == 0 && distX+20*(1+4*2)< mouseX && mouseX < distX+20*(1+4*2)+20 && distY> mouseY && mouseY > distY- table.getFloat(4, 1)*30)  {
    info = table.getFloat(4, 1);
   }
   else if( value == 0 && distX+20*(1+5*2)< mouseX && mouseX < distX+20*(1+5*2)+20 && distY> mouseY && mouseY > distY- table.getFloat(5, 1)*30)  {
    info = table.getFloat(5, 1);
   }
     else if( value == 0 && distX+20*(1+6*2)< mouseX && mouseX < distX+20*(1+6*2)+20 && distY> mouseY && mouseY > distY- table.getFloat(6, 1)*30)  {
    info = table.getFloat(6, 1);
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