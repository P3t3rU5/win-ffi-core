module WinFFI
  # Enum COMPUTER_NAME_FORMAT
  ComputerNameFormat = enum :computer_name_format,
  [
    :NetBIOS,                   0,
    :DnsHostname,               1,
    :DnsDomain,                 2,
    :DnsFullyQualified,         3,
    :PhysicalNetBIOS,           4,
    :PhysicalDnsHostname,       5,
    :PhysicalDnsDomain,         6,
    :PhysicalDnsFullyQualified, 7,
    :Max,                       8
  ]
end