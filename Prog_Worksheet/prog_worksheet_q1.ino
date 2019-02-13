void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  int egArray[10]={2,4,6,8,10,1,3,5,7,9};
  for(int index=9; index>=0; index--){
    Serial.println(egArray[index]);
  }
}

void loop() {
  // put your main code here, to run repeatedly:
  
}
