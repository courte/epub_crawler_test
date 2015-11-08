class HathiParser
  SOURCE_FILE = APP_ROOT.join('db', 'data', 'hathi_test.xml')
  attr_reader :file, :source

  def initialize(source = nil, file = SOURCE_FILE)
    @source = source || Source.find_or_create_by(name: "HathiTrust")
    @file = File.read(file)
  end

  def load
    books_dump = Nokogiri::XML.parse(file) { |config| config.noblanks }
    books_data = books_dump.xpath('//record')
    create_books(books_data)
  end

  def create_books(books_data)
    books_data.map { |book_data| generate_book(book_data) }
  end

  def generate_book(book_data)
    book = Book.new
    set_book_data(book, book_data)
    set_source(book, book_data)
    set_authorships(book, book_data)
    set_subjects(book, book_data)
    book.save
  end

  def set_book_data(book, book_data)
    book.title = book_data.xpath('dc:title').text
    book.description = book_data.xpath('dc:description').text
    book.language = book_data.xpath('dc:language').text
    book.date = book_data.xpath('dc:date').text
    book.rights = book_data.xpath('dc:rights').text
    book.save
  end

  def set_source(book, book_data)
    book.books_sources.create(
      source: source,
      identification: book_data.attributes["id"].value,
      download_uri: book_data.xpath('source').text
    )
  end

  def set_authorships(book, book_data)
    book_data.xpath('//dc:creator').each do |creator|
      book.creators << Creator.find_or_create_by(name: creator.text)
    end
  end

  def set_subjects(book, book_data)
    book_data.xpath('//dc:subject').each do |subject|
      book.subjects << Subject.find_or_create_by(description: subject.text)
    end
  end
end
