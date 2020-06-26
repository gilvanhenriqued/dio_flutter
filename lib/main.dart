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
  String _name;
  String _email;
  ImageProvider _avatar = NetworkImage("https://via.placeholder.com/100");
  TextEditingController _job = TextEditingController();
  
  int _count;

  Dio _dio;

  String _response;

  @override
  void initState(){
    super.initState();

    BaseOptions options = new BaseOptions(
      baseUrl: 'https://reqres.in/api',
      connectTimeout: 5000
    );

    _dio = new Dio(options);
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
                  backgroundImage: null,
                ),
              ),
              Text(
                'Gilvan Henrique',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              Text(
                'gilvanhenrique.dev@gmail.com',
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
                    hintText: 'Digit the job'
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
                      onPressed: () {  },
                    ),
                    RaisedButton(
                      color: Colors.blue,
                      child: Text('Save Profile'),
                      onPressed: () {  },
                    ),
                  ],
                ),
              ),
              Text(
                'resposta',
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
}
