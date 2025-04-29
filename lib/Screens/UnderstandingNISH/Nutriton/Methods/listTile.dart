import '../../../../imports.dart';

class listviewBuilder extends StatefulWidget {
  listviewBuilder({
    super.key,
    required this.optionsQuestion,
    required this.answer,
    required this.onChanged,
  });

  List<String> optionsQuestion;
  String? answer;
  final Function(String?) onChanged;

  @override
  State<listviewBuilder> createState() => _listviewBuilderState();
}

class _listviewBuilderState extends State<listviewBuilder> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        itemCount: widget.optionsQuestion.length,
        itemBuilder: (context, index) {
          final item = widget.optionsQuestion[index];
          return RadioListTile<String>(
            activeColor: Colors.white,
            tileColor: Colors.white,
            title: Text(
              item,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            value: item,
            groupValue: widget.answer,
            onChanged: widget.onChanged,
          );
        },
      ),
    );
  }
}
