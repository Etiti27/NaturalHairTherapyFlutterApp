class Question {
  final Map<String, dynamic> _questionAndAnswer = {
    "What is Flutter?":
        "Flutter is an open-source UI software development toolkit created by Google.",
    "How to use StatefulWidget in Flutter?":
        "StatefulWidget is a widget that has mutable state. You can use setState to rebuild it with a new state.",
    "What is Dart?":
        "Dart is a programming language optimized for building mobile, desktop, server, and web applications.",
    "How to make an HTTP request in Flutter?":
        "You can use the http package to make HTTP requests in Flutter.",
  };

  String findBestMatch(String userInput) {
    userInput = userInput
        .toLowerCase(); // Convert to lowercase for case-insensitive matching
    List<String> userWords =
        userInput.split(' '); // Split user input into words

    String? bestMatch;
    int maxWordMatches = 0; // Track the maximum word matches

    for (String question in _questionAndAnswer.keys) {
      List<String> questionWords =
          question.toLowerCase().split(' '); // Split question into words

      // Count the number of matching words
      int wordMatches = 0;
      for (String word in userWords) {
        if (questionWords.contains(word)) {
          wordMatches++;
        }
      }

      // If the number of word matches is greater than 3, consider it a match
      if (wordMatches > 3 && wordMatches > maxWordMatches) {
        maxWordMatches = wordMatches;
        bestMatch = question;
      }
    }

    return bestMatch != null
        ? _questionAndAnswer[bestMatch]!
        : "Sorry, I couldn't find an answer to that question.";
  }
}
