import 'package:flutter/material.dart';
import 'package:flutter_ecom_firebase/constants/assets.dart';

import 'login_view.dart';

class LoginRegister extends StatelessWidget {
  const LoginRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(AssetsValues.secondScreenBackground,))
      ),
      child: Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(
                  height: 60.0,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.map_outlined,
                      color: Colors.black,
                    ),
                    Text(
                      'Keliene',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                const SizedBox(height: 40.0),
                const Text(
                  'The Right Address \n for shopping \n Anyday',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30.0,
                ),
                const Text(
                  'It is now very easy to reach \nto reach the best quality among all',
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
