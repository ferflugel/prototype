import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prototype',
      theme: ThemeData(
        primaryColor: Colors.indigoAccent,
      ),
      home: HomePage(),
    );
  }
}

class HomePageState extends State<HomePage> {
  int optionSelected = 1;
  String languageSelected = 'English';
  List<String> langList = ['English', 'French', 'Italian', 'Portuguese'];
  List<String> textList = [
    'English Version of text',
    'French Version of text',
    'Italian Version of text',
    'Portuguese Version of text'
  ]; /* 1: HERE IS WHERE WE INPUT THE TEXT IN DIFFERENT LANGUAGES */
  List<String> emojiList = ['😃', '😔', '😯', '😡'];

  Widget _buildHome() {
    return Center(
        child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [_buildSummary(), _buildImage(), _buildTranscipt()]));
  }

  bool status1 = false;
  bool status2 = false;

  Widget _buildSummary() {
    int emojiIndex = 0; /* 2: HERE IS WHERE WE DEFINE THE SUMMARY 1 = JOY, 2 = SORROW, 3 = SURPRISE, 4 = ANGRY*/
    String emojiSelected = emojiList[emojiIndex];
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15, top: 15),
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 3.0,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Emotional Summary: ',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '$emojiSelected',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  onSwitchValueChanged(bool newStatus) {
    setState(() {
      status1 = newStatus;
    });
  }

  onSwitchValueChanged2(bool newStatus) {
    setState(() {
      status2 = newStatus;
    });
  }

  Widget _buildButton1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          status1 ? 'On' : 'Off',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Switch(
          activeColor: Colors.indigoAccent,
          value: status1,
          onChanged: (newStatus) {
            onSwitchValueChanged(newStatus);
          },
        ),
      ],
    );
  }

  Widget _buildButton2() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          status2 ? 'On' : 'Off',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Switch(
          activeColor: Colors.indigoAccent,
          value: status2,
          onChanged: (newStatus) {
            onSwitchValueChanged2(newStatus);
          },
        ),
      ],
    );
  }

  Widget _buildImage() {
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.indigoAccent,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 3.0,
        ),
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 3.0,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Display  ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                _buildButton1(),
              ],
            ),
          ),
          Image.asset(
            status1
                ? 'emotions.png' /* 3: HERE IS WHERE WE INPUT THE IMAGE */
                : 'off.png',
            width: 300,
            height: 250,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }

  Widget _buildTranscipt() {
    String transcript = textList[optionSelected - 1];
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: EdgeInsets.only(left: 15, right: 15),
          padding: EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.indigoAccent,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 3.0,
            ),
          ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 3.0,
                  ),
                ),
                width: 400,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Transcript  ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    _buildButton2(),
                    Text(
                      '| $languageSelected',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    PopupMenuButton(
                      onSelected: (result) {
                        setState(() {
                          optionSelected = result;
                          languageSelected = langList[result - 1];
                        });
                      },
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
              ),
              Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 3.0,
                  ),
                ),
                width: 400,
                child: Text(
                  status2
                      ? '$transcript'
                      : '                Turn transcript on to see it!',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  ),
                ),
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
