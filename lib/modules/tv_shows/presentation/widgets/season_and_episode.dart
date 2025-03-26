import 'package:flutter/material.dart';

class SeasonAndEpisode extends StatelessWidget {
  final String seasonSrt;
  final String episodeSrt;

  const SeasonAndEpisode({super.key, required this.seasonSrt, required this.episodeSrt});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(seasonSrt, style: const TextStyle(color: Color(0xFFFBFFFF),),),
        const SizedBox(width: 4),
        const Text('-', style: TextStyle(color: Color(0xFFFBFFFF),),),
        const SizedBox(width: 4),
        Text(episodeSrt, style: const TextStyle(color: Color(0xFFFBFFFF),),),
      ],
    );
  }
}
