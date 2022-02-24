import 'package:bloc/bloc.dart';
import 'package:my_bloc_project/domain/entitis/get_banners_response.dart';
import 'package:my_bloc_project/domain/entitis/get_home_items_response.dart';
import 'package:my_bloc_project/domain/entitis/notify_number_response.dart';
import 'package:my_bloc_project/domain/my_exception/my_exception.dart';
import 'package:my_bloc_project/domain/usecase/get_banners_usecase.dart';
import 'package:my_bloc_project/domain/usecase/get_home_items_usecase.dart';
import 'package:my_bloc_project/domain/usecase/get_notify_number_usecase.dart';
import 'package:my_bloc_project/domain/usecase/usecase.dart';
import 'package:my_bloc_project/presentation/common/state.dart';
import 'event.dart';

class HomeItemsBloc extends Bloc<HomeEvent, ResultState> {
  GetHomeItemsUseCase _getHomeItemsUseCase;

  HomeItemsBloc(this._getHomeItemsUseCase)
      : super(InitState()) {
    on<InitEvent>(_init);
    on<GetHomeItemsEvent>(_getHomeItems);
  }

  void _init(InitEvent event, Emitter<ResultState> emit) async {
    emit(InitState());
  }


  void _getHomeItems(GetHomeItemsEvent event, Emitter<ResultState> emit) async {
    emit(LoadingState());
    try {
      emit(SuccessState<GetHomeItemsResponse>(data: await _getHomeItemsUseCase(VoidParams.param)));
    } catch (e){
      if(e is ApiException){
        emit(ErrorState()
          ..errorMsg = e.errorMsg);
      }
    }

  }
}
class BannersBloc extends Bloc<HomeEvent, ResultState> {
  GetBannersUseCase _getBannersUseCase;

  BannersBloc(this._getBannersUseCase)
      : super(InitState()) {
    on<InitEvent>(_init);
    on<GetBannersEvent>(_getBanners);
  }

  void _init(InitEvent event, Emitter<ResultState> emit) async {
    emit(InitState());
  }


  void _getBanners(GetBannersEvent event, Emitter<ResultState> emit) async {
    emit(LoadingState());
    try {
      emit(SuccessState<GetBannersResponse>(data: await _getBannersUseCase(VoidParams.param)));
    } catch (e){
      if(e is ApiException){
        emit(ErrorState()
          ..errorMsg = e.errorMsg);
      }
    }

  }
}
class NotifyNumberBloc extends Bloc<HomeEvent, ResultState> {
  GetNotifyNumberUseCase _getNotifyNumberUseCase;
  NotifyNumberBloc(this._getNotifyNumberUseCase)
      : super(InitState()) {
    on<InitEvent>(_init);
    on<GetNotifyNumberEvent>(_getNotifyNumber);
  }

  void _init(InitEvent event, Emitter<ResultState> emit) async {
    emit(InitState());
  }

  void _getNotifyNumber(GetNotifyNumberEvent event,
      Emitter<ResultState> emit) async {
    try {
      emit(SuccessState<NotifyNumberResponse>(data: await _getNotifyNumberUseCase(VoidParams.param)));
    } catch (e){
      if(e is ApiException){
        emit(ErrorState()
          ..errorMsg = e.errorMsg);
      }
    }
  }
}
