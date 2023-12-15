import 'package:flutter/material.dart';
import 'package:remidio_fop/authentication/forgotPassword.dart';
import 'package:remidio_fop/constants/colors.dart';
import 'package:remidio_fop/constants/styles.dart';
import 'package:remidio_fop/constants/textformfields.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:remidio_fop/screens/splashscreen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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

              Center(child: Text('Login',style: authTitleTheme,)),

              const SizedBox(height: 70,),

              authTextFormField(emailController, 'Enter Email ID', 'Enter valid Email ID.'),

              const SizedBox(height: 25,),

              authTextFormField(passwordController, 'Password', 'Enter valid Password'),

              const SizedBox(height: 10,),

              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPassword()));
                },
                child: const Padding(
                  padding: EdgeInsets.only(left: 170),
                    child: Text('Forgot Password ?',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white),)
                ),
              ),

              const SizedBox(height: 45,),

              GestureDetector(
                onTap: () async{
                  if(formKey.currentState!.validate()){
                    try {
                      FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text)
                          .then((value){
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('User Login successfully!'),duration: Duration(seconds: 1),));
                      }).then((value){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SplashScreen()));
                      })
                          .onError((error, stackTrace){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.toString()),duration: const Duration(seconds: 2),));
                      });
                    } catch (error) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.toString(),)));
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
                      child: Text('Login', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500, color: Colors.blueAccent.shade400),),
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
