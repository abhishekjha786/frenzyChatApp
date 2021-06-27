import 'package:flutter/material.dart';
import 'chat_screen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        backgroundColor: Colors.purple[900],
        title: new Text(
          "Frenzy Chat",
        ),
      ),
      body: new ChatScreen()
      
    );
  }
}
