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

import '../../../widgets/common_elevated_button.dart';
import '../entities/customer.dart';
import '../entities/order.dart';
import '../i_storage.dart';
import '../repositories/customer_repository.dart';
import '../repositories/order_repository.dart';
import '../storages/file_storage.dart';
import '../storages/sql_storage.dart';
import 'data_tables/customers_data_table.dart';
import 'data_tables/orders_data_table.dart';
import 'storage_selection.dart';

class BridgePatternWidget extends StatefulWidget {
  @override
  _BridgePatternWidgetState createState() => _BridgePatternWidgetState();
}

class _BridgePatternWidgetState extends State<BridgePatternWidget> {
  final List<IStorage> _storages = [SqlStorage(), FileStorage()];

  late CustomerRepository _customersRepository;
  late OrderRepository _ordersRepository;

  late List<Customer> _customers;
  late List<Order> _orders;

  int _selectedCustomerStorageIndex = 0;
  int _selectedOrderStorageIndex = 0;

  @override
  void initState() {
    super.initState();

    _customersRepository =
        CustomerRepository(_storages[_selectedCustomerStorageIndex]);
    _customers = _customersRepository.getAll() as List<Customer>;

    _ordersRepository = OrderRepository(_storages[_selectedOrderStorageIndex]);
    _orders = _ordersRepository.getAll() as List<Order>;
  }

  void _onSelectedCustomerStorageIndexChanged(int? index) {
    setState(() {
      _selectedCustomerStorageIndex = index!;
      _customersRepository = CustomerRepository(_storages[index]);
      _customers = _customersRepository.getAll() as List<Customer>;
    });
  }

  void _onSelectedOrderStorageIndexChanged(int? index) {
    setState(() {
      _selectedOrderStorageIndex = index!;
      _ordersRepository = OrderRepository(_storages[index]);
      _orders = _ordersRepository.getAll() as List<Order>;
    });
  }

  void _addCustomer() {
    _customersRepository.save(Customer());

    setState(() {
      _customers = _customersRepository.getAll() as List<Customer>;
    });
  }

  void _addOrder() {
    _ordersRepository.save(Order());

    setState(() {
      _orders = _ordersRepository.getAll() as List<Order>;
    });
  }

  void _deleteAllCustomers() {
    _customersRepository.deleteAll();

    setState((){
      _customers = _customersRepository.getAll() as List<Customer>;
    });
  }

  void _deleteAllOrders() {
    _ordersRepository.deleteAll();

    setState((){
      _orders = _ordersRepository.getAll() as List<Order>;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                'Select customers storage:',
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          ),
          StorageSelection(
            storages: _storages,
            selectedIndex: _selectedCustomerStorageIndex,
            onChanged: _onSelectedCustomerStorageIndexChanged,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CommonElevatedButton(
                title: 'Add',
                onTap: _addCustomer,
              ),
              CommonElevatedButton(
                title: 'Delete all',
                onTap: _deleteAllCustomers,
              ),
            ],
          ),
          const SizedBox(height: 16),
          if (_customers.isNotEmpty)
            CustomersDatatable(customers: _customers)
          else
            Text(
              '0 customers found',
              style: Theme.of(context).textTheme.subtitle2,
            ),
          const SizedBox(height: 32),
          const Divider(),
          Row(
            children: <Widget>[
              Text(
                'Select orders storage:',
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          ),
          StorageSelection(
            storages: _storages,
            selectedIndex: _selectedOrderStorageIndex,
            onChanged: _onSelectedOrderStorageIndexChanged,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CommonElevatedButton(
                title: 'Add',
                onTap: _addOrder,
              ),
              CommonElevatedButton(
                title: 'Delete All',
                onTap: _deleteAllOrders,
              ),
            ],
          ),
          const SizedBox(height: 16),
          if (_orders.isNotEmpty)
            OrdersDatatable(orders: _orders)
          else
            Text(
              '0 orders found',
              style: Theme.of(context).textTheme.subtitle2,
            ),
        ],
      ),
    );
  }
}
