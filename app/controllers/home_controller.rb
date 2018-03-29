class HomeController < ApplicationController
  layout "default"

  before_action :check_for_mobile

  before_action :set_twitter_id

  def index
    @program = Program.random
    @featured_events = Event.featured.order(start_time: :asc)
    @current_events = Event.visible.with_startime.this_week.order(start_time: :asc).not_featured
    @future_events = Event.visible.with_startime.next_week.order(start_time: :asc).not_featured
    @static_events = Event.static.not_featured
    @scheduled = Program.scheduled
  end

  def splash
    render layout: false
  end

  def campaign
    render layout: false
  end

  def safer_space; end

  def dj_pledge; end

  def magma
    @magma_shows = MagmaShow.
      where("date > ?", Time.parse("1-1-2015")).
      order("date ASC")

    @sponsors = Sponsor.all.where(year: Time.zone.now.year.to_s)
  end

  private

  def set_twitter_id
    @twitter_id = "hollowearth"
  end
end
