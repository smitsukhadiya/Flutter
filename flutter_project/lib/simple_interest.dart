import 'dart:io';

void main() {
  stdout.write('Enter amount: ');
  double userAmount = double.parse(stdin.readLineSync()!);
  double userAmount2 = userAmount;

  stdout.write('Enter Interest %: ');
  double Interest = double.parse(stdin.readLineSync()!);

  stdout.write('Enter Days: ');
  double userDays = double.parse(stdin.readLineSync()!);

  double month = 30;
  double userInterest = Interest / month;
  double annualInterestRate = userInterest / 100;

  for (int i = 0; i < userDays; i++) {
    double interest = userAmount * annualInterestRate;

    userAmount += interest;
  }
  double totalInterest = userAmount - userAmount2;
  print('Principal Amount : $userAmount2');
  print('Interest Rate : $Interest % monthly');
  print('Total Days : $userDays');
  print('Total Interest : ${totalInterest.toStringAsFixed(2)}');
  print("Total Amount : ${userAmount.toStringAsFixed(2)}");
}
