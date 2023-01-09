import 'package:flutter/cupertino.dart';
import 'package:new_ios_chatapp_0/provider/user_provider.dart';
import 'package:new_ios_chatapp_0/screens/body.dart';
import 'package:new_ios_chatapp_0/screens/detail_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => UserProvider())
      ],
      child: CupertinoApp(
        initialRoute: "/",
        routes: {
          "/": (context) => Body(),
        },
        onGenerateRoute: (settings) {
          final List<String> pathElements = settings.name!.split("/");
          if(pathElements[0] != '') return null;
          if(pathElements[1] == 'user'){
            String userId = pathElements[2];
            return CupertinoPageRoute(builder: (BuildContext context) => DetailPage(userId: userId),);
          }
          return null;
        },
      )
    );
  }
}
