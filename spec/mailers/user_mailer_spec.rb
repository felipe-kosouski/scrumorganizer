require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  before(:each) do
    @project = create(:project)
  end


  describe "add_collaborator" do
    let(:mail) { UserMailer.add_collaborator(@project) }

    it "renders the headers" do
      expect(mail.subject).to eq("Bem vindo novo colaborador!")
      #expect(mail.to).to eq(["user@example.com.br"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Bem vindo")
    end
  end

end
