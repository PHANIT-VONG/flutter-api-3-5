import 'package:flutter_api_3_5/controllers/post_controller.dart';
import 'package:flutter_api_3_5/models/post_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<GetPostEvent>((event, emit) async {
      emit(PostLoading());
      try {
        List<PostModel> list = await PostController().fetchData();
        emit(PostLoaded(postList: list));
      } catch (e) {
        emit(PostError(error: e.toString()));
      }
    });
  }
}
