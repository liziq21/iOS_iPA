import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final Function(String roomId) onLive;
  final Function(String? quray) onSearch;
  final Function(String mid) onUser;
  final Function(String id) onVideo;
  
  HomeScreen({
    super.key,
    required this.onLive,
    required this.onSearch,
    required this.onUser,
    required this.onVideo,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

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
      appBar: AppBar(title: const Text('Home')),
      body: Center(Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () => widget.onLive('230023'),
            child: const Text('onLive'),
          ),
          ElevatedButton(
            onPressed: () => widget.onSearch('quray'),
            child: const Text('onSearch'),
          ),
          ElevatedButton(
            onPressed: () => widget.onUser('188339'),
            child: const Text('onUser'),
          ),
          ElevatedButton(
            onPressed: () => widget.onVideo('33'),
            child: const Text('onSearch'),
          ),
      )),
    );
  }
}
