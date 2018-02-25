
class Scatter {

  //set position
  int left, upper, w, h;

  //load data
  Table data;
  String var0;
  String var1;
  float buffer = 5;
  float Xbuffer = 3*buffer;
  float Ybuffer = 5*buffer;

  int selected;//data info to show when mouse click
  int value;

  Scatter() {
  }// default constructor

  //set the graph position
  void position(int _left, int _upper, int _w, int _h) {

    left = _left;
    upper = _upper;
    w = _w;
    h= _h;
  }

  void data(Table _data, String _var0, String _var1) {
    data = _data;
    var0 = _var0;
    var1 = _var1;


    float[] col0 = new float[data.getRowCount()]; //create an array to save a col for max col
    float[] col1 = new float[data.getRowCount()];

    for (int i = 0; i < data.getRowCount(); i++) {
      col0[i] = data.getFloat(i, var0); //save a col value to an array
      col1[i] = data.getFloat(i, var1); //save a col value to an array

      //max(col) is max of the col(1)  ceil(max(col))
      //println(ceil(max(col0)));
    }
  }

  void drawAxis(float _left, float _upper, float _w, float _h) {

    float chartMinU = _left;
    float chartMaxU = _left + _w;
    float chartMinV = _upper + _h;
    float chartMaxV = _upper;

    //axes


    stroke(0);
    noFill();
    //x-axis
    line(chartMinU, chartMinV, chartMaxU, chartMinV);
    //y-axis
    line(chartMinU, chartMinV, chartMinU, chartMaxV);
  }

  void draw() {

    drawAxis(left, upper, w, h);

    float[] col0 = new float[data.getRowCount()]; //create an array to save a col for max col
    float[] col1 = new float[data.getRowCount()];

    for (int i = 0; i < data.getRowCount(); i++) {
      col0[i] = data.getFloat(i, var0); //save a col value to an array
      col1[i] = data.getFloat(i, var1); //save a col value to an array

      //max(col) is max of the col(1)  ceil(max(col))
      //println(ceil(max(col0)));
    }

    float max0= max(col0);
    float min0= min(col0);
    float max1= max(col1);
    float min1= min(col1);

    float chartMinU = left;
    float chartMaxU = left + w;
    float chartMinV = upper + h;
    float chartMaxV = upper;

    for (int i = 0; i < data.getRowCount()-1; i++) {
      float value0 = data.getFloat(i, var0);
      float value1 = data.getFloat(i, var1);
      float x = map(value0, min0, max0, chartMinU, chartMaxU);
      float y = map(value1, min1, max1, chartMinV, chartMaxV);

      stroke(0, 200, 0);
      ellipse(x, y, 1, 1);
      stroke(0);
    }
    //title
    fill(0);
    text("Scatter Plot for SATM and SATV", left + 80, upper-30 );  

    //x-axis

    text(ceil(min(col0)), chartMinU, chartMinV+Xbuffer);
    text((ceil(max(col0))-ceil(min(col0)))/2, chartMinU+w/2, chartMinV+Xbuffer);
    text(ceil(max(col0)), chartMinU+w, chartMinV+Xbuffer);



    //y-axis
    line(chartMinU, chartMinV, chartMinU, chartMaxV);
    text(ceil(min(col1)), chartMinU-Ybuffer, chartMinV);
    text((ceil(max(col1))-ceil(min(col1)))/2, chartMinU-Ybuffer, chartMinV-h/2);
    text(ceil(max(col1)), chartMinU-Ybuffer, chartMinV-h);

    frameRate(12);
    if (mousePressed) {

      for (int i = 0; i < data.getRowCount(); i++) {
        float value0 = data.getFloat(i, var0);
        float value1 = data.getFloat(i, var1);
        float x = map(value0, min0, max0, chartMinU, chartMaxU);
        float y = map(value1, min1, max1, chartMinV, chartMaxV);

        if ( value == 0 && 
          x-3 < mouseX && mouseX < x+3 
          && y-3< mouseY && mouseY <y+3 ) {
          selected = i;
          stroke(0, 200, 200);
          fill(0, 200, 200);
          ellipse(x, y, 10, 10);
          fill(0);
          stroke(0);
        }
      }
    }
    //  println( mouseX, mouseY, selected);
    text("Please select a data point from the scatter plot (upper right)", width/2, height-2*Xbuffer);
    text("Selected Row #  "+ selected, width/2, height-Xbuffer);
  }
}