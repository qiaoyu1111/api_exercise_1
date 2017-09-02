class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def update_temp
    book = Book.find(params[:id])

    response = RestClient.get "http://v.juhe.cn/xiangji_weather/live_air.php",
                              :params => { :bookname => book.juhe_id, :key => "9bd38b72e91d5fef3cecce953b278d21" }
    data = JSON.parse(response.body)

    book.update( :current_temp => data["result"]["sk"]["temp"] )

    redirect_to books_path
end
end
