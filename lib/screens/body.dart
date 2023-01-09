import 'package:flutter/cupertino.dart';
import 'package:new_ios_chatapp_0/model/user.dart';
import 'package:new_ios_chatapp_0/provider/user_provider.dart';
import 'package:new_ios_chatapp_0/screens/chat_app.dart';
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
    // return CupertinoPageScaffold(
    //   child: CustomScrollView(
    //     slivers: [
    //       const CupertinoSliverNavigationBar(
    //         largeTitle: Text('Testing')
    //       ),
    //       SliverGrid(
    //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //           crossAxisCount: 1, 
    //           childAspectRatio: 5
    //         ),
    //         delegate: SliverChildBuilderDelegate((context, index) => UserCard(findUser: userList[index])),
    //       )
    //     ],
    //   )
    // );
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
          
          case 1:
            return ChatApp();
        }

        return const CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(middle: Text("First")),
          child: Center(child: Text("First"))
        );
      }),
    );
  }
}

