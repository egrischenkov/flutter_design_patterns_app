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

import '../../../widgets/common_elevated_button.dart';
import '../../../widgets/horizontal_space.dart';
import '../../../widgets/vertical_space.dart';
import '../collections/breadth_first_tree_collection.dart';
import '../collections/depth_first_tree_collection.dart';
import '../collections/i_tree_collection.dart';
import '../graph.dart';
import 'box.dart';
import 'tree_collection_selection.dart';

class IteratorPatternWidget extends StatefulWidget {
  @override
  _IteratorPatternWidgetState createState() => _IteratorPatternWidgetState();
}

class _IteratorPatternWidgetState extends State<IteratorPatternWidget> {
  final List<ITreeCollection> treeCollections = [];

  int _selectedTreeCollectionIndex = 0;
  int? _currentNodeIndex = 0;
  bool _isTraversing = false;

  @override
  void initState() {
    super.initState();

    final graph = _buildGraph();
    treeCollections.add(BreadthFirstTreeCollection(graph));
    treeCollections.add(DepthFirstTreeCollection(graph));
  }

  Graph _buildGraph() {
    final graph = Graph();

    graph.addEdge(1, 2);
    graph.addEdge(1, 3);
    graph.addEdge(1, 4);
    graph.addEdge(2, 5);
    graph.addEdge(3, 6);
    graph.addEdge(3, 7);
    graph.addEdge(4, 8);

    return graph;
  }

  void _setSelectedTreeCollectionIndex(int? index) {
    setState(() {
      _selectedTreeCollectionIndex = index!;
    });
  }

  Future _traverseTree() async {
    _toggleIsTraversing();

    final iterator =
    treeCollections[_selectedTreeCollectionIndex].createIterator();

    while (iterator.hasNext()) {
      setState(() {
        _currentNodeIndex = iterator.getNext();
      });
      await Future.delayed(const Duration(seconds: 1));
    }

    _toggleIsTraversing();
  }

  void _toggleIsTraversing() {
    setState(() {
      _isTraversing = !_isTraversing;
    });
  }

  void _reset() {
    setState(() {
      _currentNodeIndex = 0;
    });
  }

  Color _getBackgroundColor(int index) {
    return _currentNodeIndex == index ? Colors.red[200]! : Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: <Widget>[
          TreeCollectionSelection(
            treeCollections: treeCollections,
            selectedIndex: _selectedTreeCollectionIndex,
            onChanged:
            !_isTraversing ? _setSelectedTreeCollectionIndex : null,
          ),
          VerticalSpace(16),
          Wrap(
            alignment: WrapAlignment.center,
            children: <Widget>[
              CommonElevatedButton(
                onTap: () async => _currentNodeIndex == 0 ? _traverseTree() : null,
                title: 'Traverse',
              ),
              HorizontalSpace(16),
              CommonElevatedButton(
                onTap: () async =>
                _isTraversing || _currentNodeIndex == 0 ? null : _reset(),
                title: 'Reset',
              ),
            ],
          ),
          VerticalSpace(16),
          Box(
            nodeId: 1,
            color: _getBackgroundColor(1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Box(
                  nodeId: 2,
                  color: _getBackgroundColor(2),
                  child: Box(
                    nodeId: 5,
                    color: _getBackgroundColor(5),
                  ),
                ),
                Box(
                  nodeId: 3,
                  color: _getBackgroundColor(3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Box(
                        nodeId: 6,
                        color: _getBackgroundColor(6),
                      ),
                      Box(
                        nodeId: 7,
                        color: _getBackgroundColor(7),
                      ),
                    ],
                  ),
                ),
                Box(
                  nodeId: 4,
                  color: _getBackgroundColor(4),
                  child: Box(
                    nodeId: 8,
                    color: _getBackgroundColor(8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
