import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prototype',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePageState extends State<HomePage> {
  int optionSelected = 0;

  Widget _buildHome() {
    return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          _buildImage(),
          _buildTranscipt()
        ]));
  }

  Widget _buildImage() {
    return Image.asset(
      'testing.png',
      width: 200,
      height: 200,
      fit: BoxFit.contain,
    );
  }

  Widget _buildTranscipt() {
    String transcript =
        'Here we will have the transcript test. I am not sure how would we import this text, however. \n\nInput: $optionSelected';
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Language Selection',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            PopupMenuButton(
              onSelected: (result) {
                setState(() {
                  optionSelected = result;
                });
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                const PopupMenuItem(
                  value: 1,
                  child: Text('One'),
                ),
                const PopupMenuItem(
                  value: 2,
                  child: Text('Two'),
                ),
                const PopupMenuItem(
                  value: 3,
                  child: Text('Three'),
                ),
                const PopupMenuItem(
                  value: 4,
                  child: Text('Four'),
                ),
              ],
            ),
          ],
        ),
        Text(
          'Selected: $optionSelected',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          margin: EdgeInsets.all(15),
          padding: EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Text(
                'Transcript',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 200,
                child: Text('$transcript'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emotion Recognition'),
      ),
      body: _buildHome(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}
