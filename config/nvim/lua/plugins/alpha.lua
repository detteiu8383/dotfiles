return function()
  local alpha = require("alpha")
  local dashboard = require("alpha.themes.dashboard")
  dashboard.section.header.val = {
    "             .,-:;//;:=,                ",
    "         . :H@@@MM@M#H/.,+%;,           ",
    "      ,/X+ +M@@M@MM%=,-%HMMM@X/,        ",
    "     -+@MM; $M@@MH+-,;XMMMM@MMMM@+-     ",
    "    ;@M@@M- XM@X;. -+XXXXXHHH@M@M#@/.   ",
    "  ,%MM@@MH ,@%=            .---=-=:=,.  ",
    "  -@#@@@MX .,              -%HX$$%%%+;  ",
    " =-./@M@M$                  .;@MMMM@MM: ",
    " X@/ -$MM/                    .+MM@@@M$ ",
    ",@M@H: :@:                    . -X#@@@@-",
    ",@@@MMX, .                    /H- ;@M@M=",
    ".H@@@@M@+,                    %MM+..%#$.",
    " /MMMM@MMH/.                  XM@MH; -; ",
    "  /%+%$XHH@$=              , .H@@@@MX,  ",
    "   .=--------.           -%H.,@@@@@MX,  ",
    "   .%MM@@@HHHXX$$$%+- .:$MMX -M@@MM%.   ",
    "     =XMMM@MM@MM#H;,-+HMM@M+ /MMMX=     ",
    "       =%@M@M#@$-.=$@MM@@@M; %M%=       ",
    "         ,:+$+-,/H#MMMMMMM@- -,         ",
    "               =++%%%%+/:-.             ",
  }

  dashboard.section.buttons.val = {
    dashboard.button("e", "  New File    ", ":enew<CR>"),
    dashboard.button("f", "  Find File   ", ":Telescope find_files<CR>"),
    dashboard.button("t", "  Find Text   ", ":Telescope live_grep<CR>"),
    dashboard.button("n", "  Open Neotree", ":Neotree show<CR>"),
    dashboard.button("q", "  Quit        ", ":qa<CR>"),
  }

  alpha.setup(dashboard.opts)
end
