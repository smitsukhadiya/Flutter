import 'dart:io';

double calculateSimpleInterest(double principal, double rate, double time) {
  return (principal * rate * time) / (356 * 100);
}

void main() {
  stdout.write('Enter amount: ');
  double userAmount = double.parse(stdin.readLineSync()!);

  stdout.write('Enter Interest %: ');
  double userInterest = double.parse(stdin.readLineSync()!);

  stdout.write('Enter Days: ');
  double userDays = double.parse(stdin.readLineSync()!);

  double interest = calculateSimpleInterest(userAmount, userInterest, userDays);
  double totalAmount = userAmount + interest;
  print('Pricipal Amount $userAmount');
  print('Interest Rate $userInterest');
  print('Total Days $userDays');
  print("Total Interest: $interest");
  print("Total Amount: $totalAmount");
}
