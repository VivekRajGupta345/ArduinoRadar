#include <Servo.h> 
Servo myservo;  // create servo object to control a servo 
                // twelve servo objects can be created on most boards
 
int pos = 0;    // variable to store the servo position 
int buzzerpin=6;
int trig=7;
int echo=10;
int inbyte = 0;         // incoming serial byte
float distance;
void setup() 
{ 
  myservo.attach(3);  // attaches the servo on pin 3 to the servo object 
pinMode(trig,OUTPUT);
pinMode(echo,INPUT);
pinMode(buzzerpin,OUTPUT);
Serial.begin(9600);
 establishContact();  // send a byte to establish contact until receiver responds
} 
 
void loop() 
{ 
  if(Serial.available()>0)
  {
    inbyte=Serial.read();
  
  for(pos = 0; pos <= 180; pos ++) // goes from 0 degrees to 180 degrees 
  {                                  // in steps of 1 degree 
    myservo.write(pos);              // tell servo to go to position in variable 'pos' 
    delay(15);   // waits 15ms for the servo to reach the position 
    ultrasonic_Sensor();    
    buzzer();
   } 
  for(pos = 180; pos>=0; pos--)     // goes from 180 degrees to 0 degrees 
  {                                
    myservo.write(pos);              // tell servo to go to position in variable 'pos' 
    delay(15);                       // waits 15ms for the servo to reach the position 
    ultrasonic_Sensor();
    buzzer();
  } 
} 
}
void ultrasonic_Sensor()
{
digitalWrite(trig, LOW);
delayMicroseconds(2);
digitalWrite(trig,HIGH);
delayMicroseconds(20);
digitalWrite(trig,LOW);
distance=pulseIn(echo,HIGH)*0.034/2;//in cm
}
void buzzer()
{
  if(distance<=20)
  {
    Serial.write(int(distance));
    Serial.write(pos);
    digitalWrite(buzzerpin,HIGH);
    delay(10);
    digitalWrite(buzzerpin,LOW);
  }
  }

    void establishContact() {
  while (Serial.available() <= 0) {
    Serial.print('A');   // send a capital A
    delay(300);
  }
}
