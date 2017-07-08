CREATE TABLE mockify.projects
(
  ptype         VARCHAR(31)  NOT NULL,
  id            SERIAL       NOT NULL CONSTRAINT projects_pkey PRIMARY KEY,
  version       INTEGER,
  context_path  VARCHAR(255),
  description   VARCHAR(255),
  documentation TEXT,
  note          VARCHAR(255),
  title         VARCHAR(255) NOT NULL,
  uid           VARCHAR(255) CONSTRAINT unique_project_uid UNIQUE,
  project_id    BIGINT CONSTRAINT group_to_project_ref_id REFERENCES mockify.projects(id)
);

CREATE TABLE mockify.stubs
(
  id                SERIAL       NOT NULL CONSTRAINT stubs_pkey PRIMARY KEY,
  description       VARCHAR(255),
  documentation     TEXT,
  note              VARCHAR(255),
  enabled           BOOLEAN      NOT NULL,
  request           JSONB        NOT NULL,
  response          JSONB        NOT NULL,
  response_body     TEXT         NOT NULL,
  response_encoding VARCHAR(255),
  spec              VARCHAR(255) NOT NULL,
  title             VARCHAR(255) NOT NULL,
  uid               VARCHAR(255) NOT NULL CONSTRAINT unique_stub_uid UNIQUE,
  version           INTEGER,
  group_id          BIGINT       NOT NULL CONSTRAINT stub_to_group_ref_id REFERENCES mockify.projects(id)
);

CREATE TABLE mockify.users
(
  id         SERIAL       NOT NULL CONSTRAINT users_pkey PRIMARY KEY,
  created    TIMESTAMP,
  email      VARCHAR(255) CONSTRAINT unique_user_email UNIQUE,
  enabled    BOOLEAN,
  first_name VARCHAR(255),
  last_login TIMESTAMP,
  last_name  VARCHAR(255),
  password   VARCHAR(255) NOT NULL
);

CREATE TABLE mockify.user_project
(
  project_id BIGINT NOT NULL CONSTRAINT user_to_project_id REFERENCES mockify.projects(id),
  user_id    BIGINT NOT NULL CONSTRAINT project_to_user_id REFERENCES mockify.users(id),
  CONSTRAINT user_project_pkey PRIMARY KEY (user_id, project_id)
);
