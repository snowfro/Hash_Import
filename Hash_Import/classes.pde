//This class builds the Number Dictionary, which is used to associate the Base58 values to a unique number value
class NumDir{
  String[] charpool;
  StringDict nd;
  // input the character pool and builds the dictionary with numerical definitions
  // the dictionary adjusts dynamically to the character pool length
  NumDir(String[] _charpool){
    charpool = _charpool;
    nd = new StringDict();
    for (int i=0;i<charpool.length;i++){
      nd.set(charpool[i], str(i));
    }
  }
  
  //Input the hash character (as string) and get the numeric value (as int) in return as per Number Dictionary definition
  int P(String _character){
   String character = _character;
   //character = nd.get(character);
   int p = Integer.parseInt(nd.get(character));
   return p;
  }

}



//This class is used to generate a variety of stray and/or joined line types
//The constructor takes the entire Pip object as the parameter and converts it 
// into a series of x and y points as PVectors
class LineMaker {
  PVector[] points_array;
 LineMaker(Pip pip){
   points_array = new PVector[pip.raw_hash.length()];
   for(int i=0; i<pip.raw_hash.length(); i++){ 
     points_array[i] = new PVector(pip.X(i), pip.Y(i+1));   
   }
   
 }
 
 //shows all of the points 
 //takes a size variable as input parameter
 void show_points(int size){
   color fill1 = color(255, 255, 255, 50);
   fill(fill1);
   noStroke();
   for(int i=0; i<points_array.length; i++){
     ellipse(points_array[i].x, points_array[i].y, size, size);
   }
 }
 
 //computes the distance between every PVector point in the array
 //if the points are within a given maximum distance, then it will
 //draw a line conecting them
 //looks like constellations
 void compute_distance(int max_distance){
   for(int i = 0; i<points_array.length; i++){
     for(int j = 0; j<points_array.length; j++){
       if(dist(points_array[i].x, points_array[i].y, points_array[j].x, points_array[j].y) < max_distance){
         
         if(dist(points_array[i].x, points_array[i].y, points_array[j].x, points_array[j].y)!=0){
           if((points_array[i].x != points_array[j].x) || (points_array[i].y != points_array[j].y)){
          strokeWeight(0);
          stroke(0,0,0,255);
          line(points_array[i].x, points_array[i].y, points_array[j].x, points_array[j].y);
           }
         }
       }
     }
   }
 }
 
 //draws a continuous polyline connecting all of the points in the array
 //looks like scribble
  void show_scribble(){
    noFill();
    strokeWeight(1);
    stroke(255,255,255,75);
   for(int i=0; i<points_array.length; i++){
     if(i<points_array.length-1){
       line(points_array[i].x, points_array[i].y, points_array[i+1].x, points_array[i+1].y);
     } else {
       line(points_array[i].x, points_array[i].y, points_array[0].x, points_array[0].y);
     }
     
   }
  }
   
   //shows a given number of lines strewn around the canvas
   //divider is used to show more lines or to show less lines
   void show_lines(int divider){
    noFill();
    strokeWeight(1);
    stroke(255,255,255,75);
   for(int i=0; i<points_array.length; i++){
     if(i%divider == 0){
     if(i<points_array.length-1){
       line(points_array[i].x, points_array[i].y, points_array[i+1].x, points_array[i+1].y);
     } else {
       line(points_array[i].x, points_array[i].y, points_array[0].x, points_array[0].y);
     }
     }
     
   }
 }
 
 //shows lines that have 3 segments each...like in the shape of a "U"
 //divider is used to show more lines or to show less lines
 void show_complex_lines(int divider){
    noFill();
    strokeWeight(1);
    stroke(0,0,0,150);
   for(int i=0; i<points_array.length; i++){
     if(i%divider == 0){
     if(i<points_array.length-3){
       line(points_array[i].x, points_array[i].y, points_array[i+1].x, points_array[i+1].y);
       line(points_array[i+1].x, points_array[i+1].y, points_array[i+2].x, points_array[i+2].y);
       line(points_array[i+2].x, points_array[i+2].y, points_array[i+3].x, points_array[i+3].y);
     } else {
       line(points_array[i].x, points_array[i].y, points_array[0].x, points_array[0].y);
       line(points_array[0].x, points_array[0].y, points_array[1].x, points_array[1].y);
       line(points_array[1].x, points_array[1].y, points_array[2].x, points_array[2].y);
     }
     }
     
   }
 }
 
