import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:esewa_flutter_sdk/esewa_flutter_sdk.dart';
import 'package:esewa_flutter_sdk/esewa_config.dart';
import 'package:tranzac/constant/esewa_client.dart';
import 'package:esewa_flutter_sdk/esewa_payment.dart';
import 'package:esewa_flutter_sdk/esewa_payment_success_result.dart';
import 'package:tranzac/main.dart';

import '../pages/esewa_transactionDetails.dart';

final user = FirebaseAuth.instance;
final transref = FirebaseFirestore.instance
    .collection('Users')
    .doc(user.currentUser!.email)
    .collection('Transactions');

class Esewa {
  void pay(String mobileNumber, String amount, String? areas) {
    String productId = mobileNumber;
    String productPrice = amount;
    String? category = areas;
    try {
      EsewaFlutterSdk.initPayment(
        esewaConfig: EsewaConfig(
          environment: Environment.test,
          clientId: kEsewaClientId,
          secretId: kEsewaSecretKey,
        ),
        esewaPayment: EsewaPayment(
          productId: productId,
          productName: productId,
          productPrice: productPrice,
          callbackUrl: '',
        ),
        onPaymentSuccess: (EsewaPaymentSuccessResult result) {
          debugPrint('SUCCESS');
          verify(result, category);
        },
        onPaymentFailure: () {
          debugPrint('FAILURE');
        },
        onPaymentCancellation: () {
          debugPrint('CANCELLED');
        },
      );
    } catch (e) {
      debugPrint('EXCEPTION');
    }
  }

  void verify(EsewaPaymentSuccessResult result, String? category) {
    transref.doc(result.refId).set({
      'Mobile number': result.productId,
      'Total amount': result.totalAmount,
      'Date': result.date,
      'Category': category
    });

    // TODO: after success, call this function to verify transaction
    navKey.currentState?.push(
      MaterialPageRoute(
        builder: (context) => TransactionDetailsPage(transaction: result),
      ),
    );
  }
}
