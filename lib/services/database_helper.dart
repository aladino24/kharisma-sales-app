import 'package:kharisma_sales_app/models/cart_product.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper{
  final String databaseName = "db_cart";
  final int databaseVersion = 1;

  // cart
  final String cartTable = 'cart_product';
  final String cart_id = 'id';
  final String cart_uuid = 'uuid';
  final String cart_userId = 'user_id';
  final String cart_productId = 'product_id';
  final String cart_productTmplId = 'product_tmpl_id';
  final String cart_productUomId = 'product_uom_id';
  final String cart_satuan = 'satuan';
  final String cart_satuanStock = 'satuan_stock';
  final String cart_quantity = 'quantity';
  final String cart_price = 'price';
  final String cart_totalPrice = 'total_price';
  final String cart_sisaStock = 'sisa_stock';
  final String product_name = 'product_name';
  final String product_stock = 'product_stock';
  final String product_weight = 'weight';

  Database? database;

  Future<Database?> getDatabase() async{
    if(database != null) return database!;
    database = await initDatabase();
    return database;
  }

  Future<Database> initDatabase() async{
      String path = await getDatabasesPath();
      path = join(path, databaseName);
      return await openDatabase(path, version: databaseVersion, onCreate: onCreate);  
  }

  Future<void> onCreate(Database db, int version) async{
    await db.execute('''
      CREATE TABLE CartProduct (
        id INTEGER,
        uuid TEXT,
        jumlah_stock TEXT
      )
    ''');
  }



}