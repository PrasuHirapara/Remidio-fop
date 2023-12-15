import 'package:flutter/material.dart';
import 'package:remidio_fop/authentication/loginPage.dart';
import 'package:remidio_fop/constants/colors.dart';
import 'package:remidio_fop/screens/splashscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../constants/styles.dart';
import '../constants/textformfields.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appPrimaryColour,

      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 120,),

              Center(child: Text('Sign Up',style: authTitleTheme,)),

              const SizedBox(height: 70,),

              authTextFormField(emailController, 'Enter Email ID', 'Enter valid Email ID.'),

              const SizedBox(height: 25,),

              authTextFormField(passwordController, 'Password', 'Enter valid Password'),

              const SizedBox(height: 25,),

              authTextFormField(confirmPasswordController, 'Confirm Password', 'Enter valid Password.'),

              const SizedBox(height: 10,),

              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: const Padding(
                    padding: EdgeInsets.only(left: 170),
                    child: Text('Have an Account ?',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white),)
                ),
              ),

              const SizedBox(height: 45,),

              GestureDetector(
                onTap: () async{
                  if (formKey.currentState!.validate()) {
                    try {
                      await FirebaseAuth.instance.createUserWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text
                      ).then((value) => (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SplashScreen()));
                      });
                    } catch (error) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.toString())));
                    }
                  }
                },
                child: Container(
                  height: 70,
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Center(
                        child: Text('Sign up', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500, color: Colors.blueAccent.shade400),),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
