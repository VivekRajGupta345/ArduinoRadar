import processing.serial.*;
Serial myport;
PFont word;
int[] serialInArray = new int[2];
int serialCount = 0;
float distance=0;
int angle=0;

boolean firstContact=false;
void setup()
{
  size(1200,700);
  background(0,0,0);
  smooth(8);
  word=createFont("Arial",30,true);
  textFont(word,30);
  myport = new Serial(this, "COM3", 9600);
  
}

void draw()
{
  background(0);
  radar();
  
  
  fill(0,0,255);
  strokeWeight(1);
  
  text(distance,255,50);
 
  text(angle,910,50);
  
  fill(255,0,0);
  
  if(angle>90)
  {   
  ellipse(600-distance*cos(3.14-angle*0.01744)*10,700-distance*sin(3.14-angle*0.01744)*10,20,20);
  }
  else
  {
  ellipse(600+distance*cos(angle*0.01744)*4,700-distance*sin(angle*0.01744)*4,20,20);
  }
  
  
}

void radar()
{
  stroke(98,245,60); 
  noFill();
  strokeWeight(2);
  smooth(8);
  arc(600,700,100,100,PI,TWO_PI);
 // arc(600,700,200,200,PI,TWO_PI);
  arc(600,700,200,200,PI,TWO_PI);
 // arc(600,700,300,300,PI,TWO_PI);
  arc(600,700,400,400,PI,TWO_PI);
 // arc(600,700,500,500,PI,TWO_PI);
  arc(600,700,600,600,PI,TWO_PI);
 // arc(600,700,700,700,PI,TWO_PI);
  arc(600,700,800,800,PI,TWO_PI);
 // arc(600,700,900,900,PI,TWO_PI);
  arc(600,700,1000,1000,PI,TWO_PI);
 // arc(600,700,1100,1100,PI,TWO_PI);
 
  arc(600,700,1200,1200,PI,TWO_PI);
  stroke(98,255,60);
  line(0,698,1200,698);//  base line
  line(600,700,600,55);//90 degree line
  line(600,700,1150,382.15);//30 degree line
  line(600,700,50,382.15);//150 degree line
  line(600,700,920,145.56);//60 degree line
  line(600,700,280,145.56);//120 degree line
    textFont(word,25);
    fill(0,255,0);
 // may do rotate
   text("30° ",1155,385);
  text("90° ",585,50);
  text("150° ",20,375);
  text("60° ",915,140);
  text("120° ",255,135);
  fill(0,0,255);
  text("DISTANCE: ",100,50);
  text("cm",350,50);
   text("ANGLE: ",800,50);
   text(" ° ",940,50);
  
}

void serialEvent(Serial myport) {
  int inbyte=myport.read();
  if(firstContact==false)
  {
    if (inbyte=='A')
    {
    myport.clear();
    firstContact=true;
    myport.write('A');
    }
  }
else
{
serialInArray[serialCount] = inbyte;
serialCount=serialCount+1;
if(serialCount>1)
{
distance=serialInArray[0];
angle=(serialInArray[1]);
println(distance+"\t"+angle);
serialCount=0;
myport.write('A');
}
}
}
