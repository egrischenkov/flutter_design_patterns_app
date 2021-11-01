import 'package:flutter/material.dart';
import '../orders/order_item.dart';


class OrderItemsTable extends StatelessWidget {
  final List<OrderItem> orderItems;

  const OrderItemsTable({
    required this.orderItems,
  });

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columnSpacing: 16,
      horizontalMargin: 10,
      headingRowHeight: 20,
      dataRowHeight: 20,
      columns: const <DataColumn>[
        DataColumn(
          label: Text(
            'Title',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
          ),
        ),
        DataColumn(
          label: Text(
            'Package Size',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
          ),
        ),
        DataColumn(
          label: Text(
            'Price',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
          ),
          numeric: true,
        ),
      ],
      rows: <DataRow>[
        for (var orderItem in orderItems)
          DataRow(
            cells: <DataCell>[
              DataCell(Text(orderItem.title)),
              DataCell(Text(orderItem.packageSize.toString().split('.').last)),
              DataCell(Text('\$${orderItem.price.toStringAsFixed(2)}')),
            ],
          ),
      ],
    );
  }
}
