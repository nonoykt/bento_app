class BentoMailer < ApplicationMailer
  default from: 'bento_app@example.com'

  def creation_email(bento)
    @bento = bento
    mail(
      subject: '御弁当作成完了メール',
      to: 'shop@example.com',
      from: 'bento_app@example.com'
    )
  end
end
