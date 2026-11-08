// import 'package:app/features/profile/domain/repositories/user_repository.dart';
// import 'package:app/features/profile/domain/usecase/change_avatar_usecase.dart';
// import 'package:app/features/profile/domain/usecase/change_password_usecase.dart';
// import 'package:app/features/profile/domain/usecase/delete_account_usecase.dart';
// import 'package:app/features/profile/domain/usecase/logout_usecase.dart';
// import 'package:app/features/profile/domain/usecase/update_profile_usecase.dart';
// import 'package:app/features/profile/domain/usecase/user_profile_usecase.dart';
// import 'package:app/features/profile/presentation/bloc/user/user_bloc.dart';
// import 'package:dartz/dartz.dart';
// import 'package:flutter_test/flutter_test.dart';

// class MockUserRepository extends Mock implements UserRepository {}

// void main() {
//   test('delete account success emits loading then deletedAccount', () async {
//     final mockRepo = MockUserRepository();
//     when(
//       () => mockRepo.deleteAccount(),
//     ).thenAnswer((_) async => const Right(null));

//     final bloc = UserBloc(
//       profileUseCase: ProfileUseCase(mockRepo),
//       changePasswordUseCase: ChangePasswordUseCase(mockRepo),
//       logoutUseCase: LogoutUseCase(mockRepo),
//       updateProfileUseCase: UpdateProfileUseCase(mockRepo),
//       changedAvatarUseCase: ChangeAvatarUseCase(mockRepo),
//       deleteAccountUseCase: DeleteAccountUseCase(mockRepo),
//     );

//     expectLater(
//       bloc.stream,
//       emitsInOrder([
//         const UserState.loading(),
//         const UserState.deletedAccount(),
//       ]),
//     );

//     bloc.add(const UserEvent.deleteAccount());
//   });
// }
