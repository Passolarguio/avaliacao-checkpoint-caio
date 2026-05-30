import 'package:flutter/material.dart';
import 'package:meu_app/src/services/auth_service.dart';
import 'package:meu_app/src/widgets/custom_app_bar_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController senhaController = TextEditingController();

  final AuthService authService = AuthService();

  bool carregando = false;

  bool logado = false;

  @override
  void initState() {
    super.initState();

    verificarLogin();
  }

  Future<void> verificarLogin() async {
    final usuarioLogado = await authService.estaLogado();

    setState(() {
      logado = usuarioLogado;
    });
  }

  Future<void> fazerLogin() async {
    setState(() {
      carregando = true;
    });

    try {
      final sucesso = await authService.login(
        email: emailController.text,
        senha: senhaController.text,
      );

      if (sucesso) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Login realizado!')));

        setState(() {
          logado = true;
        });
      } else {
        showDialog(
          context: context,

          builder: (_) {
            return AlertDialog(
              title: Text('Erro'),

              content: Text('Email ou senha inválidos'),

              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },

                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      showDialog(
        context: context,

        builder: (_) {
          return AlertDialog(
            title: Text('Erro'),

            content: Text('Falha ao realizar login'),

            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },

                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } finally {
      setState(() {
        carregando = false;
      });
    }
  }

  Future<void> logout() async {
    await authService.logout();

    setState(() {
      logado = false;
    });

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Logout realizado!')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 37, 37, 37),

      appBar: CustomAppBarWidget(titulo: 'Login'),

      body: Center(
        child: Padding(
          padding: EdgeInsets.all(30),

          child: logado
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Image.asset('assets/logo_d20.png', height: 120),

                    SizedBox(height: 40),

                    Text(
                      'Você já está conectado',

                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 40),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),

                      onPressed: logout,

                      child: Text(
                        'Fazer Logout',

                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Image.asset('assets/logo_d20.png', height: 120),

                    SizedBox(height: 40),

                    TextField(
                      controller: emailController,

                      style: TextStyle(color: Colors.white),

                      decoration: InputDecoration(
                        labelText: 'Email',

                        labelStyle: TextStyle(color: Colors.white),
                      ),
                    ),

                    SizedBox(height: 20),

                    TextField(
                      controller: senhaController,
                      obscureText: true,

                      style: TextStyle(color: Colors.white),

                      decoration: InputDecoration(
                        labelText: 'Senha',

                        labelStyle: TextStyle(color: Colors.white),
                      ),
                    ),

                    SizedBox(height: 15),

                    Text(
                      'Login:\ndungeonmaster@gmail.com\nSenha: dnd5the',

                      textAlign: TextAlign.center,

                      style: TextStyle(color: Colors.white70),
                    ),

                    SizedBox(height: 40),

                    carregando
                        ? CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: fazerLogin,

                            child: Text('Entrar'),
                          ),
                  ],
                ),
        ),
      ),
    );
  }
}
