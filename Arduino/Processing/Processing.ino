const int BP = 8;
const int x = A0;
const int y = A1;

int smoothedx, smoothedy = 0;
int precision = 5;

int xvalue, yvalue, BPvalue;

void setup() {
  pinMode(BP, INPUT);
  pinMode(x, INPUT);
  pinMode(y, INPUT);

  Serial.begin(9600);

}
// 290
//x plat  : 350
//x-90 : 437

// 420
//y plat : 357
//y-90 : 277



void loop() {
  // put your main code here, to run repeatedly:
  xvalue = analogRead(x);
  yvalue = analogRead(y);
  BPvalue = digitalRead(BP);

  //algo de lissage des données lues
  smoothedx = smoothedx + ((xvalue - smoothedx) / precision);
  smoothedy = smoothedy + ((yvalue - smoothedy) / precision);

  Serial.print(smoothedx);
  Serial.print(',');
  Serial.print(smoothedy);
  Serial.print(',');
  Serial.println(BPvalue);
  delay(10);
}
