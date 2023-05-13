import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webtoon/models/webtoon_episode_model.dart';

class Episode extends StatelessWidget {
  const Episode({
    super.key,
    required this.episode,
    required this.webtoon_Id,
  });

  final WebtoonEpisodeModel episode;
  final String webtoon_Id;

  onButtonTap() async {
    final url = Uri.parse(
        "https://comic.naver.com/webtoon/detail?titleId=$webtoon_Id&no=${episode.id}");
    await launchUrl(url);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButtonTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.green.shade300),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(episode.title, style: const TextStyle(color: Colors.white)),
              const Icon(
                Icons.chevron_right_rounded,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
