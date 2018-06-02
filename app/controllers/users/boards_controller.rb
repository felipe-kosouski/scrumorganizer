class Users::BoardsController < Users::BaseController
  before_action :set_project
  before_action :set_board, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @board = @project.boards.new
  end

  def edit
  end

  def show
  end

  def create
    @board = @project.boards.new(boards_params)

    if @board.save
      flash[:notice] = "Quadro criado com sucesso"
      redirect_to [:users, @project]
    else
      flash[:error] = "Falha na criaçao do quadro"
      render :new
    end
  end

  def update
    if @board.update(boards_params)
      flash[:notice] = "Quadro atualizado com sucesso"
      redirect_to [:users, @project]
    else
      flash[:error] = "Falha na atualizaçao do quadro"
      render :edit
    end
  end

  def destroy
    @board.destroy
    flash[:notice] = "Quadro excluido com sucesso"
    redirect_to [:users, @project]
  end

  private
  def set_project
    @project = current_user.projects.find_by(id: params[:project_id]) || current_user.shared_projects.find_by(id: params[:project_id])
  end

  def set_board
    @board = @project.boards.find(params[:id])
  end

  def boards_params
    params.require(:board).permit(:name, :position)
  end

end
