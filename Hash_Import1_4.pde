String[] charpool = {"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"};
String temp;
NumDir nd;
Pip pip;
float timer_reset;


void setup(){
  fullScreen();
  //size(800,800);
  temp = build_hash_string();
  nd = new NumDir(charpool);
  pip = new Pip(temp);
  background(pip.C(1), pip.C(5), pip.C(7), pip.A(9)); 
  
}


void draw(){
  if(millis()-timer_reset>=10000){
    temp = build_hash_string();
    pip = new Pip(temp);
    timer_reset=millis();
  }
  
  
  background(pip.C(1), pip.C(5), pip.C(7), pip.A(9));

  
  Grid grid = new Grid(pip.P(0), pip.P(5));
  if(pip.P(2)>30){
    grid.show_diagonal(pip.C(12));
    grid.show_diagonal(-pip.C(12));
  } else if(pip.P(3)>20){
    grid.show_horizontal();
    grid.show_vertical();    
  }

  
  Rectangle rectangle1 = new Rectangle(pip.X(10), pip.Y(24), pip.R(4));
  if(pip.P(0)>5 && pip.P(0)<10){
    rectangle1.show5(pip.C(12), pip.C(3), pip.C(5), pip.A(14));
  } else if(pip.P(0)>12 && pip.P(0)<20){
    rectangle1.show3(pip.C(12), pip.C(3), pip.C(5), pip.A(14));
  } else {
  rectangle1.show1(pip.C(12), pip.C(3), pip.C(5), pip.A(14));
  }
  
  LineMaker lines = new LineMaker(pip);
  if(pip.P(10)==10){
    lines.show_points(4);
    lines.compute_distance(74);
  } else if (pip.P(10)==11){
    lines.show_points(4);
  } else if (pip.P(10)==12){
    lines.show_scribble();
  } else if (pip.P(10)==13){
    lines.show_lines(pip.P(10));
  } else if (pip.P(10)==14){
    lines.show_complex_lines(pip.P(10));
  } else if (pip.P(10)==15){
    lines.show_stars(pip.P(10));
  } else if (pip.P(10)==16){
    lines.show_points(15);
    lines.show_points(10);
    lines.show_points(5);
  } else if (pip.P(10)==17){
    lines.show_points(pip.P(10));
  } else if (pip.P(10)==18){
    lines.show_dots();
  } else if (pip.P(10)>18 && pip.P(10)<21){
    lines.show_stars(pip.P(10));
  }
  
 
 
  
  Rectangle rectangle2 = new Rectangle(pip.X(13), pip.Y(19), pip.R(3));
  if(pip.P(4)>5 && pip.P(4)<10){
    rectangle2.show5(pip.C(21), pip.C(5), pip.C(7), pip.A(19));
  } else if(pip.P(4)>12 && pip.P(4)<20){
    rectangle2.show3(pip.C(21), pip.C(5), pip.C(7), pip.A(19));
  } else {
  rectangle2.show1(pip.C(21), pip.C(5), pip.C(7), pip.A(19));
  }
  
  
  Trapezoid trap1 = new Trapezoid(pip.X(0), pip.Y(1), pip.X(2), pip.Y(3), pip.X(4), pip.Y(5), pip.X(6), pip.Y(7));
  if(pip.P(6)>25){
    trap1.show_lines(0, 0, 0, 255);
    //trap1.show_dots(0, 0, 0, 255);
  } else if(pip.P(6)>20) {
    trap1.show_lines(pip.C(15), pip.C(18), pip.C(23), pip.A(6));
  } else if(pip.P(6)>15) {
    trap1.show_shapes(pip.C(15), pip.C(18), pip.C(23), pip.A(6));
    //trap1.show_dots(255, 255, 255, 255);    
  } else if (pip.P(6)>15) {
    trap1.show_lines(pip.C(15), pip.C(18), pip.C(23), 255);
  } else if (pip.P(6)>10) {
    lines.draw_bezier();
  } else {
    trap1.show_lines(255, 255, 255, 255);
  }
  
  Trapezoid trap2 = new Trapezoid(pip.X(8), pip.Y(9), pip.X(10), pip.Y(11), pip.X(12), pip.Y(13), pip.X(14), pip.Y(15));
  trap2.show_shapes(pip.C(8), pip.C(9), pip.C(10), pip.A(11));
  
 
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
           if((points_array[i].x != points_array[j].x) && (points_array[i].y != points_array[j].y)){
          strokeWeight(1);
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
 
 
 void show_stars(int divider){
    //fill(125,0,240,100);
    strokeWeight(width*0.0015);
    //stroke(255,255,255,255);
    noStroke();
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