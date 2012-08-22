require 'spec_helper'

describe MoviesController do
#describe 'routing' do
#    it "should route /movies/similar/:id" do
#      get(:similar,{:id =>"4"}).should route_to("movies#similar",:id => "4" )
#    end
#  end

  describe 'find with same director /movies/similar/:id when director exists' do
    it 'should get the id of the movie for which similar movies to be found' do

    end
    it 'should call the model method Movie.find_similar with id' do
      Movie.should_receive(:find_similar).with('4').and_return(@fake_results)
      get :similar, {:id => "4"}
    end
    it 'should make the movies by the director available to that view' do

    end
  end

  describe 'find with same director /movies/similar/:id when no director exists for the movie id' do
    
  end
end
