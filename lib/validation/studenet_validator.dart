class StudentValidationMixin{

  String? validateFirstName(String? value){
    if(value!.length<2){
      return "isim 2 karakterden az olamaz";
    }
    
  }


   String? validateLastName(String? value){
    if(value!.length<2){
      return "Soyisim 2 karakterden az olamaz";
    }
    
  }


   String? validateGrade(String? value){
   var grade=int.parse(value!);
    if(grade<0 || grade>100){
      return "Not 0-100 arası olmalı";
    }
  }
}