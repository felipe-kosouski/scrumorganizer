class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.add_collaborator.subject
  #
  def add_collaborator(project)
    @project = project
    emails = @project.collaborators.map(&:email).uniq

    mail to: emails, subject: "Bem vindo novo colaborador!"

  end
end
