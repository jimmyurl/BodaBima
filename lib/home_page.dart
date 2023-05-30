import 'package:flutter/material.dart';

import 'about_app_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) {
              return const AboutAppPage();
            }),
          );
        },
        child: const Text('About This App'),
      ),
    );
  }
}
