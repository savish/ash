defmodule Ash.Type.UUID do
  @moduledoc """
  Represents a UUID.

  A builtin type that can be referenced via `:uuid`
  """

  use Ash.Type

  @impl true
  def storage_type, do: Ecto.UUID

  @impl true
  def cast_input(value, _) when is_binary(value) do
    Ecto.Type.cast(Ecto.UUID, String.trim(value))
  end

  def cast_input(value, _) do
    Ecto.Type.cast(Ecto.UUID, value)
  end

  @impl true
  def cast_stored(value, constraints) do
    Ecto.Type.load(Ecto.UUID, value)
  rescue
    _e in ArgumentError ->
      cast_input(value, constraints)
  end

  @impl true
  def dump_to_native(value, _) do
    Ecto.Type.dump(Ecto.UUID, value)
  end
end
