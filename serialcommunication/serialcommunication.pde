import processing.serial.*;
Serial myport;
int inbyte;

void setup()
{
  String portName="COM3";
  
  //String portName = Serial.list()[0];
  myport=new Serial(this,portName,9600);
  background(100,0,0);
  myport.bufferUntil('\n');
  //println(Serial.list());
}
  
//  
void draw()
{ if(myport.available()>0)
  {
    float val=myport.read();
  println(val);
  
  delay(1000);
  }
  else
  {
  println("no devices found");
  }
}

//}
void serialEvent(Serial myport)
{
  inbyte = int(myport.readStringUntil('\n'));
  
}
