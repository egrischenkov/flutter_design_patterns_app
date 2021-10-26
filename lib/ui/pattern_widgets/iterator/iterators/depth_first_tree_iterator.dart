import 'dart:collection';

import '../collections/depth_first_tree_collection.dart';

import 'i_tree_iterator.dart';

class DepthFirstTreeIterator implements ITreeIterator {
  final DepthFirstTreeCollection treeCollection;
  Set<int> visitedNodes = {};
  ListQueue<int> nodeStack = ListQueue();

  final int _initialNode = 1;
  late int _currentNode;

  DepthFirstTreeIterator(this.treeCollection) {
    _currentNode = _initialNode;
    nodeStack.add(_initialNode);
  }

  Map<int, Set<int>> get adjacencyList => treeCollection.graph.adjacencyList;

  @override
  int? getNext() {
    if (!hasNext()) {
      return null;
    }

    _currentNode = nodeStack.removeLast();
    visitedNodes.add(_currentNode);

    if (adjacencyList.containsKey(_currentNode)) {
      for (final node in adjacencyList[_currentNode]!
          .where((n) => !visitedNodes.contains(n))) {
        nodeStack.addLast(node);
      }
    }

    return _currentNode;
  }

  @override
  bool hasNext() => nodeStack.isNotEmpty;

  @override
  void reset() {
    _currentNode = _initialNode;
    visitedNodes.clear();
    nodeStack.clear();
    nodeStack.add(_initialNode);
  }
}