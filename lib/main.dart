// 1.- importar el material con mateapp
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/config/theme/app_theme.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/screens/chat/chat_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // el providers hace que los widgets lleguen a toda la app, no solo a las dependencias que estan debado de su jerarquia
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatProvider())
      ],
      child: MaterialApp(
        title: 'Yess no app',
        debugShowCheckedModeBanner: false,
        theme: AppTheme(selectedColor: 2).theme(),
        home: const ChatScreen()
      ),
    );
  }
}


//Scaffold(
        //appBar: AppBar(
          //title: const Text('Material App Bar'),
        //),
        //body: Center(
            //child: FilledButton.tonal(
              //onPressed: (){ }, 
              //child: const Text ('Click me')
            //)
       // ),
     // ),