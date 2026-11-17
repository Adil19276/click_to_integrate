import 'package:click_to_integrate/color.dart';
import 'package:click_to_integrate/repairing_description.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class upload_image extends StatefulWidget {
  const upload_image({super.key});

  @override
  State<upload_image> createState() => _upload_imageState();
}

class _upload_imageState extends State<upload_image> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: true,
        title: Text(
          "Upload Image",
          style: GoogleFonts.lato(
              textStyle: Theme.of(context).textTheme.titleLarge,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Add a photo to continue",
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
                    "Easily upload a photo from your device to help us understand your request better.",
                    style: TextStyle(color: Colors.grey, height: 1.2),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => repairing_description(),
                    ),
                  );
                },
                child: Container(
                  height: MediaQuery.sizeOf(context).height * 0.2,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.grey.shade100),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        CupertinoIcons.photo_on_rectangle,
                        size: 30,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Click to upload ",
                              style: TextStyle(color: Themeorangecolor),
                            ),
                            TextSpan(
                                text: "or drag and drop",
                                style: TextStyle(color: Colors.grey))
                          ],
                        ),
                      ),
                      Text(
                        "JPG, JPEG, PNG less than 1MB JPG, PNG, less than 1MB",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
                        softWrap: true,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
