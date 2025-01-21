import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoView extends StatefulWidget {
  const VideoView({super.key});

  @override
  State<VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  late VideoPlayerController _controller;
  bool isMuted = false;
  bool showControls = false;
  double playbackSpeed = 1.0;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(
        'https://storage.googleapis.com/kapiva-assets/chronic-theme-pdp/videos/dia_free_testimonial_1.mp4'))
      ..initialize().then((_) {
        setState(() {});
        _controller.setLooping(true);
        _controller.addListener(_onVideoPlayerStateChanged);
      });
  }

  void _onVideoPlayerStateChanged() {
    if (_controller.value.isInitialized && mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_onVideoPlayerStateChanged);
    _controller.dispose();
    super.dispose();
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return hours == "00" ? "$minutes:$seconds" : "$hours:$minutes:$seconds";
  }

  void _hideControlsAfterDelay() async {
    await Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          showControls = false;
        });
      }
    });
  }

  controlPlay() {
    setState(() {
      showControls = true;
      if (_controller.value.isPlaying) {
        _controller.pause();
      } else {
        _controller.play();
        _hideControlsAfterDelay();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Video Player with Overlay Controls')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 4,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: SizedBox(
              height: 500,
              child: Column(
                children: [
                  videoPlayerWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  videoPlayerWidget() {
    return SizedBox(
      height: 190,
      width: 230,
      child: GestureDetector(
        onTap: () {
          controlPlay();
        },
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              color: Colors.green,
              child: _controller.value.isInitialized
                  ? VideoPlayer(_controller)
                  : const Center(child: CircularProgressIndicator()),
            ),
            if (showControls) videoPlayerControls()
          ],
        ),
      ),
    );
  }

  videoPlayerControls() {
    double screenHeight = MediaQuery.of(context).size.height;
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            VideoProgressIndicator(
              _controller,
              allowScrubbing: true,
              colors: VideoProgressColors(
                playedColor: Colors.blue,
                bufferedColor: Colors.grey,
                backgroundColor: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(
                    _controller.value.isPlaying
                        ? Icons.pause
                        : Icons.play_arrow,
                    color: Colors.white,
                    size: 16,
                  ),
                  onPressed: () {
                    controlPlay();
                  },
                ),
                Text(
                  formatDuration(_controller.value.position),
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                ),
                IconButton(
                  icon: Icon(
                    isMuted ? Icons.volume_off : Icons.volume_up,
                    color: Colors.white,
                    size: 16,
                  ),
                  onPressed: () {
                    setState(() {
                      isMuted = !isMuted;
                      _controller.setVolume(isMuted ? 0.0 : 1.0);
                    });
                  },
                ),
                PopupMenuButton<String>(
                  icon: const Icon(
                    Icons.more_vert,
                    color: Colors.white,
                    size: 16,
                  ),
                  onSelected: (value) {
                    if (value == 'Download') {
                      // Implement download functionality
                    } else if (value == 'PIP') {
                      // Implement picture-in-picture functionality
                    }
                  },
                  itemBuilder: (BuildContext context) {
                    return [
                      PopupMenuItem<String>(
                        value: 'Speed',
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Playback Speed',
                              style: TextStyle(fontSize: 12),
                            ),
                            PopupMenuButton<double>(
                              onSelected: (value) {
                                setState(() {
                                  playbackSpeed = value;
                                  _controller.setPlaybackSpeed(playbackSpeed);
                                });
                              },
                              itemBuilder: (context) {
                                return [0.5, 1.0, 1.5, 2.0]
                                    .map((speed) => PopupMenuItem<double>(
                                          value: speed,
                                          child: Text('${speed}x'),
                                        ))
                                    .toList();
                              },
                              icon: const Icon(
                                Icons.arrow_right,
                                size: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      PopupMenuItem<String>(
                        value: 'Download',
                        child: const Text(
                          'Download',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      PopupMenuItem<String>(
                        value: 'PIP',
                        child: const Text(
                          'Picture in Picture',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ];
                  },
                  offset: Offset(0, -screenHeight * 0.15),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
