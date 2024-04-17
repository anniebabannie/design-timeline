import type { APIRoute } from "astro";
import { supabase } from "../../../lib/supabase";

export const POST: APIRoute = async ({ request, redirect }) => {
  // add new Style to supabase styles table
  const formData = await request.formData();
  const name = formData.get("name")?.toString();
  const description = formData.get("description")?.toString();
  const startYear = formData.get("start_year")?.toString();
  const endYear = formData.get("end_year")?.toString();

  const { data, error } = await supabase.from("styles").insert({
    name,
    description,
    start_year: startYear,
    end_year: endYear,
  });

  if (error) {
    return new Response(error.message, { status: 500 });
  }
  console.log(data);

  return redirect("/");
};