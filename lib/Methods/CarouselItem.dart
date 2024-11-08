import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:natural_hair_therapist/Constants.dart';

class CarouselItem extends StatelessWidget {
  CarouselItem({
    super.key,
  });
  List<Map<String, String>> blogs = [
    {
      "title": "Hair loss",
      "body": "gd usgd ghfdgh fghhdgdh fghdgh fggdhd fgdhgdhg"
    },
    {
      "title": "Hair loss2",
      "body": "gd usgd ghfdgh fghhdgdh fghdgh fggdhd fgdhgdhg"
    },
    {
      "title": "Hair loss3",
      "body": "gd usgd ghfdgh fghhdgdh fghdgh fggdhd fgdhgdhg"
    },
    {
      "title": "Hair loss4",
      "body": "gd usgd ghfdgh fghhdgdh fghdgh fggdhd fgdhgdhg"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(height: 150.0),
      items: blogs.map((blog) {
        return Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: () {
                print(blog["title"]);
              },
              child: Container(
                width: 200, // Set the width of the container
                height: 100, // Set the height of the container
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), // Rounded corners
                  color: kPrimaryColor,
                  // gradient: LinearGradient(
                  //   colors: [kPrimaryColor, Colors.lightGreenAccent],
                  //   begin: Alignment.topLeft,
                  //   end: Alignment.bottomRight,
                  // ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: Offset(0, 5), // Changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      blog["title"]!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      blog["body"]!,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
