class ApartmentsQuery
  def initialize(query)
    @apartments = Apartment.active
    @query = query
    @min_price = 0
    @max_price = Float::INFINITY
  end

  def results
    city_filter
    bedroom_count_filter
    bathroom_count_filter
    guest_count_filter
    day_price_filter
  end

  def city_filter
    if @query[:city].present?
      @apartments = @apartments.in_city(@query[:city])
    else
      @apartments
    end
  end

  def bedroom_count_filter
    if @query[:bedrooms].present?
      @apartments = @apartments.bedrooms(@query[:bedrooms])
    else
      @apartments
    end
  end

  def bathroom_count_filter
    if @query[:bathrooms].present?
      @apartments = @apartments.bathrooms(@query[:bathrooms])
    else
      @apartments
    end
  end

  def guest_count_filter
    if @query[:guests].present?
      @apartments = @apartments.guest_count(@query[:guests])
    else
      @apartments
    end
  end

  def day_price_filter
    if @query[:day_price_from].present? || @query[:day_price_to].present?
      min = @query[:day_price_from].empty? ? @min_price : @query[:day_price_from]
      max = @query[:day_price_to].empty? ? @max_price : @query[:day_price_to]
      @apartments = @apartments.day_price_between(min.to_f, max.to_f)
    else
      @apartments
    end
  end
end
