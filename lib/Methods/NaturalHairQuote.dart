class Quote {
  final List<String> _quotes = [
    "There is no such thing as a one jar fits all solution for hair.",
    "Hair care is more than just the products you put in your hair.",
    "Having a product based approach for your hair, is like waxing the car, and expecting it to drive with an empty tank! No matter how shiny your car is, it needs FUEL to be able to drive.",
    "Hair care starts far before you can even see the hair.",
    "It is not about the Hair TYPE it is about the Hair NEED.",
    "Healthy hair comes from the inside.",
    "You need to give your body the building blocks it needs to make healthy hair.",
    "Your scalp is the feeding soil of your hair.",
    "Your scalp is where your hair is born.",
    "Your scalp is where the womb of your hair is.",
    "Your scalp is where your hair is fed.",
    "When it comes to hair growth, it seems as if people love to be lied to.",
    "Products DO NOT grow your hair! Nutrition DOES!",
    "Instead of mashing the avocado and putting it in your hair, try eating it.",
    "Oils and Butters do not moisturize your hair!",
    "Stop starving your hair, start feeding it."
  ];

  String getQuote(int quoteNumber) {
    return _quotes[quoteNumber];
  }

  int quoteLength() {
    return _quotes.length;
  }
}
