package "curl"
package "screen"
package "vim"

file "/home/#{node.shimizukawa_env.user}/.gemrc" do
  content "gem: --no-ri --no-rdoc"
  owner node.shimizukawa_env.user
  group node.shimizukawa_env.group
  mode "0664"
end

cookbook_file "/home/#{node.shimizukawa_env.user}/.screenrc" do
  source 'screenrc.dot'
  action :create
  owner node.shimizukawa_env.user
  group node.shimizukawa_env.group
  mode "0664"
end

remote_directory "/home/#{node.shimizukawa_env.user}/.vim" do
  source '.vim'
  owner node.shimizukawa_env.user
  group node.shimizukawa_env.group
  mode "0755"
end

cookbook_file "/home/#{node.shimizukawa_env.user}/.vimrc" do
  source '.vimrc'
  action :create
  owner node.shimizukawa_env.user
  group node.shimizukawa_env.group
  mode "0664"
end

