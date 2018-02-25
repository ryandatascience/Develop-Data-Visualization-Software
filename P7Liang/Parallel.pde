
class Parallel {

  //set position
  int left, upper, w, h;

  //load data
  Table data;
  String var0;
  String var1;
  String var2;
  String var3;
  float buffer = 5;
  float Xbuffer = 3*buffer;
  float Ybuffer = 5*buffer;


  Parallel() {
  }// default constructor

  //set the graph position
  void position(int _left, int _upper, int _w, int _h) {

    left = _left;
    upper = _upper;
    w = _w;
    h= _h;
  }

  void data(Table _data, String _var0, String _var1, String _var2, String _var3) {
    data = _data;
    var0 = _var0;
    var1 = _var1;
    var2 = _var2;
    var3 = _var3;
  }

  void drawAxis(float _left, float _upper, float _w, float _h) {

    float left = _left;
    float upper = _upper;
    float w = _w;
    float h = _h;

    //axes


    //stroke(0);
    //noFill();
    ////x-axis
    //line(chartMinU, chartMinV, chartMaxU, chartMinV);
    ////y-axis
    //line(chartMinU, chartMinV, chartMinU, chartMaxV);
  }

  void draw() {
    if ( data == null ) return;
    else {
      drawAxis(left, upper, w, h);

      float[] col0 = new float[data.getRowCount()]; //create an array to save a col for max col
      float[] col1 = new float[data.getRowCount()];
      float[] col2 = new float[data.getRowCount()]; 
      float[] col3 = new float[data.getRowCount()];

      for (int i = 0; i < data.getRowCount(); i++) {
        col0[i] = data.getFloat(i, var0); //save a col value to an array
        col1[i] = data.getFloat(i, var1); 
        col2[i] = data.getFloat(i, var2);  
        col3[i] = data.getFloat(i, var3); 
        //max(col) is max of the col(1)  ceil(max(col))
        //println(ceil(max(col0)));
      }

      float max0= max(col0);
      float min0= min(col0);
      float max1= max(col1);
      float min1= min(col1);
      float max2= max(col2);
      float min2= min(col2);
      float max3= max(col3);
      float min3= min(col3);


      float chartMinV = upper + h;
      float chartMaxV = upper;

      for (int i = 0; i < data.getRowCount()-1; i++) {
        float value0 = data.getFloat(i, var0);
        float value1 = data.getFloat(i, var1);
        float value2 = data.getFloat(i, var2);
        float value3 = data.getFloat(i, var3);

        float a = map(value0, min0, max0, chartMinV, chartMaxV);
        float b = map(value1, min1, max1, chartMinV, chartMaxV);
        float c = map(value2, min2, max2, chartMinV, chartMaxV);
        float d = map(value3, min3, max3, chartMinV, chartMaxV);

        stroke(128, 128, 128);
        line(left, a, 
          left+w/3, b );
        line(left+w/3, b, 
          left+w/3*2, c );
        line(left+w/3*2, c, 
          left+w, d );

        stroke(255, 0, 255);
        fill(255, 0, 255);
        ellipse(left, a, 3, 3);   
        ellipse(left+w/3, b, 3, 3);
        ellipse(left+w/3*2, c, 3, 3);
        ellipse(left+w, d, 3, 3);
        stroke(0);
      }
      //title
      textAlign(CENTER, BOTTOM);
      fill(0);
      text(var0, left, upper+h+Xbuffer);
      text(var1, left+w/3, upper+h+Xbuffer);
      text(var2, left+w/3*2, upper+h+Xbuffer);
      text(var3, left+w, upper+h+Xbuffer);
      textAlign(LEFT);



      ////y-axis
      line(left, upper+h, left, upper);
      line(left+w/3, upper+h, left+w/3, upper);
      line(left+w/3*2, upper+h, left+w/3*2, upper);
      line(left+w, upper+h, left+w, upper);
      //text(ceil(min(col1)), chartMinU-Ybuffer, chartMinV);
      //text((ceil(max(col1))-ceil(min(col1)))/2, chartMinU-Ybuffer, chartMinV-h/2);
      //text(ceil(max(col1)), chartMinU-Ybuffer, chartMinV-h);
    }
  }
}