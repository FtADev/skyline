defmodule Skyline.Msg.FixedHeader do
  @moduledoc false

  #MQTT Fixed header
  #
  #http://docs.oasis-open.org/mqtt/mqtt/v3.1.1/os/mqtt-v3.1.1-os.html#_Toc398718020
  
  defstruct message_type: :reserved,
            duplicate: false,
            qos: :fire_and_forget,
            retain: false,
            length: 0
  @type t :: %__MODULE__{message_type: Skyline.msg_type, duplicate: boolean, retain: boolean, length: pos_integer}

  def new(msg_type,
             dup,
             qos,
             retain,
             length) when
                is_atom(msg_type) and
                is_boolean(dup) and
                is_atom(qos) and
                is_boolean(retain) and
                is_integer(length) and
                length >= 0 do

    %__MODULE__{message_type: msg_type,
                 duplicate: dup,
                 qos: qos,
                 retain: retain,
                 length: length}
  end
end