 //creates 5 pointed stars of variable sizes and line styles
  void show_stars(int number){
    int mx = number;
    float pA = .5*mx;
    float pB = .15*mx;
    float pC = .4*mx;
    float pD = .47*mx;
    float pE = .29*mx;
    if(number<10){
   color fill1 = color(255, 255, 255, 50);
   fill(fill1);
   noStroke();
   for(int i=0; i<points_array.length; i++){
     ellipse(points_array[i].x, points_array[i].y+pA, 3, 3);
     ellipse((points_array[i].x+pD), (points_array[i].y+pB), 3, 3);
     ellipse((points_array[i].x+pE), (points_array[i].y-pC), 3, 3);
     ellipse((points_array[i].x-pE), (points_array[i].y-pC), 3, 3);
     ellipse((points_array[i].x-pD), (points_array[i].y+pB), 3, 3);
   }
    } else if(number<20){
      stroke(0);
      strokeWeight(0);
      for(int i=0; i<points_array.length; i++){
      line(points_array[i].x, points_array[i].y+pA, points_array[i].x, points_array[i].y);
      line((points_array[i].x+pD), (points_array[i].y+pB), points_array[i].x, points_array[i].y);
      line((points_array[i].x+pE), (points_array[i].y-pC), points_array[i].x, points_array[i].y);
      line((points_array[i].x-pE), (points_array[i].y-pC), points_array[i].x, points_array[i].y);
      line((points_array[i].x-pD), (points_array[i].y+pB), points_array[i].x, points_array[i].y);
      }
    } else {
      stroke(255);
      strokeWeight(0);
      for(int i=0; i<points_array.length; i++){
        line((points_array[i].x-pE), (points_array[i].y-pC), points_array[i].x, points_array[i].y+pA);
        line(points_array[i].x, points_array[i].y+pA, (points_array[i].x+pE), (points_array[i].y-pC));
        line((points_array[i].x+pE), (points_array[i].y-pC), (points_array[i].x-pD), (points_array[i].y+pB));
        line((points_array[i].x-pD), (points_array[i].y+pB), (points_array[i].x+pD), (points_array[i].y+pB));
        line((points_array[i].x+pD), (points_array[i].y+pB), (points_array[i].x-pE), (points_array[i].y-pC));
      }
    }
 }
 
 //draws a flowing and curved line 
 void draw_bezier(){
    noFill();
    strokeWeight(width*0.0015);
    stroke(255,255,255,255);
    bezier(points_array[12].x, points_array[12].y, points_array[1].x, points_array[1].y, points_array[2].x, points_array[2].y, points_array[3].x, points_array[3].y);
    bezier(points_array[3].x, points_array[3].y, points_array[16].x, points_array[16].y, points_array[17].x, points_array[17].y, points_array[18].x, points_array[18].y);
    bezier(points_array[18].x, points_array[18].y, points_array[26].x, points_array[26].y, points_array[27].x, points_array[27].y, points_array[12].x, points_array[12].y);
 }
     
// not sure what this one does....needs to be verified and updated
 void show_dots(){
    //fill(125,0,240,100);
    //strokeWeight(width*0.0015);
    //stroke(255,255,255,255);
    noStroke();
    pushMatrix();
    for(int i=0;i<35;i++){
    fill(199*i%255,35*i%255,240*i%255,100);
    ellipse(points_array[i].x, points_array[i].y, 20, 20);
    translate(width/2, height/2);
    rotate(PI/4);
    translate(-width/2, -height/2);
    }
    popMatrix();
 }
 
