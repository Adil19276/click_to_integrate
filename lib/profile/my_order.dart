import 'package:click_to_integrate/color.dart';
import 'package:flutter/material.dart';

class my_order extends StatefulWidget {
  const my_order({super.key});

  @override
  State<my_order> createState() => _my_orderState();
}

class _my_orderState extends State<my_order> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("My Orders"),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const TabBar(
                indicator: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                tabs: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Tab(text: "Repairing Job"),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Tab(text: "eCommerce"),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Tab(text: "Refurbished"),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            ListView(
              children: [
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  margin: const EdgeInsets.all(16),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        /// Top Row
                        Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Themeorangecolor.withOpacity(0.2)),
                              child: Icon(Icons.phone_iphone,
                                  color: Themeorangecolor),
                            ),
                            const SizedBox(width: 8),
                            const Expanded(
                              child: Text("Apple iPhone 12 Pro Max",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Themeorangecolor),
                                  color: Themeorangecolor.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Text("Open",
                                  style: TextStyle(color: Themeorangecolor)),
                            )
                          ],
                        ),
                        const SizedBox(height: 4),
                        const Text("ID: 46948dda • Sep 6, 2025",
                            style: TextStyle(color: Colors.grey, fontSize: 12)),

                        const SizedBox(height: 12),
                        const Text("Required Services",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 12),
                        Wrap(
                          spacing: 4, 
                          runSpacing: 4, 
                          children: [
                            reqBox("Battery Replacement"),
                            reqBox("Charging Port"),
                            reqBox("Button Repair"),
                            reqBox("Screen Issue"),
                            reqBox("Camera Repair"),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                InfoBox(
                                    icon: Icons.label,
                                    title: "Brand",
                                    value: "Apple"),
                                const SizedBox(height: 5),
                                InfoBox(
                                    icon: Icons.money,
                                    title: "Budget",
                                    value: "TRY 1k-10k"),
                              ],
                            ),
                            Column(
                              children: [
                                InfoBox(
                                    icon: Icons.color_lens,
                                    title: "Color",
                                    value: "Black"),
                                const SizedBox(height: 5),
                                InfoBox(
                                    icon: Icons.location_on,
                                    title: "Location",
                                    value: "Hyderabad"),
                              ],
                            ),
                            Column(
                              children: [
                                InfoBox(
                                    icon: Icons.error,
                                    title: "Warranty",
                                    value: "Expired",
                                    valueColor: Colors.red),
                                const SizedBox(height: 5),
                                InfoBox(
                                    icon: Icons.local_shipping,
                                    title: "Service",
                                    value: "Pickup"),
                              ],
                            ),
                          ],
                        ),

                        const SizedBox(height: 12),
                        Row(
                          children: [
                            const Text("Priority: ",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                  color: Colors.red[100],
                                  borderRadius: BorderRadius.circular(6)),
                              child: const Text("High",
                                  style: TextStyle(color: Colors.red)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Text("Expires: Sep 13, 2025",
                            style: TextStyle(color: Colors.grey, fontSize: 12)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            ListView(
              children: [
                orderTile(
                    "Air pods pro 2",
                    "02 Aug 24",
                    "KWD 1,200",
                    "https://www.vmcdn.ca/f/files/squamishchief/images/health/hearingairpods.jpeg;w=960",
                    "Complete"),
                orderTile(
                    "Dell Laptop",
                    "07 Aug 24",
                    "KWD 2,000",
                    "https://cdn.thewirecutter.com/wp-content/media/2024/11/cheapgaminglaptops-2048px-7981.jpg",
                    "Complete"),
              ],
            ),
            ListView(
              children: [
                orderTile(
                    "Smart Watch",
                    "10 Aug 24",
                    "KWD 3,500",
                    "https://www.action.pk/cdn/shop/files/p9-wireless-bluetooth-headphones-random-colors-5_2048x.webp?v=1730371051",
                    "Cancel"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static Widget orderTile(String title, String date, String price,
      String imagePath, String status) {
    Color statusColor;
    if (status == "Complete") {
      statusColor = Colors.green;
    } else if (status == "Pending") {
      statusColor = Colors.red;
    } else {
      statusColor = Colors.grey;
    }

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: NetworkImage(
                    imagePath,
                  ),
                  fit: BoxFit.cover)),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(date),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(price, style: const TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 4),
            Text(
              status,
              style: TextStyle(color: statusColor, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget reqBox(String title) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        title,
        style: const TextStyle(
          // fontWeight: FontWeight.w500,
          color: Colors.black87,
        ),
      ),
    );
  }
}

class InfoBox extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final Color valueColor;
  const InfoBox(
      {super.key,
      required this.icon,
      required this.title,
      required this.value,
      this.valueColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.grey),
        Text(title, style: const TextStyle(color: Colors.grey, fontSize: 11)),
        Text(value,
            style: TextStyle(
                color: valueColor, fontWeight: FontWeight.bold, fontSize: 12)),
      ],
    );
  }
}
