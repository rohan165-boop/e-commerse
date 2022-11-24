import 'package:ecommerse/app/route.dart';
import 'package:ecommerse/constants/app_colors.dart';
import 'package:flutter/material.dart';

class QrHomeScreen extends StatefulWidget {
  const QrHomeScreen({super.key});

  @override
  State<QrHomeScreen> createState() => _QrHomeScreenState();
}

class _QrHomeScreenState extends State<QrHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Q R Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, AppRoute.qrcreatecreenRoute);
              },
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      AppColors.appBlack,
                      AppColors.water,
                    ],
                  ),
                ),
                child: Text(
                  "Create QR",
                  style: TextStyle(
                      color: AppColors.white.withOpacity(0.6),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, AppRoute.qrscancreenRoute);
              },
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      AppColors.appBlack,
                      AppColors.water,
                    ],
                  ),
                ),
                child: Text(
                  "Scan QR",
                  style: TextStyle(
                      color: AppColors.white.withOpacity(0.6),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
