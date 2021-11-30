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
import '../../../widgets/platform_progress_indicator.dart';
import '../customer/customer.dart';
import '../i_customer_details_service.dart';
import 'customer_details_column.dart';

class CustomerDetailsDialog extends StatefulWidget {
  final Customer customer;
  final ICustomerDetailsService service;

  const CustomerDetailsDialog({
    required this.customer,
    required this.service,
  });

  @override
  _CustomerDetailsDialogState createState() => _CustomerDetailsDialogState();
}

class _CustomerDetailsDialogState extends State<CustomerDetailsDialog> {
  @override
  void initState() {
    super.initState();

    widget.service.getCustomerDetails(widget.customer.id).then((customerDetails) {
      setState((){
        widget.customer.details = customerDetails;
      });
    });
  }

  void _closeDialog() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.customer.name),
      content: Container(
        height: 200,
        child: widget.customer.details == null ? Center(
          child: PlatformProgressIndicator(),
        ) :
        CustomerDetailsColumn(
          customerDetails: widget.customer.details!,
        ),
      ),
      actions: [
        CommonElevatedButton(
          title: 'Close',
          onTap: _closeDialog,
        ),
      ],
    );
  }
}
