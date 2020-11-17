// Pounds per kilogram
const lbInKg = 2.20462;

// Inches per centimeter
const inchInCm = 0.393701;

// Converts kilograms to the nearest whole pounds
int toPounds(int kg) {
  return (kg * lbInKg).round();
}

// Converts pounds to the nearest whole kilograms
int toKilograms(int lb) {
  return (lb / lbInKg).round();
}

// Converts pounds to kilograms
double toRealKilograms(int lb) {
  return lb / lbInKg;
}

// Converts centimeters to feet and inches (e.g. 5′11″, type String)
String toFeet(int cm) {
  var realFeet = cm * inchInCm / 12;
  var feet = realFeet.floor();
  var inches = ((realFeet - feet) * 12).round();
  if (inches == 12) {
    inches = 0;
    feet++;
  }
  return '$feet′$inches″';
}

// Converts feet and inches to centimeters
// Feet and inches required format: feetAmount′inchesAmount″, e.g. 5′11″, type String
int toCm(String feetInches) {
  feetInches = feetInches.substring(0, feetInches.length - 1);
  var feetInchesSplit = feetInches.split('′');
  var feet = int.parse(feetInchesSplit[0]);
  var inches = int.parse(feetInchesSplit[1]);
  return (((feet * 12) + inches) / inchInCm).round();
}

// Corrects the value in centimeters so that it is closest to the selected value in feet and inches
// Input: height in centimeters. Output: corrected height in centimeters
int correctFeetToCm(int height) {
  return toCm(toFeet(height));
}
