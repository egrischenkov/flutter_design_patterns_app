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
