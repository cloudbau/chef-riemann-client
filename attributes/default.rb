#general ruby/chef setup
default[:riemann][:ruby_shebang] = '#!/opt/rbenv/shims/ruby'
default[:riemann][:ruby_exec] = "/opt/rbenv/shims/ruby"
default[:riemann][:ruby_version] = "1.9.3-p286"

# versions
default[:riemann][:client_version] = "0.2.2"
default[:riemann][:tools_version] = "0.1.3"

#kvm-check specific
default[:riemann][:kvm][:riemann_executable] = "/usr/bin/riemann-kvm-service"

#nova-check specific
default[:riemann][:nova][:riemann_executable] = "/usr/bin/riemann-nova-service"

#fixed-ip check
default[:riemann][:fixed_ip][:threshold] = 2
default[:riemann][:fixed_ip][:interval] = 60
default[:riemann][:fixed_ip][:riemann_executable] = "/usr/bin/riemann-fixed-service"

default[:riemann][:server][:bind_ip] = nil

case platform
when "redhat","centos","fedora", "amazon", "scientific"
  default[:riemann][:client][:install_pkgs] = %w{ libxml2-devel libxslt-devel }
when "debian","ubuntu"
  default[:riemann][:client][:install_pkgs] = %w{ libxml2-dev libxslt-dev }
end
