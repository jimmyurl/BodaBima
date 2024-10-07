import 'package:bodaboda/emergency_assistance_page.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'main.dart';
import 'l10n/localizations.dart';

class MembershipPage extends StatefulWidget {
  final void Function(Locale) changeLanguage;
  final AppLocalizations localizations;
  final Locale selectedLocale;

  const MembershipPage({
    super.key,
    required this.changeLanguage,
    required this.localizations,
    required this.selectedLocale,
  });

  @override
  _MembershipPageState createState() => _MembershipPageState();
}

class _MembershipPageState extends State<MembershipPage> {
  final List<InsurancePackage> insurancePackages = [
    InsurancePackage(
      imageAsset: 'assets/motor_insurance.jpeg',
      description: 'Comprehensive Coverage',
      phoneNumber: '123456789',
    ),
    InsurancePackage(
      imageAsset: 'assets/home_insurance.jpg',
      description: 'Basic Coverage',
      phoneNumber: '987654321',
    ),
    // Add more insurance packages
  ];

  void _callInsuranceProvider(String phoneNumber) async {
    if (await canLaunch('tel:$phoneNumber')) {
      await launch('tel:$phoneNumber');
    } else {
      // Handle call not available
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 48, 45, 255),
        title: Text(
          widget.localizations.translate('membership') ??
              (widget.selectedLocale.languageCode == 'sw'
                  ? 'Uanachama'
                  : 'Membership'),
        ),
        actions: [
          LanguageSwitcher(
            changeLanguage: widget.changeLanguage,
            selectedLocale: widget.selectedLocale,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: insurancePackages.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              child: Column(
                children: [
                  Image.asset(
                    insurancePackages[index].imageAsset,
                    fit: BoxFit.cover,
                    height: 200,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      insurancePackages[index].description,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => _callInsuranceProvider(
                        insurancePackages[index].phoneNumber),
                    child: Text(
                      widget.localizations.translate('call_insurance') ??
                          (widget.selectedLocale.languageCode == 'sw'
                              ? 'Piga Kupata Maelezo Zaidi'
                              : 'Call Now'),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class InsurancePackage {
  final String imageAsset;
  final String description;
  final String phoneNumber;

  InsurancePackage({
    required this.imageAsset,
    required this.description,
    required this.phoneNumber,
  });
}
