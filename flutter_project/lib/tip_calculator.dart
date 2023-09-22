import 'dart:io';

double? eachPerson;
double? eachPersonTip;
double? tipAmount;
double? totalPayable;
double? totalEachPersonTip;

double? calculateTotalAmount(double amount, double tip, double person) {
  eachPerson = (amount / person);

  eachPersonTip = (eachPerson! * tip) / 100;

  tipAmount = (eachPersonTip! * person);

  totalPayable = (tipAmount! + amount);

  totalEachPersonTip = (eachPerson! + eachPersonTip!);

  return totalEachPersonTip;
}

void main() {
  stdout.write('Enter Amount: ');
  double userAmount = double.parse(stdin.readLineSync()!);

  stdout.write('Enter Tip %: ');
  double userTip = double.parse(stdin.readLineSync()!);

  stdout.write('Enter Number of Persons: ');
  double userPerson = double.parse(stdin.readLineSync()!);

  double? totalAmount = calculateTotalAmount(userAmount, userTip, userPerson);

  print('Amount : $userAmount');
  print('Tip Amount : $tipAmount($userTip %)');
  print('Total Payable : $totalPayable');
  print('Per Person : $totalEachPersonTip');
}
