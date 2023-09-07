defmodule ClpWeb.ErrorJSONTest do
  use ClpWeb.ConnCase, async: true

  test "renders 404" do
    assert ClpWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert ClpWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
