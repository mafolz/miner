require 'java'

class ShellProcess
  include ActiveModel::Validations
  attr_accessor :id, :command, :runtime

  ###################
  ##  Validations  ##
  ###################

  validates :id, :command, :presence => true
  validate  :process_id_uniq?

  def process_id_uniq?
    ! self.class.exists?(self.id)
  end

  ###################
  ##  Initializer  ##
  ###################
  
  def initialize(options = {})
    options.reverse_merge!({
      :id       => "test-0",
      :command  => "cat /dev/urandom"
    })
    self.id      = options[:id]
    self.command = options[:command]
    self.runtime = options[:runtime]
  end

  ########################
  ##  Instance methods  ##
  ########################
  
  def save
    if self.valid?
      self.class.processes[self.id] = self
      return self
    else
      return false
    end
  end

  def start
    unless self.runtime and self.running?
      self.runtime = java.lang.Runtime.getRuntime.exec(self.command)
    end
  end

  def running?
    return false unless self.runtime
    begin
      self.runtime.exitValue
      return false
    rescue java.lang.IllegalThreadStateException
      return true
    end
  end

  def read_line
    return "" unless self.runtime
    java.io.LineNumberReader.new( 
                                 java.io.InputStreamReader.new(self.runtime.getInputStream)
                                ).readLine
  end

  #####################
  ##  Class methods  ##
  #####################

  class << self
    attr_accessor :processes

    def find(id)
      self.processes[id]
    end

    def exists?(id)
      self.processes[id].present?
    end

    def create(options)
      new(options).save
    end
  end

  self.processes = {}
end
