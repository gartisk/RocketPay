# Fachada: Uma forma de manter todas as funções de determinado contexto em um lugar só
defmodule Rocketpay do
  alias Rocketpay.Users.Create, as: UserCreate

  defdelegate create_user(params), to: UserCreate, as: :call
end
