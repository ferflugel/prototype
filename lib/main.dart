import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Emotion Recognition"),
        ),
        body: Center( 
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'testing.png',
                width: 100,
                height: 100,
                fit: BoxFit.contain,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children:[
                    Text('Language Selection',
                    style: TextStyle( 
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    PopupMenuButton(
                      // THIS LINE IS STILL BUGGY onSelected: (WhyFarther result) { setState(() { _selection = result; }); },
                      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                        const PopupMenuItem(
                          value: 1,
                          child: Text('English'),
                        ),
                        const PopupMenuItem(
                          value: 2,
                          child: Text('French'),
                        ),
                        const PopupMenuItem(
                          value: 3,
                          child: Text('Italian'),
                        ),
                        const PopupMenuItem(
                          value: 4,
                          child: Text('Portuguese'),
                        ),
                      ],
                    ),
                    ],
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
                      Text('Transcript',
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
                        child: Text('Here we will have the transcript test. I am not sure how would we import this text, however.'),
                      ),
                    ],
                    ),
                  ), 
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
