# encoding: utf-8

require 'tunemygc/subscriber'

module TuneMyGc
  class StartRequestSubscriber < Subscriber
    def start(name, id, payload)
      TuneMyGc.processing_started({:controller => payload[:controller], :action => payload[:action]})
    end

    # Rails 3
    def call(*args)
      event = ActiveSupport::Notifications::Event.new(*args)
      TuneMyGc.processing_started({:controller => event.payload[:controller], :action => event.payload[:action]})
    end
  end

  class EndRequestSubscriber < Subscriber
    def finish(name, id, payload)
      TuneMyGc.processing_ended({:controller => payload[:controller], :action => payload[:action]})
    end

    # Rails 3
    def call(*args)
      event = ActiveSupport::Notifications::Event.new(*args)
      TuneMyGc.processing_ended({:controller => event.payload[:controller], :action => event.payload[:action]})
    end
  end
end

module TuneMyGc
  module Spies
    class ActionController < TuneMyGc::Spies::Base
      attr_reader :subscriptions

      def initialize
        super
        @subscriptions = []
      end

      def install
        subscription(/^start_processing.action_controller$/, TuneMyGc::StartRequestSubscriber.new)
        subscription(/^process_action.action_controller$/, TuneMyGc::EndRequestSubscriber.new)
        TuneMyGc.log "hooked: action_controller"
      end

      def uninstall
        @subscriptions.each{|s| ActiveSupport::Notifications.unsubscribe(s) }
        @subscriptions.clear
        TuneMyGc.log "uninstalled action_controller spy"
      end

      private
      def subscription(pattern, handler)
        @subscriptions << ActiveSupport::Notifications.subscribe(pattern, handler)
      end
    end
  end
end