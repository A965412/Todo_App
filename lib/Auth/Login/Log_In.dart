import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/Auth/Register/Sign_up.dart';
import 'package:todo_app/Home_page/Home_page.dart';
import 'package:todo_app/mytheme.dart';

import '../../Alert_gailog_Template.dart';
import '../Custom_TextFormField.dart';

class LOGIN extends StatefulWidget {
  static const String RotuteName = "Login";

  @override
  State<LOGIN> createState() => _LOGINState();
}

class _LOGINState extends State<LOGIN> {
  var formKey = GlobalKey<FormState>();

  TextEditingController EmailController = TextEditingController();

  TextEditingController PasswordController = TextEditingController();

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
                " Login ",
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
                  child: Container(
                    margin: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.25,
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
                        SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
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
                      login();
                    },
                    child: Text(
                      "Login",
                      style: Theme.of(context).textTheme.titleMedium,
                    )),
                SizedBox(height: 10),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, SignUp.RotuteName);
                    },
                    child: Text(
                      "Creat Account ",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Mytheme.blackcolor,
                          fontSize: 25,
                          fontWeight: FontWeight.w400),
                    )),
              ],
            ),
          ),
        )
      ],
    );
  }

  void login() async {
    if (formKey.currentState!.validate() == true) {
      DialogUtils.showloading(
        context: context,
        massege: "Loading..",
        isDismissible: true,
      );
      try {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: EmailController.text, password: PasswordController.text);
        DialogUtils.hideLoading(context);
        DialogUtils.showmassege(
            context: context,
            massege: "Login Successfuly",
            posActionName: "Ok",
            title: "Success ",
            posAction: () {
              Navigator.of(context).pushNamed(HomePage.route_name);
            });
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          DialogUtils.hideLoading(context);

          DialogUtils.showmassege(
              posActionName: "Ok",
              title: "Error ",
              context: context,
              massege: "No user found for that email");
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          DialogUtils.hideLoading(context);

          DialogUtils.showmassege(
              posActionName: "Ok",
              title: "Error ",
              context: context,
              massege: "Wrong password provided for that user");
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
