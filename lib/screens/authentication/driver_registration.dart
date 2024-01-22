import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:vehicle_pooling_app/screens/authentication/driver_login.dart';
// import 'package:vehicle_pooling_app/screens/authentication/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();

  bool _passwordVisible = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextStyle textStyle1 =
  const TextStyle(fontSize: 25, fontWeight: FontWeight.w700);
  final TextStyle textStyle2 =
  const TextStyle(fontSize: 18, fontWeight: FontWeight.w400);

  @override
  Widget build(BuildContext context) {
    bool darkTheme = Theme.of(context).brightness == Brightness.dark;

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.022),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: buildFormContents(darkTheme, screenWidth, screenHeight),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildFormContents(bool darkTheme, double width, double height) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
            alignment: Alignment.center,
            child: Image.asset("assets/images/application_logo.png", width: width * 0.18)),
        Text('Register', style: textStyle1),
        Text('Please register to login.', style: textStyle2),
        SizedBox(height: height * 0.015),
        buildTextFormField(
          controller: nameController,
          hintText: 'Full Name',
          icon: Icons.person,
          darkTheme: darkTheme,
          validator: (text) => validateName(text),
        ),
        SizedBox(height: height * 0.008),
        buildTextFormField(
          controller: emailController,
          hintText: 'Email Address',
          icon: Icons.email,
          darkTheme: darkTheme,
          validator: (text) => validateEmail(text),
        ),
        SizedBox(height: height * 0.008),
        IntlPhoneField(
          controller: phoneController,
          decoration: InputDecoration(
            filled: true,
            fillColor: darkTheme ? Colors.black45 : Colors.grey.shade200,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        buildPasswordFormField(passwordController, 'Password', darkTheme),
        SizedBox(height: height * 0.008),
        buildPasswordFormField(
            confirmController, 'Confirm Password', darkTheme),
        SizedBox(height: height * 0.015),
        buildRegisterButton(darkTheme, height, width),
        SizedBox(height: height * 0.015),
        buildSignInLink(),
      ],
    );
  }

  Widget buildTextFormField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    required bool darkTheme,
    required String? Function(String?) validator,
  }) {
    return TextFormField(
      controller: controller,
      inputFormatters: [LengthLimitingTextInputFormatter(50)],
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: darkTheme ? Colors.black45 : Colors.grey.shade200,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        prefixIcon:
        Icon(icon, color: darkTheme ? Colors.amber.shade400 : Colors.grey),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
    );
  }

  Widget buildPasswordFormField(
      TextEditingController controller, String hintText, bool darkTheme) {
    return TextFormField(
      obscureText: !_passwordVisible,
      controller: controller,
      inputFormatters: [LengthLimitingTextInputFormatter(50)],
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: darkTheme ? Colors.black45 : Colors.grey.shade200,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        prefixIcon: Icon(Icons.key,
            color: darkTheme ? Colors.amber.shade400 : Colors.grey),
        suffixIcon: IconButton(
          icon: Icon(
            _passwordVisible ? Icons.visibility : Icons.visibility_off,
            color: darkTheme ? Colors.amber.shade400 : const Color(0xFF0F52BA),
          ),
          onPressed: () => setState(() => _passwordVisible = !_passwordVisible),
        ),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (text) => validatePassword(text),
    );
  }

  Widget buildRegisterButton(bool darkTheme, double height, double width) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: darkTheme ? Colors.amber.shade400 : const Color(0xFF0F52BA),
        foregroundColor: darkTheme ? Colors.black : Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        minimumSize: Size(double.infinity, height * 0.070),
      ),
      onPressed: () {},
      child: Text('Register', style: TextStyle(fontSize: width * 0.022),),
    );
  }

  Widget buildSignInLink() {
    return Align(
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (c)=> const DriverLoginScreen(),),);
        },
        child: RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                  text: 'Already have an account? ',
                  style: TextStyle(color: Colors.black, fontSize: 15)),
              TextSpan(
                  text: 'Sign In',
                  style: TextStyle(color: Color(0xFF0F52BA), fontSize: 15)),
            ],
          ),
        ),
      ),
    );
  }

  String? validateName(String? text) {
    if (text == null || text.isEmpty) {
      return "Name can't be empty";
    } else if (text.length < 2) {
      return "Please enter a valid name";
    } else if (text.length > 49) {
      return "Name can't be more than 50";
    }
    return null;
  }

  String? validateEmail(String? text) {
    if (text == null || text.isEmpty) {
      return "Email can't be empty";
    } else if (text.length < 2) {
      return "Please enter a valid name";
    } else if (text.length > 99) {
      return "Name can't be more than 50";
    }
    return null;
  }

  String? validatePassword(String? text) {
    if (text == null || text.isEmpty) {
      return "Name can't be empty";
    } else if (text.length < 2) {
      return "Please enter a valid name";
    } else if (text.length > 49) {
      return "Name can't be more than 50";
    }
    return null;
  }
}