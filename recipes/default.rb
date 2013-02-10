package "curl"
package "screen"
package "vim"

owner = 'vagrant'
group = 'vagrant'

cookbook_file "/home/#{owner}/.screenrc" do
  source 'screenrc.dot'
  action :create
  owner owner
  group group
  mode "0664"
end

remote_directory "/home/#{owner}/.vim" do
  source '.vim'
  owner owner
  group group
  mode "0755"
end

cookbook_file "/home/#{owner}/.vimrc" do
  source '.vimrc'
  action :create
  owner owner
  group group
  mode "0664"
end

