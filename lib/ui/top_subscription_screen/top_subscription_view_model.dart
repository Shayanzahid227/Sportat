import 'package:code_structure/core/constants/app_assest.dart';
import 'package:code_structure/core/model/top_subscriptions_screen.dart';
import 'package:code_structure/core/others/base_view_model.dart';

class TopSubscriptionViewModel extends BaseViewModel {
  List<TopSubscriptionsScreenModel> topSubscriptionsList = [
    TopSubscriptionsScreenModel(
        imageUrl: AppAssets().topSubscriptionStadiumImage,
        profileLogo: AppAssets().topSubscriptionStadiumLogo,
        title: 'Sporting Club',
        energyPointsIcon: AppAssets().pointsEarnedIcon,
        energyPoints: '100 energy points',
        locationIcon: AppAssets().locationIcon,
        location: 'Riyadh Area'),
    TopSubscriptionsScreenModel(
        imageUrl: AppAssets().topSubscriptionStadiumImage,
        profileLogo: AppAssets().topSubscriptionStadiumLogo,
        title: 'Sporting Club',
        energyPointsIcon: AppAssets().pointsEarnedIcon,
        energyPoints: '100 energy points',
        locationIcon: AppAssets().locationIcon,
        location: 'Riyadh Area'),
    TopSubscriptionsScreenModel(
        imageUrl: AppAssets().topSubscriptionStadiumImage,
        profileLogo: AppAssets().topSubscriptionStadiumLogo,
        title: 'Sporting Club',
        energyPointsIcon: AppAssets().pointsEarnedIcon,
        energyPoints: '100 energy points',
        locationIcon: AppAssets().locationIcon,
        location: 'Riyadh Area')
  ];
}
