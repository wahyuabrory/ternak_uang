import 'package:flutter/material.dart';
import 'package:youtube_api/youtube_api.dart';

class VideoListPage extends StatefulWidget {
  @override
  _VideoListPageState createState() => _VideoListPageState();
}

class _VideoListPageState extends State<VideoListPage> {
  late YoutubeAPI ytApi;
  late List ytResult; // Declare ytResult as a List<YT_API>

  @override
  void initState() {
    super.initState();
    ytApi =
        YoutubeAPI('YOUR_API_KEY'); // Replace with your YouTube Data API key
    ytResult = []; // Initialize ytResult as an empty list
    fetchVideos();
  }

  void fetchVideos() async {
    ytResult = await ytApi.search('Flutter tutorials', type: 'video');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Tutorials'),
      ),
      body: ListView.builder(
        itemCount: ytResult.length,
        itemBuilder: (_, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 4,
            child: ListTile(
              leading:
                  Image.network(ytResult[index].thumbnail['default']['url']),
              title: Text(ytResult[index].title),
              subtitle: Text('Duration: ${ytResult[index].duration}'),
              onTap: () {
                // Open the YouTube video link
                String videoUrl =
                    'https://www.youtube.com/watch?v=${ytResult[index].id}';
                // Open the video link using url_launcher package or any other method
                // For example:
                // launch(videoUrl);
                print('Opening video: $videoUrl');
              },
            ),
          ),
        ),
      ),
    );
  }
}
