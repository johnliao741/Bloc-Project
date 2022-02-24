import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:my_bloc_project/domain/data/enum/banner_type.dart';
import 'package:my_bloc_project/domain/data/home_info.dart';
import 'package:my_bloc_project/domain/entitis/get_banners_response.dart';
import 'package:my_bloc_project/domain/entitis/get_home_items_response.dart';
import 'package:my_bloc_project/domain/entitis/notify_number_response.dart';
import 'package:my_bloc_project/injection/injection_container.dart';
import 'package:my_bloc_project/presentation/custom_ui/error_retry_widget.dart';
import 'package:my_bloc_project/presentation/custom_ui/image_network.dart';
import 'package:my_bloc_project/presentation/custom_ui/pager_view.dart';
import 'package:my_bloc_project/presentation/dialogs/dialogs.dart';
import 'package:my_bloc_project/presentation/login/bloc.dart';
import 'package:my_bloc_project/presentation/login/event.dart';
import 'package:my_bloc_project/presentation/common/state.dart';
import 'package:my_bloc_project/domain/data/home_info.dart' as home_info;
import 'package:url_launcher/url_launcher.dart';

import 'bloc.dart';
import 'event.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (BuildContext context) =>
                HomeItemsBloc(getIt())..add(GetHomeItemsEvent())),
        BlocProvider(
            create: (BuildContext context) =>
                BannersBloc(getIt())..add(GetBannersEvent())),
        BlocProvider(
            create: (BuildContext context) =>
                NotifyNumberBloc(getIt())..add(GetNotifyNumberEvent())),
      ],
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final bloc = BlocProvider.of<HomeItemsBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
        actions: [
          InkWell(
            child: Container(
              constraints: BoxConstraints(maxWidth: 30, maxHeight: 30),
              alignment: Alignment.center,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    child: Icon(
                      Icons.shopping_cart,
                      size: 25,
                    ),
                  ),
                  BlocBuilder<NotifyNumberBloc, ResultState>(
                    builder: (context, state) {
                      if (state is SuccessState<NotifyNumberResponse>) {
                        return Positioned(
                          right: 3,
                          top: 0,
                          child: Container(
                            width: 15,
                            height: 15,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(30)),
                            child: Text(
                              state.data?.amount.toString() ?? 0.toString(),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                        );
                      } else {
                        return Container(
                          width: 30,
                          height: 30,
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
            onTap: () {},
          ),
          IconButton(
              onPressed: () {
                context.read<LoginBloc>().add(LogoutAccountEvent());
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: MultiBlocListener(
          listeners: [
            BlocListener<BannersBloc, ResultState>(
                listener: (context, state) async {
              if (state is LoadingState) {
                Dialogs.showLoading(context);
              } else {
                Dialogs.hideLoading(context);
              }
              if (state is ErrorState) {
                var isConfirm = await Dialogs.showConfirmMessage(
                    context, state.errorMsg ?? "讀取失敗！！");
              }
            }),
            BlocListener<HomeItemsBloc, ResultState>(
                listener: (context, state) async {
              if (state is LoadingState) {
                Dialogs.showLoading(context);
              } else {
                Dialogs.hideLoading(context);
              }
              if (state is ErrorState) {
                var isConfirm = await Dialogs.showConfirmMessage(
                    context, state.errorMsg ?? "讀取失敗！！");
              }
            })
          ],
          child: Column(
            children: [
              BlocBuilder<BannersBloc, ResultState>(
                builder: (context, state) {
                  double screenWidth = MediaQuery.of(context).size.width;
                  double remainingWidth = screenWidth * .8;
                  double swipePhotosHeight = remainingWidth / 2.14285714;
                  if (state is SuccessState<GetBannersResponse>) {
                    var images = state.data?.banners!;
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        margin: EdgeInsets.only(left: 30, right: 30),
                        width: double.infinity,
                        color: Colors.white,
                        child: CustomPageView<home_info.Banner>(
                            width: remainingWidth,
                            height: swipePhotosHeight,
                            isAutoSlide: true,
                            images: images as List<home_info.Banner>,
                            clickItemAction: (banner) async {
                              if (banner is home_info.Banner) {
                                switch (banner.event!.bannerType) {
                                  case BannerType.browser:
                                    if (!await launch(
                                        banner.event!.description!)) {
                                      Dialogs.showMessage(context, "Error Url");
                                    }
                                    break;
                                  case BannerType.push:
                                    break;
                                  case BannerType.imgDialog:
                                    Dialogs.showImageDialog(
                                        context, banner.event!.description!);
                                    break;
                                  case BannerType.textDialog:
                                    Dialogs.showMessage(
                                        context, banner.event!.description!);
                                    break;
                                  default:
                                    break;
                                }
                              }
                            },
                            itemWidget: (banner) {
                              return CustomImageNetwork(url: banner.imgUrl);
                            }),
                      ),
                    );
                  } else if (state is ErrorState) {
                    return ErrorRetryWidget(state.errorMsg,
                        clickRetryAction: () {
                      context.read<BannersBloc>().add(GetBannersEvent());
                    });
                  } else {
                    return Container();
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.orange),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: IconButton(onPressed:(){
                    context.read<HomeItemsBloc>().add(GetHomeItemsEvent());
                  }, icon: Icon(Icons.shopping_cart)),),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.orange),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: IconButton(onPressed:(){
                      context.read<HomeItemsBloc>().add(GetHomeItemsEvent());
                    }, icon: Icon(Icons.shop)),),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.orange),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: IconButton(onPressed:(){
                      context.read<HomeItemsBloc>().add(GetHomeItemsEvent());
                    }, icon: Icon(Icons.event)),),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.orange),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: IconButton(onPressed:(){
                      context.read<HomeItemsBloc>().add(GetHomeItemsEvent());
                    }, icon: Icon(Icons.margin)),),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              BlocBuilder<HomeItemsBloc, ResultState>(
                  builder: (context, state) {
                if (state is SuccessState<GetHomeItemsResponse>) {
                  var items = state.data?.itemInfos!;
                  return Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, i) {
                            return _buildItem(items![i]);
                          },
                          separatorBuilder: (context, i) {
                            return Column(
                              children: [
                                SizedBox(
                                  height: 5,
                                ),
                                Divider(
                                  height: 1,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                              ],
                            );
                          },
                          itemCount: items!.length));
                } else if (state is ErrorState) {
                  return ErrorRetryWidget(state.errorMsg, clickRetryAction: () {
                    context.read<HomeItemsBloc>().add(GetHomeItemsEvent());
                  });
                } else {
                  return Container();
                }
              })
            ],
          )),
    );
  }

  Widget _buildItem(ItemInfo itemInfo) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      padding: EdgeInsets.only(top: 20, bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.network(
            itemInfo.imgUrl!,
            width: 150,
            height: 100,
          ),
          SizedBox(
            width: 5,
          ),
          VerticalDivider(
            color: Colors.black,
            thickness: 1,
          ),
          SizedBox(
            width: 5,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(itemInfo.title!),
              SizedBox(
                height: 5,
              ),
              Text(itemInfo.subTitle!)
            ],
          )
        ],
      ),
    );
  }
}
