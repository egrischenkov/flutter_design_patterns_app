import '../members/team_member.dart';

import 'notification_hub.dart';

class TeamNotificationHub extends NotificationHub {
  final List<TeamMember> _teamMembers = [];

  TeamNotificationHub({List<TeamMember>? teamMembers}) {
    teamMembers?.forEach(register);
  }

  @override
  List<TeamMember> getTeamMembers() => _teamMembers;

  @override
  void register(TeamMember teamMember) {
    teamMember.notificationHub = this;
    _teamMembers.add(teamMember);
  }

  @override
  void send(TeamMember sender, String message) {
    final filteredMembers = _teamMembers.where((member) => member != sender);

    for (var member in filteredMembers) {
      member.receive(sender.toString(), message);
    }
  }

  @override
  void sendTo<T extends TeamMember>(TeamMember sender, String message) {
    final filteredMembers =
        _teamMembers.where((member) => member != sender).whereType<T>();

    for (var member in filteredMembers) {
      member.receive(sender.toString(), message);
    }
  }
}
