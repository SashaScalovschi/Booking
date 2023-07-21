# app/controllers/rooms_controller.rb
class RoomsController < ApplicationController
  def index
    # Код для відображення всіх кімнат
    @rooms = Room.all
  end

  def show
    # Код для відображення окремої кімнати за її ідентифікатором
    @room = Room.find(params[:id])
  end

  def new
    # Код для створення нової кімнати (форма створення)
    @room = Room.new
  end

  def create
    # Код для збереження нової кімнати після відправки форми створення
    @room = Room.new(room_params)

    if @room.save
      redirect_to @room, notice: 'Кімната успішно створена.'
    else
      render :new
    end
  end

  def edit
    # Код для редагування існуючої кімнати (форма редагування)
    @room = Room.find(params[:id])
  end

  def update
    # Код для оновлення існуючої кімнати після відправки форми редагування
    @room = Room.find(params[:id])

    if @room.update(room_params)
      redirect_to @room, notice: 'Кімната успішно оновлена.'
    else
      render :edit
    end
  end

  def destroy
    # Код для видалення кімнати за її ідентифікатором
    @room = Room.find(params[:id])
    @room.destroy

    redirect_to rooms_url, notice: 'Кімната успішно видалена.'
  end

  private

  def room_params
    params.require(:room).permit(:name, :description, :price)
  end
end
