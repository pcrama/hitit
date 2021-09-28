

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;


SET SESSION AUTHORIZATION DEFAULT;

ALTER TABLE public.links DISABLE TRIGGER ALL;

INSERT INTO public.links (id, url, last_visit, visits) VALUES ('d08819a2-04d6-4ff3-a393-89d568909b68', 'https://google.com', '2021-09-21 13:22:46+02', 3);


ALTER TABLE public.links ENABLE TRIGGER ALL;


