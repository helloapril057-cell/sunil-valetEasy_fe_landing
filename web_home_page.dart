import 'package:flutter/material.dart';
import '../feature_card.dart';
import '../my_widgets.dart';
import '../stylers.dart';
import 'package:url_launcher/url_launcher.dart';

class WebHomePage extends StatelessWidget {
  final Image parkingImage;
  const WebHomePage({required this.parkingImage, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 80),

        // Hero Section
        Row(
          children: [
            SizedBox(width: 40),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.30,
              child: getRichTextAndButtons(context),
            ),
            SizedBox(width: 100),
            Flexible(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                clipBehavior: Clip.antiAlias,
                child: Image(image: parkingImage.image),
              ),
            ),
            SizedBox(width: 40),
          ],
        ),

        SizedBox(height: 85),

        // Why Choose ValetEasy Section
        whyChooseValetEasySection(context),

        SizedBox(height: 60),

        // Scan Section
        scanBasedParkingSection(context),

        SizedBox(height: 60),

        // How It Works Section
        howItWorksSection(context),

        SizedBox(height: 60),

        // App Download Section
        downloadAppSection(context),

        SizedBox(height: 60),

        // Get Started Section
        getStartedSection(),
      ],
    );
  }

  // ================= Why Choose ValetEasy Section =================
  Widget whyChooseValetEasySection(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.grey.shade100,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Why Choose ValetEasy",
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            "Experience seamless parking solutions, track your employees’ stats, and measure efficiency like never before.",
            style: TextStyle(fontSize: 18, color: Colors.black54, height: 1.5),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 60),

          // Features Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              featureCard(
                icon: Icons.access_time,
                title: "24/7 Availability",
                description:
                    "Round-the-clock support ensuring smooth parking operations.",
              ),
              featureCard(
                icon: Icons.security,
                title: "Advanced Security",
                description:
                    "Protecting customer data with robust and secure systems.",
              ),
              featureCard(
                icon: Icons.insights,
                title: "Smart Insights",
                description:
                    "Real-time analytics to monitor performance and efficiency.",
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget featureCard({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.black12, blurRadius: 12, offset: Offset(0, 6)),
          ],
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFB5CD20),
              ),
              child: Icon(icon, size: 40, color: Colors.white),
            ),
            const SizedBox(height: 20),
            Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              description,
              style:
                  TextStyle(fontSize: 16, color: Colors.black54, height: 1.4),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  // ================= Scan Section =================
  Widget scanBasedParkingSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 12,
                      offset: Offset(0, 8)),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child:
                    Image.asset("assets/scan_parking.webp", fit: BoxFit.cover),
              ),
            ),
          ),
          const SizedBox(width: 60),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Smart Scan-Based Parking",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "No more tickets, no more hassle! Simply scan the QR code at our parking spots "
                  "to check-in and check-out seamlessly. Experience the future of parking with ValetEasy.",
                  style: TextStyle(
                      fontSize: 16, color: Colors.black54, height: 1.5),
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 18, horizontal: 28),
                        backgroundColor: primaryColor,
                        shape: StadiumBorder(),
                      ),
                      icon: Icon(Icons.qr_code_scanner),
                      label: Text("How It Works"),
                    ),
                    const SizedBox(width: 20),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 18, horizontal: 28),
                        side: BorderSide(color: primaryColor, width: 2),
                        shape: StadiumBorder(),
                      ),
                      child: Text("Learn More",
                          style: TextStyle(color: primaryColor)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ================= How It Works Section =================
  Widget howItWorksSection(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.grey.shade100,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "How It Works",
            style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Text(
            "Using ValetEasy is simple. Just follow 3 quick steps:",
            style: TextStyle(fontSize: 18, color: Colors.black54),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              _HowItWorksStep(
                icon: Icons.qr_code_scanner,
                title: "Scan QR",
                description: "Scan the QR code at the parking lot.",
              ),
              _HowItWorksStep(
                icon: Icons.local_parking,
                title: "Park Easily",
                description: "Check in and park without tickets or delays.",
              ),
              _HowItWorksStep(
                icon: Icons.check_circle,
                title: "Checkout",
                description: "Scan again to checkout instantly.",
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ================= App Download Section =================
  Widget downloadAppSection(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Color(0xFFB5CD20),
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Download ValetEasy App",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                const SizedBox(height: 20),
                Text(
                  "Get the app for Android and iOS and experience seamless parking with ValetEasy!",
                  style: TextStyle(fontSize: 18, color: Colors.black87),
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        final uri = Uri.parse(
                            "https://play.google.com/store/apps/details?id=your_app_id");
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(uri,
                              mode: LaunchMode.externalApplication);
                        }
                      },
                      child: Image.asset("assets/google_play_badge.png",
                          width: 150),
                    ),
                    const SizedBox(width: 20),
                    GestureDetector(
                      onTap: () async {
                        final uri = Uri.parse(
                            "https://apps.apple.com/app/idyour_app_id");
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(uri,
                              mode: LaunchMode.externalApplication);
                        }
                      },
                      child:
                          Image.asset("assets/app_store_badge.png", width: 150),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Flexible(
            child: Container(
              alignment: Alignment.centerRight,
              child: Image.asset("assets/valet_parking_mobile.webp",
                  width: MediaQuery.of(context).size.width * 0.35),
            ),
          ),
        ],
      ),
    );
  }

  // ================= Get Started Section =================
  Widget getStartedSection() {
    return Container(
      height: 460,
      color: getStartedBgColor,
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: Row(
        children: [
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Get Started",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFB5CD20))),
                const SizedBox(height: 25),
                const Row(
                  children: [
                    Icon(Icons.phone),
                    SizedBox(width: 8),
                    Text("Call directly at: +91-798-167-9094",
                        style: TextStyle(color: Colors.blue)),
                  ],
                ),
                const Row(
                  children: [
                    Icon(Icons.chat, color: Colors.green), // ✅ replaced
                    SizedBox(width: 8),
                    Text('WhatsApp Number: '),
                    SizedBox(width: 4),
                    Text(
                      '+91-798-167-9094',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const Row(
                  children: [
                    Icon(Icons.email),
                    SizedBox(width: 8),
                    Text("bhargavreddy517@gmail.com",
                        style: TextStyle(color: Colors.blue)),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 40),
          Flexible(
            child: getBackToYou(),
          ),
        ],
      ),
    );
  }

  Widget getBackToYou() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Our team will get back to you.",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87)),
        const SizedBox(height: 20),
        const CustomTextField(label: "Full Name"),
        const CustomTextField(label: "Email"),
        const CustomTextField(label: "Phone Number"),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 32),
              shape: StadiumBorder(),
              backgroundColor: primaryColor,
              foregroundColor: Colors.white),
          child: Text("Send", style: TextStyle(fontSize: 16)),
        ),
      ],
    );
  }
}

// ================= Reusable Step Widget =================
class _HowItWorksStep extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _HowItWorksStep({
    Key? key,
    required this.icon,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration:
                BoxDecoration(color: Color(0xFFB5CD20), shape: BoxShape.circle),
            child: Icon(icon, size: 40, color: Colors.white),
          ),
          const SizedBox(height: 20),
          Text(title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center),
          const SizedBox(height: 12),
          Text(description,
              style: TextStyle(fontSize: 16, color: Colors.black54),
              textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

// ================= Custom Text Field =================
class CustomTextField extends StatelessWidget {
  final String label;
  final int maxLines;

  const CustomTextField({super.key, required this.label, this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          isDense: true,
        ),
      ),
    );
  }
}
