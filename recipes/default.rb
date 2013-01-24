package "curl"
package "screen"
package "vim"

owner = 'vagrant'

cookbook_file "/home/#{owner}/.screenrc" do
  source 'screenrc.dot'
  action :create
  owner owner
  mode "0664"
end

