import 'package:flutter/material.dart';
import 'package:lab06/service/auth_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final GlobalKey<FormState> _formKey = GlobalKey();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              buildEmail(),
              buildPassword(),

              registerButton(),
            ],
          ),
        )),
    );
  }

   ElevatedButton registerButton() {
    return ElevatedButton(onPressed: () {
              if(_formKey.currentState!.validate()){
                print("Ok");
                print(_emailController.text);
                AuthService.registerUser(_emailController.text,_passwordController.text);
              }
            }, child: const Text("Register"));
  }

  

  TextFormField buildPassword() {
    return TextFormField(
              controller: _passwordController,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              validator: (value) {
                if(value!.isEmpty){
                  return "กรุณากรอกรหัสผ่่าน";
                }
                  return null;
                
              },
            );
  }

  TextFormField buildEmail() {
    return TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if(value!.isEmpty){
                  return "กรุณากรอกอีเมล์";
                }
                  return null;
                
              },
            );
  }
}