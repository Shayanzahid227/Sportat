import 'package:code_structure/core/constants/app_assest.dart';
import 'package:code_structure/core/constants/auth_text_feild.dart';
import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:code_structure/custom_widgets/app_bar/custom_app_bar.dart';
import 'package:code_structure/ui/user_profile/followings_followers/follow_following_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class FollowFollowingScreen extends StatefulWidget {
  const FollowFollowingScreen({super.key});

  @override
  State<FollowFollowingScreen> createState() => _FollowFollowingScreenState();
}

class _FollowFollowingScreenState extends State<FollowFollowingScreen> {
  String _appBarTitle = "Followers";
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FollowFollowingViewModel(),
      child: Consumer<FollowFollowingViewModel>(
        builder: (context, model, child) => Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(56.0),
            child: CustomAppBar(isBackButton: true, title: _appBarTitle),
          ),
          body: Column(
            children: [
              10.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  2,
                  (index) {
                    final tabTitles = ['Followers', 'Followings'];
                    return _tabs(
                        text: tabTitles[index],
                        isSelected: model.selectedTabIndex == index,
                        onTap: () {
                          model.setSelectedTab(index);
                          setState(() {
                            _appBarTitle = tabTitles[index];
                          });
                        });
                  },
                ),
              ),
              20.verticalSpace,
              //      search bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: TextFormField(
                  decoration: authSignUpFieldDecoration.copyWith(
                      hintText: "search",
                      prefixIcon: Image.asset(
                        AppAssets().searchicon2,
                        scale: 4,
                      )),
                ),
              ),
              20.verticalSpace,
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    model.selectedTabIndex == 0
                        ? ListView.builder(
                            itemCount: model.FollowersList.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return FollowerFollowingListItem(
                                user: model.FollowersList[index],
                              );
                            },
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: model.FollowingList.length,
                            itemBuilder: (context, index) {
                              return FollowerFollowingListItem(
                                user: model.FollowingList[index],
                              );
                            },
                          )
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }

  ///
  ///      followers and following container
  ///
  _tabs(
      {required String text,
      required bool isSelected,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsetsDirectional.all(8),
        alignment: Alignment.center,
        width: 100.w,
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? secondaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 1,
            color: isSelected ? secondaryColor : darkGreyColor,
          ),
        ),
        child: Text(
          text,
          style:
              style14.copyWith(color: isSelected ? whiteColor : darkGreyColor),
        ),
      ),
    );
  }
}

///
///      custom follow or following widget
///
class FollowerFollowingListItem extends StatelessWidget {
  final UsersModel user;

  const FollowerFollowingListItem({
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<FollowFollowingViewModel>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25.r,
                backgroundImage: AssetImage(
                  AppAssets().profileImage,
                ),
                backgroundColor: Colors.grey.shade300,
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.name,
                      style: style18.copyWith(fontWeight: FontWeight.w500),
                    ),
                    Text(
                      '${user.followerCount}  Followers',
                      style: style12.copyWith(color: darkGreyColor),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 12.w),
              GestureDetector(
                onTap: () {
                  model.toggleFollowStatus(user.id);
                },
                child: Container(
                  width: 100.w,
                  decoration: BoxDecoration(
                    color: user.isFollowing ? Colors.white : secondaryColor,
                    border: Border.all(
                      color: user.isFollowing ? Colors.red : transparentColor,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Center(
                      child: Text(
                        user.isFollowing ? 'UnFollow' : 'Follow',
                        style: style14.copyWith(
                          color: user.isFollowing ? Colors.red : whiteColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          10.verticalSpace,
          Divider()
        ],
      ),
    );
  }
}

///
///      followers and f...  model
///
class UsersModel {
  final String id;
  final String name;
  final String profileImageUrl;
  final int followerCount;
  bool isFollowing;

  UsersModel({
    required this.id,
    required this.name,
    required this.profileImageUrl,
    required this.followerCount,
    this.isFollowing = true,
  });
}
