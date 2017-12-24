require "stfu/version"

#
# This gem only contains one function(for now). It will execute the passed
# block and have no output on stdout (or stderr if you choose).
#
module Stfu

  # Silences stdout to /dev/null
  # @param no_stderr Whethor or not to silence stderr as well as stdout
  def self.stfu(silence_stderr=false)
    begin
      orig_stdout = $stdout.clone
      orig_stderr = $stderr.clone unless silence_stderr

      # Windows has different paths for routing to null, perform them here
      if Gem.win_platform?
        $stdout.reopen(File.new('nul', 'w'))
        $stderr.reopen(File.new('nul', 'w')) unless silence_stderr
      else
        $stdout.reopen(File.new('/dev/null', 'w'))
        $stderr.reopen(File.new('/dev/null', 'w')) unless silence_stderr
      end
      ret = yield
    rescue StandardError => e
      $stdout.reopen(orig_stdout)
      $stderr.reopen(orig_stderr) unless silence_stderr
      raise e
    ensure
      $stdout.reopen(orig_stdout)
      $stderr.reopen(orig_stderr) unless silence_stderr
    end
    ret
  end

end
