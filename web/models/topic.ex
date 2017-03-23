defmodule Discuss.Topic do
  use Discuss.Web, :model

  schema "topics" do
    field :title, :string
    belongs_to :user, Discuss.User
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title])
    |> cast_assoc(:user)
    |> validate_required([:title, :user_id])
    |> assoc_constraint(:user)
  end
end
