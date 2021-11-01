import 'dart:convert';

import '../contact.dart';
import '../contacts_api/json_contacts_api.dart';
import 'i_contacts_adapter.dart';

class JsonContactsAdapter implements IContactsAdapter {
  final JsonContactsApi _jsonApi = JsonContactsApi();

  List<Contact> _parseContactsJson(String contactsJson) {
    final contactsMap = json.decode(contactsJson) as Map<String, dynamic>;
    final contactsJsonList = contactsMap['contacts'] as List;
    final contactsList = contactsJsonList.map((contact) {
      return Contact(
        fullName: contact['fullName'],
        email: contact['email'],
        favourite: contact['favourite'],
      );
    }).toList();

    return contactsList;
  }

  @override
  List<Contact> getContacts() {
    final contactsJson = _jsonApi.getContactsJson();
    final contactsList = _parseContactsJson(contactsJson);

    return contactsList;
  }

}