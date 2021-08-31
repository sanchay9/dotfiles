-- Define fg color
local function fg(group, color)
   vim.cmd("hi! " .. group .. " guifg=" .. color)
end

-- Define bg color
local function bg(group, color)
   vim.cmd("hi! " .. group .. " guibg=" .. color)
end

-- Define bg and fg color
local function fbg(group, fgcol, bgcol)
   vim.cmd("hi! " .. group .. " guifg=" .. fgcol .. " guibg=" .. bgcol)
end


fbg("FloatermBorder", "none", "none")
bg("FloatermNC", "#E06C75")

bg("Folded", "bg")
fbg("EndOfBuffer", "bg", "bg")

fbg("TabLineSel", "#D8DEE9", "bg")
fbg("TabLineSeparatorActive", "#61AFEF", "bg")
bg("TabLineFill", "black")
fbg("TabLineCloseActive", "#D8DEE9", "bg")
fbg("TabLineModifiedSeparatorActive", "#E06C75", "bg")


-- yellow = "#e7c787",
