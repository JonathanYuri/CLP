# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
Clp.Repo.insert!(%Clp.Payments.PaymentStatus{
  id: 1,
  description: "Processing"
})
Clp.Repo.insert!(%Clp.Payments.PaymentStatus{
  id: 2,
  description: "Scheduled"
})
Clp.Repo.insert!(%Clp.Payments.PaymentStatus{
  id: 3,
  description: "Paid"
})
Clp.Repo.insert!(%Clp.Payments.PaymentStatus{
  id: 4,
  description: "Refused"
})

#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
