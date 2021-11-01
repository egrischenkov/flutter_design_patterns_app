import 'file_structure_widgets/directory.dart';
import 'files/audio_file.dart';
import 'files/image_file.dart';
import 'files/text_file.dart';
import 'files/video_file.dart';

abstract class IVisitor {
  String getTitle();
  String visitDirectory(Directory directory);
  String visitAudioFile(AudioFile audioFile);
  String visitImageFile(ImageFile imageFile);
  String visitTextFile(TextFile textFile);
  String visitVideoFile(VideoFile videoFile);
}