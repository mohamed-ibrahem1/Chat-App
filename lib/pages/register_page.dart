import 'package:chat_app/pages/chat_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../components/components.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);
  static String routeId = 'RegisterPage';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? email;

  String? password;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          //حطيت هنا ال
          //ListView
          //عشان الكولوم هيعمل معايا ايرور عشان لما بتطلع الكيبورد مش بيبقي فية مساحة و يديك ايرور
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                const SizedBox(
                  height: 80,
                ),
                Center(
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/chat.png',
                        width: 100,
                        height: 100,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Text(
                        'Chat App',
                        style: TextStyle(
                            color: HexColor('7ffa88'),
                            fontSize: 45,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Register',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  hintText: 'E-mail',
                  onChanged: (data) {
                    email = data;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  hintText: 'Password',
                  obsText: true,
                  onChanged: (data) {
                    password = data;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomMaterialButton(
                  'Register',
                  materialButtonColor: HexColor('7ffa88'),
                  materialButtonHeight: 45,
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      try {
                        await registerUser();
                        // ignore: use_build_context_synchronously
                        Navigator.pushNamed(context, ChatPage.routeId);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          showSnackBar(context, 'weak password');
                        } else if (e.code == 'email-already-in-use') {
                          showSnackBar(context, 'email already exists');
                        }
                      } catch (e) {
                        showSnackBar(context, 'there was an error');
                      }
                      // ignore: use_build_context_synchronously
                      showSnackBar(context, 'success');
                    } else {}
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "already have an account?",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Login'),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

//-----------------------------------------------------------------------------------------------------

  Future<void> registerUser() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
//------------------------------------------------------
//المفروض نفس الكلام اللي مكتوب في عن 
// auth with email & password 
// هيتعمل هو هو في ال 
// login page
//------------------------------------------------------
