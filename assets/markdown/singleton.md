
[//]: <> (Copyright \(c\) 2019 Mangirdas Kazlauskas)

[//]: <> (Permission is hereby granted, free of charge, to any person obtaining a copy)
[//]: <> (of this software and associated documentation files \(the "Software"\), to deal)
[//]: <> (in the Software without restriction, including without limitation the rights)
[//]: <> (to use, copy, modify, merge, publish, distribute, sublicense, and/or sell)
[//]: <> (copies of the Software, and to permit persons to whom the Software is)
[//]: <> (furnished to do so, subject to the following conditions:)

[//]: <> (The above copyright notice and this permission notice shall be included in all)
[//]: <> (copies or substantial portions of the Software.)

[//]: <> (THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR)
[//]: <> (IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,)
[//]: <> (FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE)
[//]: <> (AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER)
[//]: <> (LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,)
[//]: <> (OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE)
[//]: <> (SOFTWARE.)
///
### ExampleStateBase

A base class for the abstraction of example's state which contains an initial text value, a single text property and methods to operate it.

```
abstract class ExampleStateBase {
  @protected
  String initialText;
  @protected
  String stateText;
  String get currentText => stateText;

  void setStateText(String text) {
    stateText = text;
  }

  void reset() {
    stateText = initialText;
  }
}
```

### Example's state implementations

Example's state is implemented in 3 different ways:

- ExampleStateByDefinition - example's state is a Singleton which is implemented by definition.

```
class ExampleStateByDefinition extends ExampleStateBase {
  static ExampleStateByDefinition _instance;

  ExampleStateByDefinition._internal() {
    initialText = "A new 'ExampleStateByDefinition' instance has been created.";
    stateText = initialText;
    print(stateText);
  }

  static ExampleStateByDefinition getState() {
    if (_instance == null) {
      _instance = ExampleStateByDefinition._internal();
    }

    return _instance;
  }
}
```

- ExampleState - example's state is a Singleton which is implemented using the Dart language capabilities.

```
class ExampleState extends ExampleStateBase {
  static final ExampleState _instance = ExampleState._internal();

  factory ExampleState() {
    return _instance;
  }

  ExampleState._internal() {
    initialText = "A new 'ExampleState' instance has been created.";
    stateText = initialText;
    print(stateText);
  }
}
```

- ExampleStateWithoutSingleton - example's state is implemented without using a Singleton design pattern.

```
class ExampleStateWithoutSingleton extends ExampleStateBase {
  ExampleStateWithoutSingleton() {
    initialText =
        "A new 'ExampleStateWithoutSingleton' instance has been created.";
    stateText = initialText;
    print(stateText);
  }
}
```

### Example

Example uses all three different implementations of the state. Singleton implementations (_ExampleStateByDefinition_ and _ExampleState_) create a new state object only on the first creation of the _SingletonExample_ widget, but the _ExampleStateWithoutSingleton_ instance is created on each creation of the _SingletonExample_ widget.

```
class SingletonExample extends StatefulWidget {
  @override
  _SingletonExampleState createState() => _SingletonExampleState();
}

class _SingletonExampleState extends State<SingletonExample> {
  final List<ExampleStateBase> stateList = [
    ExampleState(),
    ExampleStateByDefinition.getState(),
    ExampleStateWithoutSingleton()
  ];

  void _setTextValues([String text = 'Singleton']) {
    for (var state in stateList) {
      state.setStateText(text);
    }
    setState(() {});
  }

  void _reset() {
    for (var state in stateList) {
      state.reset();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollBehavior(),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: paddingL),
        child: Column(
          children: <Widget>[
            for (var state in stateList)
              Padding(
                padding: const EdgeInsets.only(bottom: paddingL),
                child: SingletonExampleCard(
                  text: state.currentText,
                ),
              ),
            const SizedBox(height: spaceL),
            PlatformButton(
              child: Text("Change states\' text to 'Singleton'"),
              materialColor: Colors.black,
              materialTextColor: Colors.white,
              onPressed: _setTextValues,
            ),
            PlatformButton(
              child: Text("Reset"),
              materialColor: Colors.black,
              materialTextColor: Colors.white,
              onPressed: _reset,
            ),
            const SizedBox(height: spaceXL),
            Text(
              'Note: change states\' text and navigate the application (e.g. go to the tab "description" or main menu, then go back to this example) to see how the Singleton state behaves!',
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
```
