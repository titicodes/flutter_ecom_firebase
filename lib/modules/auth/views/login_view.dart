import 'package:flutter/material.dart';
import 'package:flutter_ecom_firebase/constants/dimens.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Dimens.boxHeight20
            
          ],
        ),
      )
    );
  }
}