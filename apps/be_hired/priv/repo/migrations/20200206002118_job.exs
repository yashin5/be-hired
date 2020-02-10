defmodule BeHired.Repo.Migrations.Job do
  use Ecto.Migration

  def change do
    create table(:jobs, primary_key: false) do
      add(:id, :uuid, primary_key: true)
      add(:title, :string)
      add(:description, :string)
      add(:requirements, :string)
      add(:benefits, :string)
      add(:salary, :string)
      add(:hiring_type, :string)
      add(:vacancies_number, :string)
      add(:total_people_applied, :string)
    end
  end
end
