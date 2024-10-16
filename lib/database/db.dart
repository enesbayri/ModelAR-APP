import 'package:shared_preferences/shared_preferences.dart';

class LocalDB {
  SharedPreferences? db; // Null olabilen bir SharedPreferences referansı



  // Arka plan görseli indeksini al
  int getBgImgIndex() {
    final index = db!.getInt("img"); // Null safety ile erişim
    return index ?? 1; // Eğer index null ise 1 döner
  }

  // Arka plan görseli indeksini ayarla
  Future<void> setBgImgIndex(int index) async {
    await db!.setInt("img", index); // Null safety ile ayarlama
  }
}