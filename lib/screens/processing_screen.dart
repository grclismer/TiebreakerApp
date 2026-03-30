import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/decisions_service.dart';
import 'result_screen.dart';

class ProcessingScreen extends StatefulWidget {

  final  String decision;
  const ProcessingScreen({required this.decision, super.key});

  @override
  State<ProcessingScreen> createState() => _ProcessingScreenState();


}

class _ProcessingScreenState extends State<ProcessingScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final ds = Provider.of<DecisionsService>(context, listen: false);

      await ds.analyzeDecision(widget.decision);
      if (mounted && ds.errormessage == null) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const ResultsScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }

}