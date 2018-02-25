/*Data Visualization
 Project 8
 directed force
 
 Yu Liang 4/16/2017*/

JSONObject json;
JSONArray nodes;
JSONArray links;
String[] id;
int[] group;

color[] groupcolor;

JSONObject _node;
int n;
void setup() {
  size (800, 800);
  background(255);
  selectInput("Input the CSV:data file is miserables.json", "FileSelected"); //load the json file
  noLoop();

  json = loadJSONObject( "miserables.json");

  JSONArray nodes = json.getJSONArray("nodes");
  JSONArray links = json.getJSONArray("links");
  id = new String[nodes.size()];
  group = new int[nodes.size()];
  n=nodes.size();
  for (int i = 0; i < nodes.size(); i++) {

    JSONObject _node = nodes.getJSONObject(i); 

    id[i] = _node.getString("id");
    group[i] = _node.getInt("group");

    //println(id + ", " + group);
  }

  for (int i = 0; i < links.size(); i++) {

    JSONObject _link = links.getJSONObject(i); 

    String source = _link.getString("source");
    String target = _link.getString("target");
    int value =_link.getInt("value");

    //println(source + ", " + target+ ", " + value);
  }
}

void FileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    println("User selected" + selection.getAbsolutePath());
    json = loadJSONObject(selection.getAbsolutePath()); //load table from select input csv
  }
}

void draw() {
float x;
float y;

  if (json == null) return;
  else {

    for (int i = 0; i < n; i++) {

      if (group[i] ==0) {
        fill(200, 8, 44);
      } else if (group[i] ==1) {
        fill(250, 8, 44);
      } else if (group[i] ==2) {
        fill(250, 8, 234);
      } else if (group[i] ==3) {
        fill(156, 8, 250);
      } else if (group[i] ==4) {
        fill(43, 8, 250);
      } else if (group[i] ==5) {
        fill(8, 199, 250);
      } else if (group[i] ==6) {
        fill(8, 250, 175);
      } else if (group[i] ==7) {
        fill(8, 250, 78);
      } else if (group[i] ==8) {
        fill(136, 250, 8);
      } else if (group[i] ==9) {
        fill(250, 250, 8);
      } else if (group[i] ==10) {
        fill(250, 85, 8);
      }
      
      x=random(200, width-50);
      y=random(100, height-100);
      
      ellipse(x, y, 20, 20);  
      
      fill(0);
      line(x,y, 
        x+random(200, width-50), random(100, height-100)+y );
        
      println(id[i] + ", " + group[i]);
      // println(groupcolor[i]);
    }
    
    //legend
    fill(0);
    text("group 0", 10, 380);
    fill(200, 8, 44);
    rect(60, 370, 30, 10);  

    fill(0);
    text("group 1", 10, 400);
    fill(250, 8, 44);
    rect(60, 390, 30, 10);   

    fill(0);
    text("group 2", 10, 420);
    fill(250, 8, 234);
    rect(60, 410, 30, 10); 

    fill(0);
    text("group 3", 10, 440);
    fill(156, 8, 250);
    rect(60, 430, 30, 10);


    fill(0);
    text("group 4", 10, 460);
    fill(43, 8, 250);
    rect(60, 450, 30, 10);   

    fill(0);
    text("group 5", 10, 480);
    fill(8, 199, 250);
    rect(60, 470, 30, 10);


    fill(0);
    text("group 6", 10, 500);
    fill(8, 250, 175);
    rect(60, 490, 30, 10);

    fill(0);
    text("group 7", 10, 520);
    fill(8, 250, 78);
    rect(60, 510, 30, 10);



    fill(0);
    text("group 8", 10, 540);
    fill(136, 250, 8);
    rect(60, 530, 30, 10);

    fill(0);
    text("group 9", 10, 560);
    fill(250, 250, 8);
    rect(60, 550, 30, 10);

    fill(0);
    text("group 10", 10, 580);
    fill(250, 85, 8);
    rect(60, 570, 30, 10);
    fill(0);
    
    //title
    textSize(26);
 text("Force Directed Graph for Miserables", 150, 50);
textSize(12);
}
}