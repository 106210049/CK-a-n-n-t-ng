part of profile;
class ProfileController extends GetxController {
  // Biến observable để lưu thông tin người dùng
  var username = "Default User".obs;
  var email = "user@example.com".obs;

  // Phương thức cập nhật tên người dùng
  void updateUsername(String newUsername) {
    username.value = newUsername;
  }

  // Phương thức cập nhật email
  void updateEmail(String newEmail) {
    email.value = newEmail;
  }

  @override
  void onInit() {
    super.onInit();
    // Khởi tạo hoặc load dữ liệu người dùng khi controller được tạo
    print("ProfileController initialized");
  }

  @override
  void onClose() {
    super.onClose();
    // Giải phóng tài nguyên nếu cần
    print("ProfileController disposed");
  }
}
