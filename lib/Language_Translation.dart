import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class MyLanguageTranslationPage extends StatefulWidget{
  const MyLanguageTranslationPage({super.key});
  @override
  State<MyLanguageTranslationPage> createState() => _MyLanguageTranslationPageState();
}

class _MyLanguageTranslationPageState extends State<MyLanguageTranslationPage> {
  var languages = ["Hindi", "English", "Arabic","Chinese","Urdu","Spanish","French","Russian"];
  var originalLanguage = "From";
  var destinationLanguage = "To";
  var output = "";

  TextEditingController languageController = TextEditingController();


  void translate(String src , String dest , String input) async{
GoogleTranslator translator = new GoogleTranslator();
var translation = await translator.translate(input, from: src, to: dest);
setState(() {
  output = translation.text;
});

if(src == '--' || dest == '--'){
  output= "fail to translate";
}
  }

  String getLanguageCode (String language){
    if(language == "English"){
      return "en";
    }else if(language == "Hindi"){
      return "hi";
    }else if(language == "Arabic"){
      return "ar";
    }else if(language == "Chinese") {
      return "zh-cn";
    }else if (language == "Urdu") {
      return "ur"; // Urdu language code
    }else if (language == "Spanish") {
      return "es"; // Urdu language code
    }else if (language == "French") {
      return "fr"; // Urdu language code
    }else if (language == "Russian") {
      return "ru"; // Urdu language code
    }else{
      return "--";
    }
  }
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Color(0xff10223d),
    appBar: AppBar(
      title: Text("Language Translation" ),
      centerTitle: true,
      backgroundColor: Color(0xff10223d),
      foregroundColor: Colors.white,
    ),
    body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            DropdownButton(
              focusColor: Colors.white,
              iconDisabledColor: Colors.white,
              iconEnabledColor: Colors.white,
              hint: Text(originalLanguage, style: TextStyle(color: Colors.white),),
              dropdownColor: Colors.white,
              icon: Icon(Icons.keyboard_arrow_down),
              items: languages.map((String value){
                return DropdownMenuItem<String>(
                  child: Text(value),
                    value: value
                );

              }).toList(),

              onChanged: (String? newValue) {
                setState(() {
                 originalLanguage = newValue!; // Update the selected value
                });
              },
            ),

              SizedBox(width: 40),

              Icon(Icons.arrow_right_alt_outlined  , color: Colors.white, size: 40,),

              SizedBox(width: 40),


              DropdownButton(
                focusColor: Colors.white,
                iconDisabledColor: Colors.white,
                iconEnabledColor: Colors.white,
                hint: Text(destinationLanguage, style: TextStyle(color: Colors.white),),
                dropdownColor: Colors.white,
                icon: Icon(Icons.keyboard_arrow_down),
                items: languages.map((String value){
                  return DropdownMenuItem<String>(
                      child: Text(value),
                      value: value
                  );

                }).toList(),

                onChanged: (String? newValue) {
                  setState(() {
                    destinationLanguage= newValue!; // Update the selected value
                  });
                },
              ),


          ],
          ),
          SizedBox(height: 40),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              controller: languageController,
              maxLines: 10,
              cursorColor: Colors.white,
              autofocus: false,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: "Please enter your text..",
                labelStyle: TextStyle(fontSize: 15 , color: Colors.white),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.white
                  )
                ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1,
                          color: Colors.white
                      ),
                  ),
                errorStyle: TextStyle(color: Colors.red , fontSize: 15),
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

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff2b3c5a),
                foregroundColor: Colors.white,
              ),
                onPressed: (){
translate(getLanguageCode(originalLanguage), getLanguageCode(destinationLanguage), languageController.text);
            }, child: Text("Translate")),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(output, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
          )
        ],
      ),
    ),
  );
  }
}