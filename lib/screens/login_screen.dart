import 'package:flutter/material.dart';
import 'package:practica_final_2/screens/home_screen.dart';
import 'package:practica_final_2/shared_preferences/preferences.dart';
import 'package:provider/provider.dart';
import '../providers/login_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var _loginCorrecta = true;
  @override
  Widget build(BuildContext context) {
    //
    var emailController = TextEditingController(text: Preferences.email);
    var passwordController = TextEditingController(text: Preferences.password);

    // Cridada al provider
    Future<void> _loguear() async {
      String email = emailController.text.trim();
      String password = passwordController.text.trim();
      var provider = Provider.of<LoginProvider>(context, listen: false);
      await provider.ferLogin(email, password);
      if (provider.status == 'success') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } else {
        print('login incorrecta');
        setState(() {
          _loginCorrecta = false;
        });
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Baleart Login"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                    width: 200,
                    height: 150,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.asset('assets/Logo.png')),
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Entra un email valid'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    errorText: _loginCorrecta ? null : 'login incorrecta'),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              margin: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {
                  _loguear();
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 13,
            ),
            Container(
              margin: const EdgeInsets.all(1.0),
              height: 50,
              width: 250,
              child: Consumer<LoginProvider>(builder: (context, data, child) {
                return data.carregant
                    ? Center(child: CircularProgressIndicator())
                    : Text('');
              }),
              //child: Center(child: CircularProgressIndicator()),
            )
          ],
        ),
      ),
    );
  }
}
