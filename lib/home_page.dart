import 'package:bodaboda/home_insurance_page.dart';
import 'package:bodaboda/main.dart';
import 'package:bodaboda/travel_insurance_page.dart';
import 'package:flutter/material.dart';
import 'l10n/localizations.dart';
import 'medical_insurance_page.dart';
import 'motor_insurance_page.dart';

class HomePage extends StatefulWidget {
  final void Function(Locale) changeLanguage;

  const HomePage({super.key, required this.changeLanguage});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedLanguage = 'en'; // Default language is English ('en')

  void _onLanguageChanged(String selectedLanguage) {
    widget.changeLanguage(Locale(selectedLanguage));
    setState(() {
      _selectedLanguage = selectedLanguage;
    });
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 48, 45, 255),
        title: Text(localizations.translate('app_title')!),
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
                const SizedBox(width: 8),
                InkWell(
                  onTap: () {
                    _onLanguageChanged('sw');
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: _selectedLanguage == 'sw'
                          ? const Color.fromARGB(255, 48, 45, 255)
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
              const SizedBox(height: 32),
              buildInsuranceCard(
                title: localizations.translate('medical_insurance')!,
                imageAsset: "assets/medical_insurance.jpg",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MedicalInsurancePage(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              buildInsuranceCard(
                title: localizations.translate('motor_insurance')!,
                imageAsset: "assets/motor_insurance.jpeg",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MotorInsurancePage(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              buildInsuranceCard(
                title: localizations.translate('home_insurance')!,
                imageAsset: "assets/home_insurance.jpg",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeInsurancePage(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              buildInsuranceCard(
                title: localizations.translate('travel_insurance')!,
                imageAsset: "assets/travel_insurance.jpg",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TravelInsurancePage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInsuranceCard({
    required String title,
    required String imageAsset,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 150, // Set a fixed height here (adjust as needed)
            child: GestureDetector(
              onTap: onTap,
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
