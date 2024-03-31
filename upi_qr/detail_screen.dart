import 'package:flutter/material.dart';
import 'package:qrgen/qr_code_screen.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late TextEditingController upiIdController;
  late TextEditingController payeeController;
  late TextEditingController amountController;

  @override
  void initState() {
    upiIdController = TextEditingController();
    payeeController = TextEditingController();
    amountController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    upiIdController.dispose();
    payeeController.dispose();
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("QR Generate"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: upiIdController,
              decoration: const InputDecoration(
                labelText: "Enter UPI ID",
                hintText: "Enter UPI ID",
              ),
            ),
            TextFormField(
              controller: payeeController,
              decoration: const InputDecoration(
                labelText: "Enter Payee Name",
                hintText: "Enter Payee Name",
              ),
            ),
            TextFormField(
              controller: amountController,
              decoration: const InputDecoration(
                labelText: "Enter Amount",
                hintText: "Enter Amount",
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text("Enter UPI Details"),
            ElevatedButton(
              onPressed: () {
                double amount = double.parse(amountController.text);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QrCodeScreen(
                        upiID: upiIdController.text,
                        payeeName: payeeController.text,
                        amount: amount,),
                  ),
                );
              },
              child: const Text("Generate"),
            )
          ],
        ),
      ),
    );
  }
}
