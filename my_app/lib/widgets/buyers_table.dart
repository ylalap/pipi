// widgets/buyers_table.dart
import 'package:flutter/material.dart';
import '../models/buyer.dart';
import '../services/api_service.dart';

class BuyersTable extends StatelessWidget {
  final List<Buyer> buyers;

  const BuyersTable({Key? key, required this.buyers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: const [
          DataColumn(label: Text('ID')),
          DataColumn(label: Text('First Name')),
          DataColumn(label: Text('Last Name')),
          DataColumn(label: Text('Email')),
          DataColumn(label: Text('Phone')),
          DataColumn(label: Text('Actions')),
        ],
        rows: buyers.map((buyer) {
          return DataRow(cells: [
            DataCell(Text(buyer.id.toString())),
            DataCell(Text(buyer.firstName)),
            DataCell(Text(buyer.lastName)),
            DataCell(Text(buyer.email)),
            DataCell(Text(buyer.phone)),
            DataCell(
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  _deleteBuyer(context, buyer.id);
                },
              ),
            ),
          ]);
        }).toList(),
      ),
    );
  }

  void _deleteBuyer(BuildContext context, int id) async {
    try {
      await ApiService.deleteBuyer(id);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Buyer deleted successfully')),
      );
      // Refresh data by rebuilding the parent widget
      Navigator.of(context).pop();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error deleting buyer: $e')),
      );
    }
  }
}