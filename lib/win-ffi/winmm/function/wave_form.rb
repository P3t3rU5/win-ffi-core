require 'win-ffi/winmm'

require 'win-ffi/winmm/enum/mm_result'
require 'win-ffi/winmm/enum/sound_flags'

require 'win-ffi/winmm/struct/aux_caps'
require 'win-ffi/winmm/struct/mmtime'
require 'win-ffi/winmm/struct/wave_hdr'
require 'win-ffi/winmm/struct/wave_in_caps'
require 'win-ffi/winmm/struct/wave_format_ex'
require 'win-ffi/winmm/struct/wave_out_caps'

module WinFFI
  module Winmm
    # MMRESULT auxGetDevCaps(
    #     UINT_PTR uDeviceID,
    #     LPAUXCAPS lpCaps,
    #     UINT cbCaps);
    encoded_function 'auxGetDevCaps', [:pointer, AUXCAPS.ptr, :uint], MMRESULT

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
    encoded_function 'PlaySound',  [:string, :hmodule, SoundFlags], :bool

    # BOOL sndPlaySound(
    #    LPCTSTR lpszSound,
    #    UINT fuSound)
    encoded_function 'sndPlaySound', [:string, SoundFlags], :bool

    # MMRESULT waveInAddBuffer(
    #    HWAVEIN hwi,
    #    LPWAVEHDR pwh,
    #    UINT cbwh)
    attach_function 'waveInAddBuffer', [:hwavein, WAVEHDR.ptr, :uint], MMRESULT

    # MMRESULT waveInClose( HWAVEIN hwi )
    attach_function 'waveInClose', [:hwavein], MMRESULT

    # MMRESULT waveInGetDevCaps(
    #   UINT_PTR uDeviceID,
    #   LPWAVEINCAPS pwic,
    #   UINT cbwic)
    encoded_function 'waveInGetDevCaps', [:pointer, WAVEINCAPS.ptr, :uint], MMRESULT

    # MMRESULT waveInGetErrorText(
    #   MMRESULT mmrError,
    #   LPTSTR pszText,
    #   UINT cchText)
    encoded_function 'waveInGetErrorText', [MMRESULT, :string, :uint], MMRESULT

    # MMRESULT waveInGetID(
    #   HWAVEIN hwi,
    #   LPUINT puDeviceID);
    attach_function 'waveInGetID', [:hwavein, :pointer], MMRESULT

    # UINT waveInGetNumDevs(void)
    attach_function 'waveInGetNumDevs', [], :uint

    # UINT waveInGetNumDevs(void);
    attach_function 'waveInGetNumDevs', [], :uint

    # MMRESULT waveInGetPosition(
    #   HWAVEIN hwi,
    #   LPMMTIME pmmt,
    #   UINT cbmmt)
    attach_function 'waveInGetPosition', [:hwavein, MMTIME.ptr, :uint], MMRESULT

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
    attach_function 'waveInOpen', [:hwavein, :uint, WAVEFORMATEX.ptr, :pointer, :pointer, :dword], MMRESULT

    # MMRESULT waveInPrepareHeader(
    #    HWAVEIN hwi,
    #    LPWAVEHDR pwh,
    #    UINT cbwh);
    attach_function 'waveInPrepareHeader', [:hwavein, WAVEHDR.ptr, :uint], MMRESULT

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
    encoded_function 'waveOutGetDevCaps', [:pointer, WAVEOUTCAPS.ptr, :uint], MMRESULT

    # MMRESULT waveOutGetErrorText(
    #     MMRESULT mmrError,
    #     LPTSTR pszText,
    #     UINT cchText);
    encoded_function 'waveOutGetErrorText', [MMRESULT, :string, :uint], MMRESULT

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

    # MMRESULT waveOutGetPosition(
    #     HWAVEOUT hwo,
    #     LPMMTIME pmmt,
    #     UINT cbmmt);
    attach_function 'waveOutGetPosition', [:hwaveout, MMTIME.ptr, :uint], MMRESULT

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
end