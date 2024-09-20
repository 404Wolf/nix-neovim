{
  plugins.auto-save = {
    enable = true;
    settings = {
      debounce_delay = 500;
      trigger_events.immediate_save = ["InsertLeave" "TextChanged"];
      trigger_events.defer_save = ["TextChangedI"];
    };
  };
}
