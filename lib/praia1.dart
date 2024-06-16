import 'package:flutter/material.dart';

class Praia1 extends StatelessWidget {
  const Praia1({super.key});

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: Color.fromRGBO(169, 234, 239, 1),
  //     body: Center(child: Column(children:[
        
  //       Image.asset('assets/images/carrossel 1/praia1.jpg',width: 3000,height: 500,),
  //        ElevatedButton(
  //         onPressed: () {
  //           // Botão que voltará ´para a tela anterior
  //           Navigator.pop(context);
  //         },
  //         child: const Text('Voltar!'),
  //         ),
  //     ]
     
  //     )
  //   ));
//}

@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(169, 234, 239, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.network(
                  'assets/images/carrossel 1/praia1.jpg',
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 40,
                  left: 20,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      color: Colors.grey[200],
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Praia Domingo Dias ',
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Localizada entre as praias Enseada e Lázaro, a Praia Domingas Dias é um refúgio tranquilo e charmoso em Ubatuba. Rodeada por uma bonita natureza, suas águas são calmas e cristalinas, tornando-se o espaço ideal para curtir uma praia tranquila.',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'A infraestrutura nessa praia não é muito boa, então se for ficar mais tempo lá, seria interessante levar algum lanche para comer na praia.',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    flex: 1,
                    child: Image.network(
                      'assets/images/carrossel 1/guardasol.png',
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Image.network(
              'assets/images/carrossel 1/mapa1.png',
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
