Table data;

Bar bar = new Bar();
Correlation correlation0 = new Correlation();
Correlation correlation1 = new Correlation();
Correlation correlation2 = new Correlation();
Correlation correlation3 = new Correlation();
Correlation correlation4 = new Correlation();
Correlation correlation5 = new Correlation();


Histogram histogram1 = new Histogram();
Histogram histogram2 = new Histogram();
Histogram histogram3 = new Histogram();
Histogram histogram4 = new Histogram();
Line line = new Line();
Scatter scatter = new Scatter();
//SubScatter subscatter0 = new SubScatter();
//SubScatter subscatter1 = new SubScatter();
//SubScatter subscatter2 = new SubScatter();
//SubScatter subscatter3 = new SubScatter();
//SubScatter subscatter4 = new SubScatter();
//SubScatter subscatter5 = new SubScatter();
//Parallel parallel = new Parallel();



void setup() {
  size (1200, 800);
  background(255);
  selectInput("Input the CSV:data file is President.csv", "FileSelected"); //load the csv file
  //noLoop();

  //data = loadTable( "srsatact.csv", "csv,header");
}

void FileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    println("User selected" + selection.getAbsolutePath());
    data = loadTable(selection.getAbsolutePath(), "header"); //load table from select input csv
    redraw();
  }
}

void draw() {
  background(255);
  bar.data(data, "SATV");
  histogram1.data(data, "SATM");
  histogram2.data(data, "SATV");
  histogram3.data(data, "GPA");
  histogram4.data(data, "ACT");

  correlation0.data(data, "SATM", "SATV");
  correlation1.data(data, "ACT", "SATV");
  correlation2.data(data, "GPA", "SATV");
  correlation3.data(data, "ACT", "SATM");
  correlation4.data(data, "GPA", "SATM");
  correlation5.data(data, "GPA", "ACT");



  line.data(data, "SATV");
  scatter.data(data, "SATM", "SATV");
  //subscatter0.data(data, "SATM", "SATV");
  //subscatter1.data(data, "ACT", "SATV");
  //subscatter2.data(data, "GPA", "SATV");
  //subscatter3.data(data, "ACT", "SATM");
  //subscatter4.data(data, "GPA", "SATM");
  //subscatter5.data(data, "GPA", "ACT");

  //parallel.data(data, "SATM", "SATV", "GPA", "ACT");
  histogram1.position(500, 400, 200, 150);
  histogram1.draw();
  histogram2.position(800, 400, 200, 150);
  histogram2.draw();
  histogram3.position(500, 600, 200, 150);
  histogram3.draw();
  histogram4.position(800, 600, 200, 150);
  histogram4.draw();

  correlation0.position(50, 400, 80, 80);
  correlation0.draw();
  correlation1.position(200, 400, 80, 80);
  correlation1.draw();
  correlation2.position(350, 400, 80, 80);
  correlation2.draw();
  correlation3.position(200, 520, 80, 80);
  correlation3.draw();
  correlation4.position(350, 520, 80, 80);
  correlation4.draw();
  correlation5.position(350, 640, 80, 80);
  correlation5.draw();


  bar.position(50, 50, 300, 300);
  bar.draw();
  line.position(400, 50, 300, 300);
  line.draw();
  scatter.position(750, 50, 300, 300);
  scatter.draw();

  //subscatter0.position(50, 400, 80, 80);
  //subscatter0.draw();
  //subscatter1.position(200, 400, 80, 80);
  //subscatter1.draw();
  //subscatter2.position(350, 400, 80, 80);
  //subscatter2.draw();
  //subscatter3.position(200, 520, 80, 80);
  //subscatter3.draw();
  //subscatter4.position(350, 520, 80, 80);
  //subscatter4.draw();
  //subscatter5.position(350, 640, 80, 80);
  //subscatter5.draw();


  //parallel.position(500, 400, 600, 300);
  //parallel.draw();
}