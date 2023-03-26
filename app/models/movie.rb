class Movie < ActiveRecord::Base
  def self.all_ratings
    ['G','PG','PG-13','R']
  end

  def self.with_ratings(ratings_list, sort_by)
    # if ratings_list is an array such as ['G', 'PG', 'R'], retrieve all
    #  movies with those ratings
    # if ratings_list is nil, retrieve ALL movies
    if ratings_list.eql? nil then
      ratings_to_check = all_ratings
    else
      ratings_to_check = ratings_list
    end
    if sort_by.eql? nil then
      Movie.where(rating: ratings_to_check)
    else
      Movie.where(rating: ratings_to_check).order(sort_by)
    end
  end
end
