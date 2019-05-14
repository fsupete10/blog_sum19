class NotesController < ApplicationController
  def index
    @notes = note.all
  end

  def show
    @note = Note.find(params[:id])
  end

  def new
    @note = Note.new
  end

  def edit
    @note = Note.find(params[:id])
  end

  def create
    @note = Note.new(note_params)

    if @note.save
      redirect_to notes_path
    else
      render :new
  end

  def update
    @note = Note.find(params[:id])

    if @note.update(note_params)
      redirect_to notes_path
    else
      render :edit
  end
end

private

def notes_params
  params.require(:note).permit(:title, :author, :body)
end