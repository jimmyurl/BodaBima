import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

import 'package:flutter/material.dart';

import 'home_page.dart';
import 'emergency_assistance_page.dart';
import 'call_us_page.dart';
import 'profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 45, 140, 255),
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => RootPage(),
        '/home': (context) => HomePage(),
        '/emergency_assistance': (context) => EmergencyAssistancePage(),
        '/call_us': (context) => CallUsPage(),
        '/profile': (context) => ProfilePage(),
      },
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentPage = 0;

  void _onPageSelected(int index) {
    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getPage(currentPage),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint('Floating Action Button');
        },
        child: const Icon(Icons.add),
        backgroundColor: Color.fromARGB(255, 45, 140, 255),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_hospital), label: 'Emergency Assistance'),
          BottomNavigationBarItem(icon: Icon(Icons.call), label: 'Call Us'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: currentPage,
        onTap: _onPageSelected,
        selectedItemColor: Color.fromARGB(255, 45, 140, 255),
        unselectedItemColor: Colors.grey,
      ),
    );
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return HomePage();
      case 1:
        return EmergencyAssistancePage();
      case 2:
        return CallUsPage();
      case 3:
        return ProfilePage();
      default:
        return Container();
    }
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedLanguage = 'en'; // Default language is English ('en')

  void _onLanguageChanged(String selectedLanguage) {
    setState(() {
      _selectedLanguage = selectedLanguage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 48, 45, 255),
        title: const Text("BodaBima"),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    _onLanguageChanged('en');
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: _selectedLanguage == 'en'
                          ? Colors.blue
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      'EN',
                      style: TextStyle(
                        color: _selectedLanguage == 'en'
                            ? Colors.white
                            : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                InkWell(
                  onTap: () {
                    _onLanguageChanged('sw');
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: _selectedLanguage == 'sw'
                          ? Color.fromARGB(255, 48, 45, 255)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      'SW',
                      style: TextStyle(
                        color: _selectedLanguage == 'sw'
                            ? Colors.white
                            : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 32),
              buildInsuranceCard(
                title: "Medical Insurance",
                imageAsset: "assets/medical_insurance.jpg",
              ),
              SizedBox(height: 16),
              buildInsuranceCard(
                title: "Motor Insurance",
                imageAsset: "assets/motor_insurance.jpeg",
              ),
              SizedBox(height: 16),
              buildInsuranceCard(
                title: "Home Insurance",
                imageAsset: "assets/home_insurance.jpg",
              ),
              SizedBox(height: 16),
              buildInsuranceCard(
                title: "Travel Insurance",
                imageAsset: "assets/travel_insurance.jpg",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInsuranceCard(
      {required String title, required String imageAsset}) {
    return Card(
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 150, // Set a fixed height here (adjust as needed)
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InsuranceDetailsPage(title: title),
                  ),
                );
              },
              child: Image.asset(
                imageAsset,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InsuranceDetailsPage extends StatelessWidget {
  final String title;

  const InsuranceDetailsPage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 48, 45, 255),
        title: Text(title),
      ),
      body: Center(
        child: Text("More Details about $title"),
      ),
    );
  }
}
