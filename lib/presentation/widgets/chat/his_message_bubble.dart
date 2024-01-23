import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class HisMessageBubble extends StatelessWidget {
  const HisMessageBubble({
    super.key, 
    required this.message
    });

  final Message message;

  @override
  Widget build(BuildContext context) {
    //llama el color del tema
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            decoration: BoxDecoration(
                color: colors.secondary,
                borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                message.text,
                style: TextStyle(color: Colors.white)
                ),
            )
            // ctrl+shift+p -> loren ipsun insert a line
            ),
        const SizedBox(height: 50),
        _ImageBubble(message.imageUrl!),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  
  final String imageUrl;

  const _ImageBubble(this.imageUrl);
 
 
 
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print(size);

    // ClipRRect se encarga de hacer los bordes redondeados
    return ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Image.network(
          imageUrl,
          width: size.width * 0.7,
          height: 200,
          fit: BoxFit.cover,
          // ctrl + espaciadora para ver que esta disponible
          loadingBuilder: (context, child, loadingProgress) {
            // si se termina ed cargar la imagen
            if (loadingProgress == null) return child;
            //si no se termina de cargar la imagen
            return Container(
              width: size.width * 0.7,
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: const Text('Mi amor esta enviando una imagen'),
            );
          },
        ));
  }
}
