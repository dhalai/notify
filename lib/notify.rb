require 'active_support'

module Notify
  extend ActiveSupport::Concern
  extend ActiveSupport::Autoload

  autoload :VERSION
  autoload :Tracker
  autoload :Channel
  autoload :Creation,     'notify/actions/creation.rb'
  autoload :Update,       'notify/actions/update.rb'
  autoload :Destruction,  'notify/actions/destruction.rb'

  included do
    include Tracker
    include Channel

    class_attribute :notify_hooks, :subscriptions
    self.notify_hooks = {}
    self.subscriptions = {}
  end

  def create_notification(action_type)
    return unless self.notify_hooks[action_type].present?

    channels = extract_channels(action_type)
    channels.each do |name|
      create_channel(name)
    end
  end

  private
  def extract_channels(action_type)
    chanels = self.notify_hooks[action_type].select do |_, p|
       ((!!p == p) && p ) || ( p.is_a?(Proc) && p.call(self) )
    end
    chanels.keys
  end
end