 //draws a variety of colored lines strewn around the surface of the canvas
 void show_colored_lines(int divider){
    //fill(125,0,240,100);
    strokeWeight(width*0.0015);
    //stroke(255,255,255,255);
    //noStroke();
    pushMatrix();
    for(int i=0;i<divider;i++){
    stroke(199*i%255,35*i%255,240*i%255,100);
    line(points_array[i].x, points_array[i].y, 20, 20);
    translate(width/2, height/2);
    rotate(PI/4);
    translate(-width/2, -height/2);
    }
    popMatrix();
 }
 
 
}




//This is the most important class
//if creates the Pip object, which contains the methods needed to retrieve the number dictionary values
//from each hash character. Contructor requires the raw hash string.
//hash string length can be variable.
class Pip {
  String raw_hash;
  String[] array_hash;
  float padding = width*0.02;
  
  //input the raw string of hash characters to keep on hand for reference
  //also saves each character as an array element
  Pip(String _raw){
    raw_hash = _raw;
    //the hash is reversed to avoid leading nonce characters which may be present in some cryptos
    array_hash = reverse(raw_hash.split(""));
  }
  
  // input a number, grabs the corresponding hash_character, then inputs the hash character
  // into the number dictionary, and then outputs the corresponding number value of that hash character.
  // Essencially, converts the hash character into a number.
  //_num is the position of the hash character counting from left to right
  int P(int _num){
    int number_value;
    if((_num>=raw_hash.length())||(_num<0)) {
      return 0;
    } else {
      NumDir nd = new NumDir(charpool);
      number_value = nd.P(array_hash[_num]);
     return number_value; 
    }
  }
  
  // the C method maps the P method returned value into a range of 255 to be used for rgb color values
  int C(int _num){
    NumDir nd = new NumDir(charpool);
    int number_value = this.P(_num);
    int mapped_value = (int) map(number_value, 0, nd.charpool.length, 0, 255);
    return mapped_value;
  }
  
  //the A method maps the P method's return value into a range from 50 to 100 to be used for alpha transparency values
  int A(int _num){
    NumDir nd = new NumDir(charpool);
    int number_value = this.P(_num);
    int mapped_value = (int) map(number_value, 0, nd.charpool.length, 50, 100);
    return mapped_value;
  }
  
  //the X method maps the P method's return value into a range from 0 to screen width to be used for x-coordinate positioning
  int X(int _num){
    NumDir nd = new NumDir(charpool);
    int number_value = this.P(_num);
    int mapped_value = (int) map(number_value, 0, nd.charpool.length, padding, width-padding);
    return mapped_value;
  }
  
  //the Y method maps the P method's return value into a range from 0 to screen height to be used for y-coordinate positioning
  int Y(int _num){
    NumDir nd = new NumDir(charpool);
    int number_value = this.P(_num);
    int mapped_value = (int) map(number_value, 0, nd.charpool.length, padding, height-padding);
    return mapped_value;
  }
  
  // the R method maps the P method's retun value into a range from 0 to 32 to be used for small circle radius   
    int R(int _num){
    NumDir nd = new NumDir(charpool);
    int number_value = this.P(_num);
    int mapped_value = (int) map(number_value, 0, nd.charpool.length, 0, 32);
    return mapped_value;
  }
  
}


// This class generates a variety of background effects. 
// The constructor requires three color values and an alpha value.
class Backdrop{
  int c1;
  int c2;
  int c3;
  int a;
  
   Backdrop(int _c1, int _c2, int _c3, int _a){
     c1 = _c1;
     c2 = _c2;
     c3 = _c3;
     a = _a;
   }
   
   //solid fill
   void colorBlock(){
    fill(c1, c2, c3);
    rectMode(CORNERS);
    rect(0,0,width, height); 
   }
   
