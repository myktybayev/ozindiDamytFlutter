
import 'package:device_preview/device_preview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'authentication/auth.dart';
import 'authentication/authentication_provider.dart';
import 'screens/kitapkhana/library.dart';
import 'package:provider/provider.dart';

// void main() {
//   runApp(
//     DevicePreview(
//       builder: (context) => MyApp(),
//       enabled: !kReleaseMode,
//     ),
//   );
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    DevicePreview(
      builder: (context) => MyApp(),
      enabled: !kReleaseMode,
    ),
  );
}


// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'OzindiDamyt',
//         theme: ThemeData(
//             primaryColor: Colors.white,
//             textTheme: TextTheme(headline6: TextStyle(color: Colors.black))),
//         home: AuthorizationPage());
//   }
// }
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationProvider>(
          create: (_) => AuthenticationProvider(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<AuthenticationProvider>().authState,
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'OzindiDamyt',
        theme: ThemeData(
            primaryColor: Colors.white,
            textTheme: TextTheme(headline6: TextStyle(color: Colors.black))),
        home: Authenticate(),
      ),
    );
  }
}

class Authenticate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      return LibraryPage();
    }

    return AuthorizationPage();
  }
}