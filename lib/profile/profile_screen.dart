import 'package:click_to_integrate/color.dart';
import 'package:click_to_integrate/profile/change_password.dart';
import 'package:click_to_integrate/profile/edit_profile.dart';
import 'package:click_to_integrate/profile/language.dart';
import 'package:click_to_integrate/profile/my_order.dart';
import 'package:click_to_integrate/profile/privacy_policy.dart';
import 'package:click_to_integrate/profile/terms_condition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'FAQs.dart';
import 'about_us.dart';

class profile_screen extends StatefulWidget {
  const profile_screen({super.key});

  @override
  State<profile_screen> createState() => _profile_screenState();
}

class _profile_screenState extends State<profile_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              showDialog(
                barrierColor: Colors.black87,
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  contentPadding: EdgeInsets.zero,
                  content: Container(
                    color: Colors.white,
                    child: SizedBox(
                      width: double.minPositive,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            "assets/logout.gif",
                            height: 100,
                          ),
                          SizedBox(height: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Are you sure you want to\nlogout?",
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  height: 40,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Cancel",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  //authService.signOut(context);
                                },
                                child: Container(
                                  height: 40,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Ok",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Icon(
                    CupertinoIcons.power,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
        title: Text(
          'My Profile',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => update_profile(),
                //   ),
                // );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: MediaQuery.sizeOf(context).height * 0.06,
                  backgroundImage: NetworkImage(
                      "https://play-lh.googleusercontent.com/C9CAt9tZr8SSi4zKCxhQc9v4I6AOTqRmnLchsu1wVDQL0gsQ3fmbCVgQmOVM1zPru8UH=w256"),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Mr Barrel",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 7),
                  child: Text("mrbean317@gmail.com"),
                ),
              ],
            ),
            SizedBox(height: 16),

            // Options List

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Themeoffwhitecolor),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        buildMenuItem(CupertinoIcons.person, "Edit Profile",
                            () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => edit_profile(),
                            ),
                          );
                        }),
                        buildMenuItem(CupertinoIcons.pencil_ellipsis_rectangle,
                            "Change Password", () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => change_password(),
                            ),
                          );
                        }),
                        buildMenuItem(CupertinoIcons.doc_plaintext, "My Order",
                            () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => my_order(),
                            ),
                          );
                        }),
                        buildMenuItem(CupertinoIcons.globe, "Language", () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => language(),
                            ),
                          );
                        }),
                        buildMenuItem(CupertinoIcons.question_diamond, "FAQs",
                            () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FAQs(),
                            ),
                          );
                        }),
                        buildMenuItem(Icons.info_outline, "About us", () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => about_us(),
                            ),
                          );
                        }),
                        buildMenuItem(
                            CupertinoIcons.doc_chart, "Terms & Conditions", () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => terms_condition(),
                            ),
                          );
                        }),
                        buildMenuItem(
                            CupertinoIcons.lock_shield, "Privacy Policy", () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => privacy_policy(),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem(IconData icon, String title, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(14),
        ),
        child: ListTile(
          leading: Container(
            decoration: BoxDecoration(
              color: Themeorangecolor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.all(8),
            child: Icon(icon, color: Themeorangecolor),
          ),
          title: Text(title,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
          trailing: Icon(Icons.arrow_forward_ios_rounded, size: 18),
          // onTap: () {},
        ),
      ),
    );
  }
}
