#!/usr/bin/env lua

--! LibreMesh community mesh networks meta-firmware
--!
--! Copyright (C) 2014-2023  Gioacchino Mazzurco <gio@eigenlab.org>
--! Copyright (C) 2023  Asociación Civil Altermundi <info@altermundi.net>
--!
--! SPDX-License-Identifier: AGPL-3.0-only


function applyMacTemplate16(template, mac)
  for i=1,6,1 do template = template:gsub("%%M"..i, mac[i]) end
  local macid = utils.get_id(mac)
  for i=1,6,1 do template = template:gsub("%%m"..i, macid[i]) end
  return template
end

function applyMacTemplate10(template, mac)
  for i=1,6,1 do template = template:gsub("%%M"..i, tonumber(mac[i], 16)) end
  local macid = utils.get_id(mac)
  for i=1,6,1 do template = template:gsub("%%m"..i, tonumber(macid[i], 16)) end
  return template
end

function applyHostnameTemplate(template)
  return template:gsub("%%H", print(arg[1]))
end

function get_id(input)
  if type(input) == "table" then
    input = table.concat(input, "")
  end
  local id = {}
  local fd = io.popen('echo "' .. input .. '" | md5sum')
  if fd then
    local md5 = fd:read("*a")
    local j = 1
    for i=1,16,1 do
      id[i] = string.sub(md5, j, j + 1)
      j = j + 2
    end
    fd:close()
  end
  return id
end

system_hostname = applyMacTemplate16(print(arg[1]), print(arg[2]))

return system_hostname


