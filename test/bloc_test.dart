import 'package:bloc_test/bloc_test.dart';
import 'package:english_will_fly/features/reading/data/datasources/story_api.dart';
import 'package:english_will_fly/features/reading/data/models/story.dart';
import 'package:english_will_fly/features/reading/presentation/bloc/reading_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

// Mock sınıfını tanımlayın
class MockStoryApi extends Mock implements StoryApi {}

void main() {
  late ReadingBloc readingBloc;
  late MockStoryApi mockStoryApi;

  setUp(() {
    mockStoryApi = MockStoryApi();
    readingBloc = ReadingBloc(); // BLoC'ı başlatırken mock API'yi geçin
  });

  test('initial state is ReadingInitial', () {
    expect(readingBloc.state, ReadingInitial());
  });

  blocTest<ReadingBloc, ReadingState>(
    'emits [ReadingLoading, ReadingLoaded] when fetchStories is added and succeeds',
    build: () {
      when(mockStoryApi.loadStoryData("a1"))
          .thenAnswer((_) async => Story(title: "", stories: List.empty())); // Başarı durumu
      return readingBloc;
    },
    act: (bloc) => bloc.add(const FetchStories(levelCode: 'a1')),
    expect: () => [
      ReadingLoading(),
      ReadingLoaded(story: Story(title: "", stories: List.empty())), // Beklenen durumu ekleyin
    ],
  );

  /*blocTest<ReadingBloc, ReadingState>(
    'emits [ReadingLoading, ReadingError] when fetchStories is added and fails',
    build: () {
      when(mockStoryApi.loadStoryData(any)).thenThrow(Exception('Failed to load story')); // Hata durumu
      return readingBloc;
    },
    act: (bloc) => bloc.add(FetchStories(levelCode: 'a1')),
    expect: () => [
      ReadingLoading(),
      ReadingError(message: 'Exception: Failed to load story'),
    ],
  );*/
}
