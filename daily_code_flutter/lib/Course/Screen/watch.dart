import 'package:flutter/material.dart';
import 'package:mobile_app/Course/Screen/video-player.dart';
// import 'package:mobile_app/video-player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:video_player/video_player.dart';

class Video extends StatefulWidget {
  const Video({Key? key}) : super(key: key);

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  late final YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    const url =
        "https://www.youtube.com/watch?v=BBAyRBTfsOU"; //if the instructur adds a youtube video...this would be its sample
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId("BBAyRBTfsOU")!,
    );

    // print()
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
        player: YoutubePlayer(
          showVideoProgressIndicator: true,
          controller: _controller,
          // onReady: () {},
        ),
        builder: (context, player) {
          return Scaffold(
            body:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              player,
              Container(
                margin: EdgeInsets.only(
                  top: 20,
                  left: 20,
                ),
                child: Text(
                  "Title",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(
                    top: 120,
                    left: 300,
                  ),
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 1, 28, 50))),
                      child: Text("Quiz"))),
            ]),
          );
        });
  }
}
