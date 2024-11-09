import 'package:flutter/material.dart';

class MotorInsurancePage extends StatelessWidget {
  const MotorInsurancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Motor Insurance'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Motor insurance, also known as auto insurance or car insurance, is a type of insurance that provides financial protection against the cost of damages to your vehicle and liabilities that may arise from vehicle accidents. It is designed to help vehicle owners manage the expenses associated with accidents, thefts, and other incidents involving their vehicles. Here are some key aspects of motor insurance...',
            ),
            SizedBox(height: 16),
            Text(
              '1. Coverage: Motor insurance typically covers damages to your vehicle caused by accidents, natural disasters, or vandalism. It may also include coverage for injuries to yourself and others involved in an accident. The specific coverage options vary based on the type of policy and insurance provider.',
            ),
            SizedBox(height: 16),
            Text(
              '2. Premiums: To have motor insurance coverage, vehicle owners must pay regular premiums, which are determined based on factors like the type of vehicle, driving history, location, and coverage limits. Premiums can be paid monthly, quarterly, or annually.',
            ),
            SizedBox(height: 16),
            // Add other paragraphs here...
          ],
        ),
      ),
    );
  }
}
