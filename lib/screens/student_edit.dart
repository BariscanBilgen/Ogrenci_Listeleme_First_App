import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/student.dart';
import 'package:flutter_application_1/validation/studenet_validator.dart';


// ignore: must_be_immutable
class StudentEdit extends  StatefulWidget{
late  Student selectedStundet;
   StudentEdit(Student selectedStundet){
      this.selectedStundet=selectedStundet;
  }
  @override
  State<StatefulWidget> createState() {
    
    return _StudentAddState(selectedStundet);
  }

}

class _StudentAddState extends State with StudentValidationMixin  {
 late  Student selectedStundet;
  
  var formKey=GlobalKey<FormState>();

  _StudentAddState(Student selectedStundet){
      this.selectedStundet=selectedStundet ;
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
              initialValue: selectedStundet.firstName,
              decoration: InputDecoration(labelText: "Öğrenci Adı :", hintText: "Barışcan"),
              validator:validateFirstName,
              onSaved: (String? value){
                selectedStundet.firstName=value!;
              },
            );
  }

 Widget buildLastNameField() {
    return  TextFormField(
              initialValue: selectedStundet.laststName,
              decoration: InputDecoration(labelText: "Öğrenci Soyadı :", hintText: "BİLGEN"),
              validator:validateLastName,
              onSaved: (String? value){
                selectedStundet.laststName=value!;
              },
            );
  }

Widget  buildGradeField() {

    return  TextFormField(
              initialValue: selectedStundet.grade.toString(),
              decoration: InputDecoration(labelText: "Öğrenci Aldığı Not :", hintText: "65"),
              validator:validateGrade,
              onSaved: (String? value){
                selectedStundet.grade=int.parse(value!);
              },
            );
}

Widget  buildSubmitButton() {

          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.cyan,
              ),
             child: Text("GÜNCELLE"),
             
            onPressed: () { 
                if(formKey.currentState!.validate()){
                    formKey.currentState!.save();
                  
                    saveStudent();
                    Navigator.pop(context);
                }
             },
           
          );

  }

  void saveStudent() {
    print(selectedStundet.firstName);
    print(selectedStundet.laststName);
    print(selectedStundet.grade);
  }
      


}