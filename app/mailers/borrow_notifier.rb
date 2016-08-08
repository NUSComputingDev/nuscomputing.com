class BorrowNotifier < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.borrow_notifier.request_approved.subject
  #
  def request_approved(request, url)
    @greeting = "Hi"
    @url = url
    attachments.inline['qrcode.png'] = File.read request.item_transaction.qrcode.path
    mail to: request.user.email, subject: "[Approved] Your Request for item #{request.item.label} has been approved"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.borrow_notifier.request_rejected.subject
  #
  def request_rejected
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.borrow_notifier.transaction_summary.subject
  #
  def transaction_summary
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.borrow_notifier.transaction_overdued.subject
  #
  def transaction_overdued
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
