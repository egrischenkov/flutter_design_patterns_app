import 'package:flutter/material.dart';
import '../adapters/json_contacts_adapter.dart';
import '../adapters/xml_contacts_adapter.dart';
import 'contacts_section.dart';

class AdapterPatternWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ContactsSection(
            adapter: XmlContactsAdapter(),
            headerText: 'Contacts from XML api:',
          ),
          ContactsSection(
            adapter: JsonContactsAdapter(),
            headerText: 'Contacts from JSON api:',
          ),
        ],
      ),
    );
  }
}
