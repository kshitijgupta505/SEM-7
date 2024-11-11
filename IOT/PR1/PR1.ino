const int redPin = 13;
const int yellowPin = 10;
const int greenPin = 7;

// Define the time durations for each signal state (in milliseconds)
const int redDuration = 5000;    // 5 seconds
const int yellowDuration = 2000; // 2 seconds
const int greenDuration = 3000;  // 5 seconds

void setup() {
  // Initialize the LED pins as outputs
  pinMode(redPin, OUTPUT);
  pinMode(yellowPin, OUTPUT);
  pinMode(greenPin, OUTPUT);
}

void loop() {
  // Red signal
  digitalWrite(redPin, HIGH);
  digitalWrite(yellowPin, LOW);
  digitalWrite(greenPin, LOW);
  delay(redDuration);

  // Yellow signal
  digitalWrite(redPin, LOW);
  digitalWrite(yellowPin, HIGH);
  digitalWrite(greenPin, LOW);
  delay(yellowDuration);
 
   

  // Green signal
  digitalWrite(redPin, LOW);
  digitalWrite(yellowPin, LOW);
  digitalWrite(greenPin, HIGH);
  delay(greenDuration);
}
