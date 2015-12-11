class TestMailerPreview < ActionMailer::Preview

  def last
    ActionMailer::Base.deliveries.last
  end
end
