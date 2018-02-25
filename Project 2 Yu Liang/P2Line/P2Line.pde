/*Data Visualization
 Project 2
 Part II Line Chart
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

    //line chart
    stroke(66, 83, 244);
    for (int i = 0; i < table.getRowCount()-1; i++) {
      line (distX+40*(i+1)-10, 450-table.getFloat((i), 1)*30, 
            distX+40*(i+2)-10, 450-table.getFloat((i+1), 1)*30);
      ellipse(distX+40*(i+1)-10, 450-table.getFloat((i), 1)*30, 10, 10);
      ellipse(distX+40*(i+2)-10, 450-table.getFloat((i+1), 1)*30, 10, 10);
    }

    //y-axis
    stroke(255, 2, 2);
    line(distX, distY, distX, distY-300);

    //tick marks
    float[] col = new float[table.getRowCount()]; //create an array to save a col for max col

    for (int i = 0; i < table.getRowCount(); i++) {
      col[i] = table.getFloat(i, 1); //save a col value to an array
      //max(col) is max of the col(1)  ceil(max(col))
      //println(ceil(max(col)));
    }
    for (int i = 0; i < max(col)/2-1; i++) {
      line(distX, distY-60*(i+1), distX+5, distY-60*(i+1));
      text((i+1)*2, distX-15, distY-60*(i+1)+5);
    }

    //title
    text("Precentage Difference for President Compaign", distX + 30, distY - 330);

    //legend
    text("Precentage Difference", distX + 330, distY - 250);
    stroke(0);
    ellipse(distX + 380, distY - 235, 10, 10);
  }
}