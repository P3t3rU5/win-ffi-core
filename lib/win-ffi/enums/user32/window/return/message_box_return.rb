require 'win-ffi/enums/user32'

module WinFFI
  module User32
    MessageBoxReturn = enum :message_box_return,
    [
      :OK,        1, # The OK button was selected.
      :CANCEL,    2, # The Cancel button was selected.
      :ABORT,     3, # The Abort button was selected.
      :RETRY,     4, # The Retry button was selected.
      :IGNORE,    5, # The Ignore button was selected.
      :YES,       6, # The Yes button was selected.
      :NO,        7, # The No button was selected.
      :TRYAGAIN, 10, # The Try Again button was selected.
      :CONTINUE, 11 # The Continue button was selected.
    ]
  end
end