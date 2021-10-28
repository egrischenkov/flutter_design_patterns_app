import '../members/team_member.dart';

abstract class NotificationHub {
  List<TeamMember> getTeamMembers();
  void register(TeamMember teamMember);
  void send(TeamMember sender, String message);
  void sendTo<T extends TeamMember>(TeamMember sender, String message);
}