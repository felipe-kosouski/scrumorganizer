class Users::ProjectsController < Users::BaseController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = current_user.projects
  end

  def edit
  end

  def show
    @boards = @project.boards.order(position: :asc)
  end

  def new
    @project = current_user.projects.new
  end

  def create
    @project = current_user.projects.new(projects_params)

    if @project.save
      flash[:notice] = "Projeto criado com sucesso"
      redirect_to [:users, @project]
    else
      flash[:error] = "Falha na criaçao do projeto"
      render :new
    end
  end

  def update
    if @project.update(projects_params)
      flash[:notice] = "Projeto atualizado com sucesso"
      redirect_to [:users, @project]
    else
      flash[:error] = "Falha na atualizaçao do projeto"
      render :edit
    end
  end

  def destroy
    @project.destroy
    flash[:notice] = "Projeto excluido com sucesso"
    redirect_to [:users, :projects]
  end

  private
  def set_project
    @project = current_user.projects.find(params[:id])
  end

  def projects_params
    params.require(:project).permit(:name)
  end
end
