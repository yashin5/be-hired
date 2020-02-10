defmodule BeHired.Jobs.JobRepository do
  alias BeHired.Repo
  alias BeHired.Jobs.Job

  @spec create(map()) :: {:ok, %Job{}}
  def create(new_job) do
    do_new_job(new_job)
  end

  defp do_new_job(job) do
    %Job{}
    |> Job.changeset(job)
    |> Repo.insert()
  end

  @spec update(String.t(), list(String.t())) :: {:ok, %Job{}}
  def update(id, fields_to_update) do
    with {:ok, job} <- get(id) do
      IO.inspect("oi")
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
