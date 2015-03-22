module WinFFI
  ExtendedNameFormat = enum :extended_name_format,
  [
    :Unknown,          0,
    :FullyQualifiedDN, 1,
    :SamCompatible,    2,
    :Display,          3,
    :UniqueId,         6,
    :Canonical,        7,
    :UserPrincipal,    8,
    :CanonicalEx,      9,
    :ServicePrincipal, 10,
    :DnsDomain,        12
  ]
end