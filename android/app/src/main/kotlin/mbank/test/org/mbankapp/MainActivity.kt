package mbank.test.org.mbankapp

import android.os.Build
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant
import io.flutter.embedding.android.FlutterActivity
import com.yandex.maps.flutter.YandexMapsPlugin

class MainActivity: FlutterActivity() {
    
  override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
    GeneratedPluginRegistrant.registerWith(flutterEngine)

    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
        flutterEngine.plugins.add(com.yandex.maps.flutter.YandexMapsPlugin())
    }
  }
}
