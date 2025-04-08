import '../../../../imports.dart';

class NutritionModal extends StatelessWidget {
  NutritionModal({super.key, this.text1, this.text2, this.text3, this.text4});

  String? text1;
  String? text2;
  Widget? text3;
  Widget? text4;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (text1 != null)
            Text(
              text1!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w900,
              ),
            ),
          SizedBox(height: 20),
          if (text2 != null)
            Text(
              text2!,
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          SizedBox(height: 20),
          if (text3 != null) text3!,
          if (text4 != null) text4!
        ],
      ),
    );
  }
}
