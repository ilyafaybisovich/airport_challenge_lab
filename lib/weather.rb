module Weather
  def self.stormy?
    [:stormy, :sunny].sample == :stormy
  end
end