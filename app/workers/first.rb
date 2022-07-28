class First
  include Sidekiq::Worker

  def perform(name, sec)
    p "Hey #{name}, going to sleep for #{sec}."

    sleep(sec)

    p "it was a long nap"
  end
end