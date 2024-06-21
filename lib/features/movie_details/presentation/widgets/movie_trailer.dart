// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';
//
// class MovieTrailerWidget extends StatefulWidget {
//   const MovieTrailerWidget({super.key});
//
//   @override
//   State<MovieTrailerWidget> createState() => _MovieTrailerWidgetState();
// }
//
// class _MovieTrailerWidgetState extends State<MovieTrailerWidget> {
//   final videoUrl = "https://www.youtube.com/embed/NmzuHjWmXOc";
//   late YoutubePlayerController _controller;
//
//   @override
//   void initState() {
//     final videoId = YoutubePlayer.convertUrlToId(videoUrl) ;
//     _controller = YoutubePlayerController(initialVideoId: videoId!,
//     flags: const YoutubePlayerFlags(
//       autoPlay: false,
//     ));
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         YoutubePlayer(
//           controller: _controller,
//           showVideoProgressIndicator: true,
//           onReady: () => debugPrint('Ready'),
//           bottomActions: [
//             CurrentPosition(),
//             ProgressBar(
//               isExpanded: true,
//               colors: const ProgressBarColors(
//                 playedColor: Colors.amber,
//                 handleColor: Colors.amberAccent,
//               )
//             ),
//             const PlaybackSpeedButton()
//
//           ],
//
//         ),
//       ],
//     );
//   }
// }
