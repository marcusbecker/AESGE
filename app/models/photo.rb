class Photo < ActiveRecord::Base
  before_destroy{
    File.delete(Rails.root.join('public', 'uploads',  self.path)) if File.exist?(Rails.root.join('public', 'uploads',  self.path))
  }
end
