class Read < ApplicationRecord
  validates_presence_of :url

  scope :hot, -> {
    select('reads.url as url')
      .where('reads.created_at > ?', Time.now - 1.day)
      .group("reads.url")
      .order('count("reads".id) DESC').limit(10)
  }

  scope :hottest, -> {
    select('reads.url as url')
      .where('reads.created_at > ?', Time.now - 1.day)
      .group("reads.url")
      .order('count("reads".id) DESC').limit(1).first
  }
end
