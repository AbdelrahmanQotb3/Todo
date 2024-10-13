import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  static String routeName = "Register";
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register" , style: TextStyle(
          fontWeight: FontWeight.bold,
        ),),
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        // autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Spacer(),
              TextFormField(
                controller: usernameController,
                decoration: InputDecoration(
                    label: Text("User Name")
                ),
                validator: (text){
                  if(text == null || text.trim().isEmpty){
                    return "Please enter a valid User Name";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                    label: Text("E-Mail")
                ),
                validator: (text){
                  if(text == null || text.trim().isEmpty){
                    return "Please enter a valid Email";
                  }
                  final bool emailValid =
                  RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(text);
                  if(!emailValid){
                    return "Email Format is not allowed";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                    label: Text("Password")
                ),
                validator: (text){
                  if(text == null || text.length < 6){
                    return "Please enter a valid password";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: rePasswordController,
                decoration: InputDecoration(
                    label: Text("Re Password")
                ),
                validator: (text){
                  if(text == null || text.length < 6){
                    return "Please enter a valid password";
                  }
                  if(text != passwordController.text){
                    return "Passwords doesn't Match";
                  }
                  return null;
                },
              ),
              Spacer(flex: 5,),
              ElevatedButton(onPressed: (){
                registerAccount();
              }, child: Row(
                children: [
                  Text("Create Account" , style: TextStyle(fontSize: 20),),
                  Spacer(),
                  Icon(Icons.arrow_forward_rounded)
                ],
              )),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  void registerAccount() {
    // if(!formKey.currentState!.validate()) return;
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text);
  }
}