   //gradient background effect, runs either horizontally or vertically, requires axis input parameter (X_AXIS or Y_AXIS)
   void gradientBlock(String _axis){
     color colorA = color(c1,c2,c3);
     color colorB = color(c1+1000%1000, c2+50%50, 255);
     //color lerped = lerpColor(colorA, colorB, .9);
     if (_axis=="Y_AXIS"){
       for (float i = 0; i<height; i++){
         float mapped_value = map(i, 0,height, 0,1);
         color lerped = lerpColor(colorA, colorB, mapped_value);
         strokeWeight(4);
         stroke(lerped);
         line(0,i,width,i);
       }
     } else if(_axis == "X_AXIS"){
       for (float i = 0; i<width; i++){
         float mapped_value = map(i, 0,width, 0,1);
         color lerped = lerpColor(colorA, colorB, mapped_value);
         strokeWeight(4);
         stroke(lerped);
         line(i, 0,i, height);
       }
     }
   }
}



// This class draws out a trapezoidal shape with 4 points (as PVectors) required by the constructor
class Trapezoid {
  PVector p1;
  PVector p2;
  PVector p3;
  PVector p4;
  int average;
  
  Trapezoid(int px1, int py1, int px2, int py2, int px3, int py3, int px4, int py4){
    p1 = new PVector(px1, py1);
    p2 = new PVector(px2, py2);
    p3 = new PVector(px3, py3);
    p4 = new PVector(px4, py4);
    average = (px1+py1+px2+py2+px3+py3+px4+py4)/8;
  }
  
  // shows the points of the trapezoid as circles with radius 10
  //requires 3 colors and an alpha value
  void show_dots(int c1, int c2, int c3, int a){
    color fill1 = color(c1, c2, c3, a);
    fill(fill1);
    noStroke();
    ellipse(p1.x, p1.y, 10, 10);
    ellipse(p2.x, p2.y, 10, 10);
    ellipse(p3.x, p3.y, 10, 10);
    ellipse(p4.x, p4.y, 10, 10);
  }
  
  //shows the lines connecting all of the points of the trapezoid (6 lines total)
  //requires 3 colors and an alpha value
  void show_lines(int c1, int c2, int c3, int a){
    color fill1 = color(c1, c2, c3, a);
    noFill();
    strokeWeight(width*0.0015);
    stroke(fill1);
    line(p1.x, p1.y, p2.x, p2.y);
    line(p2.x, p2.y, p3.x, p3.y);
    line(p3.x, p3.y, p4.x, p4.y);
    line(p4.x, p4.y, p1.x, p1.y);
    line(p1.x, p1.y, p3.x, p3.y);
    line(p4.x, p4.y, p2.x, p2.y);
  }
  
  //creates a polar array of the filled trapezoid shape around the center of the screen
  //requires 3 colors and an alpha value
  void spiral_vortex(int c1, int c2, int c3, int a){
    color fill1 = color(c1, c2, c3, a);
    //noStroke();
    stroke(fill1);
    strokeWeight(10);
    pushMatrix();
    //translate(-width/2, -height/2);
    translate(width/2, height/2);
    scale(.3);
    for(int i=0;i<average;i++){
    rotate(i);
    p1.add(2, 2);
    p2.add(2, 2);
    p3.add(2, 2);
    p4.add(2, 2);
    fill(fill1);
    line(p1.x, p1.y, 10000, 10000);
    }
      popMatrix();
  }
  
  //displays two trapezoidal shapes
  //requires 3 colors and an alpha value
  void show_shapes(int c1, int c2, int c3, int a){
    color fill1 = color(c1, c2, c3, a);
    color fill2 = color(c1, c2, c1, c2);
    noStroke();
    fill(fill1);
    triangle(p1.x, p1.y, p2.x, p2.y, p3.x, p3.y);
    fill(fill2);
    triangle(p4.x, p4.y, p2.x, p2.y, p3.x, p3.y);
  }
}

//This class draws a rectangle. For the constructor, iput a width, a height, and a corner radius value for rounded corners
class Rectangle{
  int rect_height;
  int rect_width;
  int corner_round;
  
