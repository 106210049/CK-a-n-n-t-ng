part of profile;

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    // Khởi tạo ProfileController khi chuyển đến trang Profile
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
