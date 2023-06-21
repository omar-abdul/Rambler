import 'package:bramble_project/src/states/app_state.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key, required this.route});
  final Widget route;
  @override
  Widget build(BuildContext context) {
    return Consumer<ApplicationState>(builder: (con, appState, _) {
      if (appState.loggedIn) {
        return route;
      }

      return SignInScreen(
        actions: [
          AuthStateChangeAction<SignedIn>((context, state) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (ctx) => route));
          }),
        ],
      );
    });
  }
}
