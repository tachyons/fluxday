class CalendarController < ApplicationController
  def index; end

  def day
    @date = if params[:date].blank?
              Date.today
            else
              params[:date].to_date
            end
    @entries = current_user.assigned_and_written_tasks.where('start_date <= ? AND end_date >= ?', @date.end_of_day, @date.beginning_of_day)
    @work_logs = current_user.work_logs.where(date: @date)
  end

  def week
    if params[:date].blank?
      @start_date = Date.today - 6.days # .beginning_of_week
      @end_date = @start_date + 6.days # .end_of_week
    else
      date = params[:date].to_date
      @start_date = date # .beginning_of_week
      @end_date = date + 6.days # .end_of_week
    end
    @entry_hash = {}
    entries = current_user.work_logs.where('date <= ? AND date >= ?', @end_date.end_of_day, @start_date.beginning_of_day)
    (@start_date..@end_date).each do |dt|
      @entry_hash[dt] = entries.where('date <= ? AND date >= ?', dt.end_of_day, dt.beginning_of_day)
    end
  end

  def monthly
    if params[:date].blank?
      date = params[:date].to_date
      @start_date = date.beginning_of_month
      @end_date = date.end_of_month
    else
      @start_date = Date.today.beginning_of_month
      @end_date = Date.today.end_of_month
    end
    @prev_month = @start_date.beginning_of_week..(@start_date - 1)
    @next_month = (@end_date + 1)..@end_date.end_of_week
  end
end
