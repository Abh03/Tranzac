import 'package:esewa_flutter_sdk/esewa_flutter_sdk.dart';
import 'package:esewa_flutter_sdk/esewa_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:tranzac/constant/esewa_client.dart';
import 'package:esewa_flutter_sdk/esewa_payment.dart';
import 'package:esewa_flutter_sdk/esewa_payment_success_result.dart';



class Esewa{
  pay(){
    try {
      EsewaFlutterSdk.initPayment(
          esewaConfig: EsewaConfig(
            environment: Environment.test,
            clientId: kEsewaClientId,
            secretId: kEsewaSecretKey,

          ),
          esewaPayment: EsewaPayment(
            productId: "1d71jd81",
            productName: "Product One",
            productPrice: "20",
            callbackUrl: '',
          ),
          onPaymentSuccess: (EsewaPaymentSuccessResult result) {
            debugPrint('SUCCESS');
            verify (result);
          },
          onPaymentFailure: () {
            debugPrint('FAILURE');
          },
          onPaymentCancellation: () {
            debugPrint('CANCELLED');
          }
      );
    }
    catch (e) {
      debugPrint('EXCEPTION');
    }
  }
  verify (EsewaPaymentSuccessResult result){
    // TODO: after success, call this function to verify transaction
  }
}
