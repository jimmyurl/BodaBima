import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
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

  @override
  _EmergencyAssistancePageState createState() =>
      _EmergencyAssistancePageState();
}

class _EmergencyAssistancePageState extends State<EmergencyAssistancePage> {
  void _makeEmergencyCall(String phoneNumber) async {
    final url = 'tel:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  @override
  Widget build(BuildContext context) {
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
          ],
        ),
      ),
    );
  }

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
    );
  }
}
