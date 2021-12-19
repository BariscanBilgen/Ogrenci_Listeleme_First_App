import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/student.dart';
import 'package:flutter_application_1/validation/studenet_validator.dart';


// ignore: must_be_immutable
class StudentAdd extends  StatefulWidget{
late  List<Student> stundets;
   StudentAdd(List<Student> stundets){
      this.stundets=stundets;
  }
  @override
  State<StatefulWidget> createState() {
    
    return _StudentAddState(stundets);
  }

}

class _StudentAddState extends State with StudentValidationMixin  {
 late List<Student> stundets;
  var student= Student.withoutInfo();
  var formKey=GlobalKey<FormState>();

  _StudentAddState(List<Student> stundets){
      this.stundets=stundets;
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Yeni Öğrenci Ekle"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
        child: Column(
          children: <Widget>[
            buildFirstNameField(),
             buildLastNameField(),
              buildGradeField(),
              buildSubmitButton()
          ],
        ),
        ),
      )
    );
  }

  Widget buildFirstNameField() {

  return  TextFormField(
              decoration: InputDecoration(labelText: "Öğrenci Adı :", hintText: "Barışcan"),
              validator:validateFirstName,
              onSaved: (String? value){
                student.firstName=value!;
              },
            );
  }

 Widget buildLastNameField() {
    return  TextFormField(
              decoration: InputDecoration(labelText: "Öğrenci Soyadı :", hintText: "BİLGEN"),
              validator:validateLastName,
              onSaved: (String? value){
                student.laststName=value!;
              },
            );
  }

Widget  buildGradeField() {

    return  TextFormField(
              decoration: InputDecoration(labelText: "Öğrenci Aldığı Not :", hintText: "65"),
              validator:validateGrade,
              onSaved: (String? value){
                student.grade=int.parse(value!);
              },
            );
}

Widget  buildSubmitButton() {

          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.cyan,
              ),
             child: Text("KAYDET"),
             
            onPressed: () { 
              setState(() {
                if(formKey.currentState!.validate()){
                    formKey.currentState!.save();
                    stundets.add(student);
                    saveStudent();
                    Navigator.pop(context);
                }
             },
           
          );
 });
  }

  void saveStudent() {
    print(student.firstName);
    print(student.laststName);
    print(student.grade);
  }
      


}