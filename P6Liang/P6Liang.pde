Table data;


Bar bar = new Bar();
Line line = new Line();
Scatter scatter = new Scatter();
SubScatter subscatter0 = new SubScatter();
SubScatter subscatter1 = new SubScatter();
SubScatter subscatter2 = new SubScatter();
SubScatter subscatter3 = new SubScatter();
SubScatter subscatter4 = new SubScatter();
SubScatter subscatter5 = new SubScatter();
Parallel parallel = new Parallel();


void setup() {
  size (1200, 800);
  background(255);
    selectInput("Input the CSV:data file is President.csv", "FileSelected"); //load the csv file
 
 
  data = loadTable( "srsatact.csv", "csv,header");
  bar.data(data, "SATV");
  line.data(data, "SATV");
  scatter.data(data, "SATM", "SATV");
   
 
   subscatter0.data(data, "SATM","SATV");
   subscatter1.data(data, "ACT","SATV");
   subscatter2.data(data, "GPA","SATV");
   subscatter3.data(data, "ACT","SATM");
   subscatter4.data(data, "GPA","SATM");
   subscatter5.data(data, "GPA","ACT");
   
   parallel.data(data, "SATM", "SATV", "GPA", "ACT");
}

void FileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
  println("User selected" + selection.getAbsolutePath());
  data = loadTable(selection.getAbsolutePath(), "header"); //load table from select input csv
  //redraw();
  }
}

void draw() {
  background(255);
  bar.position(50, 50, 300, 300);
  bar.draw();
  line.position(400, 50, 300, 300);
  line.draw();
  scatter.position(750, 50, 300, 300);
  scatter.draw();
 
  subscatter0.position(50, 400, 80, 80);
  subscatter0.draw();
  subscatter1.position(200, 400, 80, 80);
  subscatter1.draw();
  subscatter2.position(350, 400, 80, 80);
  subscatter2.draw();
  subscatter3.position(200, 520, 80, 80);
  subscatter3.draw();
  subscatter4.position(350, 520, 80, 80);
  subscatter4.draw();
  subscatter5.position(350, 640, 80, 80);
  subscatter5.draw();
  
  
  parallel.position(500,400,600,300);
  parallel.draw();
  

}