import 'package:flutter/material.dart';
import '../../../widgets/vertical_space.dart';
import '../customer/customer_details.dart';
import 'customer_info_group.dart';

class CustomerDetailsColumn extends StatelessWidget {
  final CustomerDetails customerDetails;

  const CustomerDetailsColumn({
    required this.customerDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CustomerInfoGroup(
          label: 'E-mail',
          text: customerDetails.email,
        ),
        VerticalSpace(16),
        CustomerInfoGroup(
          label: 'Position',
          text: customerDetails.position,
        ),
        VerticalSpace(16),
        CustomerInfoGroup(
          label: 'Hobby',
          text: customerDetails.hobby,
        ),
      ],
    );
  }
}
