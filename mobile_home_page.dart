import 'package:flutter/material.dart';
import '../stylers.dart';
import 'package:url_launcher/url_launcher.dart';

class MobileHomePage extends StatelessWidget {
  final Image parkingImage;
  const MobileHomePage({required this.parkingImage, super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 40),

          // ✅ Hero Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                getMobileRichText(),
                const SizedBox(height: 20),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image(
                      image: parkingImage.image,
                      width: MediaQuery.of(context).size.width * 0.9),
                ),
              ],
            ),
          ),

          const SizedBox(height: 60),

          // ✅ Why Choose ValetEasy
          whyChooseValetEasySection(),

          const SizedBox(height: 60),

          // ✅ Scan-Based Parking
          scanBasedParkingSection(),

          const SizedBox(height: 60),

          // ✅ How It Works
          howItWorksSection(),

          const SizedBox(height: 60),

          // ✅ Download App Section
          downloadAppSection(context),

          const SizedBox(height: 60),

          // ✅ Get Started Section
          getStartedSection(),
        ],
      ),
    );
  }

  // ================= Hero Text =================
  Widget getMobileRichText() {
    return RichText(
      textAlign: TextAlign.center,
      text: const TextSpan(
        text: "Elevate Your User\n",
        style: TextStyle(
            fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
        children: [
          TextSpan(
              text: "Parking\n",
              style:
                  TextStyle(color: primaryColor, fontWeight: FontWeight.bold)),
          TextSpan(text: "Experience"),
        ],
      ),
    );
  }

  // ================= Why Choose =================
  Widget whyChooseValetEasySection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const Text("Why Choose ValetEasy",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          const Text(
            "Experience seamless parking solutions, track your employees’ stats and measure efficiency.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Colors.black54),
          ),
          const SizedBox(height: 30),
          Column(
            children: [
              featureCard(Icons.access_time, "24/7 Availability",
                  "Round-the-clock availability ensuring to serve the users better."),
              const SizedBox(height: 20),
              featureCard(Icons.security, "Security",
                  "Secure data and safeguarding the existing data for marketing needs."),
              const SizedBox(height: 20),
              featureCard(Icons.insights, "Insights",
                  "Get the feedback in realtime to improve business."),
            ],
          )
        ],
      ),
    );
  }

  Widget featureCard(IconData icon, String title, String description) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4))
        ],
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: const Color(0xFFB5CD20),
            child: Icon(icon, color: Colors.white, size: 30),
          ),
          const SizedBox(height: 12),
          Text(title,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(description,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, color: Colors.black54)),
        ],
      ),
    );
  }

  // ================= Scan Section =================
  Widget scanBasedParkingSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset("assets/scan_parking.webp",
                width: double.infinity, fit: BoxFit.cover),
          ),
          const SizedBox(height: 20),
          const Text("Smart Scan-Based Parking",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          const Text(
            "No more tickets, no more hassle! Simply scan the QR code at our parking spots to check-in and check-out seamlessly.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Colors.black54),
          ),
        ],
      ),
    );
  }

  // ================= How It Works =================
  Widget howItWorksSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const Text("How It Works",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          stepCard(Icons.qr_code, "Scan QR",
              "Users scan QR at the parking entrance."),
          const SizedBox(height: 20),
          stepCard(Icons.directions_car, "Park Car",
              "Vehicle is securely parked by valet."),
          const SizedBox(height: 20),
          stepCard(Icons.check_circle, "Check-out",
              "Scan QR again to pick your car hassle-free."),
        ],
      ),
    );
  }

  Widget stepCard(IconData icon, String title, String description) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: const Color(0xFFB5CD20),
            child: Icon(icon, color: Colors.white),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
                Text(description,
                    style:
                        const TextStyle(fontSize: 14, color: Colors.black54)),
              ],
            ),
          )
        ],
      ),
    );
  }

  // ================= Download App Section =================
  Widget downloadAppSection(BuildContext context) {
    return Container(
      color: const Color(0xFFB5CD20),
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const Text("Download ValetEasy App",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          const SizedBox(height: 12),
          const Text(
            "Get the app for Android and iOS and experience seamless parking with ValetEasy!",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Colors.white70),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/google_play_badge.png", width: 140),
              const SizedBox(width: 16),
              Image.asset("assets/app_store_badge.png", width: 140),
            ],
          )
        ],
      ),
    );
  }

  // ================= Get Started Section =================
  Widget getStartedSection() {
    return Container(
      color: Colors.grey.shade200,
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text("Get Started",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFB5CD20))),
          SizedBox(height: 16),
          Text("Call: +91-798-167-9094"),
          Text("WhatsApp: +91-798-167-9094"),
          Text("Email: bhargavreddy517@gmail.com"),
        ],
      ),
    );
  }
}
