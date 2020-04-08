require "rails_helper"

RSpec.describe BentoMailer, type: :mailer do
  let(:bento) { FactoryBot.create(:bento, name: 'メイラーSpecを書く', description: '送信したメールの内容を確認します。')}

  let(:text_body) do
    part = mail.body.parts.detect { |part| part.content_type == 'text/plain; charset=UTF-8' }
    part.body.raw_source
  end

  let(:html_body) do
    part = mail.body.parts.detect { |part| part.content_type == 'text/html; charset=UTF-8' }
    part.body.raw_source
  end

  describe '#creation_email' do
    let(:mail) { BentoMailer.creation_email(bento) }

    it '想定どおりのメールが生成されている' do
      expect(mail.subject).to eq('御弁当作成完了メール')
      expect(mail.to).to eq(['shop@example.com'])
      expect(mail.from).to eq(['bento_app@example.com'])

      #text
      expect(text_body).to match('以下の御弁当を作成しました')
      expect(text_body).to match('メイラーSpecを書く')
      expect(text_body).to match('送信したメールの内容を確認します')

      #html
      expect(html_body).to match('以下の御弁当を作成しました')
      expect(html_body).to match('メイラーSpecを書く')
      expect(html_body).to match('送信したメールの内容を確認します')
    end
  end
end
