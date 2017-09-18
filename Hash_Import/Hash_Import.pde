import processing.pdf.*;
String[] charpool = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"};
//String[] charpool = {"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"};
String temp;
NumDir nd;
Pip pip;
float timer_reset;
boolean image_capture;
String str;

void setup(){
  //fullScreen();
  size(650,650);
  temp = build_hash_string();
  str = fetchFile("http://www.projectonthemoon.com/b58.txt");
  nd = new NumDir(charpool);
  pip = new Pip(str);
  background(pip.C(1), pip.C(5), pip.C(7), pip.A(9)); 
  
  
}


void draw(){
println(str);
  
  if(millis()-timer_reset>=3000){
    str = fetchFile("http://www.projectonthemoon.com/b58.txt");
    //image_capture=true;
    temp = build_hash_string();
    pip = new Pip(str);
    timer_reset=millis();
    
  }
  //background needs to run before the scree begins recording
  background(204);

  if(image_capture){
    beginRecord(PDF, "screenshots/"+str+".pdf"); 
  }
  
//construct objects
Backdrop block = new Backdrop(pip.C(20), pip.C(21), pip.C(22), pip.C(23));  
LineMaker lines = new LineMaker(pip);
Grid grid = new Grid(pip.P(0), pip.P(5));
Rectangle rectangle1 = new Rectangle(pip.X(10), pip.Y(24), pip.R(4));
Rectangle rectangle2 = new Rectangle(pip.X(13), pip.Y(19), pip.R(3));
Trapezoid trap1 = new Trapezoid(pip.X(0), pip.Y(1), pip.X(2), pip.Y(3), pip.X(4), pip.Y(5), pip.X(6), pip.Y(7));
Trapezoid trap2 = new Trapezoid(pip.X(8), pip.Y(9), pip.X(10), pip.Y(11), pip.X(12), pip.Y(13), pip.X(14), pip.Y(15));


  //fill background with color
  if(pip.P(2)<10){
    block.colorBlock();
  } else if(pip.P(2)<20) {
    block.gradientBlock("Y_AXIS");
  } else {
    block.gradientBlock("X_AXIS");
  }
  

//draw grid  
  if(pip.P(2)>30){
    grid.show_diagonal(pip.C(12));
    grid.show_diagonal(-pip.C(12));
  } else if(pip.P(3)>20){
    grid.show_horizontal();
    grid.show_vertical();    
  }

  
  //draw rectangle
  if(pip.P(0)>5 && pip.P(0)<10){
    rectangle1.show5(pip.C(12), pip.C(3), pip.C(5), pip.A(14));
  } else if(pip.P(0)>12 && pip.P(0)<20){
    rectangle1.show3(pip.C(12), pip.C(3), pip.C(5), pip.A(14));
  } else {
  rectangle1.show1(pip.C(12), pip.C(3), pip.C(5), pip.A(14));
  }

// draw lots of little lines or circles  
  if(pip.P(10)==0){
    lines.show_points(4);
    lines.compute_distance((int) (width*0.11));
  } else if (pip.P(10)==1){
    lines.show_points(4);
  } else if (pip.P(10)==2){
    lines.show_scribble();
  } else if (pip.P(10)==3){
    lines.show_lines(pip.P(10));
  } else if (pip.P(10)==4){
    lines.show_complex_lines(pip.P(10));
  } else if (pip.P(10)==5){
    lines.show_colored_lines(pip.P(10));
  } else if (pip.P(10)==6){
    lines.show_points(15);
    lines.show_points(10);
    lines.show_points(5);
  } else if (pip.P(10)==7){
    lines.show_points(pip.P(10));
  } else if (pip.P(10)==8){
    lines.show_dots();
  } else if (pip.P(10)==9){
    lines.show_stars(pip.P(23));
  } else if (pip.P(10)>9 && pip.P(10)<12){
    lines.show_colored_lines(pip.P(10));
  }
  
 
 
  
//draw rectangle
  if(pip.P(4)>5 && pip.P(4)<10){
    rectangle2.show5(pip.C(21), pip.C(5), pip.C(7), pip.A(19));
  } else if(pip.P(4)>12 && pip.P(4)<20){
    rectangle2.show3(pip.C(21), pip.C(5), pip.C(7), pip.A(19));
  } else {
  rectangle2.show1(pip.C(21), pip.C(5), pip.C(7), pip.A(19));
  }
  

//draw trapezoid   
  if(pip.P(6)>25){
    trap1.show_lines(0, 0, 0, 255);
    //trap1.show_dots(0, 0, 0, 255);
  } else if(pip.P(6)>25) {
    trap1.show_lines(pip.C(15), pip.C(18), pip.C(23), pip.A(6));
  } else if(pip.P(6)>20) {
    trap1.show_shapes(pip.C(15), pip.C(18), pip.C(23), pip.A(6));
    //trap1.show_dots(255, 255, 255, 255);    
  } else if (pip.P(6)>15) {
    trap1.show_lines(pip.C(15), pip.C(18), pip.C(23), 255);
  } else if (pip.P(6)>10) {
    lines.draw_bezier();
  } else if (pip.P(6)>5) {
    trap1.spiral_vortex(pip.C(15), pip.C(18), pip.C(23), pip.A(6));
  } else {
    trap1.show_lines(255, 255, 255, 255);
  }
//draw trapezoid   
  trap2.show_shapes(pip.C(8), pip.C(9), pip.C(10), pip.A(11));
  
  
  if(image_capture){
    endRecord();
   image_capture = false; 
  }
 
}


String fetchFile(String h){
  if (loadStrings(h)==null){
    String hash = "WelcomeToTheMachine2017";
    return hash;
  } else {
    String hash[] = loadStrings(h);
    if(hash.length!=0){
       return hash[0];
     } else {
       hash[0]= "00000000000000000000000000000000000000000000";
       return hash[0];
     }
  }
}


void keyPressed() {
  // is ke pressed is spacebar
  if(key == 32){
  image_capture = true;
  }
}

String build_hash_string() {
  String thecode[] = {};
  String hash_string = "";
  for (int i=0; i<64; i++){
    int arraypicker = (int)random(charpool.length);
    thecode = append(thecode, charpool[arraypicker]);
    hash_string = join(thecode, "");
  }
  return hash_string; 
}