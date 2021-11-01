import '../graph.dart';
import '../iterators/depth_first_tree_iterator.dart';
import '../iterators/i_tree_iterator.dart';
import 'i_tree_collection.dart';

class DepthFirstTreeCollection implements ITreeCollection {
  final Graph graph;

  DepthFirstTreeCollection(this.graph);

  @override
  //ignore: use_to_and_as_if_applicable
  ITreeIterator createIterator() => DepthFirstTreeIterator(this);

  @override
  String getTitle() => "Depth-first";
}