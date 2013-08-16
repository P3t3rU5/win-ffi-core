module WinFFI
  module User32
    module Window
      module Configuration
        extend LibBase

        ffi_lib 'user32'
        SystemParametersInfoFlags = enum :system_parameters_info_flags, [
            :GETACCESSTIMEOUT, 0x003C, # Retrieves information about the time-out period associated with the
            # accessibility features. The pvParam parameter must point to an ACCESSTIMEOUT structure that receives the
            # information. Set the cbSize member of this structure and the uiParam parameter to sizeof(ACCESSTIMEOUT).

            :GETAUDIODESCRIPTION, 0x0074, # Determines whether audio descriptions are enabled or disabled. The pvParam
            # parameter is a pointer to an AUDIODESCRIPTION structure. Set the cbSize member of this structure and the
            # uiParam parameter to sizeof(AUDIODESCRIPTION).
            # While it is possible for users who have visual impairments to hear the audio in video content, there is a
            # lot of action in video that does not have corresponding audio. Specific audio description of what is
            # happening in a video helps these users understand the content better. This flag enables you to determine
            # whether audio descriptions have been enabled and in which language.
            # Windows Server 2003 and Windows XP/2000:  This parameter is not supported.

            :GETCLIENTAREAANIMATION, 0x1042, # Determines whether animations are enabled or disabled. The pvParam parameter
            # must point to a BOOL variable that receives TRUE if animations are enabled, or FALSE otherwise.
            # Display features such as flashing, blinking, flickering, and moving content can cause seizures in users with
            # photo-sensitive epilepsy. This flag enables you to determine whether such animations have been disabled in
            # the client area.
            # Windows Server 2003 and Windows XP/2000:  This parameter is not supported.

            :GETDISABLEOVERLAPPEDCONTENT, 0x1040, # Determines whether overlapped content is enabled or disabled. The
            # pvParam parameter must point to a BOOL variable that receives TRUE if enabled, or FALSE otherwise.
            # Display features such as background images, textured backgrounds, water marks on documents, alpha blending,
            # and transparency can reduce the contrast between the foreground and background, making it harder for users
            # with low vision to see objects on the screen. This flag enables you to determine whether such overlapped
            # content has been disabled.
            # Windows Server 2003 and Windows XP/2000:  This parameter is not supported.

            :GETFILTERKEYS, 0x0032, # Retrieves information about the FilterKeys accessibility feature. The pvParam
            # parameter must point to a FILTERKEYS structure that receives the information. Set the cbSize member of this
            # structure and the uiParam parameter to sizeof(FILTERKEYS).

            :GETFOCUSBORDERHEIGHT, 0x2010, # Retrieves the height, in pixels, of the top and bottom edges of the focus
            # rectangle drawn with DrawFocusRect. The pvParam parameter must point to a UINT value.
            # Windows 2000:  This parameter is not supported.

            :GETFOCUSBORDERWIDTH, 0x200E, # Retrieves the width, in pixels, of the left and right edges of the focus
            # rectangle drawn with DrawFocusRect. The pvParam parameter must point to a UINT.
            # Windows 2000:  This parameter is not supported.

            :GETHIGHCONTRAST, 0x0042, # Retrieves information about the HighContrast accessibility feature. The pvParam
            # parameter must point to a HIGHCONTRAST structure that receives the information. Set the cbSize member of this
            # structure and the uiParam parameter to sizeof(HIGHCONTRAST).
            # For a general discussion, see Remarks.

            :GETLOGICALDPIOVERRIDE, 0x009E, # Retrieves a value that determines whether Windows 8 is displaying apps using
            # the default scaling plateau for the hardware or going to the next higher plateau. This value is based on the
            # current "Make everything on your screen bigger" setting, found in the Ease of Access section of PC settings: 1
            # is on, 0 is off.
            # Apps can provide text and image resources for each of several scaling plateaus: 100%, 140%, and 180%.
            # Providing separate resources optimized for a particular scale avoids distortion due to resizing. Windows 8
            # determines the appropriate scaling plateau based on a number of factors, including screen size and pixel
            # density. When "Make everything on your screen bigger" is selected (:GETLOGICALDPIOVERRIDE returns a value of
            # 1), Windows uses resources from the next higher plateau. For example, in the case of hardware that Windows
            # determines should use a scale of SCALE_100_PERCENT, this override causes Windows to use the SCALE_140_PERCENT
            # scale value, assuming that it does not violate other constraints.
            # Note  You should not use this value. It might be altered or unavailable in subsequent versions of Windows.
            # Instead, use the GetScaleFactorForDevice function or the DisplayProperties class to retrieve the preferred
            # scaling factor. Desktop applications should use desktop logical DPI rather than scale factor. Desktop logical
            # DPI can be retrieved through the GetDeviceCaps function.

            :GETMESSAGEDURATION, 0x2016, # Retrieves the time that notification pop-ups should be displayed, in seconds. The
            # pvParam parameter must point to a ULONG that receives the message duration.
            # Users with visual impairments or cognitive conditions such as ADHD and dyslexia might need a longer time to
            # read the text in notification messages. This flag enables you to retrieve the message duration.
            # Windows Server 2003 and Windows XP/2000:  This parameter is not supported.

            :GETMOUSECLICKLOCK, 0x101E, # Retrieves the state of the Mouse ClickLock feature. The pvParam parameter must
            # point to a BOOL variable that receives TRUE if enabled, or FALSE otherwise. For more information, see About
            # Mouse Input.
            # Windows 2000:  This parameter is not supported.

            :GETMOUSECLICKLOCKTIME, 0x2008, # Retrieves the time delay before the primary mouse button is locked. The
            # pvParam parameter must point to DWORD that receives the time delay, in milliseconds. This is only enabled if
            # :SETMOUSECLICKLOCK is set to TRUE. For more information, see About Mouse Input.
            # Windows 2000:  This parameter is not supported.

            :GETMOUSEKEYS, 0x0036, # Retrieves information about the MouseKeys accessibility feature. The pvParam parameter
            # must point to a MOUSEKEYS structure that receives the information. Set the cbSize member of this structure and
            # the uiParam parameter to sizeof(MOUSEKEYS).

            :GETMOUSESONAR, 0x101C, # Retrieves the state of the Mouse Sonar feature. The pvParam parameter must point to a
            # BOOL variable that receives TRUE if enabled or FALSE otherwise. For more information, see About Mouse Input.
            # Windows 2000:  This parameter is not supported.

            :GETMOUSEVANISH, 0x1020, # Retrieves the state of the Mouse Vanish feature. The pvParam parameter must point
            # to a BOOL variable that receives TRUE if enabled or FALSE otherwise. For more information, see About Mouse
            # Input.
            # Windows 2000:  This parameter is not supported.

            :GETSCREENREADER, 0x0046, # Determines whether a screen reviewer utility is running. A screen reviewer utility
            # directs textual information to an output device, such as a speech synthesizer or Braille display. When this
            # flag is set, an application should provide textual information in situations where it would otherwise present
            # the information graphically.
            # The pvParam parameter is a pointer to a BOOLvariable that receives TRUE if a screen reviewer utility is
            # running, or FALSE otherwise.

            :GETSERIALKEYS, 0x003E, # This parameter is not supported.
            # Windows Server 2003 and Windows XP/2000:  The user should control this setting through the Control Panel.

            :GETSHOWSOUNDS, 0x0038, # Determines whether the Show Sounds accessibility flag is on or off. If it is on, the
            # user requires an application to present information visually in situations where it would otherwise present
            # the information only in audible form. The pvParam parameter must point to a BOOL variable that receives TRUE
            # if the feature is on, or FALSE if it is off.
            # Using this value is equivalent to calling GetSystemMetrics with SM_SHOWSOUNDS. That is the recommended call.

            :GETSOUNDSENTRY, 0x0040, # Retrieves information about the SoundSentry accessibility feature. The pvParam
            # parameter must point to a SOUNDSENTRY structure that receives the information. Set the cbSize member of this
            # structure and the uiParam parameter to sizeof(SOUNDSENTRY).

            :GETSTICKYKEYS, 0x003A, # Retrieves information about the StickyKeys accessibility feature. The pvParam
            # parameter must point to a STICKYKEYS structure that receives the information. Set the cbSize member of this
            # structure and the uiParam parameter to sizeof(STICKYKEYS).

            :GETTOGGLEKEYS, 0x0034, # Retrieves information about the ToggleKeys accessibility feature. The pvParam
            # parameter must point to a TOGGLEKEYS structure that receives the information. Set the cbSize member of this
            # structure and the uiParam parameter to sizeof(TOGGLEKEYS).

            :SETACCESSTIMEOUT, 0x003D, # Sets the time-out period associated with the accessibility features. The pvParam
            # parameter must point to an ACCESSTIMEOUT structure that contains the new parameters. Set the cbSize member of
            # this structure and the uiParam parameter to sizeof(ACCESSTIMEOUT).

            :SETAUDIODESCRIPTION, 0x0075, # Turns the audio descriptions feature on or off. The pvParam parameter is a
            # pointer to an AUDIODESCRIPTION structure.
            # While it is possible for users who are visually impaired to hear the audio in video content, there is a lot of
            # action in video that does not have corresponding audio. Specific audio description of what is happening in a
            # video helps these users understand the content better. This flag enables you to enable or disable audio
            # descriptions in the languages they are provided in.
            # Windows Server 2003 and Windows XP/2000:  This parameter is not supported.

            :SETCLIENTAREAANIMATION, 0x1043, # Turns client area animations on or off. The pvParam parameter is a BOOL
            # ariable. Set pvParam to TRUE to enable animations and other transient effects in the client area, or FALSE to
            # disable them.
            # Display features such as flashing, blinking, flickering, and moving content can cause seizures in users with
            # photo-sensitive epilepsy. This flag enables you to enable or disable all such animations.
            # Windows Server 2003 and Windows XP/2000:  This parameter is not supported.

            :SETDISABLEOVERLAPPEDCONTENT, 0x1041, # Turns overlapped content (such as background images and watermarks) on
            # or off. The pvParam parameter is a BOOL variable. Set pvParam to TRUE to disable overlapped content, or FALSE
            # to enable overlapped content.
            # Display features such as background images, textured backgrounds, water marks on documents, alpha blending,
            # and transparency can reduce the contrast between the foreground and background, making it harder for users
            # with low vision to see objects on the screen. This flag enables you to enable or disable all such overlapped
            # content.
            # Windows Server 2003 and Windows XP/2000:  This parameter is not supported.

            :SETFILTERKEYS, 0x0033, # Sets the parameters of the FilterKeys accessibility feature. The pvParam parameter
            # must point to a FILTERKEYS structure that contains the new parameters. Set the cbSize member of this structure
            # and the uiParam parameter to sizeof(FILTERKEYS).

            :SETFOCUSBORDERHEIGHT, 0x2011, # Sets the height of the top and bottom edges of the focus rectangle drawn with
            # DrawFocusRect to the value of the pvParam parameter.
            # Windows 2000:  This parameter is not supported.

            :SETFOCUSBORDERWIDTH, 0x200F, # Sets the height of the left and right edges of the focus rectangle drawn with
            # DrawFocusRect to the value of the pvParam parameter.
            # Windows 2000:  This parameter is not supported.

            :SETHIGHCONTRAST, 0x0043, # Sets the parameters of the HighContrast accessibility feature. The pvParam parameter
            # must point to a HIGHCONTRAST structure that contains the new parameters. Set the cbSize member of this
            # structure and the uiParam parameter to sizeof(HIGHCONTRAST).

            :SETLOGICALDPIOVERRIDE, 0x009F, # Do not use.

            :SETMESSAGEDURATION, 0x2017, # Sets the time that notification pop-ups should be displayed, in seconds. The
            # pvParam parameter specifies the message duration.
            # Users with visual impairments or cognitive conditions such as ADHD and dyslexia might need a longer time to
            # read the text in notification messages. This flag enables you to set the message duration.
            # Windows Server 2003 and Windows XP/2000:  This parameter is not supported.

            :SETMOUSECLICKLOCK, 0x101F, # Turns the Mouse ClickLock accessibility feature on or off. This feature
            # temporarily locks down the primary mouse button when that button is clicked and held down for the time
            # specified by :SETMOUSECLICKLOCKTIME. The pvParam parameter specifies TRUE for on, or FALSE for off. The
            # default is off. For more information, see Remarks and AboutMouse Input.
            # Windows 2000:  This parameter is not supported.

            :SETMOUSECLICKLOCKTIME, 0x2009, # Adjusts the time delay before the primary mouse button is locked. The uiParam
            # parameter should be set to 0. The pvParam parameter points to a DWORD that specifies the time delay in
            # milliseconds. For example, specify 1000 for a 1 second delay. The default is 1200. For more information, see
            # About Mouse Input.
            # Windows 2000:  This parameter is not supported.

            :SETMOUSEKEYS, 0x0037, # Sets the parameters of the MouseKeys accessibility feature. The pvParam parameter must
            # point to a MOUSEKEYS structure that contains the new parameters. Set the cbSize member of this structure and
            # the uiParam parameter to sizeof(MOUSEKEYS).

            :SETMOUSESONAR, 0x101D, # Turns the Sonar accessibility feature on or off. This feature briefly shows several
            # concentric circles around the mouse pointer when the user presses and releases the CTRL key. The pvParam
            # parameter specifies TRUE for on and FALSE for off. The default is off. For more information, see About Mouse
            # Input.
            # Windows 2000:  This parameter is not supported.

            :SETMOUSEVANISH, 0x1021, # Turns the Vanish feature on or off. This feature hides the mouse pointer when the
            # user types; the pointer reappears when the user moves the mouse. The pvParam parameter specifies TRUE for on
            # and FALSE for off. The default is off. For more information, see About Mouse Input.
            # Windows 2000:  This parameter is not supported.

            :SETSCREENREADER, 0x0047, # Determines whether a screen review utility is running. The uiParam parameter
            # specifies TRUE for on, or FALSE for off.

            :SETSERIALKEYS, 0x003F, # This parameter is not supported.
            # Windows Server 2003 and Windows XP/2000:  The user should control this setting through the Control Panel.

            :SETSHOWSOUNDS, 0x0039, # Turns the ShowSounds accessibility feature on or off. The uiParam parameter specifies
            # TRUE for on, or FALSE for off.

            :SETSOUNDSENTRY, 0x0041, # Sets the parameters of the SoundSentry accessibility feature. The pvParam parameter
            # must point to a SOUNDSENTRY structure that contains the new parameters. Set the cbSize member of this
            # structure and the uiParam parameter to sizeof(SOUNDSENTRY).

            :SETSTICKYKEYS, 0x003B, # Sets the parameters of the StickyKeys accessibility feature. The pvParam parameter
            # must point to a STICKYKEYS structure that contains the new parameters. Set the cbSize member of this
            # structure and the uiParam parameter to sizeof(STICKYKEYS).

            :SETTOGGLEKEYS, 0x0035, # Sets the parameters of the ToggleKeys accessibility feature. The pvParam parameter
            # must point to a TOGGLEKEYS structure that contains the new parameters. Set the cbSize member of this structure
            # and the uiParam parameter to sizeof(TOGGLEKEYS).


            # The following are the desktop parameters.
            :GETCLEARTYPE, 0x1048, # Determines whether ClearType is enabled. The pvParam parameter must point to a BOOL
            # variable that receives TRUE if ClearType is enabled, or FALSE otherwise.
            # ClearType is a software technology that improves the readability of text on liquid crystal display (LCD)
            # monitors.
            # Windows Server 2003 and Windows XP/2000:  This parameter is not supported.

            :GETDESKWALLPAPER, 0x0073, # Retrieves the full path of the bitmap file for the desktop wallpaper. The pvParam
            # parameter must point to a buffer to receive the null-terminated path string. Set the uiParam parameter to the
            # size, in characters, of the pvParam buffer. The returned string will not exceed MAX_PATH characters. If there
            # is no desktop wallpaper, the returned string is empty.

            :GETDROPSHADOW, 0x1024, # Determines whether the drop shadow effect is enabled. The pvParam parameter must point
            # to a BOOL variable that returns TRUE if enabled or FALSE if disabled.
            # Windows 2000:  This parameter is not supported.

            :GETFLATMENU, 0x1022, # Determines whether native User menus have flat menu appearance. The pvParam parameter
            # must point to a BOOL variable that returns TRUE if the flat menu appearance is set, or FALSE otherwise.
            # Windows 2000:  This parameter is not supported.

            :GETFONTSMOOTHING, 0x004A, # Determines whether the font smoothing feature is enabled. This feature uses font
            # antialiasing to make font curves appear smoother by painting pixels at different gray levels.
            # The pvParam parameter must point to a BOOL variable that receives TRUE if the feature is enabled, or FALSE if
            # it is not.

            :GETFONTSMOOTHINGCONTRAST, 0x200C, # Retrieves a contrast value that is used in ClearType smoothing. The pvParam
            # parameter must point to a UINT that receives the information. Valid contrast values are from 1000 to 2200. The
            # default value is 1400.
            # Windows 2000:  This parameter is not supported.

            :GETFONTSMOOTHINGORIENTATION, 0x2012, # Retrieves the font smoothing orientation. The pvParam parameter must
            # point to a UINT that receives the information. The possible values are FE_FONTSMOOTHINGORIENTATIONBGR
            # (blue-green-red) and FE_FONTSMOOTHINGORIENTATIONRGB (red-green-blue).
            # Windows XP/2000:  This parameter is not supported until Windows XP with SP2.

            :GETFONTSMOOTHINGTYPE, 0x200A, # Retrieves the type of font smoothing. The pvParam parameter must point to a
            # UINT that receives the information. The possible values are FE_FONTSMOOTHINGSTANDARD and
            # FE_FONTSMOOTHINGCLEARTYPE.
            # Windows 2000:  This parameter is not supported.

            :GETWORKAREA, 0x0030, # Retrieves the size of the work area on the primary display monitor. The work area is the
            # portion of the screen not obscured by the system taskbar or by application desktop toolbars. The pvParam
            # parameter must point to a RECT structure that receives the coordinates of the work area, expressed in virtual
            # screen coordinates.
            # To get the work area of a monitor other than the primary display monitor, call the GetMonitorInfo function.

            :SETCLEARTYPE, 0x1049, # Turns ClearType on or off. The pvParam parameter is a BOOL variable. Set pvParam to
            # TRUE to enable ClearType, or FALSE to disable it.
            # ClearType is a software technology that improves the readability of text on LCD monitors.
            # Windows Server 2003 and Windows XP/2000:  This parameter is not supported.

            :SETCURSORS, 0x0057, # Reloads the system cursors. Set the uiParam parameter to zero and the pvParam parameter
            # to NULL.

            :SETDESKPATTERN, 0x0015, # Sets the current desktop pattern by causing Windows to read the Pattern= setting from
            # the WIN.INI file.

            :SETDESKWALLPAPER, 0x0014, # Note  When the :SETDESKWALLPAPER flag is used, SystemParametersInfo always returns
            # TRUE.
            :SETDROPSHADOW, 0x1025, # Enables or disables the drop shadow effect. Set pvParam to TRUE to enable the drop
            # shadow effect or FALSE to disable it. You must also have CS_DROPSHADOW in the window class style.
            # Windows 2000:  This parameter is not supported.

            :SETFLATMENU, 0x1023, # Enables or disables flat menu appearance for native User menus. Set pvParam to TRUE to
            # enable flat menu appearance or FALSE to disable it.
            # When enabled, the menu bar uses COLOR_MENUBAR for the menubar background, COLOR_MENU for the menu-popup
            # background, COLOR_MENUHILIGHT for the fill of the current menu selection, and COLOR_HILIGHT for the outline of
            # the current menu selection. If disabled, menus are drawn using the same metrics and colors as in Windows 2000.
            # Windows 2000:  This parameter is not supported.
            :SETFONTSMOOTHING, 0x004B, # Enables or disables the font smoothing feature, which uses font antialiasing to
            # make font curves appear smoother by painting pixels at different gray levels.
            # To enable the feature, set the uiParam parameter to TRUE. To disable the feature, set uiParam to FALSE.

            :SETFONTSMOOTHINGCONTRAST, 0x200D, # Sets the contrast value used in ClearType smoothing. The pvParam parameter
            # is the contrast value. Valid contrast values are from 1000 to 2200. The default value is 1400.
            # :SETFONTSMOOTHINGTYPE must also be set to FE_FONTSMOOTHINGCLEARTYPE.
            # Windows 2000:  This parameter is not supported.

            :SETFONTSMOOTHINGORIENTATION, 0x2013, # Sets the font smoothing orientation. The pvParam parameter is either
            # FE_FONTSMOOTHINGORIENTATIONBGR (blue-green-red) or FE_FONTSMOOTHINGORIENTATIONRGB (red-green-blue).
            # Windows XP/2000:  This parameter is not supported until Windows XP with SP2.

            :SETFONTSMOOTHINGTYPE, 0x200B, # Sets the font smoothing type. The pvParam parameter is either
            # FE_FONTSMOOTHINGSTANDARD, if standard anti-aliasing is used, or FE_FONTSMOOTHINGCLEARTYPE, if ClearType is
            # used. The default is FE_FONTSMOOTHINGSTANDARD.
            # :SETFONTSMOOTHING must also be set.
            # Windows 2000:  This parameter is not supported.

            :SETWORKAREA, 0x002F, # Sets the size of the work area. The work area is the portion of the screen not obscured
            # by the system taskbar or by application desktop toolbars. The pvParam parameter is a pointer to a RECT
            # structure that specifies the new work area rectangle, expressed in virtual screen coordinates. In a system
            # with multiple display monitors, the function sets the work area of the monitor that contains the specified
            # rectangle.


            # The following are the icon parameters.
            :GETICONMETRICS, 0x002D, # Retrieves the metrics associated with icons. The pvParam parameter must point to an
            # ICONMETRICS structure that receives the information. Set the cbSize member of this structure and the uiParam
            # parameter to sizeof(ICONMETRICS).

            :GETICONTITLELOGFONT, 0x001F, # Retrieves the logical font information for the current icon-title font. The
            # uiParam parameter specifies the size of a LOGFONT structure, and the pvParam parameter must point to the
            # LOGFONT structure to fill in.

            :GETICONTITLEWRAP, 0x0019, # Determines whether icon-title wrapping is enabled. The pvParam parameter must point
            # to a BOOL variable that receives TRUE if enabled, or FALSE otherwise.
            :ICONHORIZONTALSPACING, 0x000D, # Sets or retrieves the width, in pixels, of an icon cell. The system uses this
            # rectangle to arrange icons in large icon view.
            # To set this value, set uiParam to the new value and set pvParam to NULL. You cannot set this value to less
            # than SM_CXICON.
            # To retrieve this value, pvParam must point to an integer that receives the current value.

            :ICONVERTICALSPACING, 0x0018, # Sets or retrieves the height, in pixels, of an icon cell.
            # To set this value, set uiParam to the new value and set pvParam to NULL. You cannot set this value to less
            # than SM_CYICON.
            # To retrieve this value, pvParam must point to an integer that receives the current value.

            :SETICONMETRICS, 0x002E, # Sets the metrics associated with icons. The pvParam parameter must point to an
            # ICONMETRICS structure that contains the new parameters. Set the cbSize member of this structure and the
            # uiParam parameter to sizeof(ICONMETRICS).

            :SETICONS, 0x0058, # Reloads the system icons. Set the uiParam parameter to zero and the pvParam parameter to
            # NULL.

            :SETICONTITLELOGFONT, 0x0022, # Sets the font that is used for icon titles. The uiParam parameter specifies the
            # size of a LOGFONT structure, and the pvParam parameter must point to a LOGFONT structure.
            :SETICONTITLEWRAP, 0x001A, # Turns icon-title wrapping on or off. The uiParam parameter specifies TRUE for on,
            # or FALSE for off.


            # The following are the input parameters. They include parameters related to the keyboard, mouse, input
            # language, and the warning beeper.
            :GETBEEP, 0x0001, # Determines whether the warning beeper is on.
            # The pvParam parameter must point to a BOOL variable that receives TRUE if the beeper is on, or FALSE if it is
            # off.

            :GETBLOCKSENDINPUTRESETS, 0x1026, # Retrieves a BOOL indicating whether an application can reset the
            # screensaver's timer by calling the SendInput function to simulate keyboard or mouse input. The pvParam
            # parameter must point to a BOOL variable that receives TRUE if the simulated input will be blocked, or FALSE
            # otherwise.

            :GETCONTACTVISUALIZATION, 0x2018, # Retrieves the current contact visualization setting. The pvParam parameter
            # must point to a ULONG variable that receives the setting. For more information, see Contact Visualization.

            :GETDEFAULTINPUTLANG, 0x0059, # Retrieves the input locale identifier for the system default input language.
            # The pvParam parameter must point to an HKL variable that receives this value. For more information, see
            # Languages, Locales, and Keyboard Layouts.

            :GETGESTUREVISUALIZATION, 0x201A, # Retrieves the current gesture visualization setting. The pvParam parameter
            # must point to a ULONG variable that receives the setting. For more information, see Gesture Visualization.

            :GETKEYBOARDCUES, 0x100A, # Determines whether menu access keys are always underlined. The pvParam parameter
            # must point to a BOOL variable that receives TRUE if menu access keys are always underlined, and FALSE if they
            # are underlined only when the menu is activated by the keyboard.

            :GETKEYBOARDDELAY, 0x0016, # Retrieves the keyboard repeat-delay setting, which is a value in the range from 0
            # (approximately 250 ms delay) through 3 (approximately 1 second delay). The actual delay associated with each
            # value may vary depending on the hardware. The pvParam parameter must point to an integer variable that
            # receives the setting.

            :GETKEYBOARDPREF, 0x0044, # Determines whether the user relies on the keyboard instead of the mouse, and wants
            # applications to display keyboard interfaces that would otherwise be hidden. The pvParam parameter must point
            # to a BOOL variable that receives TRUE if the user relies on the keyboard; or FALSE otherwise.

            :GETKEYBOARDSPEED, 0x000A, # Retrieves the keyboard repeat-speed setting, which is a value in the range from 0
            # (approximately 2.5 repetitions per second) through 31 (approximately 30 repetitions per second). The actual
            # repeat rates are hardware-dependent and may vary from a linear scale by as much as 20%. The pvParam parameter
            # must point to a DWORD variable that receives the setting.

            :GETMOUSE, 0x0003, # Retrieves the two mouse threshold values and the mouse acceleration. The pvParam parameter
            # must point to an array of three integers that receives these values. See mouse_event for further information.

            :GETMOUSEHOVERHEIGHT, 0x0064, # Retrieves the height, in pixels, of the rectangle within which the mouse pointer
            # has to stay for TrackMouseEvent to generate a WM_MOUSEHOVER message. The pvParam parameter must point to a
            # UINT variable that receives the height.

            :GETMOUSEHOVERTIME, 0x0066, # Retrieves the time, in milliseconds, that the mouse pointer has to stay in the
            # hover rectangle for TrackMouseEvent to generate a WM_MOUSEHOVER message. The pvParam parameter must point to a
            # UINT variable that receives the time.

            :GETMOUSEHOVERWIDTH, 0x0062, # Retrieves the width, in pixels, of the rectangle within which the mouse pointer
            # has to stay for TrackMouseEvent to generate a WM_MOUSEHOVER message. The pvParam parameter must point to a
            # UINT variable that receives the width.

            :GETMOUSESPEED, 0x0070, # Retrieves the current mouse speed. The mouse speed determines how far the pointer will
            # move based on the distance the mouse moves. The pvParam parameter must point to an integer that receives a
            # value which ranges between 1 (slowest) and 20 (fastest). A value of 10 is the default. The value can be set by
            # an end-user using the mouse control panel application or by an application using :SETMOUSESPEED.

            :GETMOUSETRAILS, 0x005E, # Determines whether the Mouse Trails feature is enabled. This feature improves the
            # visibility of mouse cursor movements by briefly showing a trail of cursors and quickly erasing them.
            # The pvParam parameter must point to an integer variable that receives a value. if the value is zero or 1, the
            # feature is disabled. If the value is greater than 1, the feature is enabled and the value indicates the number
            # of cursors drawn in the trail. The uiParam parameter is not used.
            # Windows 2000:  This parameter is not supported.

            :GETSNAPTODEFBUTTON, 0x005F, # Determines whether the snap-to-default-button feature is enabled. If enabled, the
            # mouse cursor automatically moves to the default button, such as OK or Apply, of a dialog box. The pvParam
            # parameter must point to a BOOL variable that receives TRUE if the feature is on, or FALSE if it is off.

            :GETSYSTEMLANGUAGEBAR, 0x1050, # Starting with Windows 8: Determines whether the system language bar is enabled
            # or disabled. The pvParam parameter must point to a BOOL variable that receives TRUE if the language bar is
            # enabled, or FALSE otherwise.

            :GETTHREADLOCALINPUTSETTINGS, 0x104E, # Starting with Windows 8: Determines whether the active input settings
            # have Local (per-thread, TRUE) or Global (session, FALSE) scope. The pvParam parameter must point to a BOOL
            # variable.

            :GETWHEELSCROLLCHARS, 0x006C, # Retrieves the number of characters to scroll when the horizontal mouse wheel is
            # moved. The pvParam parameter must point to a UINT variable that receives the number of lines. The default
            # value is 3.

            :GETWHEELSCROLLLINES, 0x0068, # Retrieves the number of lines to scroll when the vertical mouse wheel is moved.
            # The pvParam parameter must point to a UINT variable that receives the number of lines. The default value is 3.

            :SETBEEP, 0x0002, # Turns the warning beeper on or off. The uiParam parameter specifies TRUE for on, or FALSE
            # for off.

            :SETBLOCKSENDINPUTRESETS, 0x1027, # Determines whether an application can reset the screensaver's timer by
            # calling the SendInput function to simulate keyboard or mouse input. The uiParam parameter specifies TRUE if
            # the screensaver will not be deactivated by simulated input, or FALSE if the screensaver will be deactivated by
            # simulated input.

            :SETCONTACTVISUALIZATION, 0x2019, # Sets the current contact visualization setting. The pvParam parameter must
            # point to a ULONG variable that identifies the setting. For more information, see Contact Visualization.
            # Note  If contact visualizations are disabled, gesture visualizations cannot be enabled.

            :SETDEFAULTINPUTLANG, 0x005A, # Sets the default input language for the system shell and applications. The
            # specified language must be displayable using the current system character set. The pvParam parameter must
            # point to an HKL variable that contains the input locale identifier for the default language. For more
            # information, see Languages, Locales, and Keyboard Layouts.

            :SETDOUBLECLICKTIME, 0x0020, # Sets the double-click time for the mouse to the value of the uiParam parameter.
            # If the uiParam value is greater than 5000 milliseconds, the system sets the double-click time to 5000
            # milliseconds.
            # The double-click time is the maximum number of milliseconds that can occur between the first and second clicks
            # of a double-click. You can also call the SetDoubleClickTime function to set the double-click time. To get
            # the current double-click time, call the GetDoubleClickTime function.

            :SETDOUBLECLKHEIGHT, 0x001E, # Sets the height of the double-click rectangle to the value of the uiParam
            # parameter.
            # The double-click rectangle is the rectangle within which the second click of a double-click must fall for it
            # to be registered as a double-click.
            # To retrieve the height of the double-click rectangle, call GetSystemMetrics with the SM_CYDOUBLECLK flag.
            :SETDOUBLECLKWIDTH, 0x001D, # Sets the width of the double-click rectangle to the value of the uiParam
            # parameter.
            # The double-click rectangle is the rectangle within which the second click of a double-click must fall for it
            # to be registered as a double-click.
            # To retrieve the width of the double-click rectangle, call GetSystemMetrics with the SM_CXDOUBLECLK flag.

            :SETGESTUREVISUALIZATION, 0x201B, # Sets the current gesture visualization setting. The pvParam parameter must
            # point to a ULONG variable that identifies the setting. For more information, see Gesture Visualization.
            # Note  If contact visualizations are disabled, gesture visualizations cannot be enabled.

            :SETKEYBOARDCUES, 0x100B, # Sets the underlining of menu access key letters. The pvParam parameter is a BOOL
            # variable. Set pvParam to TRUE to always underline menu access keys, or FALSE to underline menu access keys
            # only when the menu is activated from the keyboard.

            :SETKEYBOARDDELAY, 0x0017, # Sets the keyboard repeat-delay setting. The uiParam parameter must specify 0, 1, 2,
            # or 3, where zero sets the shortest delay approximately 250 ms) and 3 sets the longest delay (approximately 1
            # second). The actual delay associated with each value may vary depending on the hardware.

            :SETKEYBOARDPREF, 0x0045, # Sets the keyboard preference. The uiParam parameter specifies TRUE if the user
            # relies on the keyboard instead of the mouse, and wants applications to display keyboard interfaces that would
            # otherwise be hidden; uiParam is FALSE otherwise.

            :SETKEYBOARDSPEED, 0x000B, # Sets the keyboard repeat-speed setting. The uiParam parameter must specify a value
            # in the range from 0 (approximately 2.5 repetitions per second) through 31 (approximately 30 repetitions per
            # second). The actual repeat rates are hardware-dependent and may vary from a linear scale by as much as 20%. If
            # uiParam is greater than 31, the parameter is set to 31.

            :SETLANGTOGGLE, 0x005B, # Sets the hot key set for switching between input languages. The uiParam and pvParam
            # parameters are not used. The value sets the shortcut keys in the keyboard property sheets by reading the
            # registry again. The registry must be set before this flag is used. the path in the registry is
            # HKEY_CURRENT_USER\Keyboard Layout\Toggle
            # . Valid values are "1" = ALT+SHIFT, "2" = CTRL+SHIFT, and "3" = none.

            :SETMOUSE, 0x0004, # Sets the two mouse threshold values and the mouse acceleration. The pvParam parameter must
            # point to an array of three integers that specifies these values. See mouse_event for further information.

            :SETMOUSEBUTTONSWAP, 0x0021, # Swaps or restores the meaning of the left and right mouse buttons. The uiParam
            # parameter specifies TRUE to swap the meanings of the buttons, or FALSE to restore their original meanings.
            # To retrieve the current setting, call GetSystemMetrics with the SM_SWAPBUTTON flag.

            :SETMOUSEHOVERHEIGHT, 0x0065, # Sets the height, in pixels, of the rectangle within which the mouse pointer
            # has to stay for TrackMouseEvent to generate a WM_MOUSEHOVER message. Set the uiParam parameter to the new
            # height.

            :SETMOUSEHOVERTIME, 0x0067, # Sets the time, in milliseconds, that the mouse pointer has to stay in the hover
            # rectangle for TrackMouseEvent to generate a WM_MOUSEHOVER message. This is used only if you pass HOVER_DEFAULT
            # in the dwHoverTime parameter in the call to TrackMouseEvent. Set the uiParamparameter to the new time.
            # The time specified should be between USER_TIMER_MAXIMUM and USER_TIMER_MINIMUM. If uiParam is less than
            # USER_TIMER_MINIMUM, the function will use USER_TIMER_MINIMUM. If uiParam is greater than USER_TIMER_MAXIMUM,
            # the function will be USER_TIMER_MAXIMUM.
            # Windows Server 2003 and Windows XP:  The operating system does not enforce the use of USER_TIMER_MAXIMUM and
            # USER_TIMER_MINIMUM until Windows Server 2003 with SP1 and Windows XP with SP2.

            :SETMOUSEHOVERWIDTH, 0x0063, # Sets the width, in pixels, of the rectangle within which the mouse pointer has to
            # stay for TrackMouseEvent to generate a WM_MOUSEHOVER message. Set the uiParam parameter to the new width.

            :SETMOUSESPEED, 0x0071, # Sets the current mouse speed. The pvParam parameter is an integer between 1 (slowest)
            # and 20 (fastest). A value of 10 is the default. This value is typically set using the mouse control panel
            # application.

            :SETMOUSETRAILS, 0x005D, # Enables or disables the Mouse Trails feature, which improves the visibility of mouse
            # cursor movements by briefly showing a trail of cursors and quickly erasing them.
            # To disable the feature, set the uiParam parameter to zero or 1. To enable the feature, set uiParam to a value
            # greater than 1 to indicate the number of cursors drawn in the trail.
            # Windows 2000:  This parameter is not supported.

            :SETSNAPTODEFBUTTON, 0x0060, # Enables or disables the snap-to-default-button feature. If enabled, the mouse
            # cursor automatically moves to the default button, such as OK or Apply, of a dialog box. Set the uiParam
            # parameter to TRUE to enable the feature, or FALSE to disable it. Applications should use the ShowWindow
            # function when displaying a dialog box so the dialog manager can position the mouse cursor.

            :SETSYSTEMLANGUAGEBAR, 0x1051, # Starting with Windows 8: Turns the legacy language bar feature on or off.
            # The pvParam parameter is a pointer to a BOOL variable. Set pvParam to TRUE to enable the legacy language bar,
            # or FALSE to disable it. The flag is supported on Windows 8 where the legacy language bar is replaced by Input
            # Switcher and therefore turned off by default. Turning the legacy language bar on is provided for compatibility
            # reasons and has no effect on the Input Switcher.

            :SETTHREADLOCALINPUTSETTINGS, 0x104F, # Starting with Windows 8: Determines whether the active input settings
            # have Local (per-thread, TRUE) or Global (session, FALSE) scope. The pvParam parameter must point to a BOOL
            # variable, casted by PVOID.

            :SETWHEELSCROLLCHARS, 0x006D, # Sets the number of characters to scroll when the horizontal mouse wheel is
            # moved. The number of characters is set from the uiParam parameter.

            :SETWHEELSCROLLLINES, 0x0069, # Sets the number of lines to scroll when the vertical mouse wheel is moved.
            # The number of lines is set from the uiParam parameter.
            # The number of lines is the suggested number of lines to scroll when the mouse wheel is rolled without using
            # modifier keys. If the number is 0, then no scrolling should occur. If the number of lines to scroll is greater
            # than the number of lines viewable, and in particular if it is WHEEL_PAGESCROLL (#defined as UINT_MAX), the
            # scroll operation should be interpreted as clicking once in the page down or page up regions of the scroll bar.


            # The following are the menu parameters.
            :GETMENUDROPALIGNMENT, 0x001B, # Determines whether pop-up menus are left-aligned or right-aligned, relative to
            # the corresponding menu-bar item. The pvParam parameter must point to a BOOL variable that receives TRUE if
            # right-aligned, or FALSE otherwise.

            :GETMENUFADE, 0x1012, # Determines whether menu fade animation is enabled. The pvParam parameter must point to a
            # BOOL variable that receives TRUE when fade animation is enabled and FALSE when it isdisabled. If fade
            # animation is disabled, menus use slide animation. This flag is ignored unless menu animation is enabled, which
            # you can do using the :SETMENUANIMATION flag. For more information, see AnimateWindow.

            :GETMENUSHOWDELAY, 0x006A, # Retrieves the time, in milliseconds, that the system waits before displaying a
            # shortcut menu when the mouse cursor is over a submenu item. The pvParam parameter must point to a DWORD
            # variable that receives the time of the delay.

            :SETMENUDROPALIGNMENT, 0x001C, # Sets the alignment value of pop-up menus. The uiParam parameter specifies TRUE
            # for right alignment, or FALSE for left alignment.

            :SETMENUFADE, 0x1013, # Enables or disables menu fade animation. Set pvParam to TRUE to enable the menu fade
            # effect or FALSE to disable it. If fade animation is disabled, menus use slide animation. he The menu fade
            # effect is possible only if the system has a color depth of more than 256 colors. This flag is ignored unless
            # :MENUANIMATION is also set. For more information, see AnimateWindow.

            :SETMENUSHOWDELAY, 0x006B, # Sets uiParam to the time, in milliseconds, that the system waits before displaying
            # a shortcut menu when the mouse cursor is over a submenu item.

            # The following are the power parameters.
            # Beginning with Windows Server 2008 and Windows Vista, these power parameters are not supported. Instead, to
            # determine the current display power state, an application should register for GUID_MONITOR_POWER_STATE
            # notifications. To determine the current display power down time-out, an application should register for
            # notification of changes to the GUID_VIDEO_POWERDOWN_TIMEOUT power setting. For more information, see
            # Registering for Power Events.
            # Windows Server 2003 and Windows XP/2000:  To determine the current display power state, use the following
            # power parameters.

            :GETLOWPOWERACTIVE, 0x0053, # This parameter is not supported.
            # Windows Server 2003 and Windows XP/2000:  Determines whether the low-power phase of screen saving is enabled.
            # The pvParam parameter must point to a BOOL variable that receives TRUE if enabled, or FALSE if disabled. This
            # flag is supported for 32-bit applications only.

            :GETLOWPOWERTIMEOUT, 0x004F, # This parameter is not supported.
            # Windows Server 2003 and Windows XP/2000:  Retrieves the time-out value for the low-power phase of screen
            # saving. The pvParam parameter must point to an integer variable that receives the value. This flag is
            # supported for 32-bit applications only.

            :GETPOWEROFFACTIVE, 0x0054, # This parameter is not supported. When the power-off phase of screen saving is
            # enabled, the GUID_VIDEO_POWERDOWN_TIMEOUT power setting is greater than zero.
            # Windows Server 2003 and Windows XP/2000:  Determines whether the power-off phase of screen saving is enabled.
            # The pvParam parameter must point to a BOOL variable that receives TRUE if enabled, or FALSE if disabled. This
            # flag is supported for 32-bit applications only.

            :GETPOWEROFFTIMEOUT, 0x0050, # This parameter is not supported. Instead, check the GUID_VIDEO_POWERDOWN_TIMEOUT
            # power setting.
            # Windows Server 2003 and Windows XP/2000:  Retrieves the time-out value for the power-off phase of screen
            # saving. The pvParam parameter must point to an integer variable that receives the value. This flag is
            # supported for 32-bit applications only.

            :SETLOWPOWERACTIVE, 0x0055, # This parameter is not supported.
            # Windows Server 2003 and Windows XP/2000:  Activates or deactivates the low-power phase of screen saving. Set
            # uiParam to 1 to activate, or zero to deactivate. The pvParam parameter must be NULL. This flag is supported
            # for 32-bit applications only.

            :SETLOWPOWERTIMEOUT, 0x0051, # This parameter is not supported.
            # Windows Server 2003 and Windows XP/2000:  Sets the time-out value, in seconds, for the low-power phase of
            # screen saving. The uiParam parameter specifies the new value. The pvParam parameter must be NULL. This flag is
            # supported for 32-bit applications only.

            :SETPOWEROFFACTIVE, 0x0056, # This parameter is not supported. Instead, set the GUID_VIDEO_POWERDOWN_TIMEOUT
            # power setting.
            # Windows Server 2003 and Windows XP/2000:  Activates or deactivates the power-off phase of screen saving. Set
            # uiParam to 1 to activate, or zero to deactivate. The pvParam parameter must be NULL. This flag is supported
            # for 32-bit applications only.

            :SETPOWEROFFTIMEOUT, 0x0052, # This parameter is not supported. Instead, set the GUID_VIDEO_POWERDOWN_TIMEOUT
            # power setting to a time-out value.
            # Windows Server 2003 and Windows XP/2000:  Sets the time-out value, in seconds, for the power-off phase of
            # screen saving. The uiParam parameter specifies the new value. The pvParam parameter must be NULL. This flag is
            # supported for 32-bit applications only.


            # The following are the screen saver parameters.
            :GETSCREENSAVEACTIVE, 0x0010, # Determines whether screen saving is enabled. The pvParam parameter must point to
            # a BOOL variable that receives TRUE if screen saving is enabled, or FALSE otherwise.
            # Windows 7, Windows Server 2008 R2, and Windows 2000:  The function returns TRUE even when screen saving is not
            # enabled. For more information and a workaround, see KB318781.

            :GETSCREENSAVERRUNNING, 0x0072, # Determines whether a screen saver is currently running on the window station
            # of the calling process. The pvParam parameter must point to a BOOL variable that receives TRUE if a screen
            # saver is currently running, or FALSE otherwise. Note that only the interactive window station, WinSta0, can
            # have a screen saver running.

            :GETSCREENSAVESECURE, 0x0076, # Determines whether the screen saver requires a password to display the Windows
            # desktop. The pvParam parameter must point to a BOOL variable that receives TRUE if the screen saver requires a
            # password, or FALSE otherwise. The uiParam parameter is ignored.
            # Windows Server 2003 and Windows XP/2000:  This parameter is not supported.

            :GETSCREENSAVETIMEOUT, 0x000E, # Retrieves the screen saver time-out value, in seconds. The pvParam parameter
            # must point to an integer variable that receives the value.

            :SETSCREENSAVEACTIVE, 0x0011, # Sets the state of the screen saver. The uiParam parameter specifies TRUE to
            # activate screen saving, or FALSE to deactivate it.
            # If the machine has entered power saving mode or system lock state, an ERROR_OPERATION_IN_PROGRESS exception
            # occurs.

            :SETSCREENSAVESECURE, 0x0077, # Sets whether the screen saver requires the user to enter a password to display
            # the Windows desktop. The uiParam parameter is a BOOL variable. The pvParam parameter is ignored. Set uiParam
            # to TRUE to require a password, or FALSE to not require a password.
            # If the machine has entered power saving mode or system lock state, an ERROR_OPERATION_IN_PROGRESS exception
            # occurs.
            # Windows Server 2003 and Windows XP/2000:  This parameter is not supported.

            :SETSCREENSAVETIMEOUT, 0x000F, # Sets the screen saver time-out value to the value of the uiParam parameter.
            # This value is the amount of time, in seconds, that the system must be idle before the screen saver activates.
            # If the machine has entered power saving mode or system lock state, an ERROR_OPERATION_IN_PROGRESS exception
            # occurs.


            # The following are the time-out parameters for applications and services.
            :GETHUNGAPPTIMEOUT, 0x0078, # Retrieves the number of milliseconds that a thread can go without dispatching a
            # message before the system considers it unresponsive. The pvParam parameter must point to an integer variable
            # that receives the value.
            # Windows Server 2008, Windows Vista, Windows Server 2003, and Windows XP/2000:  This parameter is not
            # supported.

            :GETWAITTOKILLTIMEOUT, 0x007A, # Retrieves the number of milliseconds that the system waits before terminating
            # an application that does not respond to a shutdown request. The pvParam parameter must point to an integer
            # variable that receives the value.
            # Windows Server 2008, Windows Vista, Windows Server 2003, and Windows XP/2000:  This parameter is not
            # supported.

            :GETWAITTOKILLSERVICETIMEOUT, 0x007C, # Retrieves the number of milliseconds that the service control manager
            # waits before terminating a service that does not respond to a shutdown request. The pvParam parameter must
            # point to an integer variable that receives the value.
            # Windows Server 2008, Windows Vista, Windows Server 2003, and Windows XP/2000:  This parameter is not
            # supported.

            :SETHUNGAPPTIMEOUT, 0x0079, # Sets the hung application time-out to the value of the uiParam parameter. This
            # value is the number of milliseconds that a thread can go without dispatching a message before the system
            # considers it unresponsive.
            # Windows Server 2008, Windows Vista, Windows Server 2003, and Windows XP/2000:  This parameter is not
            # supported.

            :SETWAITTOKILLTIMEOUT, 0x007B, # Sets the application shutdown request time-out to the value of the uiParam
            # parameter. This value is the number of milliseconds that the system waits before terminating an application
            # that does not respond to a shutdown request.
            # Windows Server 2008, Windows Vista, Windows Server 2003, and Windows XP/2000:  This parameter is not
            # supported.

            :SETWAITTOKILLSERVICETIMEOUT, 0x007D, # Sets the service shutdown request time-out to the value of the uiParam
            # parameter. This value is the number of milliseconds that the system waits before terminating a service that
            # does not respond to a shutdown request.
            # Windows Server 2008, Windows Vista, Windows Server 2003, and Windows XP/2000:  This parameter is not
            # supported.


            # The following are the UI effects. The :SETUIEFFECTS value is used to enable or disable all UI effects at once.
            # This table contains the complete list of UI effect values.
            :GETCOMBOBOXANIMATION, 0x1004, # Determines whether the slide-open effect for combo boxes is enabled. The
            # pvParam parameter must point to a BOOL variable that receives TRUE for enabled, or FALSE for disabled.

            :GETCURSORSHADOW, 0x101A, # Determines whether the cursor has a shadow around it. The pvParam parameter must
            # point to a BOOL variable that receives TRUE if the shadow is enabled, FALSE if it is disabled. This effect
            # appears only if the system has a color depth of more than 256 colors.

            :GETGRADIENTCAPTIONS, 0x1008, # Determines whether the gradient effect for window title bars is enabled. The
            # pvParam parameter must point to a BOOL variable that receives TRUE for enabled, or FALSE for disabled. For
            # more information about the gradient effect, see the GetSysColor function.

            :GETHOTTRACKING, 0x100E, # Determines whether hot tracking of user-interface elements, such as menu names on
            # menu bars, is enabled. The pvParam parameter must point to a BOOL variable that receives TRUE for enabled, or
            # FALSE for disabled.
            # Hot tracking means that when the cursor moves over an item, it is highlighted but not selected. You can query
            # this value to decide whether to use hot tracking in the user interface of your application.

            :GETLISTBOXSMOOTHSCROLLING, 0x1006, # Determines whether the smooth-scrolling effect for list boxes is enabled.
            # The pvParam parameter must point to a BOOL variable that receives TRUE for enabled, or FALSE for disabled.

            :GETMENUANIMATION, 0x1002, # Determines whether the menu animation feature is enabled. This master switch must
            # be on to enable menu animation effects. The pvParam parameter must point to a BOOL variable that receives
            # TRUE if animation is enabled and FALSE if it is disabled.
            # If animation is enabled, :GETMENUFADE indicates whether menus use fade or slide animation.

            :GETMENUUNDERLINES, 0x100A, # Same as :GETKEYBOARDCUES.

            :GETSELECTIONFADE, 0x1014, # Determines whether the selection fade effect is enabled. The pvParam parameter must
            # point to a BOOL variable that receives TRUE if enabled or FALSE if disabled.
            # The selection fade effect causes the menu item selected by the user to remain on the screen briefly while
            # fading out after the menu is dismissed.

            :GETTOOLTIPANIMATION, 0x1016, # Determines whether ToolTip animation is enabled. The pvParam parameter must
            # point to a BOOL variable that receives TRUE if enabled or FALSE if disabled. If ToolTip animation is enabled,
            # :GETTOOLTIPFADE indicates whether ToolTips use fade or slide animation.

            :GETTOOLTIPFADE, 0x1018, # If :SETTOOLTIPANIMATION is enabled, :GETTOOLTIPFADE indicates whether ToolTip
            # animation uses a fade effect or a slide effect. The pvParam parameter must point to a BOOL variable that
            # receives TRUE for fade animation or FALSE for slide animation. For more information on slide and fade effects,
            # see AnimateWindow.

            :GETUIEFFECTS, 0x103E, # Determines whether UI effects are enabled or disabled. The pvParam parameter must point
            # to a BOOL variable that receives TRUE if all UI effects are enabled, or FALSE if they are disabled.

            :SETCOMBOBOXANIMATION, 0x1005, # Enables or disables the slide-open effect for combo boxes. Set the pvParam
            # parameter to TRUE to enable the gradient effect, or FALSE to disable it.

            :SETCURSORSHADOW, 0x101B, # Enables or disables a shadow around the cursor. The pvParam parameter is a BOOL
            # variable. Set pvParam to TRUE to enable the shadow or FALSE to disable the shadow. This effect appears only if
            # the system has a color depth of more than 256 colors.

            :SETGRADIENTCAPTIONS, 0x1009, # Enables or disables the gradient effect for window title bars. Set the pvParam
            # parameter to TRUE to enable it, or FALSE to disable it. The gradient effect is possible only if the system has
            # a color depth of more than 256 colors. For more information about the gradient effect, see the GetSysColor
            # function.

            :SETHOTTRACKING, 0x100F, # Enables or disables hot tracking of user-interface elements such as menu names on
            # menu bars. Set the pvParam parameter to TRUE to enable it, or FALSE to disable it.
            # Hot-tracking means that when the cursor moves over an item, it is highlighted but not selected.

            :SETLISTBOXSMOOTHSCROLLING, 0x1007, # Enables or disables the smooth-scrolling effect for list boxes. Set the
            # pvParam parameter to TRUE to enable the smooth-scrolling effect, or FALSE to disable it.

            :SETMENUANIMATION, 0x1003, # Enables or disables menu animation. This master switch must be on for any menu
            # animation to occur. The pvParam parameter is a BOOL variable; set pvParam to TRUE to enable animation and
            # FALSE to disable animation.
            # If animation is enabled, :GETMENUFADE indicates whether menus use fade or slide animation.

            :SETMENUUNDERLINES, 0x100B, # Same as :SETKEYBOARDCUES.

            :SETSELECTIONFADE, 0x1015, # Set pvParam to TRUE to enable the selection fade effect or FALSE to disable it.
            # The selection fade effect causes the menu item selected by the user to remain on the screen briefly while
            # fading out after the menu is dismissed. The selection fade effect is possible only if the system has a color
            # depth of more than 256 colors.

            :SETTOOLTIPANIMATION, 0x1017, # Set pvParam to TRUE to enable ToolTip animation or FALSE to disable it. If
            # enabled, you can use :SETTOOLTIPFADE to specify fade or slide animation.

            :SETTOOLTIPFADE, 0x1019, # If the :SETTOOLTIPANIMATION flag is enabled, use :SETTOOLTIPFADE to indicate whether
            # ToolTip animation uses a fade effect or a slide effect. Set pvParam to TRUE for fade animation or FALSE for
            # slide animation. The tooltip fade effect is possible only if the system has a color depth of more than 256
            # colors. For more information on the slide and fade effects, see the AnimateWindowfunction.

            :SETUIEFFECTS, 0x103F, # Enables or disables UI effects. Set the pvParam parameter to TRUE to enable all UI
            # effects or FALSE to disable all UI effects.


            # The following are the window parameters.
            :GETACTIVEWINDOWTRACKING, 0x1000, # Determines whether active window tracking (activating the window the mouse
            # is on) is on or off. The pvParam parameter must point to a BOOL variable that receives TRUE for on, or FALSE
            # for off.

            :GETACTIVEWNDTRKZORDER, 0x100C, # Determines whether windows activated through active window tracking will be
            # brought to the top. The pvParam parameter must point to a BOOL variable that receives TRUE for on, or FALSE
            # for off.

            :GETACTIVEWNDTRKTIMEOUT, 0x2002, # Retrieves the active window tracking delay, in milliseconds. The pvParam
            # parameter must point to a DWORD variable that receives the time.

            :GETANIMATION, 0x0048, # Retrieves the animation effects associated with user actions. The pvParam parameter
            # must point to an ANIMATIONINFO structure that receives the information. Set the cbSize member of this
            # structure and the uiParam parameter to sizeof(ANIMATIONINFO).

            :GETBORDER, 0x0005, # Retrieves the border multiplier factor that determines the width of a window's sizing
            # border. The pvParamparameter must point to an integer variable that receives this value.

            :GETCARETWIDTH, 0x2006, # Retrieves the caret width in edit controls, in pixels. The pvParam parameter must
            # point to a DWORD variable that receives this value.

            :GETDOCKMOVING, 0x0090, # Determines whether a window is docked when it is moved to the top, left, or right
            # edges of a monitor or monitor array. The pvParam parameter must point to a BOOL variable that receives TRUE if
            # enabled, or FALSE otherwise.
            # Use :GETWINARRANGING to determine whether this behavior is enabled.
            # Windows Server 2008, Windows Vista, Windows Server 2003, and Windows XP/2000:  This parameter is not
            # supported.

            :GETDRAGFROMMAXIMIZE, 0x008C, # Determines whether a maximized window is restored when its caption bar is
            # dragged. The pvParam parameter must point to a BOOL variable that receives TRUE if enabled, or FALSE
            # otherwise.
            # Use :GETWINARRANGING to determine whether this behavior is enabled.
            # Windows Server 2008, Windows Vista, Windows Server 2003, and Windows XP/2000:  This parameter is not
            # supported.

            :GETDRAGFULLWINDOWS, 0x0026, # Determines whether dragging of full windows is enabled. The pvParam parameter
            # must point to a BOOL variable that receives TRUE if enabled, or FALSE otherwise.

            :GETFOREGROUNDFLASHCOUNT, 0x2004, # Retrieves the number of times SetForegroundWindow will flash the taskbar
            # button when rejecting a foreground switch request. The pvParam parameter must point to a DWORD variable that
            # receives the value.

            :GETFOREGROUNDLOCKTIMEOUT, 0x2000, # Retrieves the amount of time following user input, in, milliseconds, during
            # which the system will not allow applications to force themselves into the foreground. The pvParam parameter
            # must point to a DWORD variable that receives the time.

            :GETMINIMIZEDMETRICS, 0x002B, # Retrieves the metrics associated with minimized windows. The pvParam parameter
            # must point to a MINIMIZEDMETRICS structure that receives the information. Set the cbSize member of this
            # structure and the uiParam parameter to sizeof(MINIMIZEDMETRICS).

            :GETMOUSEDOCKTHRESHOLD, 0x007E, # Retrieves the threshold in pixels where docking behavior is triggered by using
            # a mouse to drag a window to the edge of a monitor or monitor array. The default threshold is 1. The pvParam
            # parameter must point to a DWORD variable that receives the value.
            # Use :GETWINARRANGING to determine whether this behavior is enabled.
            # Windows Server 2008, Windows Vista, Windows Server 2003, and Windows XP/2000:  This parameter is not
            # supported.

            :GETMOUSEDRAGOUTTHRESHOLD, 0x0084, # Retrieves the threshold in pixels where undocking behavior is triggered by
            # using a mouse to drag a window from the edge of a monitor or a monitor array toward the center. The default
            # threshold is 20.
            # Use :GETWINARRANGING to determine whether this behavior is enabled.
            # Windows Server 2008, Windows Vista, Windows Server 2003, and Windows XP/2000:  This parameter is not
            # supported.

            :GETMOUSESIDEMOVETHRESHOLD, 0x0088, # Retrieves the threshold in pixels from the top of a monitor or a monitor
            # array where a vertically maximized window is restored when dragged with the mouse. The default threshold is
            # 50.
            # Use :GETWINARRANGING to determine whether this behavior is enabled.
            # Windows Server 2008, Windows Vista, Windows Server 2003, and Windows XP/2000:  This parameter is not
            # supported.

            :GETNONCLIENTMETRICS, 0x0029, # Retrieves the metrics associated with the nonclient area of nonminimized
            # windows. The pvParam parameter must point to a NONCLIENTMETRICS structure that receives the information. Set
            # the cbSize member of this structure and the uiParam parameter to sizeof(NONCLIENTMETRICS).

            :GETPENDOCKTHRESHOLD, 0x0080, # Retrieves the threshold in pixels where docking behavior is triggered by using a
            # pen to drag a window to the edge of a monitor or monitor array. The default is 30.
            # Use :GETWINARRANGING to determine whether this behavior is enabled.
            # Windows Server 2008, Windows Vista, Windows Server 2003, and Windows XP/2000:  This parameter is not
            # supported.

            :GETPENDRAGOUTTHRESHOLD, 0x0086, # Retrieves the threshold in pixels where undocking behavior is triggered by
            # using a pen to drag a window from the edge of a monitor or monitor array toward its center. The default
            # threshold is 30.
            # Use :GETWINARRANGING to determine whether this behavior is enabled.
            # Windows Server 2008, Windows Vista, Windows Server 2003, and Windows XP/2000:  This parameter is not
            # supported.

            :GETPENSIDEMOVETHRESHOLD, 0x008A, # Retrieves the threshold in pixels from the top of a monitor or monitor array
            # where a vertically maximized window is restored when dragged with the mouse. The default threshold is 50.
            # Use :GETWINARRANGING to determine whether this behavior is enabled.
            # Windows Server 2008, Windows Vista, Windows Server 2003, and Windows XP/2000:  This parameter is not
            # supported.

            :GETSHOWIMEUI, 0x006E, # Determines whether the IME status window is visible (on a per-user basis). The pvParam
            # parameter must point to a BOOL variable that receives TRUE if the status window is visible, or FALSE if it is
            # not.

            :GETSNAPSIZING, 0x008E, # Determines whether a window is vertically maximized when it is sized to the top or
            # bottom of a monitor or monitor array. The pvParam parameter must point to a BOOL variable that receives TRUE
            # if enabled, or FALSE otherwise.
            # Use :GETWINARRANGING to determine whether this behavior is enabled.
            # Windows Server 2008, Windows Vista, Windows Server 2003, and Windows XP/2000:  This parameter is not
            # supported.

            :GETWINARRANGING, 0x0082, # Determines whether window arrangement is enabled. The pvParam parameter must point
            # to a BOOL variable that receives TRUE if enabled, or FALSE otherwise.
            # Window arrangement reduces the number of mouse, pen, or touch interactions needed to move and size top-level
            # windows by simplifying the default behavior of a window when it is dragged or sized.
            # The following parameters retrieve individual window arrangement settings:
            # :GETDOCKMOVING
            # :GETMOUSEDOCKTHRESHOLD
            # :GETMOUSEDRAGOUTTHRESHOLD
            # :GETMOUSESIDEMOVETHRESHOLD
            # :GETPENDOCKTHRESHOLD
            # :GETPENDRAGOUTTHRESHOLD
            # :GETPENSIDEMOVETHRESHOLD
            # :GETSNAPSIZING
            # Windows Server 2008, Windows Vista, Windows Server 2003, and Windows XP/2000:  This parameter is not
            # supported.

            :SETACTIVEWINDOWTRACKING, 0x1001, # Sets active window tracking (activating the window the mouse is on) either
            # on or off. Set pvParam to TRUE for on or FALSE for off.

            :SETACTIVEWNDTRKZORDER, 0x100D, # Determines whether or not windows activated through active window tracking
            # should be brought to the top. Set pvParam to TRUE for on or FALSE for off.

            :SETACTIVEWNDTRKTIMEOUT, 0x2003, # Sets the active window tracking delay. Set pvParam to the number of
            # milliseconds to delay before activating the window under the mouse pointer.

            :SETANIMATION, 0x0049, # Sets the animation effects associated with user actions. The pvParam parameter must
            # point to an ANIMATIONINFO structure that contains the new parameters. Set the cbSize member of this structure
            # and the uiParam parameter to sizeof(ANIMATIONINFO).

            :SETBORDER, 0x0006, # Sets the border multiplier factor that determines the width of a window's sizing border.
            # The uiParam parameter specifies the new value.

            :SETCARETWIDTH, 0x2007, # Sets the caret width in edit controls. Set pvParam to the desired width, in pixels.
            # The default and minimum value is 1.

            :SETDOCKMOVING, 0x0091, # Sets whether a window is docked when it is moved to the top, left, or right docking
            # targets on a monitor or monitor array. Set pvParam to TRUE for on or FALSE for off.
            # :GETWINARRANGING must be TRUE to enable this behavior.
            # Windows Server 2008, Windows Vista, Windows Server 2003, and Windows XP/2000:  This parameter is not
            # supported.

            :SETDRAGFROMMAXIMIZE, 0x008D, # Sets whether a maximized window is restored when its caption bar is dragged.
            # Set pvParam to TRUE for on or FALSE for off.
            # :GETWINARRANGING must be TRUE to enable this behavior.
            # Windows Server 2008, Windows Vista, Windows Server 2003, and Windows XP/2000:  This parameter is not
            # supported.

            :SETDRAGFULLWINDOWS, 0x0025, # Sets dragging of full windows either on or off. The uiParam parameter specifies
            # TRUE for on, or FALSE for off.

            :SETDRAGHEIGHT, 0x004D, # Sets the height, in pixels, of the rectangle used to detect the start of a drag
            # operation. Set uiParam to the new value. To retrieve the drag height, call GetSystemMetrics with the SM_CYDRAG
            # flag.

            :SETDRAGWIDTH, 0x004C, # Sets the width, in pixels, of the rectangle used to detect the start of a drag
            # operation. Set uiParam to the new value. To retrieve the drag width, call GetSystemMetrics with the SM_CXDRAG
            # flag.

            :SETFOREGROUNDFLASHCOUNT, 0x2005, # Sets the number of times SetForegroundWindow will flash the taskbar button
            # when rejecting a foreground switch request. Set pvParam to the number of times to flash.

            :SETFOREGROUNDLOCKTIMEOUT, 0x2001, # Sets the amount of time following user input, in milliseconds, during
            # which the system does not allow applications to force themselves into the foreground. Set pvParam to the new
            # time-out value.
            # The calling thread must be able to change the foreground window, otherwise the call fails.

            :SETMINIMIZEDMETRICS, 0x002C, # Sets the metrics associated with minimized windows. The pvParam parameter must
            # point to a MINIMIZEDMETRICS structure that contains the new parameters. Set the cbSize member of this
            # structure and the uiParam parameter to sizeof(MINIMIZEDMETRICS).
            :SETMOUSEDOCKTHRESHOLD, 0x007F, # Sets the threshold in pixels where docking behavior is triggered by using a
            # mouse to drag a window to the edge of a monitor or monitor array. The default threshold is 1. The pvParam
            # parameter must point to a DWORD variable that contains the new value.
            # :GETWINARRANGING must be TRUE to enable this behavior.
            # Windows Server 2008, Windows Vista, Windows Server 2003, and Windows XP/2000:  This parameter is not
            # supported.

            :SETMOUSEDRAGOUTTHRESHOLD, 0x0085, # Sets the threshold in pixels where undocking behavior is triggered by using
            # a mouse to drag a window from the edge of a monitor or monitor array to its center. The default threshold is
            # 20. The pvParam parameter must point to a DWORD variable that contains the new value.
            # :GETWINARRANGING must be TRUE to enable this behavior.
            # Windows Server 2008, Windows Vista, Windows Server 2003, and Windows XP/2000:  This parameter is not
            # supported.

            :SETMOUSESIDEMOVETHRESHOLD, 0x0089, # Sets the threshold in pixels from the top of the monitor where a
            # vertically maximized window is restored when dragged with the mouse. The default threshold is 50. The pvParam
            # parameter must point to a DWORD variable that contains the new value.
            # :GETWINARRANGING must be TRUE to enable this behavior.
            # Windows Server 2008, Windows Vista, Windows Server 2003, and Windows XP/2000:  This parameter is not
            # supported.

            :SETNONCLIENTMETRICS, 0x002A, # Sets the metrics associated with the nonclient area of nonminimized windows.
            # The pvParam parameter must point to a NONCLIENTMETRICS structure that contains the new parameters. Set the
            # cbSize member of this structure and the uiParam parameter to sizeof(NONCLIENTMETRICS). Also, the lfHeight
            # member of the LOGFONT structure must be a negative value.

            :SETPENDOCKTHRESHOLD, 0x0081, # Sets the threshold in pixels where docking behavior is triggered by using a pen
            # to drag a window to the edge of a monitor or monitor array. The default threshold is 30. The pvParam parameter
            # must point to a DWORD variable that contains the new value.
            # :GETWINARRANGING must be TRUE to enable this behavior.
            # Windows Server 2008, Windows Vista, Windows Server 2003, and Windows XP/2000:  This parameter is not
            # supported.

            :SETPENDRAGOUTTHRESHOLD, 0x0087, # Sets the threshold in pixels where undocking behavior is triggered by using a
            # pen to drag a window from the edge of a monitor or monitor array to its center. The default threshold is 30.
            # The pvParam parameter must point to a DWORD variable that contains the new value.
            # :GETWINARRANGING must be TRUE to enable this behavior.
            # Windows Server 2008, Windows Vista, Windows Server 2003, and Windows XP/2000:  This parameter is not
            # supported.
            :SETPENSIDEMOVETHRESHOLD, 0x008B, # Sets the threshold in pixels from the top of the monitor where a vertically
            # maximized window is restored when dragged with a pen. The default threshold is 50. The pvParam parameter must
            # point to a DWORD variable that contains the new value.
            # :GETWINARRANGING must be TRUE to enable this behavior.
            # Windows Server 2008, Windows Vista, Windows Server 2003, and Windows XP/2000:  This parameter is not
            # supported.

            :SETSHOWIMEUI, 0x006F, # Sets whether the IME status window is visible or not on a per-user basis. The uiParam
            # parameter specifies TRUE for on or FALSE for off.

            :SETSNAPSIZING, 0x008F, # Sets whether a window is vertically maximized when it is sized to the top or bottom of
            # the monitor. Set pvParam to TRUE for on or FALSE for off.
            # :GETWINARRANGING must be TRUE to enable this behavior.
            # Windows Server 2008, Windows Vista, Windows Server 2003, and Windows XP/2000:  This parameter is not
            # supported.

            :SETWINARRANGING, 0x0083, # Sets whether window arrangement is enabled. Set pvParam to TRUE for on or FALSE for
            # off.
            # Window arrangement reduces the number of mouse, pen, or touch interactions needed to move and size top-level
            # windows by simplifying the default behavior of a window when it is dragged or sized.
            # The following parameters set individual window arrangement settings:
            # :SETDOCKMOVING
            # :SETMOUSEDOCKTHRESHOLD
            # :SETMOUSEDRAGOUTTHRESHOLD
            # :SETMOUSESIDEMOVETHRESHOLD
            # :SETPENDOCKTHRESHOLD
            # :SETPENDRAGOUTTHRESHOLD
            # :SETPENSIDEMOVETHRESHOLD
            # :SETSNAPSIZING
            # Windows Server 2008, Windows Vista, Windows Server 2003, and Windows XP/2000:  This parameter is not
            # supported.
        ]

        #BOOL WINAPI SystemParametersInfo(
        #  _In_     UINT uiAction,
        #  _In_     UINT uiParam,
        #  _Inout_  PVOID pvParam,
        #  _In_     UINT fWinIni )
        attach_function 'SystemParametersInfoA', [SystemParametersInfoFlags, :uint, :pointer, :uint], :bool
        attach_function 'SystemParametersInfoW', [SystemParametersInfoFlags, :uint, :pointer, :uint], :bool

      end
    end
  end
end