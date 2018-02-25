class Correlation {
  //set position
  int left, upper, w, h;



  Table data;
  String var0;
  String var1;

  float buffer = 5;
  float Xbuffer = 3*buffer;
  float Ybuffer = 5*buffer;





  Correlation() {
  }  // default constructor

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
    //line(chartMinU, chartMinV, chartMaxU, chartMinV);
  }





  void draw() {
    if ( data == null ) return;


    else
    {
      drawAxis(left, upper, w, h);
      float sx = 0; //sum of x
      float sy = 0;
      float sxx = 0;//sum of x*x
      float syy = 0;
      float sxy = 0;
      float cov, sigmax, sigmay, r ;
      int n = data.getRowCount();

      for (int i = 0; i < n; i++) {
        float x = data.getFloat(i, var0); //save a col value to an array
        float y = data.getFloat(i, var1); //save a col value to an array

        //max(col) is max of the col(1)  ceil(max(col))
        //println(ceil(max(col0)));
        sx += x;
        sy += y;
        sxx += x * x;
        syy += y * y;
        sxy += x * y;
      }

      cov = sxy / n - sx * sy / n / n;

      sigmax = sqrt(sxx / n -  sx * sx / n / n); 

      sigmay = sqrt(syy / n -  sy * sy / n / n);  

      // correlation 
      r=  cov / sigmax / sigmay;
      //float rfinal=r;
    


      float rcolor = map(r, 0.3, 0.9, 0, 255);
    
      float chartMinU = left;
      float chartMaxU = left + w;
      float chartMinV = upper + h;
      float chartMaxV = upper;

      fill(rcolor,30,247);
      rect(chartMinU, chartMaxV, w -Xbuffer, h-Xbuffer );
      fill(0);
      text(r,chartMinU+Xbuffer, chartMinV-Xbuffer-h/3 );
      text(var0,chartMinU+buffer, chartMinV-buffer-h );
      text(var1,chartMinU+w, chartMinV-Xbuffer-h/2 );
      
      
    }
  }

}