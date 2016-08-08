# Preview all emails at http://localhost:3000/rails/mailers/borrow_notifier
class BorrowNotifierPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/borrow_notifier/request_approved
  def request_approved
    BorrowNotifier.request_approved
  end

  # Preview this email at http://localhost:3000/rails/mailers/borrow_notifier/request_rejected
  def request_rejected
    BorrowNotifier.request_rejected
  end

  # Preview this email at http://localhost:3000/rails/mailers/borrow_notifier/transaction_summary
  def transaction_summary
    BorrowNotifier.transaction_summary
  end

  # Preview this email at http://localhost:3000/rails/mailers/borrow_notifier/transaction_overdued
  def transaction_overdued
    BorrowNotifier.transaction_overdued
  end

end
