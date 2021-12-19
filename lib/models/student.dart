class Student{
 late int id;
 late String firstName;
 late String laststName;
 late int grade;
 late String status;

 Student.withID(int id, String firstName, String laststName, int grade ){
    this.id=id;
    this.firstName=firstName;
    this.laststName=laststName;
    this.grade=grade;
    
  }

   Student ( String firstName, String laststName, int grade ){
   
    this.firstName=firstName;
    this.laststName=laststName;
    this.grade=grade;
    
  }

  Student.withoutInfo(){
      return;
  }

  String get getStatus{

      String message=" ";
  if(this.grade>=50){
     message="GEÇTİ";
  }else if(this.grade>=40){
    message="BÜTÜNLEME";
  }else{
   message="KALDI";
  }
  return message;
  }
}