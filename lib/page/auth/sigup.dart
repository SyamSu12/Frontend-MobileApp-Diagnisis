import 'package:flutter/material.dart';
import 'package:program/page/auth/login.dart'; // Import the login page

class SignUpScreen extends StatelessWidget {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Color.fromARGB(255, 221, 246, 221), // Light green background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop(); // Go back to previous screen
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "SIGNUP",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 24),
              _buildTextField(_firstNameController, "First Name", Icons.person),
              SizedBox(height: 16),
              _buildTextField(_lastNameController, "Last Name", Icons.person),
              SizedBox(height: 16),
              _buildTextField(_emailController, "Email", Icons.email),
              SizedBox(height: 16),
              _buildTextField(_passwordController, "Password", Icons.lock,
                  isPassword: true),
              SizedBox(height: 16),
              _buildTextField(
                  _confirmPasswordController, "Confirm Password", Icons.lock,
                  isPassword: true),
              SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle the signup logic here
                    final email = _emailController.text;
                    final password = _passwordController.text;
                    final confirmPassword = _confirmPasswordController.text;

                    if (password != confirmPassword) {
                      // Show error if passwords don't match
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Passwords do not match!"),
                        backgroundColor: Colors.red,
                      ));
                    } else {
                      // Navigate to LoginPage after successful signup
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                LoginPage()), // Navigate to login page
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                      side: BorderSide(
                          color: const Color.fromARGB(255, 77, 187, 81),
                          width: 2),
                    ),
                  ),
                  child: Text(
                    "SIGNUP",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: TextStyle(color: Colors.black),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigate to LoginPage
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                LoginPage()), // Navigate to login page
                      );
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget to create a TextField with an icon on the left
  Widget _buildTextField(
    TextEditingController controller,
    String labelText,
    IconData icon, {
    bool isPassword = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(icon, color: Colors.black),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: Colors.green),
        ),
      ),
    );
  }
}
