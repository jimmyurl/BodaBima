import 'package:flutter/material.dart';

class MedicalInsurancePage extends StatelessWidget {
  const MedicalInsurancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medical Insurance'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Medical insurance, also known as health insurance or medical coverage, is a type of insurance that provides financial protection against the cost of medical and healthcare expenses. It is designed to help individuals and families manage the high costs associated with medical treatments, hospitalizations, prescription drugs, and other healthcare services. Here are some key aspects of medical insurance...',
            ),
            SizedBox(height: 16),
            Text(
              '1. Coverage: Medical insurance typically covers a wide range of medical services and treatments, including but not limited to hospitalization, doctor visits, surgeries, diagnostic tests, prescription medications, preventive care, and rehabilitation services. The specific coverage varies depending on the type of plan and the insurance provider.',
            ),
            SizedBox(height: 16),
            Text(
              '2. Premiums: To have medical insurance coverage, individuals or their employers must pay regular premiums, which are the fees for maintaining the insurance policy. Premiums can be paid monthly, quarterly, or annually, and the cost depends on factors like the level of coverage, the insured persons age, health status, location, and other relevant factors.',
            ),
            SizedBox(height: 16),
            // Add other paragraphs here...
          ],
        ),
      ),
    );
  }
}
