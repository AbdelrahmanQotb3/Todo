import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  static String routeName = "Login";
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login" , style:  TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Spacer(),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                label: Text("Enter Email")
              ),
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                  label: Text("Enter Password")
              ),
            ),
            Spacer(flex: 5,),
            ElevatedButton(onPressed: (){}, child: Row(
              children: [
                Text("Login" , style: TextStyle(fontSize: 20),),
                Spacer(),
                Icon(Icons.arrow_forward_rounded)
              ],
            )),
            Spacer()
          ],
        ),
      ),
    );
  }
}
