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



class Trapezoid {
  PVector p1;
  PVector p2;
  PVector p3;
  PVector p4;
  
  Trapezoid(int px1, int py1, int px2, int py2, int px3, int py3, int px4, int py4){
    p1 = new PVector(px1, py1);
    p2 = new PVector(px2, py2);
    p3 = new PVector(px3, py3);
    p4 = new PVector(px4, py4);
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
  
  void show_shapes(int c1, int c2, int c3, int a){
    color fill1 = color(c1, c2, c3, a);
    color fill2 = color(c1, c2, c1, c2);
    fill(fill1);
    noStroke();
    triangle(p1.x, p1.y, p2.x, p2.y, p3.x, p3.y);
    fill(fill2);
    noStroke();
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