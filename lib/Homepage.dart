import 'package:flutter/material.dart';
import 'numberaudio.dart';
import 'package:audioplayers/audio_cache.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  AudioCache audioPlayer = AudioCache();

  List<numberAudio> numberList = [
    numberAudio("one.wav", Colors.red, "ONE"),
    numberAudio("two.wav", Colors.green, "TWO"),
    numberAudio("three.wav", Colors.blueGrey, "THREE"),
    numberAudio("four.wav", Colors.yellow, "FOUR"),
    numberAudio("five.wav", Colors.orange, "FIVE"),
    numberAudio("six.wav", Colors.pink, "SIX"),
    numberAudio("seven.wav", Colors.purple, "SEVEN"),
    numberAudio("eight.wav", Colors.brown, "EIGHT"),
    numberAudio("nine.wav", Colors.blue, "NINE"),
    numberAudio("ten.wav", Colors.teal, "TEN"),
  ];

  play(String uri) {
    audioPlayer.play(uri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SPANISH NUMBERS"),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image(
                image: AssetImage("images/logo.png"),
              ),
              Expanded(
                  child: GridView.builder(
                padding: EdgeInsets.all(10.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2.0,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: this.numberList.length,
                itemBuilder: (context, i) => SizedBox(
                  width: 200.0,
                  height: 200.0,
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      color: numberList[i].buttonColor,
                      splashColor: Colors.white,
                      child: Text(
                        numberList[i].buttonText,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        play(numberList[i].audioUri);
                      }),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
