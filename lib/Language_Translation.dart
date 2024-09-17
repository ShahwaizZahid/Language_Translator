import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class MyLanguageTranslationPage extends StatefulWidget {
  const MyLanguageTranslationPage({super.key});
  @override
  State<MyLanguageTranslationPage> createState() =>
      _MyLanguageTranslationPageState();
}

class _MyLanguageTranslationPageState extends State<MyLanguageTranslationPage> {
  var languages = [
    "Hindi",
    "English",
    "Arabic",
    "Chinese",
    "Urdu",
    "Spanish",
    "French",
    "Russian",
    "German",
    "Japanese",
    "Korean",
    "Italian",
    "Portuguese",
    "Turkish",
    "Dutch",
    "Swedish",
    "Danish",
    "Norwegian",
    "Finnish"
  ];
  var originalLanguage = "From";
  var destinationLanguage = "To";
  var output = "";

  TextEditingController languageController = TextEditingController();

  void translate(String src, String dest, String input) async {
    GoogleTranslator translator = new GoogleTranslator();
    var translation = await translator.translate(input, from: src, to: dest);
    setState(() {
      output = translation.text;
    });

    if (src == '--' || dest == '--') {
      output = "fail to translate";
    }
  }

  String getLanguageCode(String language) {
    if (language == "English") {
      return "en";
    } else if (language == "Hindi") {
      return "hi";
    } else if (language == "Arabic") {
      return "ar";
    } else if (language == "Chinese") {
      return "zh-cn";
    } else if (language == "Urdu") {
      return "ur";
    } else if (language == "Spanish") {
      return "es";
    } else if (language == "French") {
      return "fr";
    } else if (language == "Russian") {
      return "ru";
    } else if (language == "German") {
      return "de"; // German language code
    } else if (language == "Japanese") {
      return "ja"; // Japanese language code
    } else if (language == "Korean") {
      return "ko"; // Korean language code
    } else if (language == "Italian") {
      return "it"; // Italian language code
    } else if (language == "Portuguese") {
      return "pt"; // Portuguese language code
    } else if (language == "Turkish") {
      return "tr"; // Turkish language code
    } else if (language == "Dutch") {
      return "nl"; // Dutch language code
    } else if (language == "Swedish") {
      return "sv"; // Swedish language code
    } else if (language == "Danish") {
      return "da"; // Danish language code
    } else if (language == "Norwegian") {
      return "no"; // Norwegian language code
    } else if (language == "Finnish") {
      return "fi"; // Finnish language code
    } else {
      return "--";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff142e57),
      appBar: AppBar(
        title: const Text("Language Translation"),
        centerTitle: true,
        backgroundColor: const Color(0xff10223d),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownButton(
                  focusColor: Colors.white,
                  iconDisabledColor: Colors.white,
                  iconEnabledColor: Colors.white,
                  hint: Text(
                    originalLanguage,
                    style: const TextStyle(color: Colors.white),
                  ),
                  dropdownColor: Colors.white,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: languages.map((String value) {
                    return DropdownMenuItem<String>(
                        value: value, child: Text(value));
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      originalLanguage = newValue!; // Update the selected value
                    },
                    );
                  },
                ),
                const SizedBox(width: 40),
                const Icon(
                  Icons.arrow_right_alt_outlined,
                  color: Colors.white,
                  size: 40,
                ),
                const SizedBox(width: 40),
                DropdownButton(
                  focusColor: Colors.white,
                  iconDisabledColor: Colors.white,
                  iconEnabledColor: Colors.white,
                  hint: Text(
                    destinationLanguage,
                    style: const TextStyle(color: Colors.white),
                  ),
                  dropdownColor: Colors.white,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: languages.map((String value) {
                    return DropdownMenuItem<String>(
                        value: value, child: Text(value));
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      destinationLanguage = newValue!;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: languageController,
                maxLines: 10,
                cursorColor: Colors.white,
                autofocus: false,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: "Please enter your text..",
                  labelStyle: TextStyle(fontSize: 15, color: Colors.white),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.white)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.white),
                  ),
                  errorStyle: TextStyle(color: Colors.red, fontSize: 15),
                  alignLabelWithHint: true,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter the text';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff2b3c5a),
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  translate(
                      getLanguageCode(originalLanguage),
                      getLanguageCode(destinationLanguage),
                      languageController.text);
                },
                child: const Text("Translate")),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                output,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
