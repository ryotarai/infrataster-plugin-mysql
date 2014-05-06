execute "sed -i -e 's| \\(http[^ ]\\+\\)| mirror://mirrors.ubuntu.com/mirrors.txt|g' /etc/apt/sources.list"

execute "apt-get update && touch /tmp/apt-get-updated" do
  not_if { File.exist?('/tmp/apt-get-updated') }
end

