import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Мастер маникюра',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Заголовок
          Container(
            width: double.infinity,
            height: 100,
            color: Colors.pink[100],
            child: Center(
              child: Text(
                'Салон красоты "Nailsss"',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
            ),
          ),
          
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Информация о мастере
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                        'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pexels.com%2Fsearch%2Fjpg%2F&psig=AOvVaw2qEkWS1ipuYKW_n4ZoqFUP&ust=1760712225419000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCIjsmqn6qJADFQAAAAAdAAAAABAE', 
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          'Анна Петрова',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('Мастер маникюра'),
                        Text('Опыт: 5 лет'),
                      ],
                    ),
                  ],
                ),
                
                // Услуги
                Container(
                  width: 300,
                  height: 150,
                  color: Colors.purple[50],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Наши услуги:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('• Классический маникюр'),
                      Text('• Аппаратный маникюр'),
                      Text('• Покрытие гель-лаком'),
                      Text('• Дизайн ногтей'),
                    ],
                  ),
                ),
                
                // Контактная информация
                Container(
                  width: double.infinity,
                  height: 80,
                  color: Colors.pink[50],
                  child: Center(
                    child: Text(
                      'Запись по телефону: +7 (999) 123-45-67',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(123);
        },
        child: Icon(Icons.phone),
        backgroundColor: Colors.purple,
      ),
    );
  }
}