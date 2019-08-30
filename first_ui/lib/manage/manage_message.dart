import 'dart:async';

class ManageMessage
{

  static void generate()
  {
    const oneSec = const Duration(seconds:1);
    new Timer.periodic(oneSec, update);
  }

  static void update(Timer timer)
  {
      print('timer.tick : ${timer.tick}');
  }




}