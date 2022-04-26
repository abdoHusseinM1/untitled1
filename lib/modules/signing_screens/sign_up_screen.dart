import 'package:flutter/material.dart';
import 'package:untitled/modules/signing_screens/sign_in_part.dart';
import 'package:untitled/shared/components/components.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var addressController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var nationalIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const Expanded(
              flex: 3,
              child: Image(
                image: AssetImage(
                  'assets/images/desktop.png',
                ),
              )),
          //the right part
          Expanded(
              flex: 4,
              child: Container(
                height: double.infinity,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(height: 200,),
                          //Sign Up text
                          getHeadlineText(
                            text: 'Sign Up',
                          ),
                          const SizedBox(
                            height: 20,
                          ),

                          //name
                          getDefaultFormField(
                              controller: nameController,
                              type: TextInputType.text,
                              hint: 'Name',
                              validate: (value) {
                                if (value!.isEmpty || value.length < 6) {
                                  return 'invalidate name';
                                }
                                return null;
                              }),
                          const SizedBox(
                            height: 10,
                          ),
                          getDefaultFormField(
                              controller: emailController,
                              type: TextInputType.emailAddress,
                              hint: 'Email',
                              validate: (value) {
                                if (value!.isEmpty || value.length < 8) {
                                  return 'Invalidate Email';
                                }
                                return null;
                              }),
                          const SizedBox(
                            height: 10,
                          ),

                          //address
                          getDefaultFormField(
                              controller: addressController,
                              type: TextInputType.text,
                              hint: 'Address',
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'invalid Address';
                                }
                                return null;
                              }),
                          const SizedBox(
                            height: 10,
                          ),

                          //password
                          getDefaultFormField(
                            controller: passwordController,
                            type: TextInputType.text,
                            hint: 'Password',
                            validate: (value) {
                              if (value!.isEmpty || value.length < 8) {
                                return 'weak password';
                              }
                              return null;
                            },
                            isPassword: true,
                          ),
                          const SizedBox(
                            height: 10,
                          ),

                          //confirm password
                          getDefaultFormField(
                            controller: confirmPasswordController,
                            type: TextInputType.text,
                            hint: 'ConfirmPassword',
                            validate: (value) {
                              if (! (passwordController.text == value)) {
                                return 'Un Match Password';
                              }
                              return null;
                            },
                            isPassword: true,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          getDefaultFormField(
                              controller: nationalIdController,
                              type: TextInputType.number,
                              hint: 'National Id',
                              validate: (value) {
                                if(value!.length != 14){
                                  return 'Invalid National Id';
                                }
                                return null;
                              }),
                          const SizedBox(
                            height: 30,
                          ),
                          //two buttons
                          Row(
                            children: [
                              //cancel button
                              Expanded(
                                child: getDefaultButton(
                                  text: 'Cancel',
                                  function: () {
                                    Navigator.pop(context);
                                  },
                                  textColor: Colors.indigo,
                                  background: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              //sign Up button
                              Expanded(
                                child: getDefaultButton(
                                    text: 'Sign Up',
                                    function: () {
                                      _onPressed();
                                    }),
                              ),
                            ],
                          ),
                          //if you don't have an account
                          Row(
                            children: [
                              const Text('If You Have an Account '),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const SignInScreen()
                                      )
                                  );
                                },
                                child: const Text('Login'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }

  _onPressed() {
    if (formKey.currentState!.validate()) {
      print('validate inputs');
    }

    //TODO register logic here
  }
}
