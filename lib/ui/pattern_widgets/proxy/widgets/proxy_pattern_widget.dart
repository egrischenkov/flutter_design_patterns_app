/*
Copyright (c) 2019 Mangirdas Kazlauskas

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

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
