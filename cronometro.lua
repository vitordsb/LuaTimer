#!/usr/bin/env lua

-- Tenta carregar LuaSocket (para sleep não‑bloqueante)
local has_socket, socket = pcall(require, "socket")

-- ANSI‑escapes básicos
local esc = string.char(27)
local C = {
  reset  = esc.."[0m",
  bold   = esc.."[1m",
  cyan   = esc.."[36m",
  yellow = esc.."[33m",
  green  = esc.."[32m",
  magenta= esc.."[35m",
}

-- Leitura do parâmetro (duração em segundos)
local total = tonumber(arg[1])
if not total then
  io.stderr:write("Uso: lua timer.lua <segundos>\n")
  os.exit(1)
end

local start = os.time()

-- Formata segundos em mm:ss
local function fmt(sec)
  local m = math.floor(sec/60)
  local s = sec % 60
  return string.format("%02d:%02d", m, s)
end

-- Gera barra de progresso (█ preenchido, ░ vazio)
local function bar(elap, tot, width)
  local filled = math.floor((elap/tot) * width)
  return string.rep("█", filled) .. string.rep("░", width - filled)
end

local WIDTH = 30  -- ajuste o tamanho da barra aqui

-- Loop principal
while true do
  local now     = os.time()
  local elapsed = now - start
  if elapsed > total then break end

  local b   = bar(elapsed, total, WIDTH)
  local pct = math.floor((elapsed/total)*100)
  io.write(string.format(
    "\r%s[%s]%s %s%s%s %3d%%",
    C.cyan,     b,       C.reset,
    C.yellow,   fmt(elapsed), C.reset,
    pct
  ))
  io.flush()

  -- pausa 1s
  if has_socket then socket.sleep(1)
  else os.execute("sleep 1") end
end

-- Finaliza mostrando 100%
local full = bar(total, total, WIDTH)
io.write(string.format(
  "\r%s[%s]%s %s %sDone!%s\n",
  C.green,    full,    C.reset,
  fmt(total),
  C.magenta,  C.reset
))

