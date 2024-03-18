import 'package:catalog_app/utils/routs.dart';
import 'package:flutter/material.dart';

class Login_Page extends StatefulWidget {
  const Login_Page({super.key});

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  String userName = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      await Navigator.pushNamed(
        context,
        MyRouts.homeRoute,
      );
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
        child: Material(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset("assets/images/catalog_hey_image.png"),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Welcome $userName",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 32, horizontal: 36),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter UserName";
                            } else {
                              return null;
                            }
                          },
                          onChanged: (val) {
                            userName = val;
                            setState(
                              () {},
                            );
                          },
                          decoration: const InputDecoration(
                            hintText: "Enter UserName",
                            labelText: "UserName",
                          ),
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password Cannnot be empty!";
                            } else if (value.length < 6) {
                              return "Password length should be atleast 6";
                            } else {
                              return null;
                            }
                          },
                          decoration: const InputDecoration(
                              hintText: "Enter Password",
                              labelText: "Password"),
                        ),
                        const SizedBox(height: 40),
                        InkWell(
                          onTap: () => moveToHome(),
                          child: AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            height: 48,
                            width: changeButton ? 48 : 120,
                            decoration: BoxDecoration(
                              color: Colors
                                  .deepPurple, // Color.fromARGB(255, 93, 117, 236),
                              borderRadius:
                                  BorderRadius.circular(changeButton ? 50 : 15),
                            ),
                            child: Center(
                              child: changeButton
                                  ? const Icon(
                                      Icons.done,
                                      color: Colors.white,
                                    )
                                  : const Text(
                                      "Log in",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                            ),
                          ),
                        )
                        // ElevatedButton(
                        //   style: const ButtonStyle(
                        //     minimumSize: MaterialStatePropertyAll(
                        //       Size(120, 45),
                        //     ),
                        //   ),
                        //   onPressed: () {
                        //     Navigator.pushNamed(context, MyRouts.homeRout);
                        //   },
                        //   child: const Text("Log in"),
                        // )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
