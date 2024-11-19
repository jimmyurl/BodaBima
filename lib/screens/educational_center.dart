import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:bima/l10n/localizations.dart'; // Adjust import as needed

class EducationCenter extends StatefulWidget {
  const EducationCenter({Key? key}) : super(key: key);

  @override
  _EducationCenterState createState() => _EducationCenterState();
}

class _EducationCenterState extends State<EducationCenter> {
  final List<Map<String, dynamic>> educationalContent = [
    {
      'title': 'Bima ni Nini?',
      'title_en': 'What is Insurance?',
      'content': 'Bima ni huduma ya kulinda na kuimarisha usalama wa kifedha.',
      'content_en':
          'Insurance is a financial protection service that helps manage risk.',
      'videoUrl': 'assets/videos/insurance_basics.mp4',
    },
    {
      'title': 'Aina za Bima',
      'title_en': 'Types of Insurance',
      'content':
          'Kuna aina mbalimbali za bima: Bima ya Afya, Bima ya Gari, Bima ya Nyumba, na Bima ya Kusafiri.',
      'content_en':
          'There are different types of insurance: Health, Motor, Home, and Travel Insurance.',
      'videoUrl': 'assets/videos/insurance_types.mp4',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final isSwahili = localizations?.locale.languageCode == 'sw';

    return Scaffold(
      appBar: AppBar(
        title: Text(isSwahili ? 'Kituo cha Elimu' : 'Education Center'),
      ),
      body: ListView.builder(
        itemCount: educationalContent.length,
        itemBuilder: (context, index) {
          final content = educationalContent[index];
          return ExpansionTile(
            title: Text(
              isSwahili ? content['title'] : content['title_en'],
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  isSwahili ? content['content'] : content['content_en'],
                ),
              ),
              if (content['videoUrl'] != null)
                VideoPlayerComponent(videoUrl: content['videoUrl']),
            ],
          );
        },
      ),
    );
  }
}

class VideoPlayerComponent extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerComponent({Key? key, required this.videoUrl})
      : super(key: key);

  @override
  _VideoPlayerComponentState createState() => _VideoPlayerComponentState();
}

class _VideoPlayerComponentState extends State<VideoPlayerComponent> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoUrl);
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                VideoPlayer(_controller),
                _ControlsOverlay(controller: _controller),
                VideoProgressIndicator(
                  _controller,
                  allowScrubbing: true,
                ),
              ],
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

class _ControlsOverlay extends StatelessWidget {
  final VideoPlayerController controller;

  const _ControlsOverlay({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 50),
          reverseDuration: const Duration(milliseconds: 200),
          child: controller.value.isPlaying
              ? const SizedBox.shrink()
              : Container(
                  color: Colors.black26,
                  child: const Center(
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 100.0,
                      semanticLabel: 'Play',
                    ),
                  ),
                ),
        ),
        GestureDetector(
          onTap: () {
            controller.value.isPlaying ? controller.pause() : controller.play();
          },
        ),
      ],
    );
  }
}
