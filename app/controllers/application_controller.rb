class ApplicationController < ActionController::API
  private

  # Render a subject conditionally, taking into consideration whether or not it is stale
  def conditional_render(subject, publicly_cacheable = true, last_modified_attribute = :updated_at, **adapter_options)
    if stale?(last_modified: last_modified_date_from(subject, last_modified_attribute), public: publicly_cacheable)
      render adapter_options.merge(json: subject)
    end
  end

  # Fetch the last modified date from a subject using the provided attribute (:updated_at by default)
  def last_modified_date_from(subject, attribute = :updated_at)
    subject.try(attribute) || subject.maximum(attribute)
  end

  # Returns a paginated collection of elements based on the provided scope or block
  def paginated(scope = nil)
    scope ||= yield if block_given?
    scope.page(current_page).per(page_size)
  end

  # Returns the current page number for results pagination
  def current_page
    pagination_status[:number]
  end

  # Returns the page size for results pagination
  def page_size
    pagination_status[:size]
  end

  def pagination_status
    @pagination_status ||= {
      number: requested_page_attribute(:number) || default_page_number,
      size: requested_page_attribute(:size) || default_page_size
    }
  end

  def requested_page_attribute(key)
    v = page_params[key].to_i
    v if v > 0
  end

  def page_params
    params[:page] || {}
  end

  def default_page_size
    Kaminari.config.default_per_page
  end

  def default_page_number
    1
  end
end
