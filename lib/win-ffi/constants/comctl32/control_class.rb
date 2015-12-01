module WinFFI
  module Comctl32
    #define PROGRESS_CLASSA         "msctls_progress32"
    #define PROGRESS_CLASSW         L"msctls_progress32"
    PROGRESS_CLASSA = 'msctls_progress32'
    PROGRESS_CLASSW = PROGRESS_CLASSA.encode('utf-16LE')
  end
end