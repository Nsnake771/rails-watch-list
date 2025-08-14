class ListsController < ApplicationController
    # => “voir toutes mes listes”
  def index
    @lists = List.all
  end

  # GET /lists/new
  # => “créer une liste” (formulaire)
  def new
    @list = List.new

  end

  # POST /lists
  # => “créer une liste” (soumission du form)
  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to @list, notice: "Liste créée."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /lists/:id
  # => “voir les détails d’une liste”
  def show
    @list = List.find(params[:id])
    # option pratique: préparer un bookmark pour un form d’ajout dans la page show
    @bookmark = Bookmark.new
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
