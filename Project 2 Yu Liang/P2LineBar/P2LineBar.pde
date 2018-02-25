/*Data Visualization
 Project 2
 Part III Line and Bar Chart
 
 data file is President.csv
 
 Yu Liang 1/27/2017*/
Table table; //table for csv
int distX = 80;  //location of the bottom left point of the chart
int distY = 450;

void setup() 
{
  size(600, 600);
  background(255);
  selectInput("Input the CSV:", "FileSelected"); //load the csv file
  noLoop(); //run draw only once
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

    //line chart
    stroke(0);
    fill(200);
    for (int i = 0; i < table.getRowCount()-1; i++) {
      line (distX+40*(i+1)-10, 450-table.getFloat((i), 2)*3, 
            distX+40*(i+2)-10, 450-table.getFloat((i+1), 2)*3);
      ellipse(distX+40*(i+1)-10, 450-table.getFloat((i), 2)*3, 10, 10);
      ellipse(distX+40*(i+2)-10, 450-table.getFloat((i+1), 2)*3, 10, 10);
    }
    fill(0);
    
    //right y-axis
    stroke(255, 2, 2);
    line(distX + 8 * 40, distY, distX + 8 * 40, distY-300);

    //tick marks
    float[] col = new float[table.getRowCount()]; //create an array to save a col for max col

    for (int i = 0; i < table.getRowCount(); i++) {
      col[i] = table.getFloat(i, 1); //save a col value to an array
      //max(col) is max of the col(1)  ceil(max(col))
      //println(ceil(max(col)));
    }
    for (int i = 0; i < max(col)/2-1; i++) {
      line(distX + 8 * 40, distY-60*(i+1), distX + 8 * 40+5, distY-60*(i+1));
      text((i+1)*20, distX + 8 * 40-15, distY-60*(i+1)+5);
    }

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
    text("Precentage Difference for President Compaign", distX + 30, distY - 330);

    //legend line chart
    text("Seat Difference", distX + 330, distY - 220);
    stroke(0);
    fill(200);
    ellipse(distX + 380, distY - 205, 10, 10);
    
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
}