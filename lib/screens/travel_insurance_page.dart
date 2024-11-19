import 'package:flutter/material.dart';

class TravelInsurancePage extends StatelessWidget {
  const TravelInsurancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Travel Insurance'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Travel insurance is a type of insurance that provides financial protection and assistance during domestic or international travel. It is designed to help travelers manage the unexpected expenses and risks that can occur during their trips. Here are some key aspects of travel insurance...',
            ),
            SizedBox(height: 16),
            Text(
              '1. Coverage: Travel insurance typically covers trip cancellations, delays, lost baggage, medical emergencies, and other travel-related issues. The specific coverage options vary based on the type of travel insurance and the insurance provider.',
            ),
            SizedBox(height: 16),
            Text(
              '2. Premiums: To have travel insurance coverage, travelers must pay a premium, which is based on factors like the duration of the trip, the destination, the age of the traveler, and the level of coverage selected.',
            ),
            SizedBox(height: 16),
            // Add other paragraphs here...
          ],
        ),
      ),
    );
  }
}
