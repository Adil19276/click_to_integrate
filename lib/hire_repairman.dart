import 'package:click_to_integrate/select_brand.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class hire_repairman extends StatefulWidget {
  const hire_repairman({super.key});

  @override
  State<hire_repairman> createState() => _hire_repairmanState();
}

class _hire_repairmanState extends State<hire_repairman> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> repairmen = [
      {
        "name": "John Doe",
        "role": "Repairman",
        "image":
            "https://static.vecteezy.com/system/resources/thumbnails/003/152/810/small/portrait-of-young-man-with-glasses-on-a-black-background-free-photo.jpg",
        "rating": 4.5,
      },
      {
        "name": "David Smith",
        "role": "Technician",
        "image":
            "https://sb.kaleidousercontent.com/67418/1920x1545/c5f15ac173/samuel-raita-ridxdghg7pw-unsplash.jpg",
        "rating": 4.8,
      },
      {
        "name": "Lofi Daniel",
        "role": "Repair Expert",
        "image":
            "https://plus.unsplash.com/premium_photo-1689977968861-9c91dbb16049?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8bWFufGVufDB8fDB8fHww",
        "rating": 4.2,
      },
      {
        "name": "Chris Evans",
        "role": "Engineer",
        "image":
            "https://t4.ftcdn.net/jpg/04/31/64/75/360_F_431647519_usrbQ8Z983hTYe8zgA7t1XVc5fEtqcpa.jpg",
        "rating": 4.9,
      },
    ];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: true,
        title: Text(
          "Repairmen Profiles",
          style: GoogleFonts.lato(
              textStyle: Theme.of(context).textTheme.titleLarge,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Wrap(
                spacing: 12,
                runSpacing: 12,
                children: repairmen.map((repairman) {
                  return SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.45,
                    child: _buildProfileCard(repairman),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileCard(Map<String, dynamic> repairman) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => select_brand(),
          ),
        );
      },
      child: Container(
        //height: MediaQuery.sizeOf(context).height * 0.15,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: const Offset(2, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(repairman["image"]),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        repairman["name"],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                       softWrap: true,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        repairman["role"],
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                        softWrap: true,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const Divider(),
              //const SizedBox(height: 8),
              Row(
                children: [
                  const SizedBox(width: 4),
                  Icon(
                    Icons.handyman_outlined,
                    color: Colors.grey[400],
                    size: 20,
                  ),
                  Spacer(),
                  const Icon(Icons.star, color: Colors.orange, size: 20),
                  const SizedBox(width: 4),
                  Text(
                    repairman["rating"].toString(),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
