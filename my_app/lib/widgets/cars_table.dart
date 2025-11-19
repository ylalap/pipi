import 'package:flutter/material.dart';
import '../models/car.dart';
import '../services/api_service.dart';

class CarsTable extends StatelessWidget {
  final List<Car> cars;

  const CarsTable({Key? key, required this.cars}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: const [
          DataColumn(label: Text('ID')),
          DataColumn(label: Text('Brand')),
          DataColumn(label: Text('Model')),
          DataColumn(label: Text('Year')),
          DataColumn(label: Text('Price')),
          DataColumn(label: Text('Color')),
          DataColumn(label: Text('Actions')),
        ],
        rows: cars.map((car) {
          return DataRow(cells: [
            DataCell(Text(car.id.toString())),
            DataCell(Text(car.brand)),
            DataCell(Text(car.model)),
            DataCell(Text(car.year.toString())),
            DataCell(Text('\$${car.price.toStringAsFixed(2)}')),
            DataCell(Text(car.color)),
            DataCell(
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  _deleteCar(context, car.id);
                },
              ),
            ),
          ]);
        }).toList(),
      ),
    );
  }

  void _deleteCar(BuildContext context, int id) async {
    try {
      await ApiService.deleteCar(id);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Car deleted successfully')),
      );
      // Refresh data by rebuilding the parent widget
      Navigator.of(context).pop();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error deleting car: $e')),
      );
    }
  }
}