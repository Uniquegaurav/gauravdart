import 'package:test/test.dart';
import 'package:cli/dependency_graph.dart';
import 'package:cli/exceptions/exceptions.dart';

void main() {
  final dependencyGraph = Singleton.instance!;
  dependencyGraph.addNode(1, "gaurav");
  dependencyGraph.addNode(2, "astha");
  dependencyGraph.addNode(3, "yami");
  dependencyGraph.addNode(4, "julius");
  dependencyGraph.addDependency(1, 2);
  dependencyGraph.addDependency(1, 3);
  dependencyGraph.addDependency(2, 4);
  dependencyGraph.addDependency(3, 4);

  test('child nodes test 1', () {
    expect(dependencyGraph.getChildsList(1), []);
  });
  test('child nodes test 2', () {
    expect(dependencyGraph.getChildsList(2), [1]);
  });
  test('child nodes test 3', () {
    expect(dependencyGraph.getChildsList(3), [1]);
  });
  test('child nodes test 4', () {
    expect(dependencyGraph.getChildsList(4), [2, 3]);
  });
  test('child node test 5', () {
    expect(() => dependencyGraph.getChildsList(5),
        throwsA(isA<NoSuchNodeException>()));
  });
  test('parent nodes test 1', () {
    expect(dependencyGraph.getParentsList(1), [2, 3]);
  });
  test('parent nodes test 2', () {
    expect(dependencyGraph.getParentsList(2), [4]);
  });
  test('parent nodes test 3', () {
    expect(dependencyGraph.getParentsList(3), [4]);
  });
  test('parent nodes test 4', () {
    expect(dependencyGraph.getParentsList(4), []);
  });
  test('parent node test 5', () {
    expect(() => dependencyGraph.getParentsList(5),
        throwsA(isA<NoSuchNodeException>()));
  });
  test('ancestors nodes test 1', () {
    expect(dependencyGraph.getAncestors(1), {2, 4, 3});
  });
  test('ancestors nodes test 2', () {
    expect(dependencyGraph.getAncestors(2), {4});
  });
  test('ancestors nodes test 3', () {
    expect(dependencyGraph.getAncestors(3), {4});
  });
  test('ancestors nodes test 4', () {
    expect(dependencyGraph.getAncestors(4), []);
  });
  test('ancestors node test 5', () {
    expect(() => dependencyGraph.getAncestors(5),
        throwsA(isA<NoSuchNodeException>()));
  });
  test('descendents nodes test 1', () {
    expect(dependencyGraph.getDescendents(1), []);
  });
  test('descendents nodes test 2', () {
    expect(dependencyGraph.getDescendents(2), {1});
  });
  test('descendents nodes test 3', () {
    expect(dependencyGraph.getDescendents(3), {1});
  });
  test('descendents nodes test 4', () {
    expect(dependencyGraph.getDescendents(4), {2, 1, 3});
  });
  test('descendents node test 5', () {
    expect(() => dependencyGraph.getDescendents(5),
        throwsA(isA<NoSuchNodeException>()));
  });
  test('adding a new node with already used id', () {
    expect(() => dependencyGraph.addNode(1, "stewart"),
        throwsA(isA<IdAlreadyExistsException>()));
  });
  test("adding a node with new id", () {
    expect(() => dependencyGraph.addNode(9, "stewart"), returnsNormally);
  });
}
