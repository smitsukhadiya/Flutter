import 'dart:io';

double? calculateRDTotal(
    double monthlyDeposit, double monthlyInterestRate, int tenureMonths) {
  double totalAmount = 0;
  for (int i = 0; i < tenureMonths; i++) {
    totalAmount = (totalAmount + monthlyDeposit) * (1 + monthlyInterestRate);
  }
  return totalAmount;
}

void main() {
  print("Enter Amount:");
  double monthlyDeposit = double.parse(stdin.readLineSync()!);

  print("Enter interest %:");
  double interestRate = double.parse(stdin.readLineSync()!);

  print("Enter Period:");
  int periodMonth = int.parse(stdin.readLineSync()!);

  double monthlyInterestRate = interestRate / 12 / 100;

  double totalInvest = (monthlyDeposit * periodMonth);
  double day = 30;
  double totalDays = (day * periodMonth);

  double? totalCost =
      calculateRDTotal(monthlyDeposit, monthlyInterestRate, periodMonth);
  double totalInterest = (totalCost! - totalInvest);

  print('Total Investment : $totalInvest');
  print('Total Interest Rate : $interestRate % yearly');
  print('Total Days: $totalDays');
  print('Total Interest : $totalInterest');
  print('Maturity Amount : $totalCost');
}
