// importm para importar material
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/his_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

// staless para empezar
// al principio nos habilita cambiar el nombre en ambas partes

// la parte basica grafica
class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading : CircleAvatar(), + ctrl+. -> wrap with pading
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJ9x_VatvCy_kwbMrE8l2kymqahzukxS8eFRCLHWXLCeAG12JJvsFqoaV90DgVeXYuQ7c&usqp=CAU'),
          ),
        ),
        //leading: Icon(Icons.ac_unit),
        // es el icono de la esquina superior
        title: const Text('mi Amor ❤'),
        centerTitle: true,
        //centro el titulo
      ),
      body: _ChatView(),
      // esto se entiende como un div
    );
  }
}

// los mensajes que van depues
class _ChatView extends StatelessWidget {
  const _ChatView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // se mantiene pendiente de los cambios que hay en la clase
    final chatProvider = context.watch<ChatProvider>();

    // wrap in widget -> safe area considerando los botones de android
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            // llena toda la pantalla
            Expanded(
                child: ListView.builder(
                    controller: chatProvider.chatScrollController ,
                    itemCount: chatProvider.messageList.length,
                    itemBuilder: (context, index) {
                      final message = chatProvider.messageList[index];
                      
                      // condicional que ordena de clasifica de quien son los mensajes
                      return (message.fromWho == FromWho.his)
                          ? HisMessageBubble(message : message)
                          : MyMessageBubble(message: message);
                    })),
            // el listview optimiza recursos
            // caja de Texto de mensajes
            MessageFieldBox(

              // esta seria la opcion larga
              // onValue: (value) => chatProvider.sendMessage(value),

              // una opcion mas corta seria
               onValue: chatProvider.sendMessage

            ),
          ],
        ),
      ),
    );
  }
}
