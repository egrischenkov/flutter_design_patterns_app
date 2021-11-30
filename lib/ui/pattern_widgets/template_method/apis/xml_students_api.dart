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

class XmlStudentsApi {
  final String _studentsXml = '''
  <?xml version="1.0"?>
  <students>
    <student>
      <fullname>John Doe (XML)</fullname>
      <age>12</age>
      <height>1.62</height>
      <weight>53</weight>
    </student>
    <student>
      <fullname>Emma Doe (XML)</fullname>
      <age>15</age>
      <height>1.55</height>
      <weight>50</weight>
    </student>
    <student>
      <fullname>Michael Roe (XML)</fullname>
      <age>18</age>
      <height>1.85</height>
      <weight>89</weight>
    </student>
    <student>
      <fullname>Emma Roe (XML)</fullname>
      <age>20</age>
      <height>1.66</height>
      <weight>79</weight>
    </student>
  </students>
  ''';

  String getStudentsXml() {
    return _studentsXml;
  }
}