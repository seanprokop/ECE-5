void setup() {
  // put your setup code here, to run once:
  int Numbers[10]={1,1,2,3,5,8,13,21,34,55};
  int sum=0;
  for(int index=0;index<10;index++){
    sum=sum+Numbers[index];
  }
  Serial.begin(9600);
  Serial.print(sum);
}

void loop() {
  // put your main code here, to run repeatedly:
  
}
