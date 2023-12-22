import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:profanity_filter/default_list.dart';
import 'package:profanity_filter/profanity_filter.dart';

class CustomProfanityFilter {
  final filter = ProfanityFilter();

  filteree() async {
    final String response =
        await rootBundle.loadString("assets/data/profanity_words.json");
    List<dynamic> words = jsonDecode(response);

    filter.wordsToFilterOutList = [
      ...defaultWordsToFilterOutList,
      ...words,
    ];
  }

  String censor(String stringToCensor) {
    filteree();
    return filter.censor(stringToCensor);
  }
}
