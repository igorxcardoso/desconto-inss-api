require 'rails_helper'

RSpec.describe User, type: :model do
  it "é válido com email e senha" do
    user = User.new(email: "teste@example.com", password: "123456")
    expect(user).to be_valid
  end

  it "cria um usuário válido com factory" do
    user = build(:user)
    expect(user).to be_valid
  end

  it "é inválido sem email" do
    user = User.new(password: "123456")
    expect(user).not_to be_valid
  end
end