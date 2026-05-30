import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  final FlutterSecureStorage storage = FlutterSecureStorage();

  Future<bool> login({required String email, required String senha}) async {
    try {
      await Future.delayed(Duration(seconds: 2));

      if (email == 'dungeonmaster@gmail.com' && senha == 'dnd5the') {
        const token = 'jwt_token_fake_123456';

        await storage.write(key: 'token', value: token);

        return true;
      }

      return false;
    } catch (e) {
      throw Exception('Erro ao realizar login');
    }
  }

  Future<bool> estaLogado() async {
    final token = await storage.read(key: 'token');

    return token != null;
  }

  Future<void> logout() async {
    await storage.delete(key: 'token');
  }
}
