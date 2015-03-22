module WinFFI
  module User32
    ProcessDpiAwareness = enum :process_dpi_awareness,
    [
      :Process_DPI_Unaware,           0, # DPI unaware
      :Process_System_DPI_Aware,      1, # System DPI aware
      :Process_Per_Monitor_DPI_Aware, 2, # Per monitor DPI aware
    ]
  end
end