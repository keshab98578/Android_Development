import 'package:android_development/screen/signuppage.dart';
import 'package:android_development/screen/splashscreen.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void submit() {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      if (passwordController.text.length < 8) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Password must be 8 characters long')));
      } else {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SplashScreen()));
      }
      return;
    }
  }

  void goSignup() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const SignUppage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 212, 208, 208),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              " Welcome DineDeliver",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontSize: 30,
                  color: Color.fromARGB(255, 26, 36, 82),
                  fontWeight: FontWeight.bold),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              width: 200,
            ),
            Card(
              color: Colors.white,
              elevation: 5,
              shadowColor: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: const BorderSide(color: Colors.white, width: 5)),
              margin: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                              labelText: 'Email Address',
                              hintText: 'abc@gmail.com'),
                          keyboardType: TextInputType.emailAddress,
                          autocorrect: false,
                          textCapitalization: TextCapitalization.none,
                          validator: (value) {
                            if (value == null ||
                                value.trim().isEmpty ||
                                !value.contains('@')) {
                              return 'please enter a valid email address.';
                            } else {
                              return null;
                            }
                          },
                        ),
                        TextFormField(
                          controller: passwordController,
                          decoration:
                              const InputDecoration(labelText: 'Password'),
                          keyboardType: TextInputType.emailAddress,
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'please enter a password.';
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "Forgot Password",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ))
                          ],
                        ),
                        ElevatedButton(
                          onPressed: submit,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 100, vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 20,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Text(
                              "Don't have an account?",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                            TextButton(
                              onPressed: goSignup,
                              child: const Text(
                                "SignUp",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue),
                              ),
                            ),
                          ],
                        ),
                        const Divider(
                          thickness: 2,
                          indent: 60,
                          endIndent: 60,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          'Or',
                          style: TextStyle(fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.facebook_outlined,
                            color: Colors.black,
                          ),
                          label: const Text(
                            "   Continue with Facebook",
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 10),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
