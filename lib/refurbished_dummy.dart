import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class refurbished_dummy extends StatefulWidget {
  const refurbished_dummy({super.key});

  @override
  State<refurbished_dummy> createState() => _refurbished_dummyState();
}

class _refurbished_dummyState extends State<refurbished_dummy> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(appBar: AppBar(elevation: 0,
        title: Text("Refurbished"),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Image.asset(
              'assets/onbording_3.png',
              height: MediaQuery.sizeOf(context).height * 0.5,
            ),
          ),
          Text(
            "📱 The newest tech & trends\nare nearly here.",
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.headlineLarge,
                fontSize: 25,
                fontStyle: FontStyle.italic,
                height: 1.4,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),);
  }
}