module PaintingHelper
  def all_countries
    c = ISO3166::Country.all.map {|country| country.name}
    c.sort
  end
end