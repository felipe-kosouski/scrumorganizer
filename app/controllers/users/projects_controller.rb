class Users::ProjectsController < Users::BaseController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def edit
  end

  def show
    set_project
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(projects_params)

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
    redirect_to [:users, Project.new]
  end

  private
  def set_project
    @project = Project.find(params[:id])
  end

  def projects_params
    params.require(:project).permit(:name, :user_id)
  end
end
