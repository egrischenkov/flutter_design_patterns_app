abstract class ICommand {
  void execute();
  String getTitle();
  void undo();
}