import 'package:flutter/material.dart';

class UserScreen extends StatefulWidget {
  final VoidCallback? onBackClick;
  final String mid;
  
  UserScreen({
    super.key,
    this.onBackClick,
    required this.mid,
  });

  @override
  State<UserScreenState> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {

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
      appBar: AppBar(title: const Text('User')),
      body: Center(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(': ${widget.mid}'),
          ElevatedButton(
            onPressed: widget.onBackClick,
            child: const Text('Back'),
          ),
        ],
      ),
    );
  }
}
