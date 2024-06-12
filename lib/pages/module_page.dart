import 'package:flutter/material.dart';
import '../utilities/video_player_screen.dart';

class VideoListPage extends StatefulWidget {
  @override
  _VideoListPageState createState() => _VideoListPageState();
}

class _VideoListPageState extends State<VideoListPage> {
  List<Map<String, String>> videoList = [
    {
      "title": "Karakteristik Saham",
      "description": "Bagaimana Saham digunakan.",
      "thumbnailUrl": "assets/images/thumbnail3",
      "videoUrl": "assets/videos/video3.mp4" // Path to the local video
    },
    {
      "title": "Flutter Tutorial 2",
      "description": "This is the second tutorial on Flutter.",
      "thumbnailUrl": "assets/images/thumbnail2",
      "videoUrl": "assets/videos/video2.mp4" // Path to the local video
    },
    {
      "title": "Flutter Tutorial 2",
      "description": "This is the second tutorial on Flutter.",
      "thumbnailUrl": "assets/images/thumbnail2",
      "videoUrl": "assets/videos/video2.mp4" // Path to the local video
    }
    // Add more videos as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Tutorials'),
      ),
      body: ListView.builder(
        itemCount: videoList.length,
        itemBuilder: (_, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  videoList[index]['thumbnailUrl']!,
                  width: double.infinity,
                  height: 150,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    videoList[index]['title']!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    videoList[index]['description']!,
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VideoPlayerScreen(
                            videoUrl: videoList[index]['videoUrl']!,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // background (button) color
                      foregroundColor: Colors.white, // foreground (text) color
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.play_arrow),
                        SizedBox(width: 4),
                        Text('Play'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
