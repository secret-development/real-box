# encoding:utf-8
require "spec_helper"

describe UserMailer do
  describe "password_reset" do
    let(:user) {Factory(:user, :password_reset_token => "anything") }
    let(:mail) { UserMailer.password_reset(user) }

    it "renders the headers" do
      mail.subject.should eq("Password reset")
      mail.to.should eq(["agent@mail.ru"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Чтобы сбросить ваш пароль нажмите на ссылку ниже")
    end
  end

end
