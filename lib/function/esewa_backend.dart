import 'package:flutter/material.dart';
import 'package:esewa_flutter_sdk/esewa_flutter_sdk.dart';
import 'package:esewa_flutter_sdk/esewa_config.dart';
import 'package:tranzac/constant/esewa_client.dart';
import 'package:esewa_flutter_sdk/esewa_payment.dart';
import 'package:esewa_flutter_sdk/esewa_payment_success_result.dart';



class Esewa {

  void pay(String mobileNumber, String amount) {
    String product_id = mobileNumber;
    String product_price = amount;
    try {
      EsewaFlutterSdk.initPayment(
        esewaConfig: EsewaConfig(
          environment: Environment.test,
          clientId: kEsewaClientId,
          secretId: kEsewaSecretKey,
        ),
        esewaPayment: EsewaPayment(
          productId: product_id,
          productName: product_id,
          productPrice: product_price,
          callbackUrl: '',
        ),
        onPaymentSuccess: (EsewaPaymentSuccessResult result) {
          debugPrint('SUCCESS');
          verify(result);

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

  void verify(EsewaPaymentSuccessResult result) {

    // TODO: after success, call this function to verify transaction


  }
}
