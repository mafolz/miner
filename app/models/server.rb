require 'java'

class Server < ActiveRecord::Base

  def world
    self.path + '/world'
  end

  #############################
  ##  Server Configurations  ##
  #############################
  
  def banned_ips
    read_txt_list("banned_ips")
  end

  def remove_banned_ip(ip)
    self.write_txt_list( self.banned_ips.delete(ip) )
  end

  #######################
  ##  Shell processes  ##
  #######################

  def render_world
    self.render_world_process.start
  end

  def render_world_process
    ShellProcess.find("render_world_#{self.id}") ||
    ShellProcess.create({
      :id      => "render_world_#{self.id}",
      :command => "#{Miner::Config["default_map_generator"]} #{self.path} #{self.map_path}"
    })
  end

  def render_world_running?
    self.render_world_process.running?
  end
  
  
  protected

  def read_txt_list(name)
    File.open(File.join(self.path, "#{name}.txt")).read.split("\n")
  end

  def write_txt_list(array)
    File.open(File.join(self.path, "#{name}.txt")).write(array * "\n")
  end

end
