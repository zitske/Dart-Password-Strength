import 'dart:math';

getPasswordStrength(String password) {
  if (password.isEmpty) return 0;
  double pFraction;
  if (RegExp(r'^[0-9]*$').hasMatch(password)) {
    pFraction = 0.8;
  } else if (RegExp(r'^[a-zA-Z0-9]*$').hasMatch(password)) {
    pFraction = 1.5;
  } else if (RegExp(r'^[a-z]*$').hasMatch(password)) {
    pFraction = 1.0;
  } else if (RegExp(r'^[a-zA-Z]*$').hasMatch(password)) {
    pFraction = 1.3;
  } else if (RegExp(r'^[a-z-_!?]*$').hasMatch(password)) {
    pFraction = 1.5;
  } else if (RegExp(r'^[a-z0-9]*$').hasMatch(password)) {
    pFraction = 1.5;
  } else {
    pFraction = 1.8;
  }
  logF(double x) {
    return 1.0 / (1.0 + exp(-x));
  }

  ;
  logC(double x) {
    return logF((x / 2.0) - 4.0);
  }

  ;

  double pStrength = logC(password.length * pFraction);
  return pStrength;

  // pStrength<=0.4 -> Weak
  // pStrength>0.4 && pStrength<=0.6 -> Good
  // pStrength>0.6 -> Strong
}
