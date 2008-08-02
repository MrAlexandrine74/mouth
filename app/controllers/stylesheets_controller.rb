class StylesheetsController < ApplicationController
  # cache all
  def show
    theme = params[:id] # TODO: Sanatize this
    send_data File.read("#{theme_path}/stylesheets/#{theme}.css"),
      :filename => "#{theme}.css", :type => "text/css", :disposition => 'inline'
  end
end
