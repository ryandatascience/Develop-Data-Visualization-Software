
class Bar {

  //set position
  int left, upper, w, h;
Table data;
  //load data

  String var0;
  float buffer = 5;
  float Xbuffer = 3*buffer;
  float Ybuffer = 5*buffer;

  Bar() {
  }  // default constructor

  //set the graph position
  void position(int _left, int _upper, int _w, int _h) {

    left = _left;
    upper = _upper;
    w = _w;
    h= _h;
  }

  void data(Table _data, String _var0) {
    data = _data;
    var0 = _var0;



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

    text("0", chartMinU, chartMinV+Xbuffer);
    text(data.getRowCount()/2, chartMinU+w/2, chartMinV+Xbuffer);
    text(data.getRowCount(), chartMinU+w, chartMinV+Xbuffer);
  }

  void draw() {
    if ( data == null ) return;
    else {
      drawAxis(left, upper, w, h);
      float[] col0 = new float[data.getRowCount()]; //create an array to save a col for max col

      for (int i = 0; i < data.getRowCount(); i++) {
        col0[i] = data.getFloat(i, var0); //save a col value to an array
        //max(col) is max of the col(1)  ceil(max(col))
        //println(ceil(max(col0)));
      }

      float max= max(col0);
      float min= min(col0);
      float chartMinU = left;
      float chartMaxU = left + w;
      float chartMinV = upper + h;
      float chartMaxV = upper;

      for (int i = 0; i < data.getRowCount(); i++) {
        float a0 = data.getFloat(i, var0);
        float y = map(a0, min, max, chartMinV, chartMaxV)/1.2;
        stroke(255, 0, 0);
        rect(left+buffer+i*(w/data.getRowCount()), chartMinV-buffer, w/data.getRowCount()*0.01, -y);
        stroke(0);
      }

      //title
      fill(0);
      text("Bar Chart for SATM", left + 80, upper-30 );

      //y-axis
      line(chartMinU, chartMinV, chartMinU, chartMaxV);
      text(ceil(min(col0)), chartMinU-Ybuffer, chartMinV);
      text((ceil(max(col0))-ceil(min(col0)))/2, chartMinU-Ybuffer, chartMinV-h/2);
      text(ceil(max(col0)), chartMinU-Ybuffer, chartMinV-h);
    }
  }
}