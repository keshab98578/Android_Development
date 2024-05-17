// ignore: file_names
import 'package:flutter/material.dart';

class AuthForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController passwordController;
  final TextEditingController confrimPasswordController;
  final String buttonText;
  final VoidCallback buttonPressed;
  final VoidCallback signPressed;
  final bool islogin;
  final bool issign;
  final VoidCallback fbPressed;
  final bool showConfirmPassword;
  // final VoidCallback forgotPaswordPressed;

  const AuthForm({
    super.key,
    required this.formKey,
    required this.passwordController,
    required this.buttonText,
    required this.buttonPressed,
    required this.fbPressed,
    required this.showConfirmPassword,
    required this.confrimPasswordController,
    required this.signPressed,
    required this.islogin,
    required this.issign,
    // required this.forgotPaswordPressed,
  });

  @override
  Widget build(BuildContext context) {
    var confirmpassword;

    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Email Address',
              hintText: 'abc@gmail.com',
            ),
            keyboardType: TextInputType.emailAddress,
            autocorrect: false,
            textCapitalization: TextCapitalization.none,
            validator: (value) {
              if (value == null ||
                  value.trim().isEmpty ||
                  !value.contains('@')) {
                return 'Please enter a valid email address.';
              } else {
                return null;
              }
            },
          ),
          TextFormField(
            controller: passwordController,
            decoration: const InputDecoration(labelText: 'Password'),
            keyboardType: TextInputType.emailAddress,
            obscureText: true,
            validator: (value) {
              confirmpassword = value;
              if (value == null || value.trim().isEmpty) {
                return 'Please enter a password.';
              } else {
                return null;
              }
            },
          ),
          if (showConfirmPassword)
            TextFormField(
              controller: confrimPasswordController,
              decoration: const InputDecoration(labelText: ' Confirm Password'),
              keyboardType: TextInputType.emailAddress,
              obscureText: true,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter a password.';
                } else if (value != confirmpassword) {
                  return 'Password must be same';
                }
                return null;
              },
            ),
          const SizedBox(height: 10),
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
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: buttonPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              padding:
                  const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              buttonText,
              style: const TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Divider(
            thickness: 2,
            indent: 60,
            endIndent: 60,
            color: Colors.black,
          ),
          const SizedBox(
            height: 0,
          ),
          const Text(
            'Or',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 0,
          ),
          if (issign)
            Row(
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                TextButton(
                  onPressed: signPressed,
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
          if (islogin)
            Row(
              children: [
                const Text(
                  "Already have an acoount",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                TextButton(
                  onPressed: signPressed,
                  child: const Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                ),
              ],
            ),
          ElevatedButton.icon(
            onPressed: fbPressed,
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8))),
          )
        ],
      ),
    );
  }
}
