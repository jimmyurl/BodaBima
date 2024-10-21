import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
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
  final List<InsuranceContact> insuranceContacts = [
    InsuranceContact(
      icon: Icons.car_crash,
      title: 'Motor Claims',
      description: '24/7 Emergency Assistance',
      phoneNumber: '123456789',
      isEmergency: true,
    ),
    InsuranceContact(
      icon: Icons.home,
      title: 'Home Insurance',
      description: 'Property Coverage Support',
      phoneNumber: '987654321',
      isEmergency: false,
    ),
    InsuranceContact(
      icon: Icons.support_agent,
      title: 'General Inquiries',
      description: 'Policy Questions & Support',
      phoneNumber: '456789123',
      isEmergency: false,
    ),
  ];

  void _callInsuranceProvider(String phoneNumber) async {
    final Uri telUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(telUri)) {
      await launchUrl(telUri);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not initiate call')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '24/7 Emergency Support',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'We are here to help whenever you need us',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final contact = insuranceContacts[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: contact.isEmergency
                          ? BorderSide(
                              color: Theme.of(context).primaryColor, width: 2)
                          : BorderSide.none,
                    ),
                    child: InkWell(
                      onTap: () => _callInsuranceProvider(contact.phoneNumber),
                      borderRadius: BorderRadius.circular(12),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: contact.isEmergency
                                    ? Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.1)
                                    : Colors.grey[100],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(
                                contact.icon,
                                size: 32,
                                color: contact.isEmergency
                                    ? Theme.of(context).primaryColor
                                    : Colors.grey[600],
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    contact.title,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    contact.description,
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    contact.phoneNumber,
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.phone,
                              color: Theme.of(context).primaryColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              childCount: insuranceContacts.length,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Divider(),
                  const SizedBox(height: 16),
                  Text(
                    'Business Hours',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                  const SizedBox(height: 8),
                  _buildBusinessHours('Monday - Friday', '8:00 AM - 6:00 PM'),
                  _buildBusinessHours('Saturday', '9:00 AM - 2:00 PM'),
                  _buildBusinessHours('Sunday', 'Closed'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBusinessHours(String day, String hours) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            day,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          Text(hours),
        ],
      ),
    );
  }
}

class InsuranceContact {
  final IconData icon;
  final String title;
  final String description;
  final String phoneNumber;
  final bool isEmergency;

  InsuranceContact({
    required this.icon,
    required this.title,
    required this.description,
    required this.phoneNumber,
    required this.isEmergency,
  });
}
