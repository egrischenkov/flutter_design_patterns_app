import 'package:flutter/material.dart';

import '../../../widgets/vertical_space.dart';
import '../customer/customer.dart';
import '../customer_details_service_proxy.dart';
import 'customer_details_dialog.dart';

class ProxyPatternWidget extends StatefulWidget {
  @override
  _ProxyPatternWidgetState createState() => _ProxyPatternWidgetState();
}

class _ProxyPatternWidgetState extends State<ProxyPatternWidget> {
  final _customerDetailsServiceProxy = CustomerDetailsServiceProxy();
  final List<Customer> _customerList = List.generate(10, (_) => Customer());

  void _showCustomerDetails(Customer customer) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return CustomerDetailsDialog(
          service: _customerDetailsServiceProxy,
          customer: customer,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Text(
            'Press on the list tile to see more information about the customer',
            textAlign: TextAlign.center,
          ),
          VerticalSpace(16),
          for (var customer in _customerList)
            Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Text(
                    customer.name[0],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                trailing: Icon(Icons.info_outline),
                title: Text(customer.name),
                onTap: () => _showCustomerDetails(customer),
              ),
            ),
        ],
      ),
    );
  }
}
