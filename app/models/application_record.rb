class ApplicationRecord < ActiveRecord::Base
  include ActionView::Helpers::DateHelper

  primary_abstract_class

  def posted_time_passed
    if self.updated_at - self.created_at > 1
      "Edited " + time_ago_in_words(self.updated_at) + " ago"
    else
      "Posted " + time_ago_in_words(self.created_at) + " ago"
    end
  end
end
