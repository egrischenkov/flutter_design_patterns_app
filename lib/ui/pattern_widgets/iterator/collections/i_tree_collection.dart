import '../iterators/i_tree_iterator.dart';

abstract class ITreeCollection {
  ITreeIterator createIterator();
  String getTitle();
}