import 'package:flutter/material.dart';
import 'package:pages/fullscreen.dart';
import 'package:video_player/video_player.dart';

class VideoView extends StatefulWidget {
  const VideoView({super.key});

  @override
  State<VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  late VideoPlayerController _controller;
  bool isMuted = false;
  bool showControls = true;
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
      body: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
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
              child: _controller.value.isInitialized
                  ? VideoPlayer(_controller)
                  : const Center(child: CircularProgressIndicator()),
            ),
            if (showControls) videoPlayerControls(),
            AnimatedOpacity(
              opacity: showControls ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
              child: Center(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: Container(
                    width: 40,
                    height: 40,
                    key: ValueKey<bool>(_controller.value.isPlaying),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.4),
                        shape: BoxShape.circle),
                    child: IconButton(
                      onPressed: () {
                        controlPlay();
                      },
                      icon: Icon(
                        _controller.value.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  videoPlayerControls() {
    return Container(
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.black.withOpacity(1), Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20, right: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  formatDuration(_controller.value.position),
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
                InkWell(
                  child: Icon(
                    isMuted ? Icons.volume_off : Icons.volume_up,
                    color: Colors.white,
                    size: 15,
                  ),
                  onTap: () {
                    setState(() {
                      isMuted = !isMuted;
                      _controller.setVolume(isMuted ? 0.0 : 1.0);
                    });
                  },
                ),
                InkWell(
                  child: const Icon(
                    Icons.fullscreen,
                    color: Colors.white,
                    size: 15,
                  ),
                  onTap: () {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              FullscreenVideoPage(controller: _controller),
                        ),
                      );
                    });
                  },
                ),
                InkWell(
                  onTap: () async {
                    final RenderBox overlay = Overlay.of(context)!
                        .context
                        .findRenderObject() as RenderBox;
                    final result = await showMenu<String>(
                      context: context,
                      position: RelativeRect.fromLTRB(
                        0, // Position it where you want
                        0, // You can adjust this value for vertical alignment
                        0,
                        0,
                      ),
                      items: <PopupMenuEntry<String>>[
                        PopupMenuItem<String>(
                          value: 'Download',
                          child: const Text('Download',
                              style: TextStyle(fontSize: 12)),
                        ),
                        PopupMenuItem<String>(
                          value: 'Speed',
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text('Playback Speed',
                                  style: TextStyle(fontSize: 12)),
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
                          value: 'PIP',
                          child: const Text('Picture in Picture',
                              style: TextStyle(fontSize: 12)),
                        ),
                      ],
                    );

                    if (result != null) {
                      if (result == 'Download') {
                        // Handle the download action
                      } else if (result == 'PIP') {
                        // Handle the Picture in Picture action
                      }
                    }
                  },
                  child: const Icon(
                    Icons.more_vert,
                    color: Colors.white,
                    size: 15,
                  ),
                ),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 4)),
          Padding(
            padding: const EdgeInsets.only(bottom: 15, left: 18, right: 18),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: VideoProgressIndicator(
                padding: EdgeInsets.zero,
                _controller,
                allowScrubbing: true,
                colors: VideoProgressColors(
                  playedColor: Colors.white,
                  bufferedColor: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
