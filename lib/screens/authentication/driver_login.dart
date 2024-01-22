import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_pooling_app/screens/authentication/driver_registration.dart';
import 'package:vehicle_pooling_app/screens/passenger/home_screen.dart';

class DriverLoginScreen extends StatefulWidget {
  const DriverLoginScreen({Key? key}) : super(key: key);

  @override
  State<DriverLoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<DriverLoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;


  final TextStyle _textStyle1 = const TextStyle(
      fontSize: 24, color: Colors.black, fontWeight: FontWeight.w700);
  final TextStyle _textStyle2 = const TextStyle(
      fontSize: 18, color: Colors.black, fontWeight: FontWeight.w300);

  @override
  Widget build(BuildContext context) {

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.022),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Image.asset(
                      "assets/images/application_logo.png",
                      width: screenWidth * 0.18,
                    )),
                Text('LOGIN', style: _textStyle1),
                Text('Please login to continue', style: _textStyle2),
                SizedBox(height: screenHeight * 0.020),
                _buildEmailTextField(),
                SizedBox(height: screenHeight * 0.012),
                _buildPasswordTextField(),
                SizedBox(height: screenHeight * 0.020),
                _buildLoginButton(context, screenHeight, screenWidth),
                SizedBox(height: screenHeight * 0.012),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text('Forgot Password?'),
                ),
                SizedBox(height: screenHeight * 0.025),
                _buildRegisterLink(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmailTextField() {
    return TextFormField(
      autovalidateMode: AutovalidateMode.disabled,
      validator: (value) {
        if (value == null || value.isEmpty || value.contains('@')) {
          return "Please enter valid email address";
        }
      },
      controller: _emailController,
      decoration: _buildInputDecoration(
        'Email Address',
        Icons.email,
      ),
    );
  }

  Widget _buildPasswordTextField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: !_passwordVisible,
      decoration: _buildInputDecoration(
        'Password',
        Icons.key,
        suffixIcon: IconButton(
          icon: Icon(
            _passwordVisible ? Icons.visibility : Icons.visibility_off,
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.amber.shade400
                : const Color(0xFF0F52BA),
          ),
          onPressed: () {
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
        ),
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context, double height, double width) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.amber.shade400
            : const Color(0xFF0F52BA),
        foregroundColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.black
            : Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        minimumSize: Size(double.infinity, height * 0.070),
      ),
      onPressed: () {
        Get.off(
            ()=> const HomeScreen(),
        );
      },
      child: Text('Login', style: TextStyle(fontSize: width * 0.022),),
    );
  }

  Widget _buildRegisterLink() {
    return Align(
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (c) => const RegisterScreen(),
              ));
        },
        child: RichText(
          text: const TextSpan(children: [
            TextSpan(
              text: "Don't have an account? ",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 15,
              ),
            ),
            TextSpan(
              text: "Register",
              style: TextStyle(
                color: Color(0xFF0F52BA),
                fontSize: 15,
              ),
            )
          ]),
        ),
      ),
    );
  }

  InputDecoration _buildInputDecoration(String hintText, IconData prefixIcon,
      {Widget? suffixIcon}) {
    return InputDecoration(
      hintText: hintText,
      prefixIcon: Icon(prefixIcon),
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.black45
          : Colors.grey.shade200,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    );
  }
}
