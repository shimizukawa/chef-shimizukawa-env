package "curl"
package "screen"
package "vim"

cookbook_file "/home/vagrant/.screenrc" do
  source 'screenrc.dot'
  action :create_if_missing
  owner owner
  mode "0664"
end

