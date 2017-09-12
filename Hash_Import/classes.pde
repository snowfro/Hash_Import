class NumDir{
  String[] charpool;
  StringDict nd;
  // input the character pool and builds the dictionary with numerical definitions
  NumDir(String[] _charpool){
    charpool = _charpool;
    nd = new StringDict();
    for (int i=0;i<charpool.length;i++){
      nd.set(charpool[i], str(i));
    }
  }
  
  //Input the hash character (as string) and get the numeric value (as int) in return as per dictionary definition
  int P(String _character){
   String character = _character;
   //character = nd.get(character);
   int p = Integer.parseInt(nd.get(character));
   return p;
  }

}




class LineMaker {
  PVector[] points_array;
 LineMaker(Pip pip){
   points_array = new PVector[pip.raw_hash.length()];
   for(int i=0; i<pip.raw_hash.length(); i++){ 
     points_array[i] = new PVector(pip.X(i), pip.Y(i+1));   
   }
   
 }
 
 void show_points(int size){
   color fill1 = color(255, 255, 255, 50);
   fill(fill1);
   noStroke();
   for(int i=0; i<points_array.length; i++){
     ellipse(points_array[i].x, points_array[i].y, size, size);
   }
 }
 
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
 
 
 void draw_bezier(){
    noFill();
    strokeWeight(width*0.0015);
    stroke(255,255,255,255);
    bezier(points_array[12].x, points_array[12].y, points_array[1].x, points_array[1].y, points_array[2].x, points_array[2].y, points_array[3].x, points_array[3].y);
    bezier(points_array[3].x, points_array[3].y, points_array[16].x, points_array[16].y, points_array[17].x, points_array[17].y, points_array[18].x, points_array[18].y);
    bezier(points_array[18].x, points_array[18].y, points_array[26].x, points_array[26].y, points_array[27].x, points_array[27].y, points_array[12].x, points_array[12].y);
 }
     

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





class Pip {
  String raw_hash;
  String[] array_hash;
  float padding = width*0.02;
  
  //input the raw string of hash characters to keep on hand for reference
  //also saves each character as an array element
  Pip(String _raw){
    raw_hash = _raw;
    array_hash = reverse(raw_hash.split(""));
  }
  
  // input a number, grabs the corresponding hash_character, then inputs the hash character
  // into the number dictionary, and then outputs the corresponding number value of that hash character.
  // Essencially, converts the hash character into a number. 
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
  
  int C(int _num){
    NumDir nd = new NumDir(charpool);
    int number_value = this.P(_num);
    int mapped_value = (int) map(number_value, 0, nd.charpool.length, 0, 255);
    return mapped_value;
  }
  
  int A(int _num){
    NumDir nd = new NumDir(charpool);
    int number_value = this.P(_num);
    int mapped_value = (int) map(number_value, 0, nd.charpool.length, 50, 100);
    return mapped_value;
  }
  
  int X(int _num){
    NumDir nd = new NumDir(charpool);
    int number_value = this.P(_num);
    int mapped_value = (int) map(number_value, 0, nd.charpool.length, padding, width-padding);
    return mapped_value;
  }
  
  int Y(int _num){
    NumDir nd = new NumDir(charpool);
    int number_value = this.P(_num);
    int mapped_value = (int) map(number_value, 0, nd.charpool.length, padding, height-padding);
    return mapped_value;
  }
  
    int R(int _num){
    NumDir nd = new NumDir(charpool);
    int number_value = this.P(_num);
    int mapped_value = (int) map(number_value, 0, nd.charpool.length, 0, 32);
    return mapped_value;
  }
  
}

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
   
   void colorBlock(){
    fill(c1, c2, c3);
    rectMode(CORNERS);
    rect(0,0,width, height); 
   }
   
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

    //color gradient1 = lerpColor(colorA, colorB, .5);
    //fill(gradient1);
    //rectMode(CORNERS);
    //rect(0,0,width, height); 
   }
   
   
}




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
  
  void update(){
    
  }
  
  void show_dots(int c1, int c2, int c3, int a){
    color fill1 = color(c1, c2, c3, a);
    fill(fill1);
    noStroke();
    ellipse(p1.x, p1.y, 10, 10);
    ellipse(p2.x, p2.y, 10, 10);
    ellipse(p3.x, p3.y, 10, 10);
    ellipse(p4.x, p4.y, 10, 10);
  }
  
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


class Rectangle{
  int rect_height;
  int rect_width;
  int corner_round;
  
  Rectangle(int _rect_width, int _rect_height, int _corner_round ){
    rect_height = _rect_height;
    rect_width = _rect_width;
    corner_round = _corner_round;
  }
  
  void show1(int c1, int c2, int c3, int a){
    color fill1 = color(c1, c2, c3, a);
    fill(fill1);
    noStroke();
    rectMode(CENTER);
    rect(width/2, height/2, rect_width, rect_height, corner_round);
  }
  
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
  
  void show_diagonal(int mixer){
    noFill();
    strokeWeight(1);
    stroke(100, 100, 100, 100);
    mixer = mixer*2;
    for(int i=0-(vertical_divider*2);i<width+(vertical_divider*2);i++){
     if((i%vertical_divider)==0){
       line(i-mixer, 0, i+mixer, height); 
  }}}
  
  void show_vertical(){
    noFill();
    strokeWeight(1);
    stroke(100, 100, 100, 100);
    for(int i=0-vertical_divider;i<width+vertical_divider;i++){
     if((i%vertical_divider)==0){
       line(i, 0, i, height); 
  }}}
  
  void show_horizontal(){
    noFill();
    strokeWeight(1);
    stroke(100, 100, 100, 100);
    for(int i=0-horizontal_divider;i<height+horizontal_divider;i++){
     if((i%horizontal_divider)==0){
       line(0, i, width, i); 
  }}}
}