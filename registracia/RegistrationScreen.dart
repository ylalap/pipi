import 'package:flutter/material.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            // Заголовок
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'DriveClub',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginScreen()),
                    );
                  },
                  child: const Text(
                    'Вход →',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 40),
            
            // Заголовок формы
            const Center(
              child: Text(
                'Регистрация',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            
            const SizedBox(height: 30),
            
            // Поле логина
            const TextField(
              decoration: InputDecoration(
                labelText: 'Логин',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              ),
            ),
            
            const SizedBox(height: 15),
            
            // Поле пароля
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Пароль',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              ),
            ),
            
            const SizedBox(height: 15),
            
            // Поле повторного ввода пароля
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Повторный ввод пароля',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              ),
            ),
            
            const SizedBox(height: 30),
            
            // Кнопка регистрации
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Действие при регистрации
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Зарегистрироваться',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
