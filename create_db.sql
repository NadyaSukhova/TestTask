CREATE TABLE account
(
  login character varying(80) NOT NULL,
  name character varying(15),
  surname character varying(20),
  password character varying(20),
  CONSTRAINT account_pkey PRIMARY KEY (login)
);

CREATE TABLE history
(
  id serial NOT NULL,
  id_mistake integer,
  date_mistake date,
  user_login character varying(80),
  status_mistake integer,
  urgency_mistake integer,
  short_description_mistake character varying(100),
  long_description_mistake character varying(300),
  criticality_mistake integer,
  CONSTRAINT history_pkey PRIMARY KEY (id)
);

CREATE TABLE mistake
(
  id integer NOT NULL,
  date date,
  user_login character varying(80),
  status integer,
  urgency integer,
  short_description character varying(100),
  long_description character varying(300),
  criticality integer,
  CONSTRAINT mistake_pkey PRIMARY KEY (id)
);