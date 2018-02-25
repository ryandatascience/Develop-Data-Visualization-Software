/*Data Visualization
Project 2
Part I Bar Chart
data file is President.csv
Yu Liang 1/27/2017*/


Table table;
int distX = 80;
int distY = 450;




void setup() {
  size(600, 600);
  background(255);
  selectInput("Input the CSV:", "fileSelected"); //load the data patch
  noLoop(); //only draw once
}


void fileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    println("User selected " + selection.getAbsolutePath());
    table = loadTable(selection.getAbsolutePath(), "header"); //load the table
   redraw();
}
}


void draw () {
  if ( table == null ) return;
  else {
    
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

    //X-axis
    stroke(255, 2, 2);
    line (distX, distY, distX + 8 * 40, distY);
    fill(0);
    for (int i = 0; i < table.getRowCount(); i++){
      text(table.getInt(i,0), distX+20*(1+i*2)-3, distY + 15);
    }
    

    //y-axis
    float[] col = new float [table.getRowCount()];  //read a value col to determin the max

    for (int i = 0; i < table.getRowCount(); i++) {
      col[i] = table.getFloat(i, 1);
    } //max(col) is max of the col(1)  ceil(max(col))

    //println(ceil(max(col)));
    stroke(255, 2, 2);
    line (distX, distY, distX, distY-300);
    
    //tick marks
    
    for (int i = 0; i < max(col)/2 - 1; i++){
      
    line (distX, distY-60*(i+1), distX+5, distY-60*(i+1));
    text ((i+1)*2, distX-15, distY-60*(i+1)+5);      
    }
    
    //title
    text("Precentage Difference for President Compaign", distX + 30, distY - 330);
    
    //legend
    text("REP", distX + 330, distY - 250);
    text("DEM", distX + 330, distY - 280);
    
    stroke(0);
    fill(219, 41, 41); //REP party is red
    rect (distX + 380, distY - 265, 20, 20);
    
    fill(66, 83, 244); //DEM party is blue
    rect (distX + 380, distY - 295, 20, 20);
   
  }
}