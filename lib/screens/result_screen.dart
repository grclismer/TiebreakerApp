import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import '../services/decisions_service.dart';

class ResultsScreen extends StatelessWidget {

  const ResultsScreen({super.key});



@override
Widget build(BuildContext context) {


  final result = Provider.of<DecisionsService>(context).currentResult;

  return DefaultTabController(
    length: 3,
    child: Scaffold(
      appBar: AppBar(
        title: const Text('Analysis Results'),
        bottom: const TabBar(
          tabs: [
            Tab(text: 'Pros/Cons'),
            Tab(text: 'Comparison'),
            Tab(text: 'SWOT'),
          ],
        ),
    ),
        body: TabBarView(
            children: [
              Markdown(data: result!.prosAndCons),
              Markdown(data: result!.comparisonTable),
              Markdown(data: result!.swotAnalysis),
            ],
        ),
        ),
  );
  }
}
