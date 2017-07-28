require 'mechanize'
# Retrieve user's content from Medium
class Medium
  def initialize
    @agent = Mechanize.new
  end

  def stories(target)
    url = target['@'].nil? ? url_from_domain(target) : url_from_user(target)
    url = URI.join('http', url).to_s
    page = Mechanize.new.get url
    parse_stories page
  end

  def last_content(target)
    stories(target).first
  end

  def random_content(target)
    stories(target).sample
  end

  private

  def url_from_user(username)
    "https://medium.com/feed/#{username}"
  end

  def url_from_domain(domain)
    domain = "https://#{domain}" unless domain =~ /\A#{URI.regexp(%w[http https])}\z/
    "#{domain}/feed"
  end

  def parse_stories(page)
    page.search('//item').map do |entry|
      next if entry.search('.//category').empty?
      parse_entry(entry)
    end.compact
  end

  def parse_entry(entry)
    {
      title: entry.search('.//title').text,
      url: entry.search('.//link').text
    }
  end
end
