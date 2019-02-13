int buttonPin = 2;
int ledPin = 13;

int buttonState;
int ledState = LOW;
void setup() {
  // put your setup code here, to run once:
  pinMode(buttonPin, INPUT);
  pinMode(ledPin, OUTPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
  buttonState=digitalRead(buttonPin);
  if(buttonState==HIGH && ledState==LOW){
    digitalWrite(ledPin, HIGH);
    ledState = HIGH;
  }
  else if(buttonState == HIGH && ledState==HIGH){
    digitalWrite(ledPin,LOW);
    ledState=LOW;
  }
  delay(100);
}
