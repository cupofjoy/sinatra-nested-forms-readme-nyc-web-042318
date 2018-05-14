require_relative 'config/environment'

class App < Sinatra::Base
  get '/' do
    erb :new
  end

  post '/student' do
    @student = Student.new(params[:student])

    params[:student][:courses].each do |details|
      Course.new(details)
    end

    @courses = Course.all

    erb :student
  end
end
