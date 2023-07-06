import 'package:flutter/material.dart';
import 'package:henrys/src/commom_widgets/custom_text_field.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:henrys/src/pages/auth/sign_up_screen.dart';

import '../base/base_screen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Nome do app
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: const Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "Henry's",
                              style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Chelsea',
                                color: Colors.deepPurpleAccent,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    //Espaço entre nome e texto animado
                    const SizedBox(height: 10),

                    // Categorias
                    SizedBox(
                      height: 30,
                      child: DefaultTextStyle(
                        style: const TextStyle(
                          fontSize: 25,
                          fontFamily: 'Chelsea',
                          color: Colors.white,
                        ),
                        child: AnimatedTextKit(
                          repeatForever: true,
                          pause: Duration.zero,
                          animatedTexts: [
                            FadeAnimatedText('Carnes'),
                            FadeAnimatedText('Mercado'),
                            FadeAnimatedText('Farmácia'),
                            FadeAnimatedText('Bebida'),
                            FadeAnimatedText('Salgados'),
                            FadeAnimatedText('Cafés'),
                            FadeAnimatedText('Açaí'),
                            FadeAnimatedText('Saudável'),
                            FadeAnimatedText('Árabe'),
                            FadeAnimatedText('Japonesa'),
                            FadeAnimatedText('Italiana'),
                            FadeAnimatedText('Brasileira'),
                            FadeAnimatedText('Cervejas'),
                            FadeAnimatedText('Refrigerantes'),
                            FadeAnimatedText('Doces'),
                            FadeAnimatedText('Lanches'),
                            FadeAnimatedText('Padaria'),
                            FadeAnimatedText('Confeitaria'),
                            FadeAnimatedText('Sorvetes'),
                            FadeAnimatedText('Vegetariana'),
                            FadeAnimatedText('Frutos do Mar'),
                            FadeAnimatedText('Variados'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Formulário
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Email
                    const CustomTextField(
                      icon: Icons.email,
                      label: 'Email',
                    ),

                    // Senha
                    const CustomTextField(
                      icon: Icons.lock,
                      label: 'Senha',
                      isSecret: true,
                    ),

                    // Botão de entrar
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: Colors.deepPurpleAccent,
                        ),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (c) {
                                return const BaseScreen();
                              },
                            ),
                          );
                        },
                        child: const Text(
                          'Entrar',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    // Esqueceu a senha
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Esqueceu a senha?',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),

                    // Divisor
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Colors.grey[100],
                              thickness: 2,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              'Ou',
                              style: TextStyle(
                                color: Colors.grey[500],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.grey[100],
                              thickness: 2,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Botão de criar conta
                    SizedBox(
                      height: 40,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (c) {
                                return SignUpScreen();
                              },
                            ),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            side: const BorderSide(
                              color: Colors.deepPurpleAccent,
                            )),
                        child: const Text(
                          'Criar conta',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.deepPurpleAccent,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
