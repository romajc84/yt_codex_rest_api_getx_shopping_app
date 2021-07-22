import 'package:get/state_manager.dart';
import 'package:yt_codex_rest_api_getx_shopping_app/models/product.dart';
import 'package:yt_codex_rest_api_getx_shopping_app/services/remote_services.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = RxList<Product>();

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await RemoteServices.fetchProducts();
      if (products != null) {
        productList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}
