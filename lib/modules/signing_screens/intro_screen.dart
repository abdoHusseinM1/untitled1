import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:untitled/modules/signing_screens/sign_up_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(flex: 1, child: Container()),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    'Simple Way To Manage Your Library',
                    style: TextStyle(
                        fontSize: 50,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.transparent,
                  ),
                )
              ],
            ),
          ),
          Expanded(
              flex: 8,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Organize, Add, Remove Your Books',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 40,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.orange),
                            child: TextButton(
                                onPressed: () {
                                  if (kDebugMode) {
                                    print('to sign main screen');
                                  }
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SignUpScreen()),
                                  );
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Get Started',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Expanded(
                    flex: 3,
                    child: Image(
                      image: AssetImage(
                        'assets/images/desktop.png',
                      ),
                    ),
                  )
                ],
              )
          ),
        ],
      ),
    );
  }
}
