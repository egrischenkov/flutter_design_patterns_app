import '../graph.dart';
import '../iterators/breadth_first_tree_iterator.dart';
import '../iterators/i_tree_iterator.dart';
import 'i_tree_collection.dart';

class BreadthFirstTreeCollection implements ITreeCollection {
  final Graph graph;

  BreadthFirstTreeCollection(this.graph);

  @override
  //ignore: use_to_and_as_if_applicable
  ITreeIterator createIterator() => BreadthFirstTreeIterator(this);

  @override
  String getTitle() => "Breadth-first";

}