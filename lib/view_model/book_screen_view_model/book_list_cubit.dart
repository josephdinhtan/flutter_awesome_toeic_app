import 'package:bloc/bloc.dart';
import '../../data/data_providers/book_api.dart';
import '../../data/models/book_info_model.dart';
import '../../data/repositories/book_repository/book_repository_impl.dart';
import '../../domain/base_use_case.dart';
import '../../domain/get_list_book_use_case.dart';

part 'book_list_state.dart';

class BookListCubit extends Cubit<BookListState> {
  final BaseUseCase useCase =
      GetListBookUseCase(repository: BookRepositoryImpl(api: BookApi()));

  BookListCubit() : super(BookListInitial());

  Future<void> getBookList() async {
    emit(BookListLoading());
    try {
      final List<BookInfoModel> listBook = await useCase.getListInfo();
      emit(BookListLoaded(bookListModel: listBook));
    } catch (error) {
      emit(Failure());
    }
  }
}
