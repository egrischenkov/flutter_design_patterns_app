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
import '../../../widgets/vertical_space.dart';
import '../members/team_member.dart';

class NotificationList extends StatelessWidget {
  final List<TeamMember> members;
  final ValueSetter<TeamMember> onTap;

  NotificationList({required this.members, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Last notifications',
          style: Theme.of(context).textTheme.headline6,
        ),
        VerticalSpace(10),
        Text(
          'Note: click on the card to send a notification from the team member.',
          style: Theme.of(context).textTheme.caption,
        ),
        VerticalSpace(8),
        for (final member in members)
          Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: InkWell(
              onTap: () => onTap(member),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            member.toString(),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          VerticalSpace(10),
                          Text(member.lastNotification ?? '-'),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: Icon(Icons.message),
                    ),
                  ],
                ),
              ),
            ),
          )
      ],
    );
  }
}
