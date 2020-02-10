defmodule BeHired.Repo.Migrations.Job do
  use Ecto.Migration

  def change do
    create table(:jobs, primary_key: false) do
      add(:id, :uuid, primary_key: true)
      add(:title, :text)
      add(:description, :text)
      add(:requirements, :text)
      add(:benefits, :text)
      add(:salary, :string)
      add(:hiring_type, :string)
      add(:vacancies_number, :integer)
      add(:total_people_applied, :integer)

      timestamps()
    end
  end
end
