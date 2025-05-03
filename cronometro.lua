#!/usr/bin/lua

local has_socket, socket = pcall(require, "socket")

-- Pega e valida o parâmetro (duração em segundos)
local duracao = tonumber(arg[1])
if not duracao then
    io.stderr:write("Uso: lua cronometro.lua <segundos>\n")
    os.exit(1)
end

-- Marca o início
local inicio = os.time()

-- Loop até completar a duração
while true do
    local agora = os.time()
    local decorrido = agora - inicio

    if decorrido > duracao then break end

    -- Formata mm:ss
    local m = math.floor(decorrido / 60)
    local s = decorrido % 60
    io.write(string.format("\r%02d:%02d", m, s))
    io.flush()

    -- Espera ~1 segundo
    if has_socket then
        socket.sleep(1)
    else
        -- fallback (menos eficiente)
        os.execute("sleep 1")
    end
end

-- Ao fim, pula linha e imprime mensagem
print("\nCronômetro finalizado!")
