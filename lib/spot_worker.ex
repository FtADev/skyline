defmodule SpotApp.Worker do

  import Socket
  alias Spotmq.Session
  alias Spotmq.Msg.Decode.Utils, as: Decoder
  alias Spotmq.Handler

  def start_link(default) do
<<<<<<< Updated upstream
    pid = spawn_link(fn -> init(8000) end)
    {:ok, pid}
  end

  def init(port) do
    server = Socket.TCP.listen!(port, [packet: 0,
											                 reuseaddr: true,
                                       binary: true,
                                       nodelay: true,
                                       active: true,
                                       backlog: 30,
											                 mode: :active])
    do_listen(server)
  end

  defp do_listen(server) do
    client = server |> Socket.TCP.accept!

    {:ok, _pid} = Spotmq.Listener.start_link(client)

    do_listen(server)
=======
    opts = [port: 8000]
    IO.puts("Starting rancher")
    :ranch.start_listener(:Spotmq, 100, :ranch_tcp, opts, Spotmq.Listener, [])
>>>>>>> Stashed changes
  end

end
