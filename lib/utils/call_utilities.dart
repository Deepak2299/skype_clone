import 'dart:math';

import 'package:flutter/material.dart';
import 'package:skype_clone/models/call.dart';
import 'package:skype_clone/models/user.dart';
import 'package:skype_clone/resources/call_methods.dart';
import 'package:skype_clone/screens/callscreens/call_screen.dart';

class CallUtils {
  static final CallMethods calMethods = CallMethods();

  static dial({User from, User to, context}) async {
    Call call = Call(
        callerId: from.uid,
        callerName: from.name,
        callerPic: from.profilePhoto,
        receiverId: to.uid,
        receiverName: to.name,
        receiverPic: to.profilePhoto,
        channelId: Random().nextInt(1000).toString());

    bool callMode = await calMethods.makeCall(call: call);

    call.hasDialled = true;

    if (callMode) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => CallScreen(call: call)));
    }
  }
}
