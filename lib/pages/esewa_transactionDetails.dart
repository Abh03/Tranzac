import 'package:flutter/material.dart';
import 'package:esewa_flutter_sdk/esewa_payment_success_result.dart';
import 'package:tranzac/function/esewa_backend.dart';

class TransactionDetailsPage extends StatelessWidget {
  final EsewaPaymentSuccessResult transaction;

  const TransactionDetailsPage({Key? key, required this.transaction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Mobile Number: ${transaction.productId}'),
            Text('Product Name: ${transaction.productName}'),
            Text('Total Amount: ${transaction.totalAmount}'),
            Text('Environment: ${transaction.environment}'),
            Text('Merchant Name: ${transaction.merchantName}'),
            Text('Date: ${transaction.date}'),
            Text('Status: ${transaction.status}'),
            Text('Reference ID: ${transaction.refId}'),
          ],
        ),
      ),
    );
  }
}