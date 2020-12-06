defmodule FizzBuzz do
  @spec build(
          binary
          | maybe_improper_list(
              binary | maybe_improper_list(any, binary | []) | char,
              binary | []
            )
        ) :: {:error, <<_::64, _::_*8>>} | {:ok, [any]}
  def build(file) do
    file
    |> File.read()
    |> handle_file_read()
  end

  defp handle_file_read({:ok, result}) do
    result =
      result
      |> String.split(",")
      |> Enum.map(&convert_and_evaluate_numbers/1)

    {:ok, result}
  end

  defp handle_file_read({:error, reason}), do: {:error, "Error reading the file: #{reason}"}

  defp convert_and_evaluate_numbers(number) do
    number
    |> String.to_integer()
    |> evaluate_numbers()
  end

  defp evaluate_numbers(number) when rem(number, 3) == 0 and rem(number, 5) == 0, do: :fizzbuzz
  defp evaluate_numbers(number) when rem(number, 3) == 0, do: :fizz
  defp evaluate_numbers(number) when rem(number, 5) == 0, do: :buzz
  defp evaluate_numbers(number), do: number
end

## 02
## def build(file) do
## file_ = File.read(file)
## handle_file_read(file_)
## end

## def handle_file_read({:ok, result}), do: result
## def handle_file_read({:error, reason}), do: reason

## 01
## defmodule FizzBuzz do
## def build(file) do
## case File.read(file) do
## {:ok, result} -> result
## {:error, reason} -> reason
## end
## end
## end
