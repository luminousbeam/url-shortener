require 'sinatra'
require 'base64'
require 'pstore'

get '/:url' do
  redirect "http://" + ShortURL.read(params[:url])
end

get '/' do
  "Enter your URL using a curl POST request."
end

post '/' do
  url = generate_short_url(params[:url])
  "Your shortened URL is: #{url}"
end

def generate_short_url(original_url)
  ShortURL.save(Base64.encode64(original_url)[0..6], original_url)
  "localhost:4567/" + Base64.encode64(original_url)[0..6]
end

# def generate_short_url(original_url)
#   letters = Array('a'..'z')
#   random_letters = Array.new(6) { letters.sample }.join
#   ShortURL.save(random_letters, original_url)
#   "localhost:4567/" + random_letters
# end

class ShortURL
  @store ||= PStore.new("short_urls.db")

  def self.save(encoded, original_url)
    @store.transaction { |t| @store[encoded] = original_url}
  end

  def self.read(encoded)
   @store.transaction {@store[encoded]}
 end

end
