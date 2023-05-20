local _M = {
   terminal = os.getenv('TERMINAL') or 'xterm',
   editor   = os.getenv('EDITOR')   or 'nano',
}

_M.editor_cmd = _M.terminal .. ' -e ' .. _M.editor

return _M
