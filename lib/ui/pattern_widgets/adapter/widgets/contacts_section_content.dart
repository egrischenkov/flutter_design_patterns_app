import 'package:flutter/material.dart';
import '../../../widgets/common_elevated_button.dart';

import '../contact.dart';
import 'contact_item.dart';

class ContactsSectionContent extends StatelessWidget {
  final List<Contact> contacts;
  final VoidCallback onPressed;
  final VoidCallback onReset;

  const ContactsSectionContent({
    required this.contacts,
    required this.onPressed,
    required this.onReset,
  });

  @override
  Widget build(BuildContext context) {
    return contacts.isEmpty
        ? CommonElevatedButton(
      title: 'Get contacts',
      onTap: onPressed,
    )
        : Column(
      children: <Widget>[
        for (var contact in contacts)
          ContactCard(
            contact: contact,
          ),
        const SizedBox(height: 16),
        CommonElevatedButton(
          title: 'Reset',
          onTap: onReset,
        ),
      ],
    );
  }
}