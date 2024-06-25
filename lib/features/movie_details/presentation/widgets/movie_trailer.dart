import 'package:flutter/material.dart';
import 'package:movies_app/core/theme_manager/color_manager.dart';
import 'package:movies_app/core/theme_manager/values_manager.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieTrailerWidget extends StatefulWidget {
  final String link;

  const MovieTrailerWidget({super.key, required this.link});

  @override
  State<MovieTrailerWidget> createState() => _MovieTrailerWidgetState();
}

class _MovieTrailerWidgetState extends State<MovieTrailerWidget> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    final videoId = YoutubePlayer.convertUrlToId(widget.link);
    _controller = YoutubePlayerController(
        initialVideoId: videoId!,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
        ));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final shadow = theme.brightness == Brightness.light ? ColorManager.black.withOpacity(0.5): ColorManager.white.withOpacity(0.2);
    return Container(
      width: AppSize.s300,
      height: AppSize.s420,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: shadow,
              blurRadius: 20,
              spreadRadius: 5),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          onReady: () => debugPrint('Ready'),
          bottomActions: [
            CurrentPosition(),
            ProgressBar(
                isExpanded: true,
                colors:  ProgressBarColors(
                  playedColor: ColorManager.amber,
                  handleColor: ColorManager.amberAccent,
                )),
            const PlaybackSpeedButton(),
          ],
        ),
      ),
    );
  }
}
