#include <Servo.h>

Servo my_servo;

void setup() {
  my_servo.attach(8);
}

void loop() {
  for (int i=0; i <= 90; i++) {
    my_servo.write(i);
    delay(20);
  }
  for (int i=90; i>=0; i--) {
    my_servo.write(i);
    delay(20);
  }
}
