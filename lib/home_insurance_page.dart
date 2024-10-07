import 'package:flutter/material.dart';

class HomeInsurancePage extends StatelessWidget {
  const HomeInsurancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Insurance'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Home insurance, also known as homeowners insurance, is a type of insurance that provides financial protection against damages and losses to your home and personal belongings. It is designed to help homeowners manage the expenses associated with accidents, natural disasters, theft, and other incidents that can occur on their property. Here are some key aspects of home insurance...',
            ),
            SizedBox(height: 16),
            Text(
              '1. Coverage: Home insurance typically covers damages to your home caused by fire, lightning, windstorms, and other specified perils. It may also include coverage for personal belongings, liability protection, and additional living expenses if you are temporarily unable to live in your home due to covered damages.',
            ),
            SizedBox(height: 16),
            Text(
              '2. Premiums: To have home insurance coverage, homeowners must pay regular premiums, which are determined based on factors like the location of the property, the age and condition of the home, coverage limits, and deductible amounts.',
            ),
            SizedBox(height: 16),
            // Add other paragraphs here...
          ],
        ),
      ),
    );
  }
}
