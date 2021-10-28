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
