import 'package:flutter/material.dart';

class AboutAppPage extends StatefulWidget {
  const AboutAppPage({super.key});

  @override
  State<AboutAppPage> createState() => _AboutAppPageState();
}

class _AboutAppPageState extends State<AboutAppPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About This Application'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('images/boda.jpg'),
            const Divider(
              color: Colors.black,
            ),
            Container(
              width: double.infinity,
              color: Colors.blueGrey,
              child: const Text(
                'How to Become A Member',
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Click Here to Access Form'),
            ),
            OutlinedButton(
              onPressed: () {},
              child: const Text('Already A Member?'),
            ),
            OutlinedButton(
              onPressed: () {},
              child: const Text('View Terms and Conditions'),
            ),
            OutlinedButton(
              onPressed: () {},
              child: const Text('Forgot Password'),
            ),
            const Row(
              children: [
                Icon(
                  Icons.access_alarm,
                ),
                Text('Alarm')
              ],
            )
          ],
        ),
      ),
    );
  }
}
