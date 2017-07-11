defmodule Queens do
  @empty_board [
    ["_", "_", "_", "_", "_", "_", "_", "_"],
    ["_", "_", "_", "_", "_", "_", "_", "_"],
    ["_", "_", "_", "_", "_", "_", "_", "_"],
    ["_", "_", "_", "_", "_", "_", "_", "_"],
    ["_", "_", "_", "_", "_", "_", "_", "_"],
    ["_", "_", "_", "_", "_", "_", "_", "_"],
    ["_", "_", "_", "_", "_", "_", "_", "_"],
    ["_", "_", "_", "_", "_", "_", "_", "_"]
  ]

  @type t :: %Queens{ black: {integer, integer}, white: {integer, integer} }
  defstruct black: nil, white: nil

  @doc """
  Creates a new set of Queens
  """
  @spec new() :: Queens.t()
  @spec new({integer, integer}, {integer, integer}) :: Queens.t()
  def new(white \\ {0, 3}, black \\ {7, 3}) do
    cond do
      white == black -> raise ArgumentError
      true -> %Queens{white: white, black: black}
    end
  end

  @doc """
  Gives a string reprentation of the board with
  white and black queen locations shown
  """
  @spec to_string(Queens.t()) :: String.t()
  def to_string(queens) do
    @empty_board
      |> apply_piece(queens.white, "W")
      |> apply_piece(queens.black, "B")
      |> Enum.map(fn(row) -> Enum.join(row, " ") end)
      |> Enum.join("\n")
  end

  defp apply_piece(board, {0, x}, representative), do: [apply_piece_to_row(Enum.at(board, 0), x, representative)] ++ Enum.slice(board, 1..7)
  defp apply_piece(board, {7, x}, representative), do: Enum.slice(board, 0..6) ++ [apply_piece_to_row(Enum.at(board, 7), x, representative)]
  defp apply_piece(board, {y, x}, representative), do: Enum.slice(board, 0..(y - 1)) ++ [apply_piece_to_row(Enum.at(board, y), x, representative)] ++ Enum.slice(board, (y + 1)..7)

  defp apply_piece_to_row(row, 0, representative), do: [representative] ++ Enum.slice(row, 1..7)
  defp apply_piece_to_row(row, 7, representative), do: Enum.slice(row, 0..6) ++ [representative]
  defp apply_piece_to_row(row, x, representative), do: Enum.slice(row, 0..(x - 1)) ++ [representative] ++ Enum.slice(row, (x + 1)..7)

  @doc """
  Checks if the queens can attack each other
  """
  @spec can_attack?(Queens.t()) :: boolean
  def can_attack?(queens) do
    true
  end
end
