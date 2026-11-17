import 'package:click_to_integrate/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class shop extends StatefulWidget {
  const shop({super.key});

  @override
  State<shop> createState() => _shopState();
}

class _shopState extends State<shop> {
  final List<Map<String, String>> shops = [
    {
      "cover":
          "https://thumbs.dreamstime.com/b/close-up-hands-scanning-qr-code-smartphone-retail-counter-showcasing-modern-payment-technology-375210348.jpg",
      "profile":
          "https://i.pinimg.com/736x/cf/2b/1d/cf2b1dd0624dd5e24fe0a10590f9eccd.jpg",
      "title": "AutoCare Shop",
      "subtitle": "Store, you're one step",
    },
    {
      "cover":
          "https://thumbs.dreamstime.com/b/close-up-hands-scanning-qr-code-smartphone-retail-counter-showcasing-modern-payment-technology-375210348.jpg",
      "profile": "https://www.promobile.com.my/images/0_pro333/others/service007.jpg",
      "title": "Tech Service",
      "subtitle": "Repair & Solutions",
    },
    {
      "cover":
          "https://thumbs.dreamstime.com/b/close-up-hands-scanning-qr-code-smartphone-retail-counter-showcasing-modern-payment-technology-375210348.jpg",
      "profile": "https://t3.ftcdn.net/jpg/05/46/29/70/360_F_546297021_HjFd4qtsXYEo4fMRONULdLOBt0HoNwFd.jpg",
      "title": "Mobile Hub",
      "subtitle": "Test that Work",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          "Shops",
          style: GoogleFonts.lato(
              textStyle: Theme.of(context).textTheme.titleLarge,
              fontWeight: FontWeight.w600),
        ),
        actions: [
          Container(
            height: 30,
            decoration: BoxDecoration(
              color: Themeorangecolor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              child: Text(
                "Filter",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: shops.length,
        itemBuilder: (context, index) {
          final shop = shops[index];
          return ShopCard(
            coverImage: shop["cover"]!,
            profileImage: shop["profile"]!,
            title: shop["title"]!,
            subtitle: shop["subtitle"]!,
          );
        },
      ),
    );
  }
}

class ShopCard extends StatelessWidget {
  final String coverImage;
  final String profileImage;
  final String title;
  final String subtitle;

  const ShopCard({
    super.key,
    required this.coverImage,
    required this.profileImage,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 6,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              // Cover image
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child: Image.network(
                  coverImage,
                  height: MediaQuery.sizeOf(context).height * 0.15,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: -25,
                left: 16,
                child: Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 3),
                    image: DecorationImage(
                      image: NetworkImage(profileImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Row(
                      children: List.generate(
                        5,
                        (index) => const Icon(
                          Icons.star,
                          size: 18,
                          color: Colors.orange,
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Text(
                      "(0 Review)",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 12),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: const [
                      Text(
                        "View Profile",
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 4),
                      Icon(Icons.arrow_right_alt, color: Colors.orange),
                    ],
                  ),
                ),
              ],
            ),
          ),const SizedBox(height: 20),
        ],
      ),
    );
  }
}
