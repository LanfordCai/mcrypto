defmodule McryptoTest.Blake2b do
  use ExUnit.Case
  alias Mcrypto.Hasher.Blake2b

  @message Base.decode16!("68656C6C6F")

  test "blake2b hash should work as expected" do
    assert Mcrypto.hash(%Blake2b{}, "") ===
             <<14, 87, 81, 192, 38, 229, 67, 178, 232, 171, 46, 176, 96, 153, 218, 161, 209, 229,
               223, 71, 119, 143, 119, 135, 250, 171, 69, 205, 241, 47, 227, 168>>

    assert Mcrypto.hash(%Blake2b{}, @message) ===
             <<50, 77, 207, 2, 125, 212, 163, 10, 147, 44, 68, 31, 54, 90, 37, 232, 107, 23, 61,
               239, 164, 184, 229, 137, 72, 37, 52, 113, 184, 27, 114, 207>>

    assert Mcrypto.hash(%Blake2b{size: 160}, @message) ===
             <<181, 83, 28, 112, 55, 240, 108, 159, 41, 71, 19, 42, 106, 119, 32, 44, 48, 142,
               137, 57>>

    assert Mcrypto.hash(%Blake2b{size: 384}, @message) ===
             <<133, 241, 145, 112, 190, 84, 30, 119, 116, 218, 25, 124, 18, 206, 149, 155, 145,
               162, 128, 178, 242, 62, 49, 19, 214, 99, 138, 51, 53, 80, 126, 215, 45, 220, 48,
               248, 18, 68, 219, 233, 250, 141, 25, 92, 35, 188, 235, 126>>

    assert Mcrypto.hash(%Blake2b{size: 512}, @message) ===
             <<228, 207, 163, 154, 61, 55, 190, 49, 197, 150, 9, 232, 7, 151, 7, 153, 202, 166,
               138, 25, 191, 170, 21, 19, 95, 22, 80, 133, 224, 29, 65, 166, 91, 161, 225, 177,
               70, 174, 182, 189, 0, 146, 180, 158, 172, 33, 76, 16, 60, 207, 163, 163, 101, 149,
               75, 187, 229, 47, 116, 162, 179, 98, 12, 148>>
  end
end
