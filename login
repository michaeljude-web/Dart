import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:garde/dashboard.dart';
import 'package:garde/signup.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LoginScreenHome();
  }
}

class LoginScreenHome extends StatefulWidget {
  @override
  State<LoginScreenHome> createState() => _LoginScreenHomeState();
}

class _LoginScreenHomeState extends State<LoginScreenHome> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;

  void validateAndLogin() {
    final username = usernameController.text.trim();
    final password = passwordController.text.trim();

    if (username.isEmpty) {
      _showErrorDialog("Username cannot be empty.");
    } else if (password.isEmpty) {
      _showErrorDialog("Password cannot be empty.");
    } else {
      // Login successful (Placeholder for actual authentication logic)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login Successful! Redirecting to dashboard...")),
      );
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Dashboard()),
      );
    }
  }

  void _showErrorDialog(String message) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      title: 'Error',
      desc: message,
      btnOkOnPress: () {},
      width: MediaQuery.of(context).size.width * 0.8,
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
            width: screenWidth < 600 ? screenWidth * 0.9 : 400,
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Title
                    const Text(
                      "Welcome Back!",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Log in to access your account.",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    const SizedBox(height: 20),
                    // Username Field
                    TextField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: "Username",
                        prefixIcon: const Icon(Icons.person, color: Colors.grey),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Password Field
                    TextField(
                      controller: passwordController,
                      obscureText: !isPasswordVisible,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: "Password",
                        prefixIcon: const Icon(Icons.lock, color: Colors.grey),
                        suffixIcon: IconButton(
                          icon: Icon(
                            isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              isPasswordVisible = !isPasswordVisible;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Login Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink.shade100,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: validateAndLogin,
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Register Option
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account?"),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => SignUpScreen()),
                            );
                          },
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.pink,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
