import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CartDatabaseHelper{
  final String databaseName = "db_cart";
  final int databaseVersion = 1;

  final String cartTable = 'cart_product';
  final String id = 'id';
  final String uuid = 'uuid';
  final String userId = 'user_id';
  final String productId = 'product_id';
  final String productTmplId = 'product_tmpl_id';
  final String productUomId = 'product_uom_id';
  final String satuan = 'satuan';
  final String satuanStock = 'satuan_stock';
  final String quantity = 'quantity';
  final String price = 'price';
  final String totalPrice = 'total_price';
  final String status = 'status';
  final String isBuyNow = 'is_buy_now';
  final String isCheckout = 'is_checkout';
  final String createdAt = 'created_at';
  final String updatedAt = 'updated_at';

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
      CREATE TABLE $cartTable (
        $id INTEGER PRIMARY KEY AUTOINCREMENT,
        $uuid TEXT,
        $userId TEXT,
        $productId TEXT,
        $productTmplId TEXT,
        $productUomId TEXT,
        $satuan TEXT,
        $satuanStock TEXT,
        $quantity TEXT,
        $price TEXT,
        $totalPrice TEXT,
        $status TEXT,
        $isBuyNow TEXT,
        $isCheckout TEXT,
        $createdAt TEXT,
        $updatedAt TEXT,
        product_id INTEGER,
      )
    ''');
  }
}