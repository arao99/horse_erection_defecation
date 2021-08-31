require 'sinatra'
require './database'

get '/' do
  erb :index
end

get '/post' do
  erb :post
end

post '/post' do
  @message = validate(params)
  if @message
    erb :post
  else
    create_record(params)
    @message = '投稿しました！'
    erb :post
  end
end

get '/browse' do
  erb :browse
end

get '/readme' do
  erb :readme
end

get '/history' do
  erb :history
end

get '/todo' do
  erb :todo
end

not_found do
  '404!'
end

error do
  'error!'
end

WEEKDAYS_ARRAY = ['日', '月', '火', '水', '木', '金', '土']

def validate(params)
  return '馬名はカタカナで入力してください！' unless params[:horse_name] =~ /^[ァ-ヴー]*$/
  return '馬っけかボロのどちらかは選んでください！' if params[:erection_level] == '0' && params[:dung_type] == '0'
  nil
end

def create_record(params)
  date = Time.parse(params[:date])
  weekday = WEEKDAYS_ARRAY[date.wday]
  Post.create(
    year: date.year,
    month: date.month,
    day: date.day,
    weekday: weekday,
    course: params[:course],
    race_number: params[:race_number],
    horse_number: params[:horse_number],
    horse_name: params[:horse_name],
    when: params[:when],
    erection_level: params[:erection_level],
    dung_type: params[:dung_type]
  )
end
