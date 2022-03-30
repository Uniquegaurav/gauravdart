import 'package:test/test.dart';
import 'package:cli/models/raw_item.dart';
import 'package:cli/models/manufactured_item.dart';
import 'package:cli/models/imported_item.dart';

void main() {
  test('calculating tax of raw item 1', () {
    RawItem newItem = RawItem('gaurav', 'raw', 2, 567.8);
    expect(newItem.calculateTax(), 70.975);
  });
  test('calculating tax of raw item 2', () {
    RawItem newItem = RawItem('gaurav', 'raw', 2, 8765.98);
    expect(newItem.calculateTax(), 1095.7475);
  });
  test('calculating tax of raw item 3', () {
    RawItem newItem = RawItem('gaurav', 'raw', 2, 30.0);
    expect(newItem.calculateTax(), 3.75);
  });

  test('calculating tax of manufactured item 1', () {
    ManufacturedItem newItem = ManufacturedItem('gaurav', 'raw', 2, 567.8);
    expect(newItem.calculateTax(), 83.75049999999999);
  });
  test('calculating tax of manufactured item 2', () {
    ManufacturedItem newItem = ManufacturedItem('gaurav', 'raw', 2, 8765.98);
    expect(newItem.calculateTax(), 1292.9820499999998);
  });
  test('calculating tax of manufactured item 3', () {
    ManufacturedItem newItem = ManufacturedItem('gaurav', 'raw', 2, 30.0);
    expect(newItem.calculateTax(), 4.425);
  });
  test('calculating tax of imported item 1', () {
    ImportedItem newItem = ImportedItem('gaurav', 'raw', 2, 567.8);
    expect(newItem.calculateTax(), 61.78);
  });
  test('calculating tax of imported item 2', () {
    ImportedItem newItem = ImportedItem('gaurav', 'raw', 2, 8765.98);
    expect(newItem.calculateTax(), 1358.7269);
  });
  test('calculating tax of imported item 3', () {
    ImportedItem newItem = ImportedItem('gaurav', 'raw', 2, 30.0);
    expect(newItem.calculateTax(), 8.0);
  });
}
