require 'rails_helper'

RSpec.describe "FuncionariosRequests", type: :request do

  describe "GET /funcionarios" do
    it "returns Unauthorized" do
      get "/funcionarios"
      expect(response).to have_http_status(401)
    end
  end

    describe "POST /funcionarios" do
      let(:valid_params) do
        {
          funcionario: {
          nome: "Funcionario",
          sexo: "masculino",
          cpf: Funcionario.first.cpf,
          telefone: "1111-1111",
          datanasc: "01-01-2001",
          email: "func1@g.com",
          password: "123456",
          password_confirmation: "123456"
          }
        }
      end
  
      it "returns error create funcionario (cpf taken)" do
        post "/funcionarios", params: valid_params
        expect(response).to have_http_status(422)
      end
    end

    describe "POST /funcionarios" do
      let(:valid_params) do
        {
          funcionario: {
          nome: "Funcionario",
          sexo: "masculino",
          cpf: "101010101010",
          telefone: "1010-1010",
          datanasc: "01-01-2001",
          email: "func10@g.com",
          password: "123456",
          password_confirmation: "123456"
          }
        }
      end
  
      it "create funcionario" do
        post "/funcionarios", params: valid_params
        expect(response).to have_http_status :created
      end
    end
end
