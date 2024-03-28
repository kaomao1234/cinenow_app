import 'dart:developer';

import 'package:cinenow_app/models/index.dart';
import 'package:cinenow_app/utils/index.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailMovieBody extends StatefulWidget {
  MovieDetailsData movieDetailsData;
  DetailMovieBody({required this.movieDetailsData, super.key});

  @override
  State<DetailMovieBody> createState() => _DetailMovieBodyState();
}

class _DetailMovieBodyState extends State<DetailMovieBody> {
  late YoutubePlayerController _controller;
  late AdaptiveSize _adaptiveSize;
  late YoutubePlayer _player;
  @override
  void initState() {
    _adaptiveSize = AdaptiveSize(context);
    super.initState();
    _controller = YoutubePlayerController(
        initialVideoId: widget.movieDetailsData.trailerUrl,
        flags: YoutubePlayerFlags(
          autoPlay: false,
        ))
      ..addListener(() {
        if (_controller.value.isFullScreen) {
          _controller.toggleFullScreenMode();
        }
      });
    _player = YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
      progressIndicatorColor: Colors.amber,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
            child: Image.asset(
          widget.movieDetailsData.imageUrl,
          fit: BoxFit.cover,
        )),
        Positioned.fill(
            child: Container(
                decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.transparent,
              Colors.black.withOpacity(0.9),
              Colors.black.withOpacity(1)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ))),
        Positioned.fill(
            child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                width: _adaptiveSize.getWidthPercent(100),
                color: Colors.amber,
                child: _player,
                height: 200,
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Text(
                      'Storyline',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.movieDetailsData.storyLine,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w300),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: _adaptiveSize.getWidthPercent(100),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text.rich(
                            textAlign: TextAlign.left,
                            TextSpan(children: [
                              const TextSpan(
                                  text: "Director:",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w700)),
                              const TextSpan(text: "  "),
                              TextSpan(
                                  text: widget.movieDetailsData.director,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500))
                            ])),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: _adaptiveSize.getWidthPercent(100),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text.rich(
                            textAlign: TextAlign.left,
                            TextSpan(children: [
                              const TextSpan(
                                  text: "Writers:",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w700)),
                              const TextSpan(text: "  "),
                              TextSpan(
                                  text: widget.movieDetailsData.writers,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500))
                            ])),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: _adaptiveSize.getWidthPercent(100),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text.rich(
                            textAlign: TextAlign.left,
                            TextSpan(children: [
                              const TextSpan(
                                  text: "Stars",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w700)),
                              const TextSpan(text: "  "),
                              TextSpan(
                                  text: widget.movieDetailsData.stars,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500))
                            ])),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ))
      ],
    );
  }
}
