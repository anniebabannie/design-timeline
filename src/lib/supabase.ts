import { createClient } from "@supabase/supabase-js";
import type { Database } from "../../types/supabase";

console.log("import.meta.env.SUPABASE_URL", import.meta.env.SUPABASE_URL);
console.log("import.meta.env.SUPABASE_ANON_KEY", import.meta.env.SUPABASE_ANON_KEY);

export const supabase = createClient(
  process.env.SUPABASE_URL as string,
  process.env.SUPABASE_ANON_KEY as string,
  {
    auth: {
      flowType: "pkce",
    },
  },
);