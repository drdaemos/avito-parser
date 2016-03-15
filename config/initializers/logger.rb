class CustomLogger < Logger
  def format_message(severity, timestamp, progname, msg)
    "#{timestamp.to_formatted_s(:db)} #{severity} #{msg}\n"
  end
end

filename = 'custom_' + Date.current.to_s(:db) + '.log'
logfile = File.open(Rails.root.join('log', filename), 'a')  # create log file
logfile.sync = true  # automatically flushes data to file

AvitoParser.setLogger(CustomLogger.new(logfile))