" Title:        A markdown based todo and journal plugin
" Description:  A todo list and journal manager based on markdown wiki with
" some orgmode mixins
" Last Change:  <today>
" Maintainer:   Kevin Löhmann<kevin.loehmann@me.com>

" Prevents the plugin from being loaded multiple times. If the loaded
" variable exists, do nothing more. Otherwise, assign the loaded
" variable and continue running this instance of the plugin.
if exists("g:loaded_jourgnal")
    finish
endif
let g:loaded_jourgnal = 1

" Defines a package path for Lua. This facilitates importing the
" Lua modules from the plugin's dependency directory.
let s:lua_rocks_deps_loc =  expand("<sfile>:h:r") . "/../lua/jourgnal/deps"
exe "lua package.path = package.path .. ';" . s:lua_rocks_deps_loc . "/lua-?/init.lua'"

" Exposes the plugin's functions for use as commands in Neovim.
command! -nargs=* AddToInbox lua require('jourgnal').add_task_to_inbox(<q-args>)
command! -nargs=* AddTask lua require('jourgnal').add_task(<q-args>)
command! -nargs=* AddSubtask lua require('jourgnal').add_subtask(<q-args>)
command! -nargs=0 ToggleTask lua require('jourgnal').toggle_task()
command! -nargs=* SetDate lua require('jourgnal').set_date(<q-args>)
command! -nargs=* SetDeadline lua require('jourgnal').set_deadline(<q-args>)
command! -nargs=* SetStatus lua require('jourgnal').set_status(<q-args>)
command! -nargs=* SetTags lua require('jourgnal').set_tags(<q-args>)
