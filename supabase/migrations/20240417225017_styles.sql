create table "public"."styles" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "name" text default ''::text,
    "description" text default ''::text,
    "start_year" smallint not null,
    "end_year" smallint
);


alter table "public"."styles" enable row level security;

CREATE INDEX idx_styles_name ON public.styles USING btree (name);

CREATE INDEX idx_styles_start_year ON public.styles USING btree (start_year);

CREATE UNIQUE INDEX styles_name_key ON public.styles USING btree (name);

CREATE UNIQUE INDEX styles_pkey ON public.styles USING btree (id);

alter table "public"."styles" add constraint "styles_pkey" PRIMARY KEY using index "styles_pkey";

alter table "public"."styles" add constraint "styles_name_key" UNIQUE using index "styles_name_key";

grant delete on table "public"."styles" to "anon";

grant insert on table "public"."styles" to "anon";

grant references on table "public"."styles" to "anon";

grant select on table "public"."styles" to "anon";

grant trigger on table "public"."styles" to "anon";

grant truncate on table "public"."styles" to "anon";

grant update on table "public"."styles" to "anon";

grant delete on table "public"."styles" to "authenticated";

grant insert on table "public"."styles" to "authenticated";

grant references on table "public"."styles" to "authenticated";

grant select on table "public"."styles" to "authenticated";

grant trigger on table "public"."styles" to "authenticated";

grant truncate on table "public"."styles" to "authenticated";

grant update on table "public"."styles" to "authenticated";

grant delete on table "public"."styles" to "service_role";

grant insert on table "public"."styles" to "service_role";

grant references on table "public"."styles" to "service_role";

grant select on table "public"."styles" to "service_role";

grant trigger on table "public"."styles" to "service_role";

grant truncate on table "public"."styles" to "service_role";

grant update on table "public"."styles" to "service_role";

create policy "Enable insert for authenticated users only"
on "public"."styles"
as permissive
for insert
to authenticated
with check (true);


create policy "Enable read access for all users"
on "public"."styles"
as permissive
for select
to public
using (true);



