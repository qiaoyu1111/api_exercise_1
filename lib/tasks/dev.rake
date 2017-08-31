namespace :dev do
  task :fetch_city => :environment do
    puts "Fetch city data..."
    response = RestClient.get "http://v.juhe.cn/weather/citys", :params => { :key => JUHE_CONFIG["api_key"] }
    data = JSON.parse(response.body)

    data["result"].each do |c|
      existing_city = City.find_by_juhe_id( c["id"] )
      if existing_city.nil?
        City.create!( :juhe_id => c["id"], :province => c["province"],
                      :city => c["city"], :district => c["district"] )
      end
    end

    puts "Total: #{City.count} cities"
  end
end


namespace :dev do
  task :fetch_book => :environment do
    puts "Fetch book data..."
    response = RestClient.get "http://v.juhe.cn/xiangji_weather/live_air.php", :params => { :key => "9bd38b72e91d5fef3cecce953b278d21" }
    data = JSON.parse(response.body)

    data["result"].each do |c|
      existing_book = Book.find_by_juhe_id( c["id"] )
      if existing_book.nil?
        Book.create!( :juhe_id => c["id"], :province => c["province"],
                      :book => c["book"], :district => c["district"] )
      end
    end

    puts "Total: #{Book.count} books"
  end
end
