import 'package:flutter/material.dart';
import 'package:natural_hair_therapist/Methods/Country.dart';
import 'package:natural_hair_therapist/Methods/ProviderPackage.dart';
import 'package:provider/provider.dart';

import '../Constants.dart';
import '../Methods/InputDecoration.dart';

class AutoCompleteCountries extends StatefulWidget {
  @override
  State<AutoCompleteCountries> createState() => _AutoCompleteCountriesState();
}

class _AutoCompleteCountriesState extends State<AutoCompleteCountries> {
  @override
  Countries countries = Countries();

  @override
  Widget build(BuildContext context) {
    List<String> _countries = countries.getCountries();
    return auto(countries: _countries);
  }
}

class auto extends StatefulWidget {
  auto({
    super.key,
    required List<String> countries,
  }) : _countries = countries;

  final List<String> _countries;
  void clear() {}

  @override
  State<auto> createState() => _autoState();
}

class _autoState extends State<auto> {
  @override
  Widget build(BuildContext context) {
    String message = "";
    return Autocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text.isEmpty) {
          return const Iterable<String>.empty();
        }
        return widget._countries.where((String country) {
          return country
              .toLowerCase()
              .contains(textEditingValue.text.toLowerCase());
        });
      },
      onSelected: (String selection) {
        Provider.of<ProviderClass>(context, listen: false)
            .setCountry(selection);

        // selectedCountry=selection;
        debugPrint('You just selected $selection');
        print(selection);
      },
      fieldViewBuilder: (BuildContext context,
          TextEditingController textEditingController,
          FocusNode focusNode,
          VoidCallback onFieldSubmitted) {
        return TextField(
          controller: textEditingController,
          focusNode: focusNode,
          onChanged: (String newMess) {
            print("i am $message");
          },
          decoration: InputDecor(
            "Country",
            "country:",
            const Icon(
              Icons.location_city,
              color: kPrimaryColor,
            ),
          ),
        );
      },
    );
  }
}
