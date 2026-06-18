defmodule DNA do
  @encodes [
    [?\s, 0b0000],
    [?A, 0b0001],
    [?C, 0b0010],
    [?G, 0b0100],
    [?T, 0b1000]
  ]

  def encode_nucleotide(code_point) do
    Enum.find(@encodes, fn [point, _code] -> point == code_point end)
    |> List.last()
  end

  def decode_nucleotide(encoded_code) do
    Enum.find(@encodes, fn [_point, code] -> code == encoded_code end)
    |> List.first()
  end

  def encode(dna) do
    do_encode(dna)
  end

  def do_encode(list, sequence \\ <<>>)
  def do_encode([], sequence), do: sequence
  def do_encode([h | t], sequence) do
    encoded = encode_nucleotide(h)
    do_encode(t, <<sequence::bitstring, encoded::4>>)
  end

  def decode(dna) do
    do_decode(dna)
  end

  def do_decode(encoded, list \\ [])
  def do_decode(<<>>, list), do: reverse(list)
  def do_decode(<<encoded::4, rest::bitstring>>, list) do
    decoded = decode_nucleotide(encoded)
    do_decode(rest, [decoded | list])
  end

  defp reverse(list) do
    do_reverse(list)
  end

  defp do_reverse(list, reversed \\ [])
  defp do_reverse([], reversed), do: reversed
  defp do_reverse([h | t], reversed) do
    do_reverse(t, [h | reversed])
  end
end
