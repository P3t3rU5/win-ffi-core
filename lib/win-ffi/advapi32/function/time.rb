module WinFFI
  module Advapi32
    if WindowsVersion >= 8

      #DWORD WINAPI EnumDynamicTimeZoneInformation(
      #  _In_   const DWORD dwIndex,
      #  _Out_  PDYNAMIC_TIME_ZONE_INFORMATION lpTimeZoneInformation )
      attach_function 'EnumDynamicTimeZoneInformation', [:dword, :pointer], :dword

      #DWORD WINAPI GetDynamicTimeZoneInformationEffectiveYears(
      #  _In_   const PDYNAMIC_TIME_ZONE_INFORMATION lpTimeZoneInformation,
      #  _Out_  LPDWORD FirstYear,
      #  _Out_  LPDWORD LastYear )
      attach_function 'GetDynamicTimeZoneInformationEffectiveYears', [:pointer, :pointer, :pointer], :dword

    end
  end
end