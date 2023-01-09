import 'package:flutter/cupertino.dart';
import 'package:new_ios_chatapp_0/model/user.dart';
import 'package:new_ios_chatapp_0/provider/user_provider.dart';
import 'package:new_ios_chatapp_0/widget/list_view/user_card.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({
    super.key,
  });


  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<User> userList = List.empty(growable: true);
  late TextEditingController _controller;

  // @override
  void initState() {
    super.initState();

    /*
      feature-ios
      
      _controller = TextEditingController();
    */
    
    // master Branch
    userList = UserProvider().filteredUsers;
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _updateUserList(String value) {
    debugPrint(value);

    if (value.isNotEmpty) {
      userList  = userList 
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    } else {
      _controller.text = '';
      userList = userList ;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          const CupertinoSliverNavigationBar(
            largeTitle: Text('Testing')
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1, 
              childAspectRatio: 5
            ),
            delegate: SliverChildBuilderDelegate((context, index) => UserCard(findUser: userList[index])),
          )
        ],
      )
    );
  }
}
