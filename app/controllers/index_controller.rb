class IndexController < ApplicationController
  def index
  	time_diff_components = Time.diff(Time.new, Time.parse('1998-03-01'))
    @resultado = time_diff_components[:year]

  	respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @resultado }
    end
  end
end
