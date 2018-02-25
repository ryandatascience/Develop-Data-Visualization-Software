
class Histogram {

  //set position
  int left, upper, w, h;
  Table data;
  //load data

  String var0;
  float buffer = 5;
  float Xbuffer = 3*buffer;
  float Ybuffer = 5*buffer;

  Histogram() {
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
      float interval = (max- min)/5;
      int[] hist = new int[5];

      for (int i = 0; i < data.getRowCount(); i++) {
        for (int j = 0; j < 5; j++) {
          if (col0[i]>min+j*interval && col0[i]<min+(j+1)*interval  ) {
            hist[j]++;
          }
        }
      }

      textSize(8);
      for (int i = 0; i < 5; i++) {

        float y = map(hist[i], min(hist), max(hist), chartMinV, chartMaxV);
        stroke(255, 0, 0);
   
        rect(left+buffer+i*(w/5), chartMinV-buffer, w/5*0.5, y-chartMinV);
        text(ceil(min(col0)+i*interval)+"-"+ceil(min(col0)+(i+1)*interval), left+buffer+i*(w/5), chartMinV+Xbuffer);
        stroke(0);
      }

      //title
      fill(0);
      text("Histogram for " + var0, left + 60, upper-10 );

      //y-axis
      line(chartMinU, chartMinV, chartMinU, chartMaxV);
      text(min(hist), chartMinU-Ybuffer, chartMinV);
      text(max(hist)-(min(hist))/2, chartMinU-Ybuffer, chartMinV-h/2);
      text(max(hist), chartMinU-Ybuffer, chartMinV-h);
      textSize(12);
    }
  }
}