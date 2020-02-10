defmodule JobRepositoryTest do
  use BeHired.DataCase, async: true

  alias BeHired.Jobs.JobRepository

  describe "create" do
    setup do
      job_data = %{
        title: "Designer Ux",
        description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
        requirements: "requirements",
        benefits: "benefits",
        salary: "100.10",
        hiring_type: "CLT",
        vacancies_number: 10,
        total_people_applied: 15
      }

      on_exit(fn ->
        nil
      end)

      {:ok, [job_data: job_data]}
    end

    test "Should be able to create a new job if data are correct", %{job_data: job_data} do
      {:ok, new_job} = JobRepository.create(job_data)

      response_to_compare = %{
        benefits: new_job.benefits,
        description: new_job.description,
        hiring_type: new_job.hiring_type,
        requirements: new_job.requirements,
        salary: new_job.salary,
        title: new_job.title,
        total_people_applied: new_job.total_people_applied,
        vacancies_number: new_job.vacancies_number
      }

      assert response_to_compare == job_data
    end

    test "Should not be able to create a new job if dont insert any field", %{job_data: job_data} do
      {:error, error_payload} =
        job_data
        |> Map.delete(:benefits)
        |> JobRepository.create()

      error_message = error_payload.errors
      error = [benefits: {"can't be blank", [validation: :required]}]

      assert error_message == error
    end

    test "Should not be able to create a new job if insert a invalid value in field", %{
      job_data: job_data
    } do
      {:error, error_payload} =
        job_data
        |> Map.put(:title, 5)
        |> JobRepository.create()

      error_message = error_payload.errors
      error = [title: {"is invalid", [{:type, :string}, {:validation, :cast}]}]

      assert error_message == error
    end
  end
end
