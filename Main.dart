import 'package:flutter/material.dart';
import 'HomePage.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginDemo(),
    );
  }
}

class LoginDemo extends StatefulWidget {
  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Center(
          child: Card(
            elevation: 50,
            shadowColor: Colors.red,
            color: Colors.grey[100],
            child: SizedBox(
              height: 600,
              width: 600,
              child: Padding(
                padding: EdgeInsets.all(5.5),
                child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top:60.0),
              child: Center(
                child: Container(
                  width: 150,
                  height: 100,
                  child: Image(
                    image: AssetImage('Assets/example1.png'),
                  ),
                 ),
                ),
               ),
      
      

      Padding(
          padding: EdgeInsets.symmetric(horizontal: 50),
    child: TextField(
    decoration: InputDecoration(
      prefixIcon: Align(widthFactor: 1.0, heightFactor: 1.0, child: Icon(Icons.email)),
    border: OutlineInputBorder(),
    labelText: 'Email',
    hintText: 'Enter Valid email',
    ),
    ),
    ),
    Padding(
    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
    child: TextField(
    obscureText: true,
    decoration: InputDecoration(
      prefixIcon: Align(widthFactor: 1.0, heightFactor: 1.0, child: Icon(Icons.lock)),
    border: OutlineInputBorder(),
    labelText: 'Password',
    hintText: 'Enter secure password',
    ),
    ),
    ),

    Padding(
    padding: EdgeInsets.symmetric(horizontal: 15),
    child: ElevatedButton(
    onPressed: () {

    },
    child: Text(
    'Forgot Password',
    style: TextStyle(color: Colors.blue, fontSize: 15),
    ),
    ),
    ),
    
    Padding(
    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
    child: Container(
    height: 50,
    width: 250,
    decoration: BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(20),
    ),
    child: ElevatedButton(
    onPressed: () {
      Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => HomePage()),
      );
    },
    child: Text(
    'Login',
    style: TextStyle(color: Colors.blue, fontSize: 25),
    ),
    ),
    ),
    ),
    SizedBox(
    height: 130,
    ),

    Padding(
    padding: EdgeInsets.symmetric(horizontal: 15),
    child: Text('New User? Create Account'),
    ),
  ],
  ),
    ),
    ),
    ),
      ),
  );
}
}