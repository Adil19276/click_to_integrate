import 'dart:async';
import 'dart:ui';
import 'package:click_to_integrate/chat.dart';
import 'package:click_to_integrate/hire_repairman.dart';
import 'package:click_to_integrate/profile/edit_profile.dart';
import 'package:click_to_integrate/profile/my_order.dart';
import 'package:click_to_integrate/profile/profile_screen.dart';
import 'package:click_to_integrate/select_brand.dart';
import 'package:click_to_integrate/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color.dart';

class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  bool isFavorite = false;
  PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  Timer? _timer; 

  List<int> selectedIndexes = [];

  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < imageUrls.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  int? index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => profile_screen(),
                        ),
                      );
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          border: Border.all(color: Themeoffwhitecolor),
                          shape: BoxShape.circle),
                      child: Center(
                        child: IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => edit_profile(),
                              ),
                            );
                          },
                          icon: Icon(CupertinoIcons.person),
                        ),
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  height: 40,
                  width: 40,
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      border: Border.all(color: Themeoffwhitecolor),
                      shape: BoxShape.circle),
                  child: Center(
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => my_order()));
                      },
                      icon: Icon(CupertinoIcons.shopping_cart),
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  width: 40,
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      border: Border.all(color: Themeoffwhitecolor),
                      shape: BoxShape.circle),
                  child: Center(
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => chat(),
                          ),
                        );
                      },
                      icon: Icon(CupertinoIcons.chat_bubble),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Find & Book Best Service",
                  style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.labelLarge,
                      fontSize: 25,
                      height: 1.4,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  prefixIcon: Icon(CupertinoIcons.search),
                  hintText: "Search",
                  contentPadding: EdgeInsets.symmetric(horizontal: 15),
                ),
              ),
            ),
            SizedBox(
              height: 200,
              child: PageView.builder(
                controller: _pageController,
                itemCount: imageUrls.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 150,
                    width: double.infinity,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: NetworkImage(imageUrls[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Quick Actions ⚡",
                  style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.labelLarge,
                      fontSize: 20,
                      height: 1.4,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(top: 18.0, left: 10, right: 10),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => select_brand(),
                          ),
                        );
                      },
                      child: SizedBox(
                        width: 300,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              height: 120,
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.blue.shade200),
                                color: const Color(0xFFEFF6FF),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Explore the talent pool",
                                    style: TextStyle(
                                      color: Colors.orange,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  //const SizedBox(height: 4),
                                  const Text(
                                    "Post a New Project",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  //const SizedBox(height: 6),
                                  Text(
                                    "Give a boost to your project with the hand picked and verified talent.",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: -20,
                              right: -10,
                              child: Image.network(
                                "https://static.vecteezy.com/system/resources/thumbnails/046/459/515/small/smiling-woman-with-laptop-pointing-on-transparent-background-png.png",
                                height: 140,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => hire_repairman(),
                          ),
                        );
                      },
                      child: SizedBox(
                        width: 300,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              height: 120,
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.orange.shade200),
                                color: Color(0xFFFFFAE6),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Explore the talent pool",
                                    style: TextStyle(
                                      color: Colors.orange,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  //const SizedBox(height: 4),
                                  const Text(
                                    "Hire a Repairman",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  //const SizedBox(height: 6),
                                  Text(
                                    "Give a boost to your project with the hand picked and verified talent.",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: -20,
                              right: -10,
                              child: Image.asset(
                                "assets/a_man_repairer.png",
                                height: 140,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
              child: Row(
                children: [
                  Text(
                    "Top Selling Products",
                    style: GoogleFonts.lato(
                        textStyle: Theme.of(context).textTheme.labelLarge,
                        fontSize: 20,
                        //height: 1.4,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
             
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.sizeOf(context).height * 0.22,
                      width: MediaQuery.sizeOf(context).width * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: const DecorationImage(
                          image: NetworkImage(
                              "https://img.freepik.com/premium-psd/mobile-phone-mockup-with-editable-design-changeable-colors_196070-196.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      height: MediaQuery.sizeOf(context).height * 0.22,
                      width: MediaQuery.sizeOf(context).width * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: const DecorationImage(
                          image: NetworkImage(
                              "https://www.honor.com/content/dam/honor/common/product-list/phones-list-others/honor-magic7-pro/honor-magic7-pro-pc.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.black.withOpacity(0.6),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            CupertinoIcons.hourglass,
                            color: Colors.white,
                            size: 30,
                          ),
                          Text(
                            "Coming Soon",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
              child: Row(
                children: [
                  Text(
                    "Featured Repairmans",
                    style: GoogleFonts.lato(
                        textStyle: Theme.of(context).textTheme.labelLarge,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  toprated(
                    name: "John Doe",
                    location: "Turkey, Istanbul, Asia",
                    imageUrl:
                        "https://t4.ftcdn.net/jpg/08/46/26/65/360_F_846266563_Xc3HUuhJPLPN61OFf8MlNnXyb5r7d3qC.jpg",
                    rating: 5,
                  ),
                  toprated(
                    name: "Lee Ching",
                    location: "Turkey, Antalya, Asia",
                    imageUrl:
                        "https://blog.indifi.com/wp-content/uploads/2019/12/Mobile-Shop-500x281.jpeg",
                    rating: 4,
                  ),
                  toprated(
                    name: "Izmir kaur",
                    location: "Turkey, Izmir, Asia",
                    imageUrl:
                        "https://www.gloled.co/wp-content/uploads/2024/09/image2-9.webp",
                    rating: 3,
                  ),
                  toprated(
                    name: "Ankara",
                    location: "Turkey, Ankara, Asia",
                    imageUrl:
                        "https://s.alicdn.com/@sc04/kf/H7591f7ec13134af9b300cd4d4b180abdV.jpg",
                    rating: 5,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
              child: Row(
                children: [
                  Text(
                    "Featured Citites",
                    style: GoogleFonts.lato(
                        textStyle: Theme.of(context).textTheme.labelLarge,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  citycard(
                    name: "Antalya",
                    location: "Turkey, antalya, Asia",
                    imageUrl:
                        "https://www.azal.az/_next/static/media/Kaleici_0b1be7d832.jpg",
                  ),
                  citycard(
                    name: "Ankara",
                    location: "Turkey, ankara, Asia",
                    imageUrl:
                        "https://isinolsun.com/blog/wp-content/uploads/2025/02/ankara-is-ve-yasam-rehberi.jpg",
                  ),
                  citycard(
                    name: "Istanbul",
                    location: "Turkey, istanbul, Asia",
                    imageUrl:
                        "https://www.hotelgift.com/media/wp/HG/2022/08/blue-mosque-Turkey-where-to-stay-in-istanbul.webp",
                  ),
                  citycard(
                    name: "Izmir",
                    location: "Turkey, izmir, Asia",
                    imageUrl:
                        "https://media.istockphoto.com/id/479786994/photo/clock-tower-in-izmir-stock-image.jpg?s=612x612&w=0&k=20&c=PhgIB7pkyIRLhA1HkU_nEjThC0bRdC2yK4ygXDSOaUE=",
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
              child: Row(
                children: [
                  Text(
                    "Refurbished Products",
                    style: GoogleFonts.lato(
                        textStyle: Theme.of(context).textTheme.labelLarge,
                        fontSize: 20,
                        //height: 1.4,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                /// Row of Containers
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.sizeOf(context).height * 0.22,
                      width: MediaQuery.sizeOf(context).width * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: const DecorationImage(
                          image: NetworkImage(
                              "https://me-em.pk/cdn/shop/files/Auriculares_intrauditivos_Y-26_Negro_Blanco_Rosa_Azul.jpg?v=1727946764&width=533"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      height: MediaQuery.sizeOf(context).height * 0.22,
                      width: MediaQuery.sizeOf(context).width * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: const DecorationImage(
                          image: NetworkImage(
                              "https://uptowntech.com.bd/wp-content/uploads/2025/05/Screenshot_1-430x431.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.black.withOpacity(0.6),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            CupertinoIcons.hourglass,
                            color: Colors.white,
                            size: 30,
                          ),
                          Text(
                            "Coming Soon",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.2,
            ),
          ],
        ),
      ),
    );
  }
}

class toprated extends StatefulWidget {
  final String name;
  final String location;
  final String imageUrl;
  final int rating;

  const toprated({
    super.key,
    required this.name,
    required this.location,
    required this.imageUrl,
    required this.rating,
  });

  @override
  State<toprated> createState() => _CityCardState();
}

class _CityCardState extends State<toprated> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Container(
              width: 160,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 150,
                    width: 180,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(widget.imageUrl),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          widget.location,
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Row(
                          children: List.generate(
                            5,
                            (index) => Icon(
                              index < widget.rating
                                  ? Icons.star
                                  : Icons.star_border,
                              color: Colors.orange,
                              size: 20,
                            ),
                          ),
                        ),
                        const SizedBox(height: 3),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Positioned(
              top: 130,
              left: 120,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    if (isFavorite) {
                      isFavorite = false;
                    } else
                      isFavorite = true;
                  });
                },
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Icon(
                      isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border_outlined,
                      color: Themeorangecolor,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class citycard extends StatefulWidget {
  final String name;
  final String location;
  final String imageUrl;

  const citycard({
    super.key,
    required this.name,
    required this.location,
    required this.imageUrl,
  });

  @override
  State<citycard> createState() => _cityCardState();
}

class _cityCardState extends State<citycard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Container(
              width: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 150,
                    //width: 180,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(widget.imageUrl),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          widget.location,
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 3),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Container(
            //   height: MediaQuery.sizeOf(context).height*0.55,
            //   width: double.infinity,
            //   decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/chatgpt.png"),fit: BoxFit.cover)),
            // ),
            // Stack(
            //   children: [
            //     SizedBox(
            //       height: MediaQuery.sizeOf(context).height,
            //       child: GridView.count(
            //         crossAxisCount: 2,
            //         physics: const NeverScrollableScrollPhysics(),
            //         childAspectRatio: 1,
            //         children: List.generate(2, (index) {
            //           return Container(
            //             margin: const EdgeInsets.all(10),
            //             decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(16),
            //               image: const DecorationImage(
            //                 image: NetworkImage(
            //                     "https://cdn2.vectorstock.com/i/1000x1000/69/96/banner-mega-sale-in-mockup-smartphone-special-vector-24286996.jpg"),
            //                 fit: BoxFit.cover,
            //               ),
            //             ),
            // child: ClipRRect(
            //   borderRadius: BorderRadius.circular(16),
            //   child: BackdropFilter(
            //     filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            //     child: Container(
            //       alignment: Alignment.bottomCenter,
            //       padding: const EdgeInsets.all(8),
            //       color: Colors.black.withOpacity(0.6),
            //       child: Text(
            //         "Mobile ${index + 1}",
            //         style: const TextStyle(
            //           fontSize: 17,
            //           color: Colors.white,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            //           );
            //         }),
            //       ),
            //     ),
            //     Container(
            //       height: 250,
            //       width: double.infinity,
            //       decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(10),
            //           color: Colors.black26),
            //       child: Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: Center(
            //           child: Column(
            //             children: [
            //               Icon(
            //                 CupertinoIcons.hourglass,
            //                 size: 40,
            //               ),
            //               Text(
            //                 "Coming Soon",
            //                 style: TextStyle(
            //                   fontSize: 35,
            //                   fontWeight: FontWeight.bold,
            //                   color: Colors.black,
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),