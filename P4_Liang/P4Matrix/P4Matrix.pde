/*Data Visualization
 Project 3
 Part III Scatterplot of 4 vars
 
 data file is srsatact.csv
  data file is srsatact.csv
   data file is srsatact.csv
    data file is srsatact.csv
    
    
 Yu Liang 2/6/2017*/
Table table; //table for csv
float X ;  //location of the bottom left point of the chart
float Y ;
float NormalX;
float NormalY;
int value;
float detailx =100;
float detaily=100;

void setup() 
{
  size(800, 600);
  background(255);
  selectInput("Input the CSV:", "FileSelected"); //load the csv file
  //table = loadTable("srsatact.csv", "header");
  //noLoop(); //run draw only once
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

  background(255);


  for (int j = 0; j < 4; j++) {
    for (int i = 0; i < 4; i++) {
      float x = 100 + i*100;
      float y = 100 + j*100;
stroke(255, 102, 0);
      rect(x, y, 100, 100);
stroke(0);

      if (table == null) return;
      else {
        float[] colx = new float[table.getRowCount()]; //create an array to save a col for max col

        for (int k = 0; k < table.getRowCount(); k++) {
          colx[k] = table.getFloat(k, i); //save a col value to an array
          //max(col) is max of the col(1)  ceil(max(col))
          //println(ceil(max(col)));
        }

        float[] coly = new float[table.getRowCount()]; //create an array to save a col for max col
        for (int k = 0; k < table.getRowCount(); k++) {
          coly[k] = table.getFloat(k, j); //save a col value to an array
          //max(col) is max of the col(1)  ceil(max(col))
          //println(ceil(max(col)));
        }        


        for (int k = 0; k < table.getRowCount(); k++) {
          float NormalX = norm(table.getFloat(k, i), min(colx), (max(colx)));
          float NormalY = norm(table.getFloat(k, j), min(coly), (max(coly)));
          //noStroke();

          ellipse(x+NormalX * 100, y+NormalY * 100, 2, 2);
     
        }
      }
    }
  }



  fill(value);
  text("SAT Math", 20, 150);
  text("SAT Verbal", 20, 250);
  text("ACT Scores", 20, 350);
  text("GPA Scores", 20, 450);  


  text("SAT Math", 130, 70);
  text("SAT Verbal", 230, 70);
  text("ACT Scores", 330, 70);
  text("GPA Scores", 430, 70);  
  fill(255);

  frameRate(12);
  //println( mouseX + "-" +mouseY);
  println( int(detailx/100) + "-" +int(detaily/100));
stroke(204, 102, 0);
  rect( 550, 200, 200, 200);
  //fill(value);
  //for (int j = 0; j < 4; j++) {
  //  for (int i = 0; i < 4; i++) {
  //    float x = 100 + i*100;
  //    float y = 100 + j*100;


  if (table == null) return;
  else {
    float[] colx = new float[table.getRowCount()]; //create an array to save a col for max col

    for (int k = 0; k < table.getRowCount(); k++) {
      colx[k] = table.getFloat(k, (int(detailx/100)-1)); //save a col value to an array
      //max(col) is max of the col(1)  ceil(max(col))
      //println(ceil(max(col)));
    }

    float[] coly = new float[table.getRowCount()]; //create an array to save a col for max col
    for (int k = 0; k < table.getRowCount(); k++) {
      coly[k] = table.getFloat(k, (int(detaily/100)-1)); //save a col value to an array
      //max(col) is max of the col(1)  ceil(max(col))
      //println(ceil(max(col)));
    }        


    for (int k = 0; k < table.getRowCount(); k++) {
      float NormalX = norm(table.getFloat(k, (int(detailx/100)-1)), min(colx), (max(colx)));
      float NormalY = norm(table.getFloat(k, (int(detaily/100)-1)), min(coly), (max(coly)));
      //noStroke();
stroke(0, 102, 255);
      ellipse(550+NormalX * 200, 200+NormalY * 200, 4, 4);
    }
  }
}





void mouseClicked() {
  for (int j = 0; j < 4; j++) {
    for (int i = 0; i < 4; i++) {
      float x = 100 + i*100;
      float y = 100 + j*100;
      fill(0);
      if ( 
        //value == 0 && 
        x < mouseX && mouseX <x+100 && 
        y< mouseY && mouseY < y+100) {
        detailx = x;
        detaily = y;
      }
    }
  }
}