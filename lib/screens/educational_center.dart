// Create a new file: lib/screens/education_center.dart

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../l10n/localizations.dart';

class EducationCenter extends StatefulWidget {
  @override
  _EducationCenterState createState() => _EducationCenterState();
}

class _EducationCenterState extends State<EducationCenter> {
  final List<Map<String, dynamic>> educationalContent = [
    {
      'title': 'Bima ni Nini?',
      'title_en': 'What is Insurance?',
      'content': 'Bima ni...',
      'content_en': 'Insurance is...',
      'videoUrl': 'assets/videos/insurance_basics.mp4',
    },
    // Add more educational content
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: educationalContent.length,
      itemBuilder: (context, index) {
        final content = educationalContent[index];
        return ExpansionTile(
          title: Text(
            AppLocalizations.of(context)?.currentLanguage == 'sw'
                ? content['title']
                : content['title_en'],
          ),
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                AppLocalizations.of(context)?.currentLanguage == 'sw'
                    ? content['content']
                    : content['content_en'],
              ),
            ),
            if (content['videoUrl'] != null)
              VideoPlayerWidget(videoUrl: content['videoUrl']),
          ],
        );
      },
    );
  }
}
