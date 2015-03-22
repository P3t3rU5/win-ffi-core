module WinFFI
  module WinMM

    typedef :pointer, :hwaveout
    typedef :pointer, :hwavein
    typedef :uint,    :mmversion

    MMRESULT = enum :mm_result, [
        :MMSYSERR_NOERROR,      0,
        :MMSYSERR_ERROR,        1,
        :MMSYSERR_BADDEVICEID,  2,
        :MMSYSERR_NOTENABLED,   3,
        :MMSYSERR_ALLOCATED,    4,
        :MMSYSERR_INVALHANDLE,  5,
        :MMSYSERR_NODRIVER,     6,
        :MMSYSERR_NOMEM,        7,
        :MMSYSERR_NOTSUPPORTED, 8,
        :MMSYSERR_BADERRNUM,    9,
        :MMSYSERR_INVALFLAG,    10,
        :MMSYSERR_INVALPARAM,   11,
        :MMSYSERR_HANDLEBUSY,   12,
        :MMSYSERR_INVALIDALIAS, 13,
        :MMSYSERR_BADDB,        14,
        :MMSYSERR_KEYNOTFOUND,  15,
        :MMSYSERR_READERROR,    16,
        :MMSYSERR_WRITEERROR,   17,
        :MMSYSERR_DELETEERROR,  18,
        :MMSYSERR_VALNOTFOUND,  19,
        :MMSYSERR_NODRIVERCB,   20,
        :WAVERR_BADFORMAT,      32,
        :WAVERR_STILLPLAYING,   33,
        :WAVERR_UNPREPARED,     34
    ]

    module Waveform
      ffi_lib 'winmm.dll'
      extend LibBase

      # typedef struct {
      #   WORD      wMid;
      #   WORD      wPid;
      #   MMVERSION vDriverVersion;
      #   TCHAR     szPname[MAXPNAMELEN];
      #   WORD      wTechnology;
      #   WORD      wReserved1;
      #   DWORD     dwSupport;
      # } AUXCAPS;
      class AUXCAPS < FFIStruct
        layout :wMid,           :word,
               :wPid,           :word,
               :vDriverVersion, :mmversion,
               :szPname,        :string,
               :wTechnology,    :word,
               :wReserved1,     :word,
               :dwSupport,      :dword
      end

      SND = enum :sound_flags, [
        :SYNC,      0x0000,
        :ASYNC,     0x0001,
        :NODEFAULT, 0x0002,
        :MEMORY,    0x0004,

        #loop the sound until next sndPlaySound
        :LOOP,      0x0008,
        :NOSTOP,    0x0010,
        :PURGE,     0x40,

       #The pszSound parameter is an application-specific alias in the registry. You can combine this flag with the
       # SND_ALIAS or SND_ALIAS_ID flag to specify an application-defined sound alias.
        :APPLICATION, 0x80,
        :NOWAIT,      0x00002000,
        :ALIAS,       0x00010000,
        :ALIAS_ID,    0x00110000,
        :FILENAME,    0x00020000,
        :RESOURCE,    0x00040004
      ]

      WHDR = enum :whdr_flags, [
        :DONE,      1,
        :PREPARED,  2,
        :BEGINLOOP, 4,
        :ENDLOOP,   8,
        :INQUEUE,   16
      ]

      # typedef struct wavehdr_tag {
      #   LPSTR              lpData;
      #   DWORD              dwBufferLength;
      #   DWORD              dwBytesRecorded;
      #   DWORD_PTR          dwUser;
      #   DWORD              dwFlags;
      #   DWORD              dwLoops;
      #   struct wavehdr_tag  *lpNext;
      #   DWORD_PTR          reserved;
      # } WAVEHDR, *LPWAVEHDR;
      class WAVEHDR < FFIStruct
        layout :lpData,          :pointer,
               :dwBufferLength,  :dword,
               :dwBytesRecorded, :dword,
               :dwUser,          :pointer,
               :dwFlags,         WHDR,
               :dwLoops,         :dword,
               :lpNext,          :pointer,
               :reserved,        :pointer
      end

      # typedef struct {
      #   WORD      wMid;
      #   WORD      wPid;
      #   MMVERSION vDriverVersion;
      #   TCHAR     szPname[MAXPNAMELEN];
      #   DWORD     dwFormats;
      #   WORD      wChannels;
      #   WORD      wReserved1;
      # } WAVEINCAPS;
      class WAVEINCAPS < FFIStruct
        layout :wMid,           :word,
               :wPid,           :word,
               :vDriverVersion, :mmversion,
               :szPname,        :string,
               :dwFormats,      :dword,
               :wChannels,      :word,
               :wReserved1,     :word
      end

      # typedef struct {
      #   WORD      wMid;
      #   WORD      wPid;
      #   MMVERSION vDriverVersion;
      #   TCHAR     szPname[MAXPNAMELEN];
      #   DWORD     dwFormats;
      #   WORD      wChannels;
      #   WORD      wReserved1;
      #   DWORD     dwSupport;
      # } WAVEOUTCAPS;
      class WAVEOUTCAPS < FFIStruct
        layout wMid,           :word,
               wPid,           :word,
               vDriverVersion, :mmversion,
               szPname,        :string,
               dwFormats,      :dword,
               wChannels,      :word,
               wReserved1,     :word,
               dwSupport,      :dword
      end

      # typedef struct {
      #   WORD  wFormatTag;
      #   WORD  nChannels;
      #   DWORD nSamplesPerSec;
      #   DWORD nAvgBytesPerSec;
      #   WORD  nBlockAlign;
      #   WORD  wBitsPerSample;
      #   WORD  cbSize;
      # } WAVEFORMATEX;
      class WAVEFORMATEX < FFIStruct
        layout :wFormatTag,      :word,
               :nChannels,       :word,
               :nSamplesPerSec,  :dword,
               :nAvgBytesPerSec, :dword,
               :nBlockAlign,     :word,
               :wBitsPerSample,  :word,
               :cbSize,          :word
      end

      # MMRESULT auxGetDevCaps(
      #     UINT_PTR uDeviceID,
      #     LPAUXCAPS lpCaps,
      #     UINT cbCaps);
      attach_function 'auxGetDevCapsA', [:pointer, AUXCAPS.ptr, :uint], MMRESULT
      attach_function 'auxGetDevCapsW', [:pointer, AUXCAPS.ptr, :uint], MMRESULT

      # UINT auxGetNumDevs(void);
      attach_function 'auxGetNumDevs', [], :uint

      # MMRESULT auxGetVolume(
      #    UINT uDeviceID,
      #    LPDWORD lpdwVolume);
      attach_function 'auxGetVolume', [:uint, :pointer], MMRESULT

      # DWORD auxOutMessage(
      #     UINT uDeviceID,
      #     UINT uMsg,
      #     DWORD_PTR dwParam1,
      #     DWORD_PTR dwParam2);
      attach_function 'auxOutMessage', [:uint, :uint, :pointer, :pointer], :dword

      # MMRESULT auxSetVolume(
      #   UINT uDeviceID,
      #   DWORD dwVolume);
      attach_function 'auxSetVolume', [:uint, :dword], MMRESULT

      #BOOL PlaySound(
      #  LPCTSTR pszSound,
      #  HMODULE hmod,
      #  DWORD fdwSound )
      attach_function 'PlaySound',  [:string, :hmodule, SoundFlags], :bool
      attach_function 'PlaySoundA', [:string, :hmodule, SoundFlags], :bool
      attach_function 'PlaySoundW', [:string, :hmodule, SoundFlags], :bool

      # BOOL sndPlaySound(
      #    LPCTSTR lpszSound,
      #    UINT fuSound)
      attach_function 'sndPlaySound', [:string, SND], :bool

      # MMRESULT waveInAddBuffer(
      #    HWAVEIN hwi,
      #    LPWAVEHDR pwh,
      #    UINT cbwh)
      attach_function 'waveInAddBuffer', [:hwavein, WAVEHDR.ptr, :uint], MMRESULT

      # MMRESULT waveInClose( HWAVEIN hwi )
      attach_fuunction 'waveInClose', [:hwavein], MMRESULT

      # MMRESULT waveInGetDevCaps(
      #   UINT_PTR uDeviceID,
      #   LPWAVEINCAPS pwic,
      #   UINT cbwic)
      attach_function 'waveInGetDevCapsA', [:pointer, WAVEINCAPS.ptr, :uint], MMRESULT
      attach_function 'waveInGetDevCapsW', [:pointer, WAVEINCAPS.ptr, :uint], MMRESULT

      # MMRESULT waveInGetErrorText(
      #   MMRESULT mmrError,
      #   LPTSTR pszText,
      #   UINT cchText)
      attach_function 'waveInGetErrorTextA', [MMRESULT, :string, :uint], MMRESULT
      attach_function 'waveInGetErrorTextW', [MMRESULT, :string, :uint], MMRESULT

      # MMRESULT waveInGetID(
      #   HWAVEIN hwi,
      #   LPUINT puDeviceID);
      attach_function 'waveInGetID', [:hwavein, :pointer], MMRESULT

      # UINT waveInGetNumDevs(void)
      attach_function 'waveInGetNumDevs', [], :uint

      # UINT waveInGetNumDevs(void);
      attach_function 'waveInGetNumDevs', [], :uint

      #TODO MMTIME structure
      # MMRESULT waveInGetPosition(
      #   HWAVEIN hwi,
      #   LPMMTIME pmmt,
      #   UINT cbmmt)
      # attach_function 'waveInGetPosition', [:hwavein, ], MMRESULT

      # DWORD waveInMessage(
      #   HWAVEIN deviceID,
      #   UINT uMsg,
      #   DWORD_PTR dwParam1,
      #   DWORD_PTR dwParam2);
      attach_function 'waveInMessage', [:hwavein, :uint, :pointer, :pointer], :dword

      # MMRESULT waveInOpen(
      #   LPHWAVEIN phwi,
      #   UINT uDeviceID,
      #   LPCWAVEFORMATEX pwfx,
      #   DWORD_PTR dwCallback,
      #   DWORD_PTR dwCallbackInstance,
      #   DWORD fdwOpen);
      attach_function 'waveInOpen', [:hwavein.ptr, :uint, WAVEFORMATEX.ptr, :pointer, :pointer, :dword], MMRESULT

      # MMRESULT waveInPrepareHeader(
      #    HWAVEIN hwi,
      #    LPWAVEHDR pwh,
      #    UINT cbwh);
      attach_function 'waveInPrepareHeader', [:hwavein, WAVEHDR.ptr, :uint], MMRESULT

      #TODO Callback
      # void CALLBACK waveInProc(
      #     HWAVEIN hwi,
      #     UINT uMsg,
      #     DWORD_PTR dwInstance,
      #     DWORD_PTR dwParam1,
      #     DWORD_PTR dwParam2);
      WaveInProc = callback :waveInProc, [:hwavein, :uint, :pointer, :pointer, :pointer], :void

      # MMRESULT waveInReset( HWAVEIN hwi );
      attach_function 'waveInReset', [:hwavein], MMRESULT

      # MMRESULT waveInStart( HWAVEIN hwi );
      attach_function 'waveInStart', [:hwavein], MMRESULT

      # MMRESULT waveInStop( HWAVEIN hwi );
      attach_function 'waveInStop', [:hwavein], MMRESULT

      # MMRESULT waveInUnprepareHeader(
      #    HWAVEIN hwi,
      #    LPWAVEHDR pwh,
      #    UINT cbwh);
      attach_function 'waveInUnprepareHeader', [:hwavein, WAVEHDR.ptr, :uint], MMRESULT

      # MMRESULT waveOutBreakLoop( HWAVEOUT hwo );
      attach_function 'waveOutBreakLoop', [:hwaveout], MMRESULT

      # MMRESULT waveOutClose( HWAVEOUT hwo );
      attach_function 'waveOutClose', [:hwaveout], MMRESULT

      # MMRESULT waveOutGetDevCaps(
      #     UINT_PTR uDeviceID,
      #     LPWAVEOUTCAPS pwoc,
      #     UINT cbwoc);
      attach_function 'waveOutGetDevCapsA', [:pointer, WAVEOUTCAPS.ptr, :uint], MMRESULT
      attach_function 'waveOutGetDevCapsW', [:pointer, WAVEOUTCAPS.ptr, :uint], MMRESULT

      # MMRESULT waveOutGetErrorText(
      #     MMRESULT mmrError,
      #     LPTSTR pszText,
      #     UINT cchText);
      attach_function 'waveOutGetErrorTextA', [MMRESULT, :string, :uint], MMRESULT
      attach_function 'waveOutGetErrorTextW', [MMRESULT, :string, :uint], MMRESULT

      # MMRESULT waveOutGetID(
      #     HWAVEOUT hwo,
      #     LPUINT puDeviceID);
      attach_function 'waveOutGetID' , [:hwaveout, :pointer], MMRESULT

      # UINT waveOutGetNumDevs(void);
      attach_function 'waveOutGetNumDevs', [], :uint

      # MMRESULT waveOutGetPitch(
      #     HWAVEOUT hwo,
      #     LPDWORD pdwPitch);
      attach_function 'waveOutGetPitch', [:hwaveout, :pointer], MMRESULT

      # MMRESULT waveOutGetPlaybackRate(
      #     HWAVEOUT hwo,
      #     LPDWORD pdwRate);
      attach_function 'waveOutGetPlaybackRate', [:hwaveout, :pointer], MMRESULT

      #TODO MMTIME
      # MMRESULT waveOutGetPosition(
      #     HWAVEOUT hwo,
      #     LPMMTIME pmmt,
      #     UINT cbmmt);
      # attach_function 'waveOutGetPosition', [:hwaveout, :]

      # MMRESULT waveOutGetVolume(
      #     HWAVEOUT hwo,
      #     LPDWORD pdwVolume);
      attach_function 'waveOutGetVolume', [:hwaveout, :pointer], MMRESULT

      # DWORD waveOutMessage(
      #     HWAVEOUT deviceID,
      #     UINT uMsg,
      #     DWORD_PTR dwParam1,
      #     DWORD_PTR dwParam2);
      attach_function 'waveOutMessage', [:hwaveout, :uint, :pointer, :pointer], :dword

      # MMRESULT waveOutOpen(
      #     LPHWAVEOUT phwo,
      #     UINT_PTR uDeviceID,
      #     LPWAVEFORMATEX pwfx,
      #     DWORD_PTR dwCallback,
      #     DWORD_PTR dwCallbackInstance,
      #     DWORD fdwOpen);
      attach_function 'waveOutOpen', [:pointer, :pointer, WAVEFORMATEX.ptr, :pointer, :pointer, :dword], MMRESULT

      # MMRESULT waveOutPause( HWAVEOUT hwo );
      attach_function 'waveOutPause', [:hwaveout], MMRESULT

      #MMRESULT waveOutSetVolume(
      #  HWAVEOUT hwo,
      #  DWORD dwVolume )
      attach_function 'waveOutSetVolume', [:hwaveout, :dword], :int

      #UINT waveOutGetNumDevs(void)
      attach_function 'waveOutGetNumDevs', [], :uint

      #UINT waveInGetNumDevs(void)
      attach_function 'waveInGetNumDevs', [], :uint

      #UINT midiOutGetNumDevs(void)
      attach_function 'midiOutGetNumDevs', [], :uint

      #UINT midiInGetNumDevs(void)
      attach_function 'midiInGetNumDevs', [], :uint

      #UINT auxGetNumDevs(void)
      attach_function 'auxGetNumDevs', [], :uint

      #UINT mixerGetNumDevs(void)
      attach_function 'mixerGetNumDevs', [], :int

    end

    module Joystick
      ffi_lib 'winmm.dll'
      extend LibBase

      # typedef struct {
      #   UINT wXpos;
      #   UINT wYpos;
      #   UINT wZpos;
      #   UINT wButtons;
      # } JOYINFO;
      class JOYINFO < FFIStruct
        layout :wXpos,    :uint,
               :wYpos,    :uint,
               :wZpos,    :uint,
               :wButtons, :uint
      end

      # typedef struct joyinfoex_tag {
      #   DWORD dwSize;
      #   DWORD dwFlags;
      #   DWORD dwXpos;
      #   DWORD dwYpos;
      #   DWORD dwZpos;
      #   DWORD dwRpos;
      #   DWORD dwUpos;
      #   DWORD dwVpos;
      #   DWORD dwButtons;
      #   DWORD dwButtonNumber;
      #   DWORD dwPOV;
      #   DWORD dwReserved1;
      #   DWORD dwReserved2;
      # } JOYINFOEX;
      class JOYINFOEX < FFIStruct
        layout :dwSize,         :dword,
               :dwFlags,        :dword,
               :dwXpos,         :dword,
               :dwYpos,         :dword,
               :dwZpos,         :dword,
               :dwRpos,         :dword,
               :dwUpos,         :dword,
               :dwVpos,         :dword,
               :dwButtons,      :dword,
               :dwButtonNumber, :dword,
               :dwPOV,          :dword,
               :dwReserved1,    :dword,
               :dwReserved2,    :dword,
      end

      # typedef struct {
      #   WORD  wMid;
      #   WORD  wPid;
      #   TCHAR szPname[MAXPNAMELEN];
      #   UINT  wXmin;
      #   UINT  wXmax;
      #   UINT  wYmin;
      #   UINT  wYmax;
      #   UINT  wZmin;
      #   UINT  wZmax;
      #   UINT  wNumButtons;
      #   UINT  wPeriodMin;
      #   UINT  wPeriodMax;
      #   UINT  wRmin;
      #   UINT  wRmax;
      #   UINT  wUmin;
      #   UINT  wUmax;
      #   UINT  wVmin;
      #   UINT  wVmax;
      #   UINT  wCaps;
      #   UINT  wMaxAxes;
      #   UINT  wNumAxes;
      #   UINT  wMaxButtons;
      #   TCHAR szRegKey[MAXPNAMELEN];
      #   TCHAR szOEMVxD[MAX_JOYSTICKOEMVXDNAME];
      # } JOYCAPS;

      class JOYCAPS < FFIStruct
        layout :wMid, :word,
               :wPid, :word,
               :szPname, :string,
               :wXmin, :uint,
               :wXmax, :uint,
               :wYmin, :uint,
               :wYmax, :uint,
               :wZmin, :uint,
               :wZmax, :uint,
               :wNumButtons, :uint,
               :wPeriodMin, :uint,
               :wPeriodMax, :uint,
               :wRmin, :uint,
               :wRmax, :uint,
               :wUmin, :uint,
               :wUmax, :uint,
               :wVmin, :uint,
               :wVmax, :uint,
               :wCaps, :uint,
               :wMaxAxes, :uint,
               :wNumAxes, :uint,
               :wMaxButtons, :uint,
               :szRegKey, :string,
               :szOEMVxD, :string,
      end

      JoyCapsFlags = enum :joy_caps_flags, [
          :HASZ,	  # Joystick has z-coordinate information.
          :HASR,	  # Joystick has rudder (fourth axis) information.
          :HASU,	  # Joystick has u-coordinate (fifth axis) information.
          :HASV,    # Joystick has v-coordinate (sixth axis) information.
          :HASPOV,  # Joystick has point-of-view information.
          :POV4DIR, # Joystick point-of-view supports discrete values (centered, forward, backward, left, and right).
          :POVCTS , # Joystick point-of-view supports continuous degree bearings.
      ]

      # MMRESULT joyConfigChanged( DWORD dwFlags )
      attach_function 'joyConfigChanged', [:dword], MMRESULT

      # MMRESULT joyGetDevCaps(
      #    UINT_PTR uJoyID,
      #    LPJOYCAPS pjc,
      #    UINT cbjc);
      attach_function 'joyGetDevCapsA', [:pointer, JOYCAPS.ptr, :uint], MMRESULT
      attach_function 'joyGetDevCapsW', [:pointer, JOYCAPS.ptr, :uint], MMRESULT

      # UINT joyGetNumDevs(void);
      attach_function 'joyGetNumDevs', [], :uint

      # MMRESULT joyGetPos(
      #   UINT uJoyID,
      #   LPJOYINFO pji);
      attach_function 'joyGetPos', [:uint, JOYINFO.ptr], MMRESULT

      # MMRESULT joyGetPosEx(
      #   UINT uJoyID,
      #   LPJOYINFOEX pji);
      attach_function 'joyGetPosEx', [:uint, JOYINFOEX.ptr], MMRESULT

      # MMRESULT joyGetThreshold(
      #   UINT uJoyID,
      #   LPUINT puThreshold);
      attach_function 'joyGetThreshold', [:uint, :pointer], MMRESULT

      # MMRESULT joyReleaseCapture( UINT uJoyID );
      attach_function 'joyReleaseCapture', [:uint], MMRESULT

      # MMRESULT joySetCapture(
      #   HWND hwnd,
      #   UINT uJoyID,
      #   UINT uPeriod,
      #   BOOL fChanged);
      attach_function 'joySetCapture', [:hwnd, :uint, :uint, :bool], MMRESULT

      # MMRESULT joySetThreshold(
      #   UINT uJoyID,
      #   UINT uThreshold);
      attach_function 'joySetThreshold', [:uint, :uint], MMRESULT



    end
  end
end