  Rectangle(int _rect_width, int _rect_height, int _corner_round ){
    rect_height = _rect_height;
    rect_width = _rect_width;
    corner_round = _corner_round;
  }
  
  //Shows a single rectangular shape
  //requires 3 colors and an alpha value
  void show1(int c1, int c2, int c3, int a){
    color fill1 = color(c1, c2, c3, a);
    fill(fill1);
    noStroke();
    rectMode(CENTER);
    rect(width/2, height/2, rect_width, rect_height, corner_round);
  }
  
  //Shows 3 equally spaced rectangular shapes
  //requires 3 colors and an alpha value
  void show3(int c1, int c2, int c3, int a){
    color fill1 = color(c1, c2, c3, a);
    fill(fill1);
    noStroke();
    rectMode(CENTER);
    if(rect_height>rect_width){
      rect((width/2)+(width*0.2), height/2, rect_width, rect_height, corner_round);
      rect(width/2, height/2, rect_width, rect_height, corner_round);
      rect((width/2)-(width*0.2), height/2, rect_width, rect_height, corner_round);
    } else {
      rect(width/2, (height/2)+(height*0.2), rect_width, rect_height, corner_round);
      rect(width/2, height/2, rect_width, rect_height, corner_round);
      rect(width/2, (height/2)-(height*0.2), rect_width, rect_height, corner_round);
    }
  }
  
  //Shows 5 equally spaced rectangular shapes
  //requires 3 colors and an alpha value
  void show5(int c1, int c2, int c3, int a){
    color fill1 = color(c1, c2, c3, a);
    fill(fill1);
    noStroke();
    rectMode(CENTER);
    if(rect_height>rect_width){
      rect((width/2)+(width*0.2), height/2, rect_width, rect_height, corner_round);
      rect((width/2)+(width*0.1), height/2, rect_width, rect_height, corner_round);
      rect(width/2, height/2, rect_width, rect_height, corner_round);
      rect((width/2)-(width*0.1), height/2, rect_width, rect_height, corner_round);
      rect((width/2)-(width*0.2), height/2, rect_width, rect_height, corner_round);
    } else {
      rect(width/2, (height/2)+(height*0.2), rect_width, rect_height, corner_round);
      rect(width/2, (height/2)+(height*0.1), rect_width, rect_height, corner_round);
      rect(width/2, height/2, rect_width, rect_height, corner_round);
      rect(width/2, (height/2)-(height*0.1), rect_width, rect_height, corner_round);
      rect(width/2, (height/2)-(height*0.2), rect_width, rect_height, corner_round);
    }
  }
}


//This class creates a very fine grid pattern accross the entire window
//constructor requires two integers which will be used to determine the grid spacing
class Grid{
  int vertical_divider;
  int horizontal_divider;
  color c1;
  
  Grid(int p, int q){
    if(p<4){p=4;}
    if(q<4){q=4;}
    vertical_divider = p;
    horizontal_divider = q;
  }
  
  //draws the grid with oblique angles
  //mixer is used to give the angles a bit more rotation
  void show_diagonal(int mixer){
    noFill();
    strokeWeight(1);
    stroke(100, 100, 100, 100);
    mixer = mixer*2;
    for(int i=0-(vertical_divider*2);i<width+(vertical_divider*2);i++){
     if((i%vertical_divider)==0){
       line(i-mixer, 0, i+mixer, height); 
  }}}
  
  //draws vertical lines
  void show_vertical(){
    noFill();
    strokeWeight(1);
    stroke(100, 100, 100, 100);
    for(int i=0-vertical_divider;i<width+vertical_divider;i++){
     if((i%vertical_divider)==0){
       line(i, 0, i, height); 
  }}}
  
  //draws horizontal lines
  void show_horizontal(){
    noFill();
    strokeWeight(1);
    stroke(100, 100, 100, 100);
    for(int i=0-horizontal_divider;i<height+horizontal_divider;i++){
     if((i%horizontal_divider)==0){
       line(0, i, width, i); 
  }}}
}