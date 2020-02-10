defmodule BeHired.Jobs.JobRepository do
  alias BeHired.Repo
  alias BeHired.Jobs.Job

  @spec create(
          String.t(),
          String.t(),
          String.t(),
          String.t(),
          String.t(),
          String.t(),
          String.t(),
          String.t()
        ) :: {:ok, %Job{}}
  def create(
        title,
        description,
        requirements,
        benefits,
        salary,
        hiring_type,
        vacancies_number,
        total_people_applied
      ) do
    description
    |> new(
      title,
      requirements,
      benefits,
      salary,
      hiring_type,
      vacancies_number,
      total_people_applied
    )
    |> do_new_job()
  end

  defp do_new_job(job) do
    %Job{}
    |> Job.changeset(job)
    |> Repo.insert()
  end

  defp new(
         title,
         description,
         requirements,
         benefits,
         salary,
         hiring_type,
         vacancies_number,
         total_people_applied
       ) do
    %{
      title: title,
      description: description,
      requirements: requirements,
      benefits: benefits,
      salary: salary,
      hiring_type: hiring_type,
      vacancies_number: vacancies_number,
      total_people_applied: total_people_applied
    }
  end

  @spec update(String.t(), list(String.t())) :: {:ok, %Job{}}
  def update(id, fields_to_update) do
    with {:ok, job} <- get(id) do
      job
      |> Job.changeset_update(fields_to_update)
      |> Repo.update()
    end
  end

  @spec get(String.t()) :: {:ok, %Job{}}
  def get(id), do: Job |> Repo.get(id)

  @spec get_all() :: {:ok, list(%Job{})}
  def get_all(), do: Job |> Repo.all()
end
