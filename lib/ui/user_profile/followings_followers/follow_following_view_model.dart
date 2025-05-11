import 'package:code_structure/core/constants/app_assest.dart';
import 'package:code_structure/core/others/base_view_model.dart';
import 'package:code_structure/ui/user_profile/followings_followers/follow_following.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FollowFollowingViewModel extends BaseViewModel {
  int selectedTabIndex = 0;
  void setSelectedTab(index) {
    selectedTabIndex = index;
    notifyListeners();
  }

  ///
  ///
  ///
  List<UsersModel> FollowersList = [
    UsersModel(
        id: '1',
        name: 'Riya Lumari',
        profileImageUrl: AppAssets().profileImage,
        followerCount: 1000,
        isFollowing: true),
    UsersModel(
        id: '2',
        name: 'Nicolás Díaz',
        profileImageUrl: AppAssets().profileImage,
        followerCount: 1000,
        isFollowing: false),
    UsersModel(
        id: '3',
        name: 'Nicolás Díaz',
        profileImageUrl: AppAssets().profileImage,
        followerCount: 1000,
        isFollowing: true),
    UsersModel(
        id: '4',
        name: 'sanan zahid',
        profileImageUrl: AppAssets().profileImage,
        followerCount: 1000,
        isFollowing: false),
    UsersModel(
        id: '5',
        name: 'numan zahid',
        profileImageUrl: AppAssets().acIcon,
        followerCount: 1000,
        isFollowing: true),
    UsersModel(
        id: '6',
        name: 'Sam Harris',
        profileImageUrl: AppAssets().profileImage,
        followerCount: 1000,
        isFollowing: false),
  ];

  // Simulate fetching following data
  List<UsersModel> FollowingList = [
    UsersModel(
        id: '7',
        name: 'shayan zahid',
        profileImageUrl: AppAssets().profileImage,
        followerCount: 1000,
        isFollowing: true),
    UsersModel(
        id: '8',
        name: 'sanan zahid',
        profileImageUrl: AppAssets().profileImage,
        followerCount: 1000,
        isFollowing: false),
    UsersModel(
        id: '9',
        name: 'Riya Lumari',
        profileImageUrl: AppAssets().profileImage,
        followerCount: 1000,
        isFollowing: true),
    UsersModel(
        id: '10',
        name: 'Nicolás Díaz',
        profileImageUrl: AppAssets().profileImage,
        followerCount: 1000,
        isFollowing: false),
    UsersModel(
        id: '11',
        name: 'Nicolás Díaz',
        profileImageUrl: AppAssets().profileImage,
        followerCount: 1000,
        isFollowing: true),
    UsersModel(
        id: '12',
        name: 'sanan zahid',
        profileImageUrl: AppAssets().profileImage,
        followerCount: 1000,
        isFollowing: false),
    UsersModel(
        id: '13',
        name: 'numan zahid',
        profileImageUrl: AppAssets().acIcon,
        followerCount: 1000,
        isFollowing: true),
    UsersModel(
        id: '14',
        name: 'Sam Harris',
        profileImageUrl: AppAssets().profileImage,
        followerCount: 1000,
        isFollowing: false),
    UsersModel(
        id: '15',
        name: 'numan zahid',
        profileImageUrl: AppAssets().acIcon,
        followerCount: 1000,
        isFollowing: true),
    UsersModel(
        id: '16',
        name: 'awais khan',
        profileImageUrl: AppAssets().acIcon,
        followerCount: 1000,
        isFollowing: true),
  ];

  ///
  ///      toggle follow and un follow states
  ///
  void toggleFollowStatus(String userId) {
    // Update in FollowersList
    var followerIndex = FollowersList.indexWhere((user) => user.id == userId);
    if (followerIndex != -1) {
      FollowersList[followerIndex].isFollowing =
          !FollowersList[followerIndex].isFollowing;
    }

    // Update in FollowingList
    var followingIndex = FollowingList.indexWhere((user) => user.id == userId);
    if (followingIndex != -1) {
      FollowingList[followingIndex].isFollowing =
          !FollowingList[followingIndex].isFollowing;
    }

    notifyListeners();
  }
}
