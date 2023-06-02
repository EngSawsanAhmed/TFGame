import 'package:rflutter_alert/rflutter_alert.dart';
import 'app_brain.dart';
import 'package:flutter/material.dart';

AppBrain appBrain=AppBrain();
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(appBar: AppBar(title:
     Text('اختر الاجابة الصحيحة',
     selectionColor: Color.fromARGB(255, 3, 12, 3),
    ),
   backgroundColor: Color.fromARGB(255, 163, 194, 163),
    ), 
    body:Padding(
      padding: const EdgeInsets.all(8.0),
      child: examepage(),
    ) ,
    ),
    );
  }
}

class examepage extends StatefulWidget {
  const examepage({super.key});

  @override
  State<examepage> createState() => _examepageState();
}

class _examepageState extends State<examepage> {

void chekanswer(whatuserchosse){
  
            setState(() {
               bool corectanswer=appBrain.getquestionanswer();
            if(whatuserchosse==corectanswer){
              answerreslt.add(Padding(
                padding: const EdgeInsets.all(3.0),
                child: Icon(Icons.thumb_up,color: Colors.green,),
              ) );

            }else{
               answerreslt.add(Padding(
                 padding: const EdgeInsets.all(3.0),
                 child: Icon(Icons.thumb_down,color: Colors.red,),
               ) );
            }
            if(appBrain.isfinish()==true){
              Alert(
      context: context,
      type: AlertType.error,
      title: "انتهاء الاختبار",
      desc: "اجبت على جميع الاسئله.",
      buttons: [
        DialogButton(
          child: Text(
            "ابدء من جديد",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
    appBrain.reset();
    answerreslt=[];
            }else{
               appBrain.nextquestion();

            }
             
            
            });}

  List<Widget>answerreslt=[];

  @override
  Widget build(BuildContext context) {
    return  Column(
        crossAxisAlignment : CrossAxisAlignment.stretch,
        children: [
          Row(
           children: answerreslt,

          ),
         
         Expanded(
            flex:5,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                    child: Image.asset(appBrain.getquestionimage()
                            ),
                  
                ),
             SizedBox(height: 20,),
        
            Text(appBrain.getquestiontext(),
            textAlign:TextAlign.center)
            ],
            ),
          ),
        
           SafeArea(
             child: Expanded(child: Padding(
              padding: const EdgeInsets.all(5),
              child: TextButton(
                child: Text('True'),
                
                style:TextButton.styleFrom(foregroundColor: Color.fromARGB(255, 2, 7, 2),backgroundColor: Colors.green) ,
                onPressed: (){
                chekanswer(true);
                
                          }, 
              ),
                     )
                   
                     ),
           ),
        
    
        SafeArea(
          child: Expanded(child: Padding(
            padding: const EdgeInsets.all( 5),
            child: TextButton(
              child: Text('fulse'),
              style:TextButton.styleFrom(foregroundColor: Color.fromARGB(255, 2, 7, 2),backgroundColor: Colors.red) ,
              onPressed: (){
        
             chekanswer(false);
            
            }, 
            
            ),
          )
        
          ),
        ),
        
    
      ],);
    
  }
}