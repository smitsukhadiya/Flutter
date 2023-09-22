import 'dart:io';

double? discountAmount;
double? taxAmount;

double calculateTotalAmount(
    double amount, double discountPercentage, double taxPercentage) {
  discountAmount = (amount * discountPercentage) / 100;

  double discountedAmount = (amount - discountAmount!);

  taxAmount = (discountedAmount * taxPercentage) / 100;

  double totalAmount = discountedAmount + taxAmount!;

  return totalAmount;
}

void main() {
  stdout.write('Enter amount: ');
  double userAmount = double.parse(stdin.readLineSync()!);

  stdout.write('Enter discount %: ');
  double userDiscount = double.parse(stdin.readLineSync()!);

  stdout.write('Enter tax: ');
  double userTax = double.parse(stdin.readLineSync()!);

  double totalAmount = calculateTotalAmount(userAmount, userDiscount, userTax);

  print('Amount : $userAmount');
  print('Gst Tex : $taxAmount ($userTax%)');
  print('Saving : $discountAmount ($userDiscount%)');

  print('Payable Amount: \$${totalAmount.toStringAsFixed(2)}');
}
