defmodule DNA do
  @encodes %{
    ?\s => 0b0000,
    ?A => 0b0001,
    ?C => 0b0010,
    ?G => 0b0100,
    ?T => 0b1000
  }

  @decodes %{
    0b0000 => ?\s,
    0b0001 => ?A,
    0b0010 => ?C,
    0b0100 => ?G,
    0b1000 => ?T
  }

  def encode_nucleotide(code_point) do
    @encodes[code_point]
  end

  def decode_nucleotide(encoded_code) do
    @decodes[encoded_code]
  end

  def encode(dna) do
    do_encode(dna)
  end

  defp do_encode(list, sequence \\ <<>>)
  defp do_encode([], sequence), do: sequence
  defp do_encode([h | t], sequence) do
    encoded = encode_nucleotide(h)
    do_encode(t, <<sequence::bitstring, encoded::4>>)
  end

  def decode(dna) do
    do_decode(dna)
  end

  defp do_decode(encoded, list \\ [])
  defp do_decode(<<>>, list), do: reverse(list)
  defp do_decode(<<encoded::4, rest::bitstring>>, list) do
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
