import 'package:flutter/material.dart';

class VideoScreen extends StatefulWidget {
  final VoidCallback? onBackClick;
  final String id;
  
  const VideoScreen({
    super.key,
    this.onBackClick,
    required this.id,
  });

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {

  @override
  void initState() {
    super.initState();
  }
  
  @override
  void dispose() {
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Video')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('id: ${widget.id}'),
            ElevatedButton(
              onPressed: widget.onBackClick,
              child: const Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
