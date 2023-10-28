#include <stdio.h>

#define YELLOW 13
#define ORANGE 12
#define BROWN 11
#define BLACK 10
int i;

void setup() {
  Serial.begin(9600);
  // put your setup code here, to run once:
  for (i = 10; i < 14; i++) {
    pinMode(i, OUTPUT);
  }
}

void loop() {
  // put your main code here, to run repeatedly:
  for (i = 0; i < 4; i++) {
    Serial.println(i);
    switch (i) {
      case 0:
        digitalWrite(YELLOW, LOW);
        digitalWrite(ORANGE, HIGH);
        digitalWrite(BROWN, HIGH);
        digitalWrite(BLACK, LOW);
        break;
      case 1:
        digitalWrite(YELLOW, LOW);
        digitalWrite(ORANGE, HIGH);
        digitalWrite(BROWN, LOW);
        digitalWrite(BLACK, HIGH);
        break;
      case 2:
        digitalWrite(YELLOW, HIGH);
        digitalWrite(ORANGE, LOW);
        digitalWrite(BROWN, LOW);
        digitalWrite(BLACK, HIGH);
        break;
      case 3:
        digitalWrite(YELLOW, HIGH);
        digitalWrite(ORANGE, LOW);
        digitalWrite(BROWN, HIGH);
        digitalWrite(BLACK, LOW);
        break;
    }
    printf("i=%d\n", i);
    delay(104);
  }
}
