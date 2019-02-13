const int sensorPin = A0;
int led=13;
int lightLevel;
void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  pinMode(led,OUTPUT);
  pinMode(sensorPin,INPUT);
}
void loop() {
  digitalWrite(led,HIGH);
  delay(2000);
  lightLevel=analogRead(sensorPin);
  digitalWrite(led,LOW);
  Serial.print("The photoresistor is reading: ");
  Serial.println(lightLevel);
  delay(1000);
  lightLevel=analogRead(sensorPin);
  Serial.print("The photoresistor is reading: ");
  Serial.println(lightLevel);
}
