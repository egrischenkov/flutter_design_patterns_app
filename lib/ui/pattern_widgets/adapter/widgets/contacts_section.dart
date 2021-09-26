import 'package:flutter/material.dart';
import '../adapters/i_contacts_adapter.dart';

import '../contact.dart';
import 'contacts_section_content.dart';

class ContactsSection extends StatefulWidget {
  final IContactsAdapter adapter;
  final String headerText;

  const ContactsSection({
    required this.adapter,
    required this.headerText,
  });

  @override
  _ContactsSectionState createState() => _ContactsSectionState();
}

class _ContactsSectionState extends State<ContactsSection> {
  final List<Contact> contacts = [];

  void _getContacts() {
    setState(() {
      contacts.addAll(widget.adapter.getContacts());
    });
  }

  void _resetContacts() {
    setState(contacts.clear);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(widget.headerText, style: TextStyle(fontSize: 20),),
          const SizedBox(height: 16),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: ContactsSectionContent(
              contacts: contacts,
              onPressed: _getContacts,
              onReset: _resetContacts,
            ),
          ),
        ],
      ),
    );
  }
}
