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