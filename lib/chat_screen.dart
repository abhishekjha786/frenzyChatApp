import 'package:chatapp/chat_message.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = new TextEditingController();
  final List<ChatMessage> _message = <ChatMessage>[];

  void _handleSubmitted(String text) {
    _textController.clear();
    ChatMessage message = new ChatMessage(
      text: text,
    );
    setState(() {
      _message.insert(0, message);
    });
  }

  Widget _textComposerWidget() {
    return new IconTheme(
      data: new IconThemeData(color: Colors.purple[900]),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 2.0),
        decoration:
            BoxDecoration(border: Border.all(color: Colors.purple[900],width: 4.0)),
        child: new Row(
          children: [
            new Flexible(
              child: new TextField(
                decoration: new InputDecoration.collapsed(
                  hintText: "Send a mesage",
                  hintStyle: TextStyle(color: Colors.deepPurple[400]),
                ),
                controller: _textController,
                onSubmitted: _handleSubmitted,
              ),
            ),
            new Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: new IconButton(
                  icon: new Icon(Icons.send),
                  onPressed: () => _handleSubmitted(_textController.text)),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: [
        new Flexible(
          child: new ListView.builder(
            padding: new EdgeInsets.all(8.0),
            reverse: true,
            itemBuilder: (_, int index) => _message[index],
            itemCount: _message.length,
          ),
        ),
        new Divider(height: 1.0),
        new Container(
          decoration: new BoxDecoration(
            color: Theme.of(context).cardColor,
          ),
          child: _textComposerWidget(),
        )
      ],
    );
  }
}
