import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'main.dart';
import 'l10n/localizations.dart';

class EmergencyAssistancePage extends StatefulWidget {
  final void Function(Locale) changeLanguage;
  final AppLocalizations localizations;
  final Locale selectedLocale;

  const EmergencyAssistancePage({
    super.key,
    required this.changeLanguage,
    required this.localizations,
    required this.selectedLocale,
  });

  @override
  _EmergencyAssistancePageState createState() =>
      _EmergencyAssistancePageState();
}

class _EmergencyAssistancePageState extends State<EmergencyAssistancePage> {
  void _makeEmergencyCall(String phoneNumber) async {
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
          widget.localizations.translate('Emergency Assistance') ??
              (widget.selectedLocale.languageCode == 'sw'
                  ? 'Msaada wa Dharura'
                  : 'Emergency Assistance'),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _makeEmergencyCall('0712462029'),
              child: Text(
                widget.localizations.translate('call_emergency_services') ??
                    (widget.selectedLocale.languageCode == 'sw'
                        ? 'Piga Huduma ya Daharura'
                        : 'Call Emergency Services'),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _makeEmergencyCall('0712462029'),
              child: Text(
                widget.localizations
                        .translate('call_local_emergency_services') ??
                    (widget.selectedLocale.languageCode == 'sw'
                        ? 'Piga Namba ya Dharura ya Karibu '
                        : 'Call Local Emergency Services'),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle requesting assistance
              },
              child: Text(
                widget.localizations.translate('request_assistance') ??
                    (widget.selectedLocale.languageCode == 'sw'
                        ? 'Omba Msaada'
                        : 'Request Assistance'),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle live location sharing
              },
              child: Text(
                widget.localizations.translate('share_live_location') ??
                    (widget.selectedLocale.languageCode == 'sw'
                        ? 'Onyesha Mahali Ulipo'
                        : 'Show Live Location'),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              widget.localizations.translate('safety_tips') ??
                  (widget.selectedLocale.languageCode == 'sw'
                      ? 'Dondoo za Usalama'
                      : 'Safety Tips'),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              widget.localizations.translate('stay_calm') ??
                  (widget.selectedLocale.languageCode == 'sw'
                      ? 'Kuwa Mtulivu'
                      : 'Stay Calma'),
            ),
            Text(
              widget.localizations.translate('ensure_safety') ??
                  (widget.selectedLocale.languageCode == 'sw'
                      ? 'Hakikisha Usalama'
                      : 'Ensure Safety'),
            ),
            Text(
              widget.localizations.translate('follow_instructions') ??
                  (widget.selectedLocale.languageCode == 'sw'
                      ? 'Fuata Maelekezo'
                      : 'Follow Instructions'),
            ),
            // Add more safety tips as needed
          ],
        ),
      ),
    );
  }
}

class LanguageSwitcher extends StatelessWidget {
  final void Function(Locale) changeLanguage;
  final Locale selectedLocale;

  const LanguageSwitcher(
      {super.key, required this.changeLanguage, required this.selectedLocale});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            changeLanguage(const Locale('en'));
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: selectedLocale.languageCode == 'en'
                  ? Colors.blue
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              'EN',
              style: TextStyle(
                color: selectedLocale.languageCode == 'en'
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
            changeLanguage(const Locale('sw'));
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: selectedLocale.languageCode == 'sw'
                  ? const Color.fromARGB(255, 48, 45, 255)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              'SW',
              style: TextStyle(
                color: selectedLocale.languageCode == 'sw'
                    ? Colors.white
                    : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
