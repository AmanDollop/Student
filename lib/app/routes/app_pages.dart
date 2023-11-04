import 'package:get/get.dart';

import '../modules/add_list/bindings/add_list_binding.dart';
import '../modules/add_list/views/add_list_view.dart';
import '../modules/add_student_list/bindings/add_student_list_binding.dart';
import '../modules/add_student_list/views/add_student_list_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/social_login/bindings/social_login_binding.dart';
import '../modules/social_login/views/social_login_view.dart';
import '../modules/start_attendance/bindings/start_attendance_binding.dart';
import '../modules/start_attendance/views/start_attendance_view.dart';
import '../modules/student_details/bindings/student_details_binding.dart';
import '../modules/student_details/views/student_details_view.dart';
import '../modules/student_list/bindings/student_list_binding.dart';
import '../modules/student_list/views/student_list_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SOCIAL_LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SOCIAL_LOGIN,
      page: () => const SocialLoginView(),
      binding: SocialLoginBinding(),
    ),
    GetPage(
      name: _Paths.STUDENT_LIST,
      page: () => const StudentListView(),
      binding: StudentListBinding(),
    ),
    GetPage(
      name: _Paths.ADD_LIST,
      page: () => const AddListView(),
      binding: AddListBinding(),
    ),
    GetPage(
      name: _Paths.ADD_STUDENT_LIST,
      page: () => const AddStudentListView(),
      binding: AddStudentListBinding(),
    ),
    GetPage(
      name: _Paths.START_ATTENDANCE,
      page: () => const StartAttendanceView(),
      binding: StartAttendanceBinding(),
    ),
    GetPage(
      name: _Paths.STUDENT_DETAILS,
      page: () => const StudentDetailsView(),
      binding: StudentDetailsBinding(),
    ),
  ];
}
