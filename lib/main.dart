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
  int optionSelected = 0;
  String languageSelected = 'English';
  List<String> langList = ['English', 'French', 'Italian', 'Portuguese'];

  Widget _buildHome() {
    return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [_buildImage(), _buildTranscipt()]));
  }

  bool status = false;

  onSwitchValueChanged(bool newStatus) {
    setState(() {
      status = newStatus;
    });
  }

  Widget _buildButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:[
      Text(status ? 'On' : 'Off',
      style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
      ),
      Switch(
        activeColor: Colors.indigoAccent,
        value: status,
        onChanged: (newStatus) {
          onSwitchValueChanged(newStatus);
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
            child: 
            Row(
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
            _buildButton(),
              ],
            ),
          ),
          Image.asset(
            status ? 'emotions.png' : 'testing.png', // HERE WE INPUT THE IMAGE AFTER ANALYSIS
            width: 300,
            height: 250,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }

  Widget _buildTranscipt() {
    // Here you add the text to be showed
    String transcript =
        'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa.Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula Aenean massa.Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula.  amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa.Lorem ip';
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
                      'Transcript   |   $languageSelected',
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
