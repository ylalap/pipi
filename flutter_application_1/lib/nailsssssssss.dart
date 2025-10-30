import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Мастер маникюра',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/services': (context) => ServicesPage(),
        '/about': (context) => AboutPage(),
        '/contact': (context) => ContactPage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Салон красоты "Nailsss"'),
        backgroundColor: Colors.pink[100],
        foregroundColor: Colors.purple,
        elevation: 4,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Заголовок (убрали дублирующий, так как теперь есть AppBar)
            
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Информация о мастере
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/about');
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20),
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage(
                              'https://avatars.mds.yandex.net/get-yapic/27232/2QFrz3lyfCtG4z1lnfoDbaI-1/orig', 
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                'Анна Петрова',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.purple[800],
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Мастер маникюра',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[700],
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Опыт: 5 лет',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  // Услуги с навигацией
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/services');
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.purple[50],
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.purple[100]!,
                          width: 1,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Наши услуги:',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.purple[800],
                            ),
                          ),
                          SizedBox(height: 12),
                          Text(
                            '• Классический маникюр',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[700],
                            ),
                          ),
                          Text(
                            '• Аппаратный маникюр',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[700],
                            ),
                          ),
                          Text(
                            '• Покрытие гель-лаком',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[700],
                            ),
                          ),
                          Text(
                            '• Дизайн ногтей',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[700],
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Нажмите для подробностей →',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.purple[600],
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  SizedBox(height: 20),
                  
                  // Контактная информация с навигацией
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/contact');
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.pink[50],
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.pink[50]!,
                            Colors.purple[50]!,
                          ],
                        ),
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              'Запись по телефону: +7 (999) 123-45-67',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.purple[800],
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Нажмите для контактов →',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.purple[600],
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Дополнительный контент для демонстрации прокрутки
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Дополнительная информация',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple[800],
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Мы предлагаем качественные услуги маникюра с использованием современных материалов и технологий. Наши мастера регулярно проходят обучение и следят за последними тенденциями в индустрии красоты.',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[700],
                            height: 1.4,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/contact');
        },
        child: Icon(Icons.phone),
        backgroundColor: Colors.purple,
      ),
    );
  }
}

// Новая страница с услугами
class ServicesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Наши услуги'),
        backgroundColor: Colors.pink[100],
        foregroundColor: Colors.purple,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Классический маникюр',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple[800],
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Цена: 1500 руб.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                      ),
                    ),
                    Text(
                      'Время: 60 минут',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Аппаратный маникюр',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple[800],
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Цена: 2000 руб.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                      ),
                    ),
                    Text(
                      'Время: 75 минут',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Покрытие гель-лаком',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple[800],
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Цена: 1000 руб.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                      ),
                    ),
                    Text(
                      'Время: 45 минут',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Дизайн ногтей',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple[800],
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Цена: от 500 руб.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                      ),
                    ),
                    Text(
                      'Время: зависит от сложности',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Новая страница "О мастере"
class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('О мастере'),
        backgroundColor: Colors.pink[100],
        foregroundColor: Colors.purple,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: NetworkImage(
                'https://avatars.mds.yandex.net/get-yapic/27232/2QFrz3lyfCtG4z1lnfoDbaI-1/orig',
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Анна Петрова',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.purple[800],
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Мастер маникюра с 5-летним опытом',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 20),
            Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Образование и сертификаты:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple[800],
                      ),
                    ),
                    SizedBox(height: 10),
                    Text('• Курс "Современный маникюр" (2019)'),
                    Text('• Сертификат "Гель-лаки премиум класса" (2020)'),
                    Text('• Мастер-класс "Нейл-арт и дизайн" (2021)'),
                    Text('• Повышение квалификации (2023)'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Специализация:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple[800],
                      ),
                    ),
                    SizedBox(height: 10),
                    Text('• Аппаратный маникюр'),
                    Text('• Лечение проблемных ногтей'),
                    Text('• Сложный дизайн'),
                    Text('• Мужской маникюр'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Новая страница контактов
class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Контакты'),
        backgroundColor: Colors.pink[100],
        foregroundColor: Colors.purple,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Контактная информация',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple[800],
                      ),
                    ),
                    SizedBox(height: 15),
                    ListTile(
                      leading: Icon(Icons.phone, color: Colors.purple),
                      title: Text('Телефон'),
                      subtitle: Text('+7 (999) 123-45-67'),
                    ),
                    ListTile(
                      leading: Icon(Icons.email, color: Colors.purple),
                      title: Text('Email'),
                      subtitle: Text('anna@nailsss.ru'),
                    ),
                    ListTile(
                      leading: Icon(Icons.location_on, color: Colors.purple),
                      title: Text('Адрес'),
                      subtitle: Text('ул. Красоты, д. 5, Москва'),
                    ),
                    ListTile(
                      leading: Icon(Icons.access_time, color: Colors.purple),
                      title: Text('Часы работы'),
                      subtitle: Text('Пн-Пт: 9:00-21:00\nСб-Вс: 10:00-19:00'),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Записаться на прием',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple[800],
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Вы можете записаться по телефону, через WhatsApp или посетить наш салон для консультации.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(height: 15),
                    ElevatedButton(
                      onPressed: () {
                        // Действие для записи
                      },
                      child: Text('Записаться онлайн'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}