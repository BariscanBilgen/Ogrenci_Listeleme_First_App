import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/student.dart';
import 'package:flutter_application_1/screens/student_add.dart';
import 'package:flutter_application_1/screens/student_edit.dart';

void main() {
  
  runApp(MaterialApp(

    home: MyApp()
    )
  );
}



// ignore: must_be_immutable
class MyApp extends StatefulWidget{
  @override 
  _MyAppState createState() => _MyAppState(); 
}


class _MyAppState extends State<MyApp> {
  String mesaj="Öğrenci Takip Sistemi"; 

Student selectedStundet=Student.withID(0,"","",0);
  
     List<Student> students = [
       Student.withID(1,"Barışcan", "BİLGEN", 65),
       Student.withID(2,"Cemal", "YÜKSEL", 85),
       Student.withID(3,"Deli", "VELİ", 40) ] ;



  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(mesaj),
      ),
      body: buildBody(context)
      
       
      );
    
  }

     

     void mesajGoster(BuildContext context, String mesaj){
       var alert = AlertDialog(
                  title: Text("İŞLEM SONUCU"),
                
                  content: Text(mesaj),
                );
                showDialog(context: context, builder: (BuildContext context)=>alert);
     }

  Widget buildBody(BuildContext context) {
        return Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (BuildContext context, int index){
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage("https://media-exp1.licdn.com/dms/image/C4D03AQHuuAyQpQHTZA/profile-displayphoto-shrink_200_200/0/1550509984353?e=1637798400&v=beta&t=L-QEQNqmDszRQD9M8bp3zGoZgPiT6BG93sCS1m05AXE"),
                  ),
                  title: Text(students[index].firstName + " " + students[index].laststName),
                  subtitle: Text("sınavdan aldğı not : " + students[index].grade.toString() + " [" + students[index].getStatus.toString() +"]"),
                  trailing: buildStatusIcon(students[index].grade),
                  onTap: (){
                    setState(() {
                      selectedStundet=students[index];
                    });
                    print(selectedStundet.firstName);
                  },
                );
              })
          ),
          Text("Seçili Öğrenci : " + selectedStundet.firstName + " "+ selectedStundet.laststName) ,
          Row(children: <Widget>[
            add(context),
            update(context),
            delete(context)
          ],)
          
        ],
      );

  }

  Flexible delete(BuildContext context) {
    return Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child:  ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.redAccent,
              ),

            onPressed: () { 
              setState(() {
                students.remove(selectedStundet);
              });
             var mesaj ="SİLİNDİ : "+ selectedStundet.firstName+" Adlı Öğrenci";
              mesajGoster(context, mesaj);
              
             },
            child: Row(
              children: <Widget>[
                Icon(Icons.delete),
                Text("SİL"),
              ],
            ),
          ),
          
          );
  }

  Flexible add(BuildContext context) {
    return Flexible(
            fit: FlexFit.tight,
            flex: 2,
            child:  ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.green,
              ),
            child: Row(
              children: <Widget> [
                Icon(Icons.add),
                SizedBox(width: 5.0,),
                Text("ÖĞRENCİ EKLE"),
              ],
            ),
            onPressed: () { 
              setState(() {
             Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentAdd(students)));
              });
             },
          ),
          
          );
  }

  Flexible update(BuildContext context) {
    return Flexible(
            fit: FlexFit.tight,
            flex: 2,
            child:  ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.lightBlue,
              ),
            child: Row(
              children: <Widget>[
                Icon (Icons.update),
                SizedBox(width: 5.0,),
                Text("GÜNCELLE"),
              ],
            ),
            onPressed: () { 
               setState(() {
           Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentEdit(selectedStundet)));
              });
             },
          ),
          
          );
  }

 Widget buildStatusIcon(int grade) {
    
  if(grade>=50){
     return Icon(Icons.done);
  }else if(grade>=40){
    return Icon(Icons.album);
  }else{
    return Icon(Icons.clear);
  }
  
  }
}