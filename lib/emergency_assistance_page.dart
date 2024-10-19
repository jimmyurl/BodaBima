import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
<<<<<<< HEAD
import 'l10n/localizations.dart';

class EmergencyAssistancePage extends StatefulWidget {
  final Function(Locale) changeLanguage;
  final Locale selectedLocale;
  final AppLocalizations localizations;

  const EmergencyAssistancePage({
    Key? key,
    required this.changeLanguage,
    required this.selectedLocale,
    required this.localizations,
  }) : super(key: key);
=======
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
>>>>>>> 0097b14add9085455e321c434cb17c149eae833b

  @override
  _EmergencyAssistancePageState createState() =>
      _EmergencyAssistancePageState();
}

class _EmergencyAssistancePageState extends State<EmergencyAssistancePage> {
  void _makeEmergencyCall(String phoneNumber) async {
<<<<<<< HEAD
    final url = 'tel:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
=======
    if (await canLaunch('tel:$phoneNumber')) {
      await launch('tel:$phoneNumber');
    } else {
      // Handle call not available
>>>>>>> 0097b14add9085455e321c434cb17c149eae833b
    }
  }

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Emergency Call Card
            Card(
              elevation: 4,
              color: Colors.red.shade50,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Icon(
                      Icons.emergency,
                      size: 48,
                      color: Colors.red,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      widget.localizations.translate('emergency_services') ??
                          'Emergency Services',
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: () => _makeEmergencyCall('0712462029'),
                      icon: const Icon(Icons.phone),
                      label: Text(widget.localizations
                              .translate('call_emergency_services') ??
                          'Call Emergency Services'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Quick Actions Grid
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 1.2,
              children: [
                _buildActionCard(
                  icon: Icons.local_police,
                  title: widget.localizations.translate('call_local_police') ??
                      'Call Local Police',
                  onTap: () => _makeEmergencyCall('0712462029'),
                  color: Colors.blue,
                ),
                _buildActionCard(
                  icon: Icons.help_outline,
                  title: widget.localizations.translate('request_help') ??
                      'Request Help',
                  onTap: () {
                    // Handle requesting assistance
                  },
                  color: Colors.orange,
                ),
                _buildActionCard(
                  icon: Icons.location_on,
                  title: widget.localizations.translate('share_location') ??
                      'Share Location',
                  onTap: () {
                    // Handle live location sharing
                  },
                  color: Colors.green,
                ),
                _buildActionCard(
                  icon: Icons.medical_services,
                  title: widget.localizations.translate('first_aid_guide') ??
                      'First Aid Guide',
                  onTap: () {
                    // Handle first aid guide
                  },
                  color: Colors.purple,
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Safety Tips Section
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.tips_and_updates, color: Colors.amber),
                        const SizedBox(width: 8),
                        Text(
                          widget.localizations.translate('safety_tips') ??
                              'Safety Tips',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                    const Divider(),
                    _buildTipItem(
                      icon: Icons.psychology,
                      tip: widget.localizations.translate('stay_calm') ??
                          'Stay calm',
                    ),
                    _buildTipItem(
                      icon: Icons.security,
                      tip: widget.localizations.translate('ensure_safety') ??
                          'Ensure your safety',
                    ),
                    _buildTipItem(
                      icon: Icons.rule,
                      tip: widget.localizations
                              .translate('follow_instructions') ??
                          'Follow instructions',
                    ),
                  ],
                ),
              ),
            ),
=======
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
>>>>>>> 0097b14add9085455e321c434cb17c149eae833b
          ],
        ),
      ),
    );
  }
<<<<<<< HEAD

  Widget _buildActionCard({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    required Color color,
  }) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 32, color: color),
              const SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTipItem({required IconData icon, required String tip}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.grey),
          const SizedBox(width: 16),
          Expanded(
            child: Text(tip),
          ),
        ],
      ),
=======
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
>>>>>>> 0097b14add9085455e321c434cb17c149eae833b
    );
  }
}
