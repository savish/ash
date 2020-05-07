defmodule Ash.Error.Invalid do
  use Ash.Error

  def_ash_error([:errors], class: :invalid)

  defimpl Ash.ErrorKind do
    def id(_), do: Ecto.UUID.generate()

    def code(_), do: "invalid"

    def message(error) do
      Ash.Error.error_messages(error.errors)
    end

    def description(error) do
      Ash.Error.error_descriptions(error.errors)
    end
  end
end