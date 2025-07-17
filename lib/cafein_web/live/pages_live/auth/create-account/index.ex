defmodule CafeinWeb.PagesLive.Auth.CreateAccount.Index do
  use CafeinWeb, :live_view
  alias Cafein.Accounts

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, form: to_form(Accounts.change_create_account(%Accounts.User{}))),
     layout: false}
  end

  @impl true
  def handle_event("validate", %{"account" => params}, socket) do
    form =
      %Accounts.User{}
      |> Accounts.change_create_account(params)
      |> to_form(action: :validate)

    {:noreply, assign(socket, form: form)}
  end

  # @impl true
  # def handle_event("save", %{"account" => account_params}, socket) do
  #   case Accounts.create_user(account_params) do
  #     {:ok, _} ->
  #       {:noreply,
  #        socket
  #        |> redirect(to: ~p"/auth/sign-in")}

  #     {:error, %Ecto.Changeset{} = changeset} ->
  #       {:noreply, assign(socket, form: to_form(changeset))}
  #   end
  # end
end
