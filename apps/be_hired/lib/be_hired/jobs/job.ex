defmodule BeHired.Jobs.Job do
  @moduledoc """
    Schema to table Job
  """

  use Ecto.Schema

  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "jobs" do
    field(:title, :string)
    field(:description, :string)
    field(:requirements, :string)
    field(:benefits, :string)
    field(:salary, :string)
    field(:hiring_type, :string)
    field(:vacancies_number, :integer)
    field(:total_people_applied, :integer)

    timestamps()
  end

  def changeset(job, params \\ %{}) do
    required_fields = [
      :title,
      :description,
      :requirements,
      :benefits,
      :salary,
      :hiring_type,
      :vacancies_number,
      :total_people_applied
    ]

    job
    |> cast(params, required_fields)
    |> validate_required(required_fields)
  end

  def changeset_update(job, params \\ %{}) do
    required_fields = [
      :title,
      :description,
      :requirements,
      :benefits,
      :salary,
      :hiring_type,
      :vacancies_number,
      :total_people_applied
    ]

    job
    |> cast(params, required_fields)
    |> unique_constraint(:id)
  end
end
