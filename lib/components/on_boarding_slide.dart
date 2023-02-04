import 'package:flutter/material.dart';

class OnBoardingSlide extends StatelessWidget {
  const OnBoardingSlide(
      {super.key, this.titulo, this.imagen, this.descripcion});
  final String? titulo, imagen, descripcion;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.only(top: 250),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 40),
            child: Image(
              image: AssetImage(imagen!),
              width: 300,
              height: 200,
            ),
          ),
          Text(
            titulo!,
            style: const TextStyle(
              fontSize: 28.0,
              color: Color.fromARGB(255, 80, 28, 170),
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 19, 25, 0),
            child: Text(
              descripcion!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 22.0, color: Color.fromARGB(150, 105, 81, 81)),
            ),
          ),
        ],
      ),
    );
  }
}
