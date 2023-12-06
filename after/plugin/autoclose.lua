local function nvim_setup()
    require("autoclose").setup()
end

return {
    nvim_setup = nvim_setup
}
