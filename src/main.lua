require('utils')
require('sigils')
require('lexer')
require('parser')
require('executor')

local function run()
    if #arg < 1 then Panic('NotEnoughArguments') end
    if arg[1] == 'license' then
        print([[mini-rip: A minimal programming language
        Copyright (C) 2025 tixonochek
    
        This program is free software: you can redistribute it and/or modify
        it under the terms of the GNU General Public License as published by
        the Free Software Foundation, either version 3 of the License, or
        (at your option) any later version.
    
        This program is distributed in the hope that it will be useful,
        but WITHOUT ANY WARRANTY; without even the implied warranty of
        MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
        GNU General Public License for more details.
    
        You should have received a copy of the GNU General Public License
        along with this program.  If not, see <https://www.gnu.org/licenses/>.]])
        os.exit(0)
    end
    local horder_tokens = {}

    local i = 1
    while i <= #arg do
        local script = AttemptRead(arg[i])
        local lines = Lex(script)
        ht = Parse(lines)

        local j = 1
        while j <= #ht do
            table.insert(horder_tokens, ht[j])
            j = j + 1
        end

        i = i + 1
    end

    Execute(horder_tokens)
end

run()
