class InviteMailer < ApplicationMailer
  def invite
    @host     = host
    @email    = params[:email]
    @password = params[:password]

    mail(to: @email, subject: 'You have invite for Ever Testing!')
  end

  def host
    Rails.application.config.action_mailer.default_url_options[:protocol] + '://'
    Rails.application.config.action_mailer.default_url_options[:host] + ':'
    Rails.application.config.action_mailer.default_url_options[:port].to_s
  end
end
