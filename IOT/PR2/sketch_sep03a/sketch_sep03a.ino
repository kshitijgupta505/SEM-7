#include <Arduino.h>

const int ledPin = 9; // Replace 9 with the actual pin number used
const int powerPin = 10; // Pin to control the 3.5V supply

void setup() {
  pinMode(ledPin, OUTPUT); // Set the LED pin as an output
  pinMode(powerPin, OUTPUT); // Set the power pin as an output
  digitalWrite(powerPin, HIGH); // Enable the 3.5V supply
}

void loop() {
  for (int brightness = 0; brightness <= 255; brightness++) {
    analogWrite(ledPin, brightness); // Gradually increase brightness
    delay(10); // Adjust delay for fading speed
  }

  for (int brightness = 255; brightness >= 0; brightness--) {
    analogWrite(ledPin, brightness); // Gradually decrease brightness
    delay(10); // Adjust delay for fading speed
  }
}
