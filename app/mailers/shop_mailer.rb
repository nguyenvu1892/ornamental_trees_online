class ShopMailer < ApplicationMailer

  default from: (I18n.t "mailers.shop_mailer.shop_mail")

  def new_receipt(user, order, token_key, time)
    @user = user
    @order = order
    @token_key = token_key
    @time = time

    title_en = (I18n.t "mailers.shop_mailer.title")
    mail(to: @user.email, subject: title_en)
  end
end
