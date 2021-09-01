import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rive_examples/teddy/tracking_text_input.dart';

import 'character_controller.dart';
import 'login_character.dart';
import 'signin_button.dart';
import 'theme.dart';

// TODO: redo the migration, for I think I introduced bugs resulting in missing neck.
class GussDemo extends StatefulWidget {
  const GussDemo({
    Key? key,
  }) : super(key: key);

  @override
  _GussDemoState createState() => _GussDemoState();
}

class _GussDemoState extends State<GussDemo> {
  final CharacterController _characterController = CharacterController(projectGaze: LoginCharacter.projectGaze);

  String? _password;
  @override
  Widget build(BuildContext context) {
    EdgeInsets devicePadding = MediaQuery.of(context).padding;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(93, 142, 155, 1.0),
      body: Container(
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  // Box decoration takes a gradient
                  gradient: LinearGradient(
                    // Where the linear gradient begins and ends
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    // Add one stop for each color. Stops should increase from 0
                    // to 1
                    stops: [0.0, 1.0],
                    colors: background,
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(left: 20.0, right: 20.0, top: devicePadding.top + 50.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    LoginCharacter(controller: _characterController),
                    Container(
                      decoration: const BoxDecoration(
                          color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(cornerRadius))),
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Form(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              TrackingTextInput(
                                label: "Email",
                                hint: "What's your email address?",
                                onCaretMoved: (Offset? caret) {
                                  _characterController.lookAt(caret ?? Offset(0, 0));
                                },
                              ),
                              TrackingTextInput(
                                label: "Password",
                                hint: "Try 'bears'...",
                                isObscured: true,
                                onCaretMoved: (Offset? caret) {
                                  _characterController.coverEyes(caret != null);
                                  _characterController.lookAt(Offset(0, 0));
                                },
                                onTextChanged: (String value) {
                                  _password = value;
                                },
                              ),
                              SigninButton(
                                child: const Text("Sign In",
                                    style: TextStyle(fontFamily: "RobotoMedium", fontSize: 16, color: Colors.white)),
                                onPressed: _login,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> checkCredentials() async {
    return _password == "bears";
  }

  Future<void> _login() async {
    // Clear focus from text fields.
    FocusScope.of(context).requestFocus(FocusNode());
    // Bring hands down
    _characterController.coverEyes(false);

    // Check password
    bool valid = await checkCredentials();
    if (valid) {
      _characterController.rejoice();
    } else {
      _characterController.lament();
    }
  }
}
