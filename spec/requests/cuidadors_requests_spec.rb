require 'rails_helper'

RSpec.describe "CuidadorsRequests", type: :request do
  describe "GET /cuidadors" do
    it "returns Unauthorized" do
      get "/cuidadors"
      expect(response).to have_http_status(401)
    end
  end

  describe "POST /cuidadors" do
    let(:valid_params) do
      {
        cuidador: {
        nome: "Cuidador",
        sexo: "masculino",
        cpf: "6666666666",
        telefone: "6666-6666",
        datanasc: "06-06-2006",
        email: "cuidador6@g.com",
        password: "123456",
        password_confirmation: "123456"
        }
      }
    end

    it "returns Error cuidador (missing animal)" do
      post "/cuidadors", params: valid_params
      expect(response).to have_http_status(422)
    end
  end
end
