PFont word;
float distance;
float angle;
void setup()
{
  size(1200,700);
  background(0,0,0);
  smooth(8);
  word=createFont("Arial",30,true);
  radar();
  textFont(word,30);
}

void draw()
{
  radar();
  
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
}
