import 'package:flutter/material.dart';
import 'package:members_widget/members.dart';
import 'package:members_widget/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.only(left: 0, right: 0),
          color: Colors.black12,
          alignment: Alignment.center,
          child:
            Members(members: [
                User(firstName: "John", lastName: "Wayne", imageUrl: "https://i1.sndcdn.com/avatars-000475270878-w0r5zp-t500x500.jpg"),
                User(firstName: "Joe", lastName: "Doe"),
                User(firstName: "John", lastName: "Wayne", imageUrl: "https://i1.sndcdn.com/avatars-000475270878-w0r5zp-t500x500.jpg"),
                User(firstName: "Peter", lastName: "Kowalsky"),
                User(firstName: "John", lastName: "Wayne", imageUrl: "https://avatarfiles.alphacoders.com/194/194221.jpg"),
                User(firstName: "Ann", lastName: "Lee", imageUrl: "https://avatarfiles.alphacoders.com/103/103875.png"),
                User(firstName: "Ann", lastName: "Lee")
            ],)
          ,
        ),
      ),
    );
  }
}


