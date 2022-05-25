import 'package:flutter/material.dart';
import 'package:untitled/models/login_officer.dart';
import 'package:untitled/models/officer.dart';
import 'package:untitled/modules/home_screen/home_screen.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/instances/current_user_info.dart';
import 'package:untitled/shared/network/remote/officer_api.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const Expanded(
            flex: 3,
            child: Image(
              image: AssetImage('assets/images/desktop.png'),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              color: Colors.white,
              height: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 200,
                        ),
                        getHeadlineText(text: 'Login'),
                        const SizedBox(
                          height: 10,
                        ),
                        getDefaultFormField(
                            controller: emailController,
                            type: TextInputType.emailAddress,
                            hint: 'Email',
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'Enter Your Email';
                              }
                              return null;
                            }),
                        const SizedBox(
                          height: 10,
                        ),
                        getDefaultFormField(
                          controller: passwordController,
                          type: TextInputType.text,
                          hint: 'Password',
                          validate: (value) {
                            if (value!.length < 8) {
                              return 'Invalid Password';
                            }
                            return null;
                          },
                          isPassword: true,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: getDefaultButton(
                                text: 'Cancel',
                                function: () {
                                  Navigator.pop(context);
                                },
                                background: Colors.white,
                                textColor: Colors.indigo,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: getDefaultButton(
                                    text: 'Login',
                                    function: () {
                                      _login();
                                    })),
                          ],
                        ),
                        Row(
                          children: [
                            const Text('If You don\'t Have an Account '),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Sign Up'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _login() async {
    if (formKey.currentState!.validate()) {
      LoginOfficer officer = LoginOfficer(
          password: passwordController.text, email: emailController.text);

      await OfficerAPI.loginOfficer(officer).then((value) {
        if (value.statusCode == 200) {
          currentOfficer = Officer.getAuthorFromJson(value.body);
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const HomeScreen()));
        }else {
          SnackBar snackBar = SnackBar(content: Text(value.body));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      });
    }
  }
}
