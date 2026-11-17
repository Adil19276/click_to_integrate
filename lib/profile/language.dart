import 'package:click_to_integrate/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class language extends StatefulWidget {
  const language({super.key});

  @override
  State<language> createState() => _languageState();
}

class _languageState extends State<language> {
  final List<List<String>> rowdata = [
    ['English'],
    ['Turkish'],
  ];
  final List<String> containerimage = [
    'https://wiki2.railml.org/images/b/b8/UK_flag.png',
    'https://cdn.britannica.com/82/4782-050-8129909C/Flag-Turkey.jpg',
  ];
  int selectedindex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          "Language",
          style: GoogleFonts.lato(
              textStyle: Theme.of(context).textTheme.labelLarge,
              fontSize: 25,
              height: 1.4,
              fontWeight: FontWeight.w500),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Suggested Language",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: rowdata.length,
                  itemBuilder: (context, index) {
                    final RowItem = rowdata[index];
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 10, right: 10),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedindex = index;
                              });
                            },
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              decoration: BoxDecoration(
                                  color: selectedindex == index
                                      ? Themeorangecolor
                                      : Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Row(
                                children: [
                                  Container(
                                    height: 35,
                                    width: 35,
                                    margin: EdgeInsets.only(right: 11),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            containerimage[index],
                                          ),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          RowItem[0],
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: selectedindex == index
                                                  ? Colors.white
                                                  : Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
