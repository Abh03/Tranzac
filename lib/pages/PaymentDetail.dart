import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:tranzac/constants.dart';
import 'package:tranzac/pages/Homepage.dart'; // Import for date formatting

class PaymentDetailsPage extends StatelessWidget {
  final String recipientMobileNumber;
  final int amountInPaisa;
  final String transactionId;
  final DateTime paymentTime;

  PaymentDetailsPage({
    required this.recipientMobileNumber,
    required this.amountInPaisa,
    required this.transactionId,
    required this.paymentTime,
  });

  @override
  Widget build(BuildContext context) {
    String formattedAmount = 'NPR ${amountInPaisa / 100}';
    String formattedTime = DateFormat.yMd().add_jms().format(paymentTime);

    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Details'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.check_circle_outline,
                color: Colors.green,
                size: 100,
              ),
              SizedBox(height: 20.0),
              Text(
                'Payment Successful!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 80.0),
              _buildDetailRow('Transaction ID', transactionId),
              _buildDetailRow('Recipient Mobile', recipientMobileNumber),
              _buildDetailRow('Amount', formattedAmount),
              _buildDetailRow('Payment Time', formattedTime),
              _buildDetailRow('Status', "SUCCESS"),
              SizedBox(height: 40.0),
              Container(
                width: 300,
                height: 40,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all(kActiveIconColor),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const HomePage())));
                  },
                  child: Text('Go Back To Home'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 18.0),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
