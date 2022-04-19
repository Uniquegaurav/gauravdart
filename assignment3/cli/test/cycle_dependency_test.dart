import 'package:test/test.dart';
import 'package:cli/dependency_graph.dart';
import 'package:cli/exceptions/exceptions.dart';

void main() {
  final dependencyGraph = Singleton.instance!;
  dependencyGraph.addNode(1, "gaurav");
  dependencyGraph.addNode(2, "astha");
  dependencyGraph.addNode(3, "yami");
  dependencyGraph.addNode(4, "megha");
  dependencyGraph.addDependency(1, 2);

  test('adding a new node with already used id', () {
    expect(() => dependencyGraph.addDependency(2, 3), returnsNormally);
  });
  test('adding a new node with already used id', () {
    expect(() => dependencyGraph.addDependency(3, 1),
        throwsA(isA<CyclicDependencyException>()));
  });
  test('adding a new node with already used id', () {
    expect(() => dependencyGraph.addDependency(2, 4), returnsNormally);
  });
  test('adding a new node with already used id', () {
    expect(() => dependencyGraph.addDependency(4, 2),
        throwsA(isA<CyclicDependencyException>()));
  });
  test('adding a new node with already used id', () {
    expect(() => dependencyGraph.addDependency(3, 4), returnsNormally);
  });
  test('adding a new node with already used id', () {
    expect(() => dependencyGraph.addDependency(4, 1),
        throwsA(isA<CyclicDependencyException>()));
  });
}
