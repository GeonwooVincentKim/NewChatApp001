import 'package:flutter/cupertino.dart';
import 'package:new_ios_chatapp_0/model/user.dart';
import 'package:new_ios_chatapp_0/provider/user_provider.dart';
import 'package:new_ios_chatapp_0/screens/chat_page.dart';
import 'package:new_ios_chatapp_0/screens/settings_page.dart';
import 'package:new_ios_chatapp_0/widget/list_view/user_card.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _CupertinoChatState();
}

class _CupertinoChatState extends State<Body> {


  @override
  Widget build(BuildContext context) {
    print('Click');
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.phone),
            label: 'First'
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.chat_bubble),
            label: 'Second'
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            label: 'Third'
          )
        ]
      ),
      tabBuilder: ((context, index) {
        switch (index) {
          case 0: 
            return const CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(middle: Text("First")), 
              child: Center(child: Text('First'))
            );
          
          case 1: return ChatPage();
          case 2: return SettingsPage();
        }

        return const CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(middle: Text("First")),
          child: Center(child: Text("First"))
        );
      }),
    );
  }
}

