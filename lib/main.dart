import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _name = 'username';
  var _email = 'useremail';
  ImageProvider _avatar = NetworkImage("https://via.placeholder.com/100");
  TextEditingController _job = TextEditingController();
  
  var _count = 1;
  var _result = '';

  final Dio _dio = new Dio();
  String baseUrl = "https://reqres.in/api";

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DIO Flutter'),
      ),
      body: Center(
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 100,
                width: 100,
                margin: EdgeInsets.fromLTRB(0,0,0,20),
                child: CircleAvatar(
                  backgroundImage: _avatar,
                ),
              ),
              Text(
                _name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              Text(
                _email,
                style: TextStyle(
                  fontSize: 15
                ),
              ),
              Container(
                width: 200,
                margin: EdgeInsets.all(12),
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'Digit the job',
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0,0,0,30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                      color: Colors.blue,
                      child: Text('Get Profile'),
                      onPressed: () { getProfile(); },
                    ),
                    RaisedButton(
                      color: Colors.blue,
                      child: Text('Save Profile'),
                      onPressed: () { saveProfile(); } ,
                    ),
                  ],
                ),
              ),
              Text(
                '_result',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void getProfile() async{
    Response res = await _dio.get("$baseUrl/users/$_count");
    var profile = res.data["data"];
    print(_name);  

    setState(() {
      _name = profile['first_name'] + ' ' + profile['last_name'];
      _email = profile['email'];
      _avatar = NetworkImage(profile['avatar']);
    });

    print(_name);  

  }

  void saveProfile() async {
    Response res = await _dio.post(
      "users",
      data: {
        "name": _name,
        "job": _job.text
      }
    );

    print(res.data.toString());  
  
  }

}
