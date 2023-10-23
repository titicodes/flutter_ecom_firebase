import 'package:flutter/material.dart';
import 'package:flutter_ecom_firebase/constants/assets.dart';

import '../../../constants/colors.dart';
import '../../../constants/dimens.dart';
import '../../../constants/strings.dart';
import '../../../constants/styles.dart';
import 'login_view.dart';

class LoginRegister extends StatelessWidget {
  const LoginRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimens.screenHeight,
      width: Dimens.screenWidth,
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage(AssetValues.secondScreenBackground,))
      ),
      child: Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Column(
              children: [
              Dimens.boxHeight60,
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.map_outlined,
                      color: ColorValues.blackColor20,
                    ),
                    Text(
                     StringValues.keliene,
                      style: AppStyles.style14Bold,
                    ),
                  ],
                ),
                Dimens.boxHeight40,
                 Text(
                 StringValues.rightAddress,
                  style: AppStyles.style11Bold,
                  textAlign: TextAlign.center,
                ),
               Dimens.boxHeight32,
                const Text(
                  StringValues.bestQuality,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w300),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40.0),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  height: 50,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 9, 86, 150)),
                  child: const Text(
                    'Register',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(height: 20.0),
                GestureDetector(
                  // Within the `FirstRoute` widget
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginView()),
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    height: 50,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 232, 235, 238)),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
