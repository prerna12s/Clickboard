import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

import '../../../providers/type_defs.dart';
import '../../../models/student_model.dart';
import '../../../providers/utils_providers.dart';
import '../repositories/profile_repository.dart';

final profileControllerProvider =
    StateNotifierProvider<ProfileController, bool>((ref) {
  final userProfileRepository = ref.watch(userProfileRepositoryProvider);
  return ProfileController(
    userProfileRepository: userProfileRepository,
    ref: ref,
  );
});

class ProfileController extends StateNotifier<bool> {
  final ProfileRepository _userProfileRepository;
  final Ref _ref;
  ProfileController(
      {required ProfileRepository userProfileRepository, required Ref ref})
      : _userProfileRepository = userProfileRepository,
        _ref = ref,
        super(false);
  FutureVoid changeUserData({String? name, String? reg}) async {
    Student? newStudent =
        _ref.read(myUserProvider)!.copyWith(name: name, reg: reg);
    state = true;
    try {
      await _userProfileRepository.editProfile(newStudent);
      _ref.read(myUserProvider.notifier).update(newStudent);
    } catch (e) {
      state = false;
      return left('Could not update profile');
    }
    state = false;
    return right(null);
  }
}
