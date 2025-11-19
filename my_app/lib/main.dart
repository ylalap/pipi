import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auto Dealer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AutoDealerHomePage(),
    );
  }
}

class AutoDealerHomePage extends StatefulWidget {
  const AutoDealerHomePage({Key? key}) : super(key: key);

  @override
  State<AutoDealerHomePage> createState() => _AutoDealerHomePageState();
}

class _AutoDealerHomePageState extends State<AutoDealerHomePage> {
  int _selectedIndex = 0;
  List<Map<String, dynamic>> _cars = [];
  List<Map<String, dynamic>> _buyers = [];
  bool _isLoading = false;

  // Тестовые данные
  final List<Map<String, dynamic>> _mockCars = [
    {'id': 1, 'brand': 'Toyota', 'model': 'Camry', 'year': 2022, 'price': 25000, 'color': 'Black'},
    {'id': 2, 'brand': 'Honda', 'model': 'Civic', 'year': 2023, 'price': 22000, 'color': 'White'},
    {'id': 3, 'brand': 'Ford', 'model': 'Focus', 'year': 2021, 'price': 19000, 'color': 'Red'},
  ];

  final List<Map<String, dynamic>> _mockBuyers = [
    {'id': 1, 'firstName': 'John', 'lastName': 'Doe', 'email': 'john@email.com', 'phone': '+1234567890'},
    {'id': 2, 'firstName': 'Jane', 'lastName': 'Smith', 'email': 'jane@email.com', 'phone': '+0987654321'},
  ];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() {
    setState(() {
      _cars = _mockCars;
      _buyers = _mockBuyers;
    });
  }

  void _addCar() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add New Car'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(decoration: const InputDecoration(labelText: 'Brand')),
              TextField(decoration: const InputDecoration(labelText: 'Model')),
              TextField(decoration: const InputDecoration(labelText: 'Year'), keyboardType: TextInputType.number),
              TextField(decoration: const InputDecoration(labelText: 'Price'), keyboardType: TextInputType.number),
              TextField(decoration: const InputDecoration(labelText: 'Color')),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              // Добавление новой машины
              final newCar = {
                'id': _cars.length + 1,
                'brand': 'New Brand',
                'model': 'New Model',
                'year': 2023,
                'price': 30000,
                'color': 'Blue'
              };
              setState(() {
                _cars.add(newCar);
              });
              Navigator.pop(context);
            },
            child: const Text('Add Car'),
          ),
        ],
      ),
    );
  }

  void _addBuyer() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add New Buyer'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(decoration: const InputDecoration(labelText: 'First Name')),
              TextField(decoration: const InputDecoration(labelText: 'Last Name')),
              TextField(decoration: const InputDecoration(labelText: 'Email'), keyboardType: TextInputType.emailAddress),
              TextField(decoration: const InputDecoration(labelText: 'Phone'), keyboardType: TextInputType.phone),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              // Добавление нового покупателя
              final newBuyer = {
                'id': _buyers.length + 1,
                'firstName': 'New',
                'lastName': 'Buyer',
                'email': 'new@email.com',
                'phone': '+0000000000'
              };
              setState(() {
                _buyers.add(newBuyer);
              });
              Navigator.pop(context);
            },
            child: const Text('Add Buyer'),
          ),
        ],
      ),
    );
  }

  void _deleteCar(int id) {
    setState(() {
      _cars.removeWhere((car) => car['id'] == id);
    });
  }

  void _deleteBuyer(int id) {
    setState(() {
      _buyers.removeWhere((buyer) => buyer['id'] == id);
    });
  }

  Widget _buildCarsTab() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton.icon(
            onPressed: _addCar,
            icon: const Icon(Icons.add),
            label: const Text('Add New Car'),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
            ),
          ),
        ),
        Expanded(
          child: _cars.isEmpty
              ? const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.directions_car, size: 64, color: Colors.grey),
                      SizedBox(height: 16),
                      Text('No cars available', style: TextStyle(fontSize: 18)),
                      Text('Add your first car using the button above'),
                    ],
                  ),
                )
              : ListView.builder(
                  itemCount: _cars.length,
                  itemBuilder: (context, index) {
                    final car = _cars[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                      child: ListTile(
                        leading: const Icon(Icons.directions_car, color: Colors.blue),
                        title: Text('${car['brand']} ${car['model']}'),
                        subtitle: Text('${car['year']} • ${car['color']} • \$${car['price']}'),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _deleteCar(car['id']),
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }

  Widget _buildBuyersTab() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton.icon(
            onPressed: _addBuyer,
            icon: const Icon(Icons.person_add),
            label: const Text('Add New Buyer'),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
            ),
          ),
        ),
        Expanded(
          child: _buyers.isEmpty
              ? const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.people, size: 64, color: Colors.grey),
                      SizedBox(height: 16),
                      Text('No buyers available', style: TextStyle(fontSize: 18)),
                      Text('Add your first buyer using the button above'),
                    ],
                  ),
                )
              : ListView.builder(
                  itemCount: _buyers.length,
                  itemBuilder: (context, index) {
                    final buyer = _buyers[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                      child: ListTile(
                        leading: const Icon(Icons.person, color: Colors.green),
                        title: Text('${buyer['firstName']} ${buyer['lastName']}'),
                        subtitle: Text('${buyer['email']}\n${buyer['phone']}'),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _deleteBuyer(buyer['id']),
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }

  Widget _buildSalesTab() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shopping_cart, size: 64, color: Colors.orange),
          SizedBox(height: 16),
          Text('Sales Management', style: TextStyle(fontSize: 24)),
          SizedBox(height: 8),
          Text('Track car sales and customer purchases', style: TextStyle(fontSize: 16, color: Colors.grey)),
          SizedBox(height: 24),
          Card(
            margin: EdgeInsets.all(16),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Text('Total Sales: 12', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text('Revenue: \$245,000', style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _widgetOptions = [
      _buildCarsTab(),
      _buildBuyersTab(),
      _buildSalesTab(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Auto Dealer'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 4,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadData,
            tooltip: 'Refresh Data',
          ),
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car),
            label: 'Cars',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Buyers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Sales',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}