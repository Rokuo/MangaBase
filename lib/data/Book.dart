import 'package:hive_ce/hive_ce.dart';

part 'book.g.dart';

@HiveType(typeId: 1)
class Book extends HiveObject {
  Book({
    required this.id,
    required this.title,
    required this.authors,
    this.description,
    this.coverUrl,
    this.firstPublishYear,
    this.subjects = const [],
    this.pageCount,
  });

  @HiveField(0)
  int id;
  @HiveField(1)
  String title;
  @HiveField(2)
  List<String> authors;
  @HiveField(3)
  String? description;
  @HiveField(4)
  String? coverUrl;
  @HiveField(5)
  int? firstPublishYear;
  @HiveField(6)
  List<String> subjects;
  @HiveField(7)
  int? pageCount;

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['key'] ?? '',
      title: json['title'] ?? 'Unknown title',
      authors: (json['author_name'] as List?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      description: _parseDescription(json['description']),
      coverUrl: json['cover_i'] != null
          ? 'https://covers.openlibrary.org/b/id/${json['cover_i']}-L.jpg'
          : null,
      firstPublishYear: json['first_publish_year'],
      subjects: (json['subject'] as List?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      pageCount: json['number_of_pages_median'],
    );
  }

  static String? _parseDescription(dynamic description) {
    if (description == null) return null;
    if (description is String) return description;
    if (description is Map && description['value'] is String) {
      return description['value'];
    }
    return null;
  }

}


