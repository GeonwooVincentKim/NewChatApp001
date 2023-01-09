import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_ios_chatapp_0/provider/user_provider.dart';
import 'package:new_ios_chatapp_0/widget/common/style.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget {
  final String userId;
  const DetailPage({super.key, required this.userId});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, userProfile, _) => CupertinoPageScaffold(
          navigationBar: const CupertinoNavigationBar(
            middle: Text('Detail Page')
          ),
          child: Column(
            children: [
              _buildUserBackgroundImage(),
              _buildUserCardText()
            ],
          )
        ),
    );
  }
  
  Widget _buildUserBackgroundImage() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(generalBorder),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          child: Image.asset(
            "assets/image/user/sample_user.png",
            // userList.backgroundImage,
            fit: BoxFit.fill
          ) 
        )
      ),
    );
  }

  Widget _buildUserCardText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        TextButton(
          onPressed: () { 
            Navigator.of(context).pop();
          },
          child: const Text('Go back')
        ),
        Text(
          // 'Test',
          widget.userId,
          // userList.userName,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white
          )
        ),
      ],
    );
  }
}