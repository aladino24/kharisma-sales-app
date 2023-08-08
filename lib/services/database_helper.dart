import 'package:kharisma_sales_app/models/cart_offline.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper{
  final String databaseName = "db_cart";
  final int databaseVersion = 1;


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
      CREATE TABLE cart_offline (
        id INTEGER PRIMARY KEY,
        uuid TEXT UNIQUE,
        user_id TEXT,
        product_id TEXT,
        product_tmpl_id TEXT,
        product_uom_id TEXT,
        satuan TEXT,
        satuan_stock TEXT,
        quantity INTEGER,
        price TEXT,
        total_price TEXT,
        status TEXT,
        is_buy_now TEXT,
        is_checkout TEXT,
        created_at TEXT,
        updated_at TEXT,
        sisa_stock TEXT,
        product_name TEXT,
        product_name_slug TEXT,
        unit TEXT,
        stock TEXT,
        price_utama TEXT,
        label_utama TEXT,
        product_tag_id TEXT,
        name TEXT
      )
    ''');
  }

    Future<int> insertOrUpdateCartOffline(CartOffline cart) async {
      try {
        final db = await getDatabase(); // Make sure to call getDatabase() to initialize the database
        await db!.delete('cart_offline');
        int insertedRowId = await db.insert(
          'cart_offline',
          cart.toMap(),
          conflictAlgorithm: ConflictAlgorithm.ignore,
        );

        // Check if the insertion was successful or not
        if (insertedRowId > 0) {
          // Data successfully inserted
          return insertedRowId;
        } else {
          // Data insertion failed
          throw Exception('Failed to insert data into the cart_offline table.');
        }
      } catch (e) {
        // Handle any errors that might occur during database operations
        print('Error: $e');
        throw Exception('Failed to perform database operation.');
      }
    }




   Future<List<CartOffline>> getCartOffline() async {
  if (database == null) {
    database = await initDatabase();
  }

  if (database == null) {
    // Handle the case where the database initialization failed
    return [];
  }

  final List<Map<String, dynamic>> maps = await database!.query('cart_offline');
  return List.generate(maps.length, (i) => CartOffline.fromMap(maps[i]));
}


}