# Add a declarative step here for populating the DB with movies.

Given /the following movies exist:/ do |movies_table|
  movies_table.hashes.each do |movie|
  Movie.create(movie)
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
  end
  #print Movie.all
  #flunk "Unimplemented"
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.content  is the entire content of the page as a string.
  
  page.body.match(/([\s\S]*)#{Regexp.quote(e1)}([\s\S]*)#{Regexp.quote(e2)}([\s\S]*)/).should_not == nil
  #flunk "Unimplemented"
end


# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  rating_list.split(/,\s*/).each do |rating|
      step %Q[I#{(uncheck ? " un" : " ")}check "#{rating}"]
  end
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
end


Then /I should see all of the movies/ do
  available_movies = Movie.all.count + 1 
  page.all('table#movies tr').count.should == available_movies
end

Then /I should see none of the movies/ do
  available_movies = Movie.all.count + 1 
  1.should == available_movies
end

Then /the director of "(.+)" should be "(.+)"/ do |movie, director|
  step %Q[I am on the details page for "#{movie}"]
  page.body.match(/Director: #{Regexp.quote(director)}/).should_not == nil
end
