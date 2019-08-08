import 'package:firebase_ml_vision/firebase_ml_vision.dart';



class ManageFirebaseMLVision
{

  final TextRecognizer textRecognizer = FirebaseVision.instance.textRecognizer();
  final TextRecognizer cloudTextRecognizer = FirebaseVision.instance.cloudTextRecognizer();


}