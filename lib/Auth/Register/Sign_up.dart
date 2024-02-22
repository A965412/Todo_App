import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/Alert_gailog_Template.dart';
import 'package:todo_app/Home_page/Home_page.dart';
import 'package:todo_app/mytheme.dart';

import '../Custom_TextFormField.dart';

class SignUp extends StatefulWidget {
  static const String RotuteName = "SignUp";

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var formKey = GlobalKey<FormState>();

  TextEditingController NamedController = TextEditingController();

  TextEditingController EmailController = TextEditingController();

  TextEditingController PasswordController = TextEditingController();

  TextEditingController ConfirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Mytheme.primarycolor,
          child: Image(
            image: AssetImage(
              "assets/images/background.png",
            ),
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.transparent,
              title: Text(
                "Create Account ",
                style: TextStyle(
                    color: Mytheme.whiteycolor,
                    fontSize: 30,
                    fontWeight: FontWeight.w500),
              )),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.26,
                      ),
                      CustomTextFormField(
                        label: "User Name .",
                        Validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return "PLease enter User Name ..";
                          }
                          return null;
                        },
                        Controller: NamedController,
                        Icon: Icon(Icons.person),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      CustomTextFormField(
                        label: " Email .",
                        Validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return "PLease enter Email ..";
                          }
                          bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(text);
                          if (!emailValid) {
                            return "Please Enter Valid Email ";
                          }
                          return null;
                        },
                        Controller: EmailController,
                        Icon: Icon(Icons.email),
                        Keyboard: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      CustomTextFormField(
                        label: "Password .",
                        Validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return "PLease enter Password ..";
                          }
                          if (text.length < 7) {
                            return "Password Should be at least 6 char";
                          }
                          return null;
                        },
                        ObscureText: true,
                        Controller: PasswordController,
                        Icon: Icon(Icons.lock),
                        Keyboard: TextInputType.phone,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      CustomTextFormField(
                        label: "Confirm Password .",
                        Validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return "PLease enter Confirm Password";
                          }
                          if (text != PasswordController.text) {
                            return "Confirm Password Doesnt match ";
                          }
                          return null;
                        },
                        Controller: ConfirmPasswordController,
                        ObscureText: true,
                        Icon: Icon(Icons.lock),
                        Keyboard: TextInputType.phone,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(300, 45),
                      backgroundColor: Mytheme.bluecolor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15), // <-- Radius
                      ),
                    ),
                    onPressed: () {
                      Register();
                    },
                    child: Text(
                      "Sign Up",
                      style: Theme.of(context).textTheme.titleMedium,
                    ))
              ],
            ),
          ),
        )
      ],
    );
  }

  void Register() async {
    if (formKey.currentState!.validate() == true) {
      // todo :show loading
      DialogUtils.showloading(
        context: context,
        massege: "Loading..",
        isDismissible: false,
      );
      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: EmailController.text,
          password: PasswordController.text,
        );
        DialogUtils.hideLoading(context);
        DialogUtils.showmassege(
            context: context,
            massege: "Register Successfuly",
            posActionName: "Ok",
            title: "Success ",
            posAction: () {
              Navigator.of(context).pushNamed(HomePage.route_name);
            });
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          DialogUtils.hideLoading(context);

          DialogUtils.showmassege(
            context: context,
            massege: "The password provided is too weak",
            posActionName: "Ok",
            title: "Error ",
          );
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          DialogUtils.hideLoading(context);

          DialogUtils.showmassege(
              posActionName: "Ok",
              title: "Error ",
              context: context,
              massege: "The account already exists for that email");
          print('The account already exists for that email.');
        }
      } catch (e) {
        DialogUtils.hideLoading(context);

        DialogUtils.showmassege(
            posActionName: "Ok",
            title: "Error ",
            context: context,
            massege: "${e.toString()}");
      }
    }
  }
}
