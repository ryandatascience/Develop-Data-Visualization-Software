/*Data Visualization
 Project 5
 parallel coordinates plot
 
 data file is srsatact.csv
 
 Yu Liang 3/6/2017*/

Table table; //table for csv
int distX = 100;  //location of the bottom left point of the chart
int distY = 350;
float info1;
float info2;//data info to show when mouse click
int value;
int line2= 1;
int line3=1;

void setup() 
{
  size(800, 400);
  background(255);
 background(255);
  selectInput("Input the CSV:", "FileSelected"); //load the csv file
  //table = loadTable("srsatact.csv", "header");
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

    background(255);
    //left y-axis
    stroke(65, 105, 255);
    line(distX, distY, distX, distY-300);
    line(distX+150, distY, distX+150, distY-300);
    line(distX+300, distY, distX+300, distY-300);
    line(distX+450, distY, distX+450, distY-300);
    stroke(240, 128, 128);

    //tick marks
    float[] col1 = new float[table.getRowCount()]; //create an array to save a col for max col

    for (int i = 0; i < table.getRowCount(); i++) {
      col1[i] = table.getFloat(i, 0); //save a col value to an array
      //max(col) is max of the col(1)  ceil(max(col))
      //println(ceil(max(col1)));
    }
    float[] col2 = new float[table.getRowCount()]; //create an array to save a col for max col

    for (int i = 0; i < table.getRowCount(); i++) {
      col2[i] = table.getFloat(i, 1); //save a col value to an array
      //max(col) is max of the col(1)  ceil(max(col))
      //println(ceil(max(col1)));
    }    
    float[] col3 = new float[table.getRowCount()]; //create an array to save a col for max col

    for (int i = 0; i < table.getRowCount(); i++) {
      col3[i] = table.getFloat(i, 2); //save a col value to an array
      //max(col) is max of the col(1)  ceil(max(col))
      //println(ceil(max(col1)));
    }
    float[] col4 = new float[table.getRowCount()]; //create an array to save a col for max col

    for (int i = 0; i < table.getRowCount(); i++) {
      col4[i] = table.getFloat(i, 3); //save a col value to an array
      //max(col) is max of the col(1)  ceil(max(col))
      //println(ceil(max(col1)));
    }

    for (int j = 0; j <4; j++) {

      line(distX+j*150, distY, distX+j*150-5, distY);
      line(distX+j*150, distY-150, distX+j*150-5, distY-150);
      line(distX+j*150, distY-300, distX+j*150-5, distY-300);
    }

    fill(0);
    text(ceil(max(col1)), distX-30, distY-300);
    text(ceil(min(col1)), distX-30, distY);
    text(ceil(min(col1)+max(col1))/2, distX-30, distY-150);

    text(ceil(max(col2)), distX-30+150, distY-150-150*line2);
    text(ceil(min(col2)), distX-30+150, distY-150+150*line2);
    text(ceil(min(col2)+max(col2))/2, distX-30+150, distY-150);

    text(ceil(max(col3)), distX-30+300, distY-150-150*line3);
    text(ceil(min(col3)), distX-30+300, distY-150+150*line3);
    text(ceil(min(col3)+max(col3))/2, distX-30+300, distY-150);

    text(ceil(max(col4)), distX-30+450, distY-300);
    text(ceil(min(col4)), distX-30+450, distY);
    text(ceil(min(col4)+max(col4))/2, distX-30+450, distY-150);


    for (int k = 0; k < table.getRowCount(); k++) {
      float Normal1 = norm(table.getFloat(k, 0), min(col1), (max(col1)));
      float Normal2;
      if (line2==1){
      Normal2 = norm(table.getFloat(k, 1), min(col2), (max(col2)));
      } else {Normal2 = norm(table.getFloat(k, 1), max(col2), (min(col2)));
      }
      
      float Normal3;
            if (line3==1){
      Normal3 = norm(table.getFloat(k, 2), min(col3), (max(col3)));
      } else {Normal3 = norm(table.getFloat(k, 2), max(col3), (min(col3)));
      }
      
      float Normal4 = norm(table.getFloat(k, 3), min(col4), (max(col4)));
      
      
      
      fill(255, 0, 255);  
      line(distX, distY+Normal1 * 300-300, 
        distX+150, distY+Normal2 * 300-300 );
      line(distX+150, distY+Normal2 * 300-300, 
        distX+300, distY+Normal3 * 300-300 );
      line(distX+300, distY+Normal3 * 300-300, 
        distX+450, distY+Normal4 * 300-300 );
      noStroke();
      ellipse(distX, distY+Normal1 * 300-300, 3, 3);   
      ellipse(distX+150, distY+Normal2 * 300-300, 3, 3);
      ellipse(distX+300, distY+Normal3 * 300-300, 3, 3);
      ellipse(distX+450, distY+Normal4 * 300-300, 3, 3);
      stroke(240, 128, 128);
    }

 

    textAlign(CENTER, BOTTOM);
    fill(0);
    text("SATM", distX, distY-325);
    text("SATV", distX+150, distY-325);
    text("ACT", distX+300, distY-325);
    text("GPA", distX+450, distY-325);


    //interaction
    fill(value);
     textAlign(LEFT);
    text("Click SATV axis or ACT axis ", 580, 270);
  text(" to switch axis direction", 580, 290);
  
    text("switch cols in dataset to swap axis", 580, 310);
    fill(0);



    //title
    noStroke();
    fill(0);
    textAlign(LEFT);
    text("Parallel Coordinates Plot for ACT, SAT and GPA", distX, distY +20);


    //legend line chart
    text("student score", 650, distY - 220);
    noStroke();
    fill(255, 0, 255);
    ellipse(680, distY - 205, 5, 5);
  }
  //
   //frameRate(12);
  //println( mouseX + "-" +mouseY);
  //  println( line2);
  //    println( line3);
        //println( value);
  //}


}
 

  void mouseClicked() {


    if ( value == 0 && 
      distX+150-5 < mouseX && mouseX <  distX+150+5 
      && distY-300 < mouseY && mouseY < distY) 
    {
      line2= line2*(-1);
    } else if ( value == 0 && 
      distX+300-5 < mouseX && mouseX <  distX+300+5 
      && distY-300 < mouseY && mouseY < distY)
    {line3= line3*(-1);
    }
  }