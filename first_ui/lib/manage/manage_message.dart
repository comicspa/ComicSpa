import 'dart:async';

class ManageMessage
{
  static const int __LOOP_SECOND = 1;
  static Timer __timer;
  static List<int> __messageList;

  static void generate()
  {
    if(null == __messageList)
      __messageList = new List<int>();

    const duration = const Duration(seconds:__LOOP_SECOND);
    __timer = new Timer.periodic(duration, update);
  }

  static void update(Timer timer)
  {
      //print('current time : ${timer.toString()}');

    if(null != __messageList)
      {
        if(0 < __messageList.length)
          {



          }
      }



  }




}