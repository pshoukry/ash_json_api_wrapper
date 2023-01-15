defmodule AshJsonApiWrapper.Paginator do
  @moduledoc """
  Behavior for scanning pages of a paginated endpoint.
  """

  @type ref :: {module, Keyword.t()}

  defmacro __using__(_) do
    quote do
      @behaviour AshJsonApiWrapper.Paginator
    end
  end

  @callback continue(
              response :: term,
              entities :: [Ash.Resource.record()],
              request :: Finch.Request.t(),
              opts :: Keyword.t()
            ) :: {:ok, %{optional(:params) => map, optional(:headers) => map}} | :halt
end