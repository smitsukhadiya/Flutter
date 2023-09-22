import 'dart:io';

void main() {
  stdout.write('Enter amount: ');
  double userAmount = double.parse(stdin.readLineSync()!);
  double userAmount2 = userAmount;
  double days = 360;

  stdout.write('Enter Interest %: ');
  double userInterest = double.parse(stdin.readLineSync()!);

  stdout.write('Enter Year: ');
  double userYears = double.parse(stdin.readLineSync()!);

  for (int i = 0; i < userYears; i++) {
    double interest = userAmount * userInterest / 100;

    userAmount += interest;
  }
  double totalInterest = userAmount2 - userAmount;
  double totalDays = days * userYears;
  print('Principal Amount : $userAmount2');
  print('Interest Rate : $userInterest');
  print('Total Days : $totalDays');
  print('Total Interest : ${totalInterest.toStringAsFixed(2)}');
  print("Maturity Amount : ${userAmount.toStringAsFixed(2)}");
}
