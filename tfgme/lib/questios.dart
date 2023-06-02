class Questions {
   late String questionstext ;
  late String questionimage;
  late bool questionsanswer;

   Questions(
   { required  String q,
     required String i,
    required bool  a })
  {
    questionstext=q;
    questionimage=i;
    questionsanswer=a;
  }
}