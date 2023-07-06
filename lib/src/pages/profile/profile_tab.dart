import 'package:flutter/material.dart';
import 'package:henrys/src/commom_widgets/custom_text_field.dart';
import 'package:henrys/src/config/app_data.dart' as app_data;

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Perfil do usuário'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        children: [
          // email
          CustomTextField(
            readOnly: true,
            initialValue: app_data.user.email,
            icon: Icons.email,
            label: 'Email',
          ),
          // nome
          CustomTextField(
            readOnly: true,
            initialValue: app_data.user.name,
            icon: Icons.person,
            label: 'Nome',
          ),
          //celular
          CustomTextField(
            readOnly: true,
            initialValue: app_data.user.phone,
            icon: Icons.phone,
            label: 'Celular',
          ),
          // botão de atualizar
          CustomTextField(
            readOnly: true,
            initialValue: app_data.user.cpf,
            icon: Icons.file_copy,
            label: 'CPF',
            isSecret: true,
          ),
          SizedBox(
            height: 40,
            child: OutlinedButton(
              onPressed: () {
                updatePassword();
              },
              style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  side: const BorderSide(
                    color: Colors.deepPurpleAccent,
                  )),
              child: const Text(
                'Atualizar senha',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.deepPurpleAccent,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<bool?> updatePassword() {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // titulo
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        'Atualização de senha',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    // senha atual
                    const CustomTextField(
                      icon: Icons.lock,
                      label: 'Senha atual',
                      isSecret: true,
                    ),
                    // nova senha
                    const CustomTextField(
                      icon: Icons.lock_outline,
                      label: 'Nova senha',
                      isSecret: true,
                    ),
                    // confirmar nova senha
                    const CustomTextField(
                      icon: Icons.lock_outline,
                      label: 'Confirmar nova senha',
                      isSecret: true,
                    ),
                    // botão de confirmar
                    SizedBox(
                      height: 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: Colors.deepPurpleAccent,
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Atualizar senha',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 1,
                right: 1,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.close),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
