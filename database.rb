require 'active_record'

dbname = 'horse_erection_defecation'

if `hostname` == 'aws'
  host = ''
  user = 'horse_erection_defecation'
  pass = "#{user}!"
else
  host = 'localhost'
  user = 'root'
  pass = ''
  ActiveRecord::Base.logger = Logger.new(STDERR)
end

ActiveRecord::Base.establish_connection(
  :adapter   => 'mysql2',
  :database  => dbname,
  :host      => host,
  :username  => user,
  :password  => pass,
  :charset   => 'utf8mb4',
  :encoding  => 'utf8mb4',
  :collation => 'utf8mb4_general_ci'
)

Time.zone_default = Time.find_zone! 'Tokyo'
ActiveRecord::Base.default_timezone = :local

class Post < ActiveRecord::Base
end
