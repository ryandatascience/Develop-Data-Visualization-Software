/*Data Visualization
 Project 3
 Part II Scatterplot of ACT and GPA
 
 data file is srsatact.csv
 
 Yu Liang 2/6/2017*/
Table table; //table for csv
int distX = 80;  //location of the bottom left point of the chart
int distY = 450;

void setup() 
{
  size(600, 600);
  background(255);
  selectInput("Input the CSV:", "FileSelected"); //load the csv file
  //table = loadTable("srsatact.csv", "header");
  noLoop(); //run draw only once
  noSmooth();
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

  
  rect(120, 135, 400, 400);
  
 fill(0);
  text("ACT Scores", 300, 550);
  text("GPA Scores", 50, 300);
  fill(255);
  if (mousePressed){
  ellipse( mouseX, mouseY, 2, 2 );
  println( "x: " + mouseX + " y: " + mouseY);
  }  
  
  if (table == null) return;
  else {
        for (int i = 0; i < table.getRowCount(); i++){
       ellipse(table.getFloat(i, 2) * 15 - 100 , table.getFloat(i, 3) * 150 -100 , 5, 5);   
    }
  }    
}   
    



  