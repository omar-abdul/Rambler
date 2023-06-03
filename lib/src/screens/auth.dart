import 'package:bramble_project/src/screens/home.dart';
import 'package:bramble_project/src/states/app_state.dart';
import 'package:firebase_auth/firebase_auth.dart'
    hide EmailAuthProvider, PhoneAuthProvider;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<ApplicationState>(builder: (con, appState, _) {
      // return ElevatedButton(
      //     onPressed: () {
      //       Navigator.push(context,
      //           MaterialPageRoute(builder: (context) => const SignInScreen()));
      //     },
      //     child: const Text('test'));

      return SignInScreen(
        actions: [
          AuthStateChangeAction<SignedIn>((context, state) {
            print('singedin');
          })
        ],
      );
    });
  }
}
