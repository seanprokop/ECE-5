// Outputs analog reading at A0 and system time to Serial at 50 Hz.
unsigned long ii = 0; // Counter
int sensorValue; // Stores value read from the sensor
unsigned long millinum;
void setup() {
  Serial.begin(9600); //Initialize Serial connection
}

void loop() {
  millinum = millis();
  if ((millinum) > 20 * ii) { //Make the following code execute every 20ms
    millinum = millis();
    sensorValue = analogRead(A0); // read the input on analog pin A0
    // Print to serial the value you read:
    Serial.print(millinum); // Time
    Serial.print(' ');
    Serial.println(sensorValue); // Sensor reading
    ii = ii + 1; // Increment counter
  }
}
