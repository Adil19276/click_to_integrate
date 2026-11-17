import 'package:click_to_integrate/color.dart';
//import 'package:click_to_integrate/home_page.dart';
import 'package:click_to_integrate/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slider_button/slider_button.dart';

class on_bording extends StatefulWidget {
  const on_bording({super.key});

  @override
  State<on_bording> createState() => _on_bordingState();
}

PageController _controller = PageController();
int currentpage = 0;

List<Map<String, String>> pages = [
  {
    'title': 'Discover Everything in One\nPlace.',
    'subtitle':
        'Small daily choices can create a big impact.\nFind tools, ideas, and resources all in one place.\nTurn your habits into meaningful climate action with\nClick to Integrate',
    'image': 'assets/mobile_vector_1.png',
  },
  {
    'title': 'Repair, Shop Insure – Made\nSimple',
    'subtitle':
        'Get your devices repaired with ease\nShop trusted tools and accessories hassle-free.\nInsure everything you value, all in one place with\nClick to Integrate',
    'image': 'assets/onbording_3.png',
  },
  {
    'title': 'Shop Smarter with AI &\nSecurity',
    'subtitle':
        'Smarter shopping guided by AI.\nSafe, secure, and worry-free purchases\nExperience the future of shopping today with\nClick to Integrate',
    'image': 'assets/ai_vector.png',
  },
];

class _on_bordingState extends State<on_bording> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
        child: SliderButton(
          buttonSize: 50,
          action: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => sign_in(),
            ),
          ),
          height: 60,
          label: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Text(
                "Swipe to start",
                style: TextStyle(
                  color: Themeorangecolor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.2,
              ),
              Row(
                children: [
                  Icon(Icons.double_arrow_rounded),
                ],
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
          icon: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Color(0xFFFFB74D),
            ),
            child: Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
          ),
          width: MediaQuery.sizeOf(context).width * 0.93,
          radius: 15,
          buttonColor: const Color(0xFF5B2EFF),
          backgroundColor: Colors.white,
          highlightedColor: Colors.black,
          baseColor: Colors.black12,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                  controller: _controller,
                  onPageChanged: (index) {
                    setState(() => currentpage = index);
                  },
                  itemCount: pages.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              child: Column(
                                children: [
                                  Center(
                                    child: Image.asset(
                                      pages[index]['image']!,
                                      fit: BoxFit.contain,
                                      width: MediaQuery.of(context).size.width *
                                          0.9,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.50,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              margin: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white),
                              child: Center(
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(Icons.chevron_left),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.45,
                              ),
                              child: Container(
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      // color: Colors.black,
                                      // boxShadow: [
                                      //   BoxShadow(
                                      //       color: Colors.black,
                                      //       blurRadius: 40,
                                      //       blurStyle: BlurStyle.outer),
                                      // ],
                                      ),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            pages[index]['title']!,
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.lato(
                                                textStyle: Theme.of(context)
                                                    .textTheme
                                                    .labelLarge,
                                                fontSize: 27,
                                                height: 1.4,
                                                //color: Colors.white,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            pages[index]['subtitle']!,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.grey.shade700,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                pages.length,
                (index) => Container(
                  margin: EdgeInsets.symmetric(horizontal: 4, vertical: 15),
                  height: 8,
                  width: index == currentpage ? 20 : 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: index == currentpage
                        ? Color(0xFFFFB74D)
                        : Colors.grey.shade400,
                  ),
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 8.0),
            //   child: Row(
            //     children: List.generate(
            //       pages.length,
            //       (index) => Container(
            //         margin: EdgeInsets.symmetric(horizontal: 4, vertical: 15),
            //         height: 5,
            //         width: index == currentpage ? 20 : 8,
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(10),
            //           color: index == currentpage
            //               ? Color(0xFFFFB74D)
            //               : Colors.grey,
            //         ),
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
