
import 'questios.dart';
class AppBrain{
    int _questionNumber=0;
  List< Questions>_questiongroub=[

  Questions(
  q:'هل التوليب من النباتنات البصلية ',
  i:'imagez/image1.jpg', 
  a:true),
 Questions(
  q:'تقع هذه الغابة في اليابان',
  i:'imagez/image2.jpg', 
  a:true),
  Questions(
  q:'تقع المدينه السياحية في بغداد',
  i:'imagez/image3.jpg', 
  a:false),
  Questions(
  q:'تقع حديقة الزهور في ابو ضبي',
  i:'imagez/image4.jpg', 
  a:false),
 ];
void nextquestion(){
  if(_questionNumber<_questiongroub.length-1){
    _questionNumber++;
  }
}
String getquestiontext() {
  return _questiongroub[_questionNumber].questionstext;
}

String getquestionimage() {
  return _questiongroub[_questionNumber].questionimage;
}
bool getquestionanswer() {
  return _questiongroub[_questionNumber].questionsanswer;
}

bool isfinish (){
  if(_questionNumber>=_questiongroub.length-1){
    return true ;
  }else{return false;
  }
}
void reset(){
  _questionNumber=0;
}
}