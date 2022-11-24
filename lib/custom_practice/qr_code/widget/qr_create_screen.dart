import 'package:ecommerse/constants/app_colors.dart';
import 'package:flutter/material.dart';

class QrCodeCreatePage extends StatefulWidget {
  const QrCodeCreatePage({super.key});

  @override
  State<QrCodeCreatePage> createState() => _QrCodeCreatePageState();
}

class _QrCodeCreatePageState extends State<QrCodeCreatePage> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Qr Create"),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            children: [
              // BarcodeWidget(
              //   barcode: Barcode.qrCode(),
              //   data: _controller.text,
              //   color: AppColors.bluegrey,
              // ),
              const SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Expanded(child: buildTextField(context)),
                  const SizedBox(
                    width: 12,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {});
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.bluegrey,
                      ),
                      child: const Icon(
                        Icons.done,
                        size: 40,
                        color: AppColors.white,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(BuildContext context) => TextField(
        controller: _controller,
        style: const TextStyle(
          color: AppColors.appBlack,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        decoration: InputDecoration(
          hintText: 'Enter the data',
          hintStyle: const TextStyle(color: Colors.grey),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: AppColors.water),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: AppColors.bluegrey,
            ),
          ),
        ),
      );
}
