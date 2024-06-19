import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:tranzac/pages/PaymentDetail.dart';

final user = FirebaseAuth.instance;
final transref = FirebaseFirestore.instance
    .collection('Users')
    .doc(user.currentUser!.email)
    .collection('Transactions');

void showPaymentSuccessDialog(
  BuildContext context,
  String message,
  String transactionId,
  String recipientMobileNumber,
  int amountInPaisa,
  DateTime paymentTime,
) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Payment success'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Dismiss dialog
              navigateToDetailsPage(
                context,
                recipientMobileNumber,
                amountInPaisa,
                transactionId,
                paymentTime,
              );
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}

void showPaymentFailureDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Payment failed'),
        content: Text('Reason: $message'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}

void showValidationErrorDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Validation Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}

void payWithKhaltiApp(
  BuildContext context,
  TextEditingController mobileController,
  TextEditingController amountController,
) {
  try {
    String recipientMobileNumber = mobileController.text.trim();
    String amountText = amountController.text.trim();
    double amountInRupees = double.tryParse(amountText) ?? 0;

    if (recipientMobileNumber.isEmpty) {
      showValidationErrorDialog(context, 'Please enter a mobile number.');
      return;
    }

    if (amountInRupees <= 0) {
      showValidationErrorDialog(context, 'Please enter a valid amount.');
      return;
    }



    int amountInPaisa = (amountInRupees * 100).toInt();

    KhaltiScope.of(context).pay(
      config: PaymentConfig(
        amount: amountInPaisa,
        productIdentity: 'unique-id-for-transaction',
        productName: 'Sending money to $recipientMobileNumber',
      ),
      preferences: [
        PaymentPreference.khalti,
      ],
      onSuccess: (success) => onSuccess(
        success,
        context,
        recipientMobileNumber,
        amountInPaisa,
      ),
      onFailure: (failure) => onFailure(failure, context),
      onCancel: onCancel,
    );
  } catch (e, stackTrace) {
    debugPrint('Error occurred in payWithKhaltiApp: $e');
    debugPrint('$stackTrace');
    showPaymentFailureDialog(context, 'An unexpected error occurred.');
  }
}

void onSuccess(
  PaymentSuccessModel success,
  BuildContext context,
  String recipientMobileNumber,
  int amountInPaisa,
) {
  String senderMobileNumber =
      success.additionalData?['mobile_number']?.toString() ?? 'N/A';

  String transactionId = success.token;
  DateTime paymentTime = DateTime.now();

  String message =
      'Payment of NPR${amountInPaisa / 100} to $recipientMobileNumber was successful';

  transref.doc(transactionId).set({
    'Mobile number': recipientMobileNumber,
    'Total amount': amountInPaisa / 100,
    'Date': paymentTime,
  });

  showPaymentSuccessDialog(
    context,
    message,
    transactionId,
    recipientMobileNumber,
    amountInPaisa,
    paymentTime,
  );

  navigateToDetailsPage(
    context,
    recipientMobileNumber,
    amountInPaisa,
    transactionId,
    paymentTime,
  );
}

void navigateToDetailsPage(
  BuildContext context,
  String recipientMobileNumber,
  int amountInPaisa,
  String transactionId,
  DateTime paymentTime,
) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => PaymentDetailsPage(
        recipientMobileNumber: recipientMobileNumber,
        amountInPaisa: amountInPaisa,
        transactionId: transactionId,
        paymentTime: paymentTime,
      ),
    ),
  );
}

void onFailure(PaymentFailureModel failure, BuildContext context) {
  showPaymentFailureDialog(context, failure.message);
}

void onCancel() {
  debugPrint('Payment cancelled');
}
