import 'package:flutter/material.dart';
import '../../entities/order.dart';

class OrdersDatatable extends StatelessWidget {
  final List<Order> orders;

  const OrdersDatatable({
    required this.orders,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columnSpacing: 16,
        horizontalMargin: 16,
        headingRowHeight: 32,
        dataRowHeight: 32,
        columns: const <DataColumn>[
          DataColumn(
            label: Text(
              'Dishes',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
            ),
          ),
          DataColumn(
            label: Text(
              'Total',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
            ),
            numeric: true,
          ),
        ],
        rows: <DataRow>[
          for (var order in orders)
            DataRow(
              cells: <DataCell>[
                DataCell(Text(order.dishes.join(', '))),
                DataCell(Text(order.total.toStringAsFixed(2))),
              ],
            ),
        ],
      ),
    );
  }
}
