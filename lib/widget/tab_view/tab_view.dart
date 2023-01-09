import 'package:flutter/cupertino.dart';
import 'package:new_ios_chatapp_0/screens/chat_page.dart';
import 'package:new_ios_chatapp_0/screens/page_not_found.dart';
import 'package:new_ios_chatapp_0/screens/settings_page.dart';

class TabView extends StatelessWidget {
  final String textLocation;
  final int index;
  const TabView({super.key, required this.textLocation, required this.index});

  @override
  Widget build(BuildContext context) {
    if (index == 0) {
      return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(middle: Text(textLocation)),
        child: Center(
          child: Text(textLocation)
        )
      );
    } else if (index == 1) {
      return ChatPage();
    } else if (index == 2) {
      return SettingsPage();
    } else {
      return PageNotFound(textLocation: textLocation);
    }
  }
}
