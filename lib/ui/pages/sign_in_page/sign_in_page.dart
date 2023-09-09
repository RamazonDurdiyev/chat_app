import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _isLogin = true;
  final _enteredEmail = "";
  var _enteredPassword = "";
  final _form = GlobalKey<FormState>();
  void submit() {
    final _isValid = _form.currentState!.validate();

    if (!_isValid) {
      return;
    }
    _form.currentState!.save();
    if (_isLogin) {
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 41, 47, 63),
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 42,
                        fontWeight: FontWeight.bold),
                    "Create your\nAccunt"),
                const SizedBox(
                  height: 44,
                ),
                Form(
                  key: _form,
                  child: SizedBox(
                    child: Column(
                      children: [
                        _buildEmaiField(_enteredEmail),
                        const SizedBox(
                          height: 16,
                        ),
                        _buildPassField(_enteredPassword),
                        const SizedBox(
                          height: 24,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(1, 55, 62, 78),
                            fixedSize: const Size(double.maxFinite, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                24,
                              ),
                            ),
                          ),
                          onPressed: () {
                            submit();
                          },
                          child: const Text('Sign up'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an accaunt?",
                  style: TextStyle(color: Colors.white),
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Sign in",
                      style: TextStyle(color: Colors.blue),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }

  _buildEmaiField(var email) {
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      validator: (value) {
        if (value == null || value.trim().isEmpty || !value.contains("@")) {
          return "Please enter valid email";
        }
        return null;
      },
      decoration: const InputDecoration(
        hintText: "Email",
        hintStyle: TextStyle(color: Colors.white),
        prefixIcon: Icon(Icons.email, color: Colors.white),
        // labelText: " Email ",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
      ),
      autocorrect: false,
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) {
        email = newValue!;
      },
    );
  }

  _buildPassField(var password) {
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      validator: (value) {
        if (value == null || value.trim().length < 6 || !value.contains("@")) {
          return "Password must be at least 6 character";
        }
        return null;
      },
      decoration: const InputDecoration(
          hintText: "Password",
          hintStyle: TextStyle(color: Colors.white),
          iconColor: Color.fromARGB(255, 168, 236, 241),
          prefixIcon: Icon(Icons.lock_open, color: Colors.white),
          // labelText: " Password ",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)))),
      autocorrect: false,
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) {
        _enteredPassword = newValue!;
      },
    );
  }
}
