defmodule Skyline.Msg.PubAck do
  @moduledoc false

  # PubAck MQTT Message
  # 
  # http://docs.oasis-open.org/mqtt/mqtt/v3.1.1/os/mqtt-v3.1.1-os.html#_Toc398718043

  defstruct msg_id: nil
  @type t :: %__MODULE__{msg_id: pos_integer}
  @behaviour Skyline.Msg.Decode

  alias Skyline.Msg.Decode.Utils

  @doc "New PubAck Message"
  @spec new(pos_integer) :: __MODULE__.t
  def new(msg_id) do
    %__MODULE__{msg_id: msg_id}
  end

  @spec decode_body(binary, Skyline.Msg.FixedHeader.t) :: __MODULE__.t
  def decode_body(msg, _hdr) do
    new(Utils.get_msgid(msg))
  end

end

defimpl Skyline.Msg.Encode, for: Skyline.Msg.PubAck do
  alias Skyline.Msg.Encode.Utils

  def encode(%Skyline.Msg.PubAck{msg_id: msg_id}) do
    Utils.basic_with_msg_id(:pub_ack, msg_id)
  end
end
