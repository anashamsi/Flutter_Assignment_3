import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

List reels = const [
  'assets/videos/reels3.mp4',
  'assets/videos/reels2.mp4',
  'assets/videos/fbreels.mp4',
];

class ReelsScreen extends StatelessWidget {
  const ReelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: reels.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (c, i) {
          return SingleReel(v: reels[i]);
        },
      ),
    );
  }
}

class SingleReel extends StatefulWidget {
  final String v;

  const SingleReel({super.key, required this.v});

  @override
  State<SingleReel> createState() => _SingleReelState();
}

class _SingleReelState extends State<SingleReel> {
  late VideoPlayerController p;
  ChewieController? ch;
  bool done = false;

  @override
  void initState() {
    super.initState();
    playNow();
  }

  void playNow() async {
    p = VideoPlayerController.asset(widget.v);
    await p.initialize();
    ch = ChewieController(
      videoPlayerController: p,
      autoPlay: true,
      looping: true,
      showControls: false,
    );
    p.play();
    if (mounted) {
      setState(() {
        done = true;
      });
    }
  }

  @override
  void dispose() {
    ch?.dispose();
    p.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        done
            ? Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.black,
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: p.value.size.width,
                    height: p.value.size.height,
                    child: Chewie(controller: ch!),
                  ),
                ),
              )
            : const Center(child: CircularProgressIndicator()),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25, left: 10, right: 10),
              child: Row(
                children: [
                  const Text(
                    'Reels',
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search, color: Colors.white),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.camera_alt, color: Colors.white),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.person, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          right: 5,
          bottom: 50,
          child: Column(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.thumb_up_alt, color: Colors.white),
              ),
              const SizedBox(height: 10),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.comment, color: Colors.white),
              ),
              const SizedBox(height: 10),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.share, color: Colors.white),
              ),
              const SizedBox(height: 10),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert, color: Colors.white),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 70,
          left: 18,
          child: Row(
            children: [
              InkWell(
                onTap: () {},
                child: const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/logo.jpg'),
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                'Cricket videos',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
