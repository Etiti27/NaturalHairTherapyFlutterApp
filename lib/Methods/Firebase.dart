import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';

import 'AiHttpMethod.dart';

class FirebaseMethods {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String _errorMessage = "";
  String _response = "";
  String userName = "";
  final OpenAIService _openAIService = OpenAIService();
  bool isLoading = true;

  Future<void> getResponse(String userInput) async {
    try {
      // Convert user input into a list of words
      final List<String> userInputWords = userInput.toLowerCase().split(' ');

      // Fetch all predefined questions from Firestore
      final querySnapshot =
          await FirebaseFirestore.instance.collection('questions').get();

      String? bestMatchAnswer;

      for (var doc in querySnapshot.docs) {
        final predefinedQuestion = doc['question'].toString().toLowerCase();
        final predefinedAnswer = doc['answer'].toString();

        // Count the number of words that match in the predefined question
        int matchCount = 0;
        for (String word in userInputWords) {
          if (predefinedQuestion.contains(word)) {
            matchCount++;
          }
        }

        // Check if at least three words match
        if (matchCount >= 3) {
          bestMatchAnswer = predefinedAnswer;
          break; // Stop the loop once a match is found
        }
      }

      if (bestMatchAnswer != null) {
        isLoading = false;
        // Use OpenAI API to generate a refined response
        final aiResponse =
            await _openAIService.generateResponse(userInput, bestMatchAnswer);
        _response = aiResponse;
      } else {
        isLoading = false;
        _response =
            "No answer found. Please consult with Janine, she is a specialist.";
      }
    } catch (e) {
      _response = 'Error: $e';
    }
  }

  // sign in
  Future<void> signing(String email, String password) async {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      _errorMessage = e.message!;
    }
  }

  // Registration
  Future<void> register(String name, String email, String password,
      String country, String DOB) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = userCredential.user;
      if (user != null) {
        Map<String, dynamic> profileDetails = {
          "name": name,
          "email": email,
          "country": country,
          "Date of Birth": DOB
        };
        await firestore.collection("profile").add(profileDetails);
      }
    } on FirebaseAuthException catch (e) {
      print("error is: ${e.message}");
      _errorMessage = e.message!;
    }
  }

  String getErrorMessage() {
    return _errorMessage;
  }

  String getResponseMessage() {
    return _response;
  }

  bool getIsLoading() {
    return isLoading;
  }

  // Get current user
  getCurrentUser() {
    User? user = auth.currentUser;
    if (user != null) {
      return user.email;
    } else {
      return "no user";
    }
  }

  Future<void> setCurrentUserName() async {
    final QuerySnapshot = await firestore.collection("profile").get();
    for (var docs in QuerySnapshot.docs) {
      if (docs["email"] == getCurrentUser()) {
        userName = docs["name"];
      }
    }
  }

  String getCurrentUserName() {
    return userName.toUpperCase();
  }
}
