defmodule AdventOfCode.Day01 do
  defp get_first_and_last(numbers) do
    String.first(numbers) <> String.last(numbers)
  end

  defp to_list_of_numbers([], acc), do: acc
  defp to_list_of_numbers(["o", "n", "e" | rest], acc), do: to_list_of_numbers(rest, acc <> "1")
  defp to_list_of_numbers(["t", "w", "o" | rest], acc), do: to_list_of_numbers(rest, acc <> "2")

  defp to_list_of_numbers(["t", "h", "r", "e", "e" | rest], acc),
    do: to_list_of_numbers(rest, acc <> "3")

  defp to_list_of_numbers(["f", "o", "u", "r" | rest], acc),
    do: to_list_of_numbers(rest, acc <> "4")

  defp to_list_of_numbers(["f", "i", "v", "e" | rest], acc),
    do: to_list_of_numbers(rest, acc <> "5")

  defp to_list_of_numbers(["s", "i", "x" | rest], acc),
    do: to_list_of_numbers(rest, acc <> "6")

  defp to_list_of_numbers(["s", "e", "v", "e", "n" | rest], acc),
    do: to_list_of_numbers(rest, acc <> "7")

  defp to_list_of_numbers(["e", "i", "g", "h", "t" | rest], acc),
    do: to_list_of_numbers(rest, acc <> "8")

  defp to_list_of_numbers(["n", "i", "n", "e" | rest], acc),
    do: to_list_of_numbers(rest, acc <> "9")

  defp to_list_of_numbers([f | rest], acc) do
    case Integer.parse(f) do
      {_int, ""} -> to_list_of_numbers(rest, acc <> f)
      _ -> to_list_of_numbers(rest, acc)
    end
  end

  defp process_input(input) do
    String.split(input, "\n", trim: true)
    |> Enum.map(&String.graphemes/1)
    |> Enum.map(fn line -> to_list_of_numbers(line, "") end)
    |> Enum.map(&get_first_and_last/1)
    |> Enum.map(fn n -> String.to_integer(n) end)
    |> Enum.sum()
  end

  def part1(input) do
    process_input(input)
  end

  def part2(input) do
    process_input(input)
  end
end
