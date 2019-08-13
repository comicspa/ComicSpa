import 'package:flutter/material.dart';
import 'package:first_ui/manage/manage_device_info.dart'; // use this to make all the widget size responsive to the device size.




class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: ManageDeviceInfo.resolutionHeight * .25,
            child:  Center(
                child: CircularProgressIndicator()
            ),
          ),
        ],
      ),
    );
  }
}