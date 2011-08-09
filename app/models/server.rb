class Server < ActiveRecord::Base

  def banned_ips
    read_txt_list("banned_ips")
  end

  def remove_banned_ip(ip)
    self.write_txt_list( self.banned_ips.delete(ip) )
  end

  protected

  def read_txt_list(name)
    File.open(File.join(self.path, "#{name}.txt")).read.split("\n")
  end

  def write_txt_list(array)
    File.open(File.join(self.path, "#{name}.txt")).write(array * "\n")
  end
end
