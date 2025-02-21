class QuestionBank {
  final Map<String, String> _questions = {
    "question1":
        "How often do you include foods high in protein (like beans, fish, eggs) in your diet?",
    "question2":
        "Do you take any supplements (e.g., vitamins, minerals) specifically for hair or general health?",
    "question3":
        "Which of these ingredients do you look for when choosing a hair product?",
    "question4":
        "Are you aware of any ingredients that might harm your hair’s health or cause dryness?",
    "question5":
        "Do you regularly massage your scalp or use scalp-specific treatments?",
    "question6": "How many hours of sleep do you usually get per night?",
    "question7":
        "Do you protect your hair at night with a silk scarf or pillowcase?",
    "question8": "How would you describe your stress levels on a daily basis?",
    "question9":
        "Do you have practices to manage stress, like exercise, meditation, or journaling?",
  };

  final Map<String, List<String>> _answer = {
    "answer1": ["Daily", "A few times a week", "Rarely", "Never"],
    "answer2": ["Yes", "Regularly", "Occasionally", "No"],
    "answer3": [
      "Castor Oil",
      "Coconut Oil",
      "Aloe vera",
      "Shea Butter",
      "Sodium Cocoyl Isethionate",
      "Cetyl Alcohol"
    ],
    "answer4": [
      "Sodium Lauryl Sulfate (SLS)",
      "Mineral Oil",
      "Sodium Laureth Sulphate",
      "Isopropyl Alcohol"
    ],
    "answer5": ["Yes", "Regularly", "Occasionally", "No"],
    "answer6": ["7-8 Hours", "5-6 Hours", "Less than 5 Hours"],
    "answer7": ["Yes, every night", "Sometimes", "Never"],
    "answer8": ["Low", "Moderate", "High"],
    "answer9": ["Yes, regularly", "Occasionally", "No"],
  };

  Map<String, String> getQuestion() {
    return _questions;
  }

  Map getAnswer() {
    return _answer;
  }
}
