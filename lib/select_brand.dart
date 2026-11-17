import 'package:click_to_integrate/select_fault.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class select_brand extends StatefulWidget {
  const select_brand({super.key});

  @override
  State<select_brand> createState() => _select_brandState();
}

class _select_brandState extends State<select_brand> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: true,
        title: Text(
          "Pick Your Brand",
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
                  "Select Brand",
                  style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.titleLarge,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Submit your repairing request query and get quick support",
                  style: TextStyle(color: Colors.grey, ),softWrap: true,
                )
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                brand(
                    text: "Xiaomi",
                    imageurl:
                        "https://a0.anyrgb.com/pngimg/364/244/techme-sas-xiaomi-logo-electronic-products-xiaomi-mi-a1-xiaomi-redmi-xiaomi-smartphone-internet-mobile-phones-orange.png"),
                brand(
                    text: "Apple",
                    imageurl:
                        "https://t3.ftcdn.net/jpg/02/94/22/52/360_F_294225253_YiGjFQNJfEHvd8jpGAZJJSNGSfBnZxMy.jpg"),
                brand(
                    text: "Samsung",
                    imageurl:
                        "https://static.vecteezy.com/system/resources/previews/020/927/451/non_2x/samsung-brand-logo-phone-symbol-name-white-design-south-korean-mobile-illustration-with-blue-background-free-vector.jpg"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                brand(
                    text: "Google",
                    imageurl:
                        "https://static.vecteezy.com/system/resources/previews/059/494/413/non_2x/google-pixel-mobile-company-brand-official-logo-icon-and-symbol-high-quality-digital-download-free-vector.jpg"),
                brand(
                    text: "Motorola",
                    imageurl:
                        "https://static.vecteezy.com/system/resources/previews/020/927/541/non_2x/motorola-brand-logo-phone-symbol-with-name-white-design-usa-mobile-illustration-with-red-background-free-vector.jpg"),
                brand(
                    text: "Lenovo",
                    imageurl:
                        "https://static.cdnlogo.com/logos/l/27/lenovo.png"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                brand(
                    text: "One Plus",
                    imageurl:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTsYqlZ0lhMv5gHETEdQokZ_QAusu2lU4Q4bnRTR81qgykEAtHk4MNTwt_dZfv9Ta7eSE&usqp=CAU"),
                brand(
                    text: "Nokia",
                    imageurl:
                        "https://static.vecteezy.com/system/resources/previews/020/927/394/non_2x/nokia-logo-brand-phone-symbol-white-design-finland-mobile-illustration-with-blue-background-free-vector.jpg"),
                brand(
                    text: "Huawei",
                    imageurl:
                        "https://i.pinimg.com/736x/ec/c4/11/ecc4115da2d5fc646e86a4374a7bb0f7.jpg"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                brand(
                    text: "Honor",
                    imageurl:
                        "https://static.vecteezy.com/system/resources/previews/020/927/207/non_2x/honor-brand-logo-phone-symbol-name-white-design-china-mobile-illustration-with-blue-background-free-vector.jpg"),
                brand(
                    text: "Vivo",
                    imageurl:
                        "https://d2q79iu7y748jz.cloudfront.net/s/_squarelogo/256x256/6cd8c26826a0bf59c5266a2c51216b1f"),
                brand(
                    text: "Realme",
                    imageurl:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwrFwjh6jI4f5230mMSFnmYzTiuZP-hqzApw&s"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                brand(
                    text: "Oppo",
                    imageurl:
                        "https://cdn.iconscout.com/icon/free/png-256/free-oppo-icon-svg-png-download-8715832.png"),
                brand(
                    text: "TCL",
                    imageurl:
                        "https://i.pinimg.com/736x/55/32/9b/55329b2fff5821a4449722de6f35dd3e.jpg"),
                brand(
                    text: "Itel",
                    imageurl:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgSlh-OUcB7xkmAB_gkOx2xgRlh4RchVjljw&s"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class brand extends StatefulWidget {
  final String imageurl;
  final String text;
  const brand({super.key, required this.imageurl, required this.text});

  @override
  State<brand> createState() => _brandState();
}

class _brandState extends State<brand> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => select_fault(),
                ),
              );
            },
            child: Container(
              height: MediaQuery.sizeOf(context).height * 0.1,
              width: MediaQuery.sizeOf(context).width * 0.25,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 4),
                        blurRadius: 5,
                        spreadRadius: 1,
                        blurStyle: BlurStyle.solid,
                        color: Colors.grey),
                  ],
                  image: DecorationImage(
                      image: NetworkImage(widget.imageurl), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            widget.text,
            style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.bodyLarge,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
