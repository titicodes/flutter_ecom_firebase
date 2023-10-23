

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_ecom_firebase/utils/app_utility.dart';
import '../firebase_options.dart';

@pragma('vm:entry-point')
Future<void> initializeFirebaseService()async{
 AppUtility.log('Initializing Firebase Service');

 await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
// Ideal time to initialize
await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
}