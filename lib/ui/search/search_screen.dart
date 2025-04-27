// ignore_for_file: must_be_immutable

import 'package:code_structure/core/constants/app_assest.dart';
import 'package:code_structure/core/constants/auth_text_feild.dart';
import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:code_structure/custom_widgets/bottom_sheet/search_filter_bottom_sheet.dart';
import 'package:code_structure/custom_widgets/buttons/custom_back_button.dart';
import 'package:code_structure/custom_widgets/sportat/top_subscription_screen.dart';
import 'package:code_structure/ui/top_subscription_screen/top_subscription_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  int search;
  SearchScreen({required this.search});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String selectedTab = "Booking";
  final FocusNode _focusNode = FocusNode();
  bool _showRecentSearches = false;
  final List<String> recentSearches = [
    'Race club',
    'Football club',
    'The champion club'
  ];

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _showRecentSearches = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TopSubscriptionViewModel>(
      builder: (context, model, child) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              _searchField(context),
              if (widget.search == 0) Expanded(child: _subscriptions(model)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _searchField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 10),
      child: Row(
        children: [
          CustomBackButton(),
          SizedBox(width: 8),
          Expanded(
            child: TextFormField(
              focusNode: _focusNode,
              decoration: authSignUpFieldDecoration.copyWith(
                contentPadding: EdgeInsets.all(5),
                hintText: 'Search for sports or fields',
                hintStyle: style16.copyWith(color: lightGreyColor),
                prefixIcon: Image.asset(AppAssets().searchicon2, scale: 4),
                suffixIcon: GestureDetector(
                  onTap: () => SearchFilterBottomSheet.show(context),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Image.asset(AppAssets().searchfieldIcon, scale: 5),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _subscriptions(TopSubscriptionViewModel model) {
    return Column(
      children: [
        if (_showRecentSearches) _recentSearchList(),
        20.verticalSpace,
        if (!_showRecentSearches) _tabSelection(),
        20.verticalSpace,
        if (!_showRecentSearches)
          selectedTab == "Booking"
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Football fields",
                      style: style16B.copyWith(color: lightGreyColor),
                    ),
                    Text(
                      "3 Result",
                      style: style16B.copyWith(color: lightGreyColor),
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Clubs Subscription",
                      style: style16B.copyWith(color: lightGreyColor),
                    ),
                    Text(
                      "3 Result",
                      style: style16B.copyWith(color: lightGreyColor),
                    ),
                  ],
                ),
        20.verticalSpace,
        if (!_showRecentSearches)
          Expanded(
            child: selectedTab == "Booking"
                ? _BookingList(model)
                : _subscriptionList(model),
          ),
      ],
    );
  }

  Widget _recentSearchList() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Recent Search",
                style: style16B.copyWith(color: lightGreyColor)),
            TextButton(
              onPressed: () => setState(() => recentSearches.clear()),
              child: Text("Clear",
                  style: style16B.copyWith(color: lightGreyColor)),
            )
          ],
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: recentSearches.length,
          itemBuilder: (context, index) => ListTile(
            leading: Image.asset(AppAssets().searchicon2, scale: 5),
            title: Text(recentSearches[index], style: style16),
            trailing: IconButton(
              icon: Icon(Icons.close, color: Colors.black),
              onPressed: () => setState(() => recentSearches.removeAt(index)),
            ),
            onTap: () => setState(() => _showRecentSearches = false),
          ),
        ),
      ],
    );
  }

  Widget _tabSelection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => setState(() => selectedTab = "Booking"),
          child: _tabItem("Booking", selectedTab == "Booking"),
        ),
        20.horizontalSpace,
        GestureDetector(
          onTap: () => setState(() => selectedTab = "Subscribe"),
          child: _tabItem("Subscribe", selectedTab == "Subscribe"),
        ),
      ],
    );
  }

  Widget _tabItem(String title, bool isSelected) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      decoration: BoxDecoration(
        color: isSelected ? secondryColor : whitecolor,
        border: Border.all(
            width: 2.0, color: isSelected ? secondryColor : lightGreyColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        title,
        style: style16B.copyWith(
          color: isSelected ? whitecolor : lightGreyColor,
        ),
      ),
    );
  }

  Widget _subscriptionList(TopSubscriptionViewModel model) {
    return ListView.builder(
      itemCount: model.topSubscriptionsList.length,
      itemBuilder: (context, index) => CustomTopSubscriptions(
        topSubscriptions: model.topSubscriptionsList[index],
      ),
    );
  }

  Widget _BookingList(TopSubscriptionViewModel model) {
    return ListView.builder(
      itemCount: model.topSubscriptionsList.length,
      itemBuilder: (context, index) => CustomTopSubscriptions(
        topSubscriptions: model.topSubscriptionsList[index],
      ),
    );
  }
}
