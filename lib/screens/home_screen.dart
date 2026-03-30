import 'package:flutter/material.dart';
import 'processing_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('The TieBreaker')),
      body: Padding(
          padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(labelText: 'What Decision are you making? '),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
                onPressed: (){
                  if (_controller.text.isNotEmpty){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (_) =>ProcessingScreen(decision: _controller.text)
                    ));
                  }
                },
                child: const Text('Help me decide'),
            ),
          ],
        ),
      ),
    );
  }

}