import 'package:flutter/material.dart';

class LoginApp extends StatefulWidget {
  const LoginApp({Key? key}) : super(key: key);

  @override
  State<LoginApp> createState() => _LoginAppState();
}

class _LoginAppState extends State<LoginApp> {
  @override
  var EmailContlorer = TextEditingController();
  var PasswordContlorer = TextEditingController();
  // make variable key to check validiate
  var formkey = GlobalKey<FormState>();
  bool ispassword = true;

  Widget build(BuildContext context) {
    // safe area use to start app after phone bar because donot use appbar
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        elevation: 0,
        leading: IconButton(
          color: Colors.black,
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            size: 25,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Login",
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                  // used to give space between text and the box
                  const SizedBox(height: 10),
                  // use to make user input text
                  TextFormField(
                    controller: EmailContlorer,
                    // to make write easyer user found what he need to write
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      // text appear in box and when you pressed on it move to up and donot disappear
                      labelText: 'Login',
                      // word appear when presed on box and disappeared when user write
                      hintText: 'Email Address',
                      // to put icon in the start of box
                      prefixIcon: Icon(Icons.email),
                      // use to put TextFormField inside box
                      border: OutlineInputBorder(),
                    ),
                    onFieldSubmitted: (value) {
                      print(value);
                    },
                    // make validator to check empty
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Please Enter your Email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: PasswordContlorer,
                    // to make write easyer user found what he need to write
                    keyboardType: TextInputType.visiblePassword,
                    // use to make password words hidden
                    obscureText: ispassword,
                    decoration: InputDecoration(
                      // text appear in box and when you pressed on it move to up and donot disappear
                      labelText: 'Password',
                      hintStyle: const TextStyle(),
                      // to put icon in the start of box
                      prefixIcon: const Icon(Icons.lock),
                      // to put icon in the end of box
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              ispassword = !ispassword;
                            });
                          },
                          icon: Icon(ispassword
                              ? Icons.visibility
                              : Icons.visibility_off)),
                      // use to put TextFormField inside box
                      border: const OutlineInputBorder(),
                    ),
                    onFieldSubmitted: (value) {
                      print(value);
                    },
                    // make validator to check empty
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter your Password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.blue,
                    child: MaterialButton(
                        onPressed: () {
                          // to check if key empty or no
                          if (formkey.currentState!.validate()) {
                            print(EmailContlorer.text);
                            print(PasswordContlorer.text);
                          }
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don\'t have an account?",
                          style: TextStyle(fontSize: 15)),
                      MaterialButton(
                        onPressed: () {},
                        child: const Text(
                          "Register Now",
                          style: TextStyle(color: Colors.blue),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
