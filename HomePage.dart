import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
      child: Card(
      elevation: 50,
      shadowColor: Colors.red,
      color: Colors.grey[100],
      child: SizedBox(
        width: 300,
        height: 500,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage('Assets/pfp1rev.png'),
            ),


            SizedBox(height: 30),
            Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),


              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, //
                ),
                child: Text(
                  'Welcome User!',
                  style: TextStyle(
                    color: Colors.white, // Changed to white for better contrast
                    fontSize: 15,
                  ),
                ),
              ),
            ),

           ElevatedButton.icon(
             icon: Icon(Icons.add),
            label: Text('Add Story'),
            onPressed: () {},
           ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              icon: Icon(Icons.edit),
              label: Text('Add Story'),
              onPressed: () {},
            ),




          ],
        ),
       ),
          ),
    ),
    );


  }
}
