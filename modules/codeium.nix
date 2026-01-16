_: {
  vim = {
    assistant.neocodeium = {
      enable = true;
      setupOpts = {
        manual = false;
        silent = true;
      };
    };

    maps.insert = {
      "<C-Space>" = {
        action = ''<cmd>lua require("neocodeium").accept()<CR>'';
        desc = "NeoCodeium Accept Suggestion";
      };

      "<C-n>" = {
        action = ''<cmd>lua require("neocodeium").cycle_or_complete(1)<CR>'';
        desc = "NeoCodeium Next Suggestion";
      };

      "<C-e>" = {
        action = ''<cmd>lua require("neocodeium").clear()<CR>'';
        desc = "NeoCodeium Clear Suggestion";
      };
    };
  };
}
