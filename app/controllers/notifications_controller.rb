class NotificationsController < ApplicationController
    def mark_as_read
      notification = Notification.find(params[:id])
      notification.update(read: true)
      redirect_to root_path, notice: 'Notificación marcada como leída.'
    end
  end
  