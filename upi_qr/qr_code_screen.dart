import 'package:flutter/material.dart';
import 'package:upi_payment_qrcode_generator/upi_payment_qrcode_generator.dart';

class QrCodeScreen extends StatefulWidget {
  final String upiID,payeeName;
  final double amount;

  const QrCodeScreen({super.key, required this.upiID, required this.payeeName, required this.amount});

  @override
  State<QrCodeScreen> createState() => _QrCodeScreenState();
}

class _QrCodeScreenState extends State<QrCodeScreen> {

  late UPIDetails upiDetails;

  @override
  void initState() {
    upiDetails = UPIDetails(upiID: widget.upiID, payeeName: widget.payeeName,amount: widget.amount);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("QR HERE"),
      ),
      body: Center(
        child: UPIPaymentQRCode(upiDetails: upiDetails, size: 200,),
      ),
    );
  }
}
