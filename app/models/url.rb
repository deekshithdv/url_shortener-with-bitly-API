class Url < ApplicationRecord
  validates :long_url, presence: true, length: { minimum: 30}
  before_create :generate_short_url

  def generate_short_url
    # I created account in bitly website and generated an access token
    client = Bitly::API::Client.new(token:'6eb07de282f141e42e7503b2131732e1768f9c57')
    bitlink = client.shorten(long_url: long_url)
    return bitlink.link
  end
end
