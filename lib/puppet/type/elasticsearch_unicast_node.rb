Puppet::Type.newtype(:elasticsearch_unicast_node) do

  @doc = "Define an unicast node"

  newparam(:name, :namevar => true) do
    desc "Unique name"
  end

  newparam(:ipaddress) do
    desc "Content"
  end

  newparam(:cluster) do
    desc "Tag name to be used by file_concat to collect all file_fragments by tag name"
  end

  validate do 
    self.fail Puppet::ParseError, "Required setting 'ipaddress' missing" if self[:ipaddress].nil?
    self.fail Puppet::ParseError, "Required setting 'cluster' missing" if self[:ipaddress].nil?
  end

end
