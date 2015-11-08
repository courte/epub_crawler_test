class GutenbergParser
  attr_reader :file, :source, :book

  def initialize(args)
    @file = args[:file]
    @source = source || Source.find_or_create_by(name: "Project Gutenberg")
  end

  def load
    Dir[APP_ROOT.join('db', 'data', 'gutenberg', 'epub')]
  end

  def generate_book
  end

  def set_book_data
  end

  def set_source
  end

  def set_authorships
  end

  def set_subjects
  end
end
