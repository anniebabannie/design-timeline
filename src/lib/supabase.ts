import { createClient } from "@supabase/supabase-js";
import type { Database } from "../../types/supabase";

console.log("process.env.SUPABASE_URL", process.env.SUPABASE_URL);
console.log("process.env.SUPABASE_ANON_KEY", process.env.SUPABASE_ANON_KEY);

export const supabase = createClient(
  process.env.SUPABASE_URL as string,
  process.env.SUPABASE_ANON_KEY as string,
  {
    auth: {
      flowType: "pkce",
    },
  },
);