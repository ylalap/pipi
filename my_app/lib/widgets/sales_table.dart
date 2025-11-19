import 'package:flutter/material.dart';
import '../models/sale_info.dart';

class SalesTable extends StatelessWidget {
  final List<SaleInfo> sales;

  const SalesTable({Key? key, required this.sales}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: const [
          DataColumn(label: Text('Car')),
          DataColumn(label: Text('Buyer')),
          DataColumn(label: Text('Purchase Date')),
          DataColumn(label: Text('Sale Price')),
        ],
        rows: sales.map((sale) {
          return DataRow(cells: [
            DataCell(Text(sale.carInfo)),
            DataCell(Text(sale.buyerInfo)),
            DataCell(Text(_formatDate(sale.purchaseDate))),
            DataCell(Text('\$${sale.salePrice.toStringAsFixed(2)}')),
          ]);
        }).toList(),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}