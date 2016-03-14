defmodule Spotmq.Msg.PingReq do
  @moduledoc """
  PingReq Message

  http://docs.oasis-open.org/mqtt/mqtt/v3.1.1/os/mqtt-v3.1.1-os.html#_Toc398718081
  """
  defstruct []
  @type t :: %__MODULE__{}
  @behaviour Spotmq.Msg.Decode
  
  alias Spotmq.Msg.FixedHeader

  @doc """
  Creates a new PingReq.
  """
  @spec new() :: __MODULE__.t
  def new() do
    %__MODULE__{}
  end

  @spec decode_body(binary, Spotmq.Msg.FixedHeader.t) :: __MODULE__.t
  def decode_body(<<>>, %FixedHeader{length: 0}) do
    new()
  end
  def decode_body(_msg, _hdr) do
    # Raise an error about needing 0 length
  end
end
defimpl Spotmq.Msg.Encode, for: Spotmq.Msg.PingReq do
  alias Spotmq.Msg.Encode.Utils

  def encode(_msg) do
    Utils.encode_basic(:ping_req)
  end
end
