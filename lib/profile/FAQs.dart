import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FAQs extends StatefulWidget {
  const FAQs({super.key});

  @override
  State<FAQs> createState() => _FAQsState();
}

class _FAQsState extends State<FAQs> {
  List<bool> expanded = [false, false, false];
  final List<Map<String, String>> containerData = [
    {
      "title": "What can an investor do in this app?",
      "content":
          "An investor can investor in specific products. They can only see the product they've invested in - including details like remaining stock, sold quantity, and earned profit."
    },
    {
      "title": "How is the profit calculated?",
      "content":
          "Profit = Selling Price - Cost Price Once profit is calculated, it is split between the Store Owner and the Investor(e.g, 50-50 or based on a predefined ratio.)"
    },
    {
      "title":
          "If multiple investor have invested in the same product, how are sales distributed?",
      "content":
          "Sales are distributed using the FIFO (First-in-first-out) method. The oldest investment stock is sold first, followed by newer ones."
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        
        backgroundColor: Colors.white,
        title: Text(
          'FAQs',
          style: GoogleFonts.lato(
              textStyle: Theme.of(context).textTheme.labelLarge,
              fontSize: 25,
              height: 1.4,
              fontWeight: FontWeight.w500),
        ),
      ),
      body: SafeArea(
          child: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: containerData.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 1,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            margin: EdgeInsets.only(bottom: 16),
            // duration: Duration(milliseconds: 300),
            // curve: Curves.easeInOut,

            // padding: EdgeInsets.all(16),
            // decoration: BoxDecoration(
            //   color: Colors.white,
            //   border: Border.all(color: Colors.grey.shade300),
            //   borderRadius: BorderRadius.circular(12),
            // ),
            // height: expanded[index] ? 180 : 70,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          containerData[index]['title']!,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        expanded[index]
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                      ),
                      onPressed: () {
                        setState(() {
                          expanded[index] = !expanded[index];
                        });
                      },
                    ),
                  ],
                ),
                if (expanded[index])
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      containerData[index]['content']!,
                      style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                    ),
                  ),
              ],
            ),
          );
        },
      )),
    );
  }

  Widget Expanded_container(string, index) {
    return Column(
      children: [
        expanded[index]
            ? Text(
                containerData[index]['title']!,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              )
            : Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  containerData[index]['content']!,
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),
              ),
      ],
    );
  }
}
