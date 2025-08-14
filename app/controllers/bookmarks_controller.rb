class BookmarksController < ApplicationController


  # POST /lists/:list_id/bookmarks
  # => création effective du bookmark
  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to @list, notice: "Film ajouté à la liste."
    else
      # tu peux ré-afficher soit la page new, soit la page show avec le form
      render 'lists/show', status: :unprocessable_entity
    end
  end

  # DELETE /bookmarks/:id
  # => “détruire un bookmark”
  def destroy
    bookmark = Bookmark.find(params[:id])
    list = bookmark.list
    bookmark.destroy
    redirect_to list, notice: "Bookmark supprimé."
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end
