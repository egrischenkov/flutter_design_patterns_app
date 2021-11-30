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

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

import '../../../widgets/common_elevated_button.dart';
import '../../../widgets/vertical_space.dart';
import '../hubs/notification_hub.dart';
import '../hubs/team_notification_hub.dart';
import '../members/admin.dart';
import '../members/developer.dart';
import '../members/team_member.dart';
import '../members/tester.dart';
import 'notification_list.dart';

class MediatorPatternWidget extends StatefulWidget {
  @override
  _MediatorPatternWidgetState createState() => _MediatorPatternWidgetState();
}

class _MediatorPatternWidgetState extends State<MediatorPatternWidget> {
  /// as Mediator
  late final NotificationHub _notificationHub;
  final _admin = Admin(name: 'God');

  @override
  void initState() {
    super.initState();
    final _members = [
      _admin,
      Developer(name: faker.person.name()),
      Developer(name: faker.person.name()),
      Developer(name: faker.person.name()),
      Tester(name: faker.person.name()),
      Tester(name: faker.person.name()),
    ];

    _notificationHub = TeamNotificationHub(teamMembers: _members);
  }

  void _sendToAll() {
   setState(() {
     _admin.send("Hi, all!");
   });
  }

  void _sendToQA() {
    setState(() {
      _admin.sendTo<Tester>("Bug!");
    });
  }

  void _sendToDevelopers() {
    setState(() {
      _admin.sendTo<Developer>("Hi to Developers");
    });
  }

  void _addTeamMember() {
    final name = faker.person.name();
    final teamMember = faker.randomGenerator.boolean()
        ? Developer(name: name)
        : Tester(name: name);
    setState(() {
      _notificationHub.register(teamMember);
    });
  }

  void _sendFromMember(TeamMember teamMember) {
    setState((){
      teamMember.send('Hello, all from $teamMember');
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CommonElevatedButton(title: "Admin: send 'Hello' to all!", onTap: _sendToAll),
          CommonElevatedButton(title: "Admin: send 'Bug' to QAs!", onTap: _sendToQA),
          CommonElevatedButton(title: "Admin: send 'Hello' to developers", onTap: _sendToDevelopers),
          Divider(),
          CommonElevatedButton(title: "Add member", onTap: _addTeamMember),
          VerticalSpace(16),
          NotificationList(
            members: _notificationHub.getTeamMembers(),
            onTap: _sendFromMember,
          ),
        ],
      ),
    );
  }
}
