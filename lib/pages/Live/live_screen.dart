import 'package:flutter/material.dart';

class LiveScreen extends StatefulWidget {
  final VoidCallback? onBackClick;
  final String roomId;
  
  LiveScreen({
    super.key,
    this.onBackClick,
    required this.roomId,
  });

  @override
  State<LiveScreenState> createState() => _LiveScreenState();
}

class _LiveScreenState extends State<LiveScreen> {

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
      appBar: AppBar(title: const Text('Live')),
      body: Center(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('roomId: ${widget.roomId}'),
          ElevatedButton(
            onPressed: widget.onBackClick,
            child: const Text('Back'),
          ),
        ],
      ),
    );
  }
}
