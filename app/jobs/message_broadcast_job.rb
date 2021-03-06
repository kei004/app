class MessageBroadcastJob < ApplicationJob
   queue_as :default
 
   def perform(message)
     # Do something later
     ActionCable.server.broadcast "threadtitle_channel_#{message.threadtitle_id}", message: render_message(message)
   end
   private
   def render_message(message)
     ApplicationController.renderer.render partial: 'messages/message', locals: {message: message}
   end
 end