import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class messages_screen extends StatefulWidget {
  const messages_screen({super.key});

  @override
  State<messages_screen> createState() => _messages_screenState();
}

class _messages_screenState extends State<messages_screen> {
  List<Map<String, String>> chatdata = [
    {
      'image':
          'https://img.freepik.com/premium-photo/handsome-black-man-demonstrating-cellphone-with-black-screen_922936-36390.jpg',
      'title': 'Michael Josh',
      'subtitle':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      'time': '10 min',
      'msg': '2'
    },
    {
      'image':
          'https://i.etsystatic.com/32055372/r/il/99bf98/5611093915/il_fullxfull.5611093915_q69p.jpg',
      'title': 'Alex Smith',
      'subtitle':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      'time': '5 min',
      'msg': '4'
    },
    {
      'image':
          'https://m.media-amazon.com/images/I/717jzjoneVL._UF894,1000_QL80_.jpg',
      'title': 'Sophia Lee',
      'subtitle':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      'time': '20 min',
      'msg': '1'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: const Text("Chats")),
       
    );
  }
}