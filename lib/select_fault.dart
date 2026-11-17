import 'package:click_to_integrate/color.dart';
import 'package:click_to_integrate/upload_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marquee/marquee.dart';

class select_fault extends StatefulWidget {
  const select_fault({super.key});

  @override
  State<select_fault> createState() => _select_faultState();
}

class _select_faultState extends State<select_fault> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: true,
        title: Text(
          "Pick a Fault",
          style: GoogleFonts.lato(
              textStyle: Theme.of(context).textTheme.titleLarge,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Quick steps to accurate repair",
                    style: GoogleFonts.lato(
                        textStyle: Theme.of(context).textTheme.titleLarge,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Text(
                      "Simply pick the fault from the list and let us handle the rest.Fast, accurate repair solutions tailored to your device.",
                      style: TextStyle(color: Colors.grey, height: 1.2),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    brand(
                      text: "Back camera not working",
                    ),
                    brand(
                      text: "Volume button not working",
                    ),
                    brand(
                      text: "Finger touch not working",
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    brand(
                      text: "Wifi not working",
                    ),
                    brand(
                      text: "Audio receiver not workink",
                    ),
                    brand(
                      text: "Camera glass broken",
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    brand(
                      text: "bluetooth not working",
                    ),
                    brand(
                      text: "Charging port not working",
                    ),
                    brand(
                      text: "Camera not working",
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    brand(
                      text: "Screen damage",
                    ),
                    brand(
                      text: "Battery Health 80-85%",
                    ),
                    brand(
                      text: "Battery health below 80%",
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class brand extends StatefulWidget {
  final String text;
  const brand({super.key, required this.text});

  @override
  State<brand> createState() => _brandState();
}

class _brandState extends State<brand> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => upload_image(),
                ),
              );
            },
            child: Container(
              height: MediaQuery.sizeOf(context).height * 0.18,
              width: MediaQuery.sizeOf(context).width * 0.25,
              decoration: BoxDecoration(
                  border: Border.all(color: Themeoffwhitecolor),
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Image.asset(
                    "assets/mobile-development.png",
                    height: MediaQuery.sizeOf(context).height * 0.09,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 20,
                    child: Marquee(
                      text: widget.text,
                      style: TextStyle(color: Colors.black),
                      scrollAxis: Axis.horizontal,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      blankSpace: 20.0,
                      velocity: 50.0,
                      pauseAfterRound: Duration(seconds: 1), 
                      startPadding: 10.0,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
