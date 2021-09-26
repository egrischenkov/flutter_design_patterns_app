import 'package:xml/xml.dart';

import '../contact.dart';
import '../contacts_api/xml_contacts_api.dart';
import 'i_contacts_adapter.dart';

class XmlContactsAdapter implements IContactsAdapter {
  final XmlContactsApi _xmlApi = XmlContactsApi();

  List<Contact> _parseContactsXml(String contactsXml) {
    final xmlDocument = XmlDocument.parse(contactsXml);
    final contactsList = <Contact>[];

    for (final xmlElement in xmlDocument.findAllElements('contact')) {
      final fullName = xmlElement.findElements('fullname').single.text;
      final email = xmlElement.findElements('email').single.text;
      final favouriteString = xmlElement.findElements('favourite').single.text;
      final favourite = favouriteString.toLowerCase() == 'true';

      contactsList.add(
        Contact(
          fullName: fullName,
          email: email,
          favourite: favourite,
        ),
      );
    }

    return contactsList;
  }

  @override
  List<Contact> getContacts() {
    final contactsXml = _xmlApi.getContactsXml();
    final contactsList = _parseContactsXml(contactsXml);

    return contactsList;
  }
}