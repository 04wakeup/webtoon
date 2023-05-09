import 'package:flutter/material.dart';
import 'package:webtoon/models/webtoon_episode_model.dart';
import 'package:webtoon/services/api_service.dart';

import '../models/webtoon_detail_model.dart';

class DetailsScreen extends StatefulWidget {
  final String title, thumb, id;
  const DetailsScreen({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late Future<WebtoonDetailModel> webtoon;
  late Future<List<WebtoonEpisodeModel>> episodes;

  @override
  void initState() {
    super.initState();
    webtoon = ApiService.getToonById(widget.id);
    episodes = ApiService.getLatestEpisodesById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        foregroundColor: Colors.green,
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: widget.id,
                child: Container(
                  width: 250,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          offset: const Offset(0, 0),
                          color: Colors.black.withOpacity(0.5),
                        )
                      ]),
                  child: Image.network(
                    widget.thumb,
                    headers: const {
                      "User-Agent":
                          "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36",
                    },
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          FutureBuilder(
            future: webtoon,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        snapshot.data!.about,
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        '${snapshot.data!.genre} / ${snapshot.data!.age}',
                        style: const TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                );
              }
              return const Text('...');
            },
          )
        ],
      ),
    );
  }
}
