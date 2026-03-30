import 'package:flutter/foundation.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import '../models/decisions_result.dart';

class DecisionsService extends ChangeNotifier {
  DecisionsResult? currentResult;
  bool isLoading = false;
  String? errormessage;

  final String _apikey = "";

  Future<void> analyzeDecision (String decisionPrompt) async {
    isLoading = true;
    errormessage = null;
    notifyListeners();


  try {
    final model = GenerativeModel(model: 'gemini-2.5-flash', apiKey: _apikey);
    final prompt = '''

    You are an expert decision-maker. The user is trying to make a decision "$decisionPrompt".
    Please provide exactly 3 sections of markdown:
    1. - Provide Pros and Cons -
    Provide a detailed pros and cons list.
    2. - Comparison Table -
    If applicable, provide a comparison table comparing the main alternatives.
    3. - SWOT analysis -
    Provide a SWOT (Strengths, Weakness, Opportunities, Threats) Analysis for the Decisions.
    
    Ensure the markdown is well-formatted and easy to read. Do not include extra text outside of these headers.

    ''';

    final response = await model.generateContent([Content.text(prompt)]);

    currentResult = _parceResponse(response.text ?? '', decisionPrompt);
  } catch (e) {
  errormessage = 'Failed: $e';
  } finally {
    isLoading = false;
    notifyListeners();
  }
}

DecisionsResult _parceResponse(String text, String decision){
  final parts = text.split('####');
  return DecisionsResult(
      decisions: decision,
      prosAndCons: parts.length > 1 ? parts[1]: text,
      comparisonTable: parts.length > 2 ? parts[2]: "NO TABLE",
      swotAnalysis: parts.length > 3 ? parts[3]: "NO SWOT",
  );
  }
}