// mock data 
final List<Book> mockBooks = [
  Book(
    id: 0,
    title: '1984',
    authors: ['George Orwell'],
    description:
        'A dystopian novel about surveillance, totalitarianism, and the loss of individual freedom.',
    coverUrl:
        'https://covers.openlibrary.org/b/id/7222246-L.jpg',
    firstPublishYear: 1949,
    subjects: ['Dystopia', 'Political Fiction'],
    pageCount: 328,
  ),
  Book(
    id: 1,
    title: 'Brave New World',
    authors: ['Aldous Huxley'],
    description:
        'A futuristic society controlled by technology, conditioning, and genetic engineering.',
    coverUrl:
        'https://covers.openlibrary.org/b/id/8775116-L.jpg',
    firstPublishYear: 1932,
    subjects: ['Science Fiction', 'Dystopia'],
    pageCount: 288,
  ),
  Book(
    id: 2,
    title: 'Fahrenheit 451',
    authors: ['Ray Bradbury'],
    description:
        'A world where books are outlawed and firemen burn any that are found.',
    coverUrl:
        'https://covers.openlibrary.org/b/id/9251990-L.jpg',
    firstPublishYear: 1953,
    subjects: ['Censorship', 'Dystopia'],
    pageCount: 194,
  ),
  Book(
    id: 3,
    title: 'The Hobbit',
    authors: ['J.R.R. Tolkien'],
    description:
        'Bilbo Baggins embarks on a journey filled with dragons, treasure, and adventure.',
    coverUrl:
        'https://covers.openlibrary.org/b/id/6979861-L.jpg',
    firstPublishYear: 1937,
    subjects: ['Fantasy', 'Adventure'],
    pageCount: 310,
  ),
  Book(
    id: 4,
    title: 'The Lord of the Rings',
    authors: ['J.R.R. Tolkien'],
    description:
        'An epic fantasy tale about the battle between good and evil in Middle-earth.',
    coverUrl:
        'https://covers.openlibrary.org/b/id/8231856-L.jpg',
    firstPublishYear: 1954,
    subjects: ['Fantasy', 'Epic'],
    pageCount: 1178,
  ),
  Book(
    id: 6,
    title: 'To Kill a Mockingbird',
    authors: ['Harper Lee'],
    description:
        'A powerful story about racial injustice and moral growth in the American South.',
    coverUrl:
        'https://covers.openlibrary.org/b/id/8228691-L.jpg',
    firstPublishYear: 1960,
    subjects: ['Classic', 'Justice'],
    pageCount: 281,
  ),
  Book(
    id: 5,
    title: 'The Catcher in the Rye',
    authors: ['J.D. Salinger'],
    description:
        'A teenager’s perspective on alienation and identity in modern society.',
    coverUrl:
        'https://covers.openlibrary.org/b/id/8231996-L.jpg',
    firstPublishYear: 1951,
    subjects: ['Classic', 'Coming-of-age'],
    pageCount: 214,
  ),
  Book(
    id: 7,
    title: 'Moby-Dick',
    authors: ['Herman Melville'],
    description:
        'Captain Ahab’s obsessive quest to hunt the white whale.',
    coverUrl:
        'https://covers.openlibrary.org/b/id/8101341-L.jpg',
    firstPublishYear: 1851,
    subjects: ['Adventure', 'Classic'],
    pageCount: 635,
  ),
  Book(
    id: 8,
    title: 'Pride and Prejudice',
    authors: ['Jane Austen'],
    description:
        'A romantic novel exploring manners, upbringing, and marriage.',
    coverUrl:
        'https://covers.openlibrary.org/b/id/8091016-L.jpg',
    firstPublishYear: 1813,
    subjects: ['Romance', 'Classic'],
    pageCount: 279,
  ),
  Book(
    id: 9,
    title: 'The Great Gatsby',
    authors: ['F. Scott Fitzgerald'],
    description:
        'A tragic story of wealth, love, and the American Dream.',
    coverUrl:
        'https://covers.openlibrary.org/b/id/7222161-L.jpg',
    firstPublishYear: 1925,
    subjects: ['Classic', 'Tragedy'],
    pageCount: 180,
  ),
  Book(
    id: 10,
    title: 'Crime and Punishment',
    authors: ['Fyodor Dostoevsky'],
    description:
        'A psychological exploration of guilt and redemption.',
    coverUrl:
        'https://covers.openlibrary.org/b/id/8235086-L.jpg',
    firstPublishYear: 1866,
    subjects: ['Philosophy', 'Classic'],
    pageCount: 671,
  ),
  Book(
    id: 11,
    title: 'The Alchemist',
    authors: ['Paulo Coelho'],
    description:
        'A journey of self-discovery and following one’s dreams.',
    coverUrl:
        'https://covers.openlibrary.org/b/id/8128691-L.jpg',
    firstPublishYear: 1988,
    subjects: ['Philosophy', 'Adventure'],
    pageCount: 208,
  ),
  Book(
    id: 12,
    title: 'Dune',
    authors: ['Frank Herbert'],
    description:
        'A science fiction epic about politics, power, and destiny.',
    coverUrl:
        'https://covers.openlibrary.org/b/id/8106661-L.jpg',
    firstPublishYear: 1965,
    subjects: ['Science Fiction', 'Epic'],
    pageCount: 412,
  ),
  Book(
    id: 13,
    title: 'The Name of the Wind',
    authors: ['Patrick Rothfuss'],
    description:
        'The story of a gifted young man who grows to be the most notorious wizard.',
    coverUrl:
        'https://covers.openlibrary.org/b/id/8235116-L.jpg',
    firstPublishYear: 2007,
    subjects: ['Fantasy'],
    pageCount: 662,
  ),
  Book(
    id: 14,
    title: 'Harry Potter and the Philosopher’s Stone',
    authors: ['J.K. Rowling'],
    description:
        'A young boy discovers he is a wizard and attends a magical school.',
    coverUrl:
        'https://covers.openlibrary.org/b/id/7984916-L.jpg',
    firstPublishYear: 1997,
    subjects: ['Fantasy', 'Young Adult'],
    pageCount: 223,
  ),
  Book(
    id: 15,
    title: 'The Martian',
    authors: ['Andy Weir'],
    description:
        'An astronaut must survive alone on Mars using science and ingenuity.',
    coverUrl:
        'https://covers.openlibrary.org/b/id/8370221-L.jpg',
    firstPublishYear: 2011,
    subjects: ['Science Fiction'],
    pageCount: 369,
  ),
  Book(
    id: 16,
    title: 'Sapiens',
    authors: ['Yuval Noah Harari'],
    description:
        'A brief history of humankind, from ancient times to today.',
    coverUrl:
        'https://covers.openlibrary.org/b/id/8319256-L.jpg',
    firstPublishYear: 2011,
    subjects: ['History', 'Non-fiction'],
    pageCount: 443,
  ),
  Book(
    id: 17,
    title: 'Atomic Habits',
    authors: ['James Clear'],
    description:
        'An approach to building good habits and breaking bad ones.',
    coverUrl:
        'https://covers.openlibrary.org/b/id/9259256-L.jpg',
    firstPublishYear: 2018,
    subjects: ['Self-help'],
    pageCount: 320,
  ),
  Book(
    id: 18,
    title: 'The Pragmatic Programmer',
    authors: ['Andrew Hunt', 'David Thomas'],
    description:
        'A practical guide to becoming a better software developer.',
    coverUrl:
        'https://covers.openlibrary.org/b/id/8099256-L.jpg',
    firstPublishYear: 1999,
    subjects: ['Programming', 'Software Engineering'],
    pageCount: 352,
  ),
  Book(
    id: 19,
    title: 'Clean Code',
    authors: ['Robert C. Martin'],
    description:
        'A handbook of agile software craftsmanship.',
    coverUrl:
        'https://covers.openlibrary.org/b/id/9641986-L.jpg',
    firstPublishYear: 2008,
    subjects: ['Programming'],
    pageCount: 464,
  ),
];