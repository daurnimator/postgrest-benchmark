CREATE OR REPLACE VIEW api.projects AS
  SELECT
    p.id,
    p.version,
    p.context_path,
    p.description,
    p.documentation,
    p.note,
    p.title,
    p.uid
  FROM mockify.projects p
  WHERE p.ptype = 'P';

CREATE OR REPLACE VIEW api.groups AS
  SELECT
    g.id,
    g.version,
    g.context_path,
    g.description,
    g.documentation,
    g.note,
    g.title,
    g.uid,
    g.project_id
  FROM mockify.projects g
  WHERE g.ptype = 'G';

CREATE OR REPLACE VIEW api.stubs AS
  SELECT *
  FROM mockify.stubs;

CREATE OR REPLACE VIEW api.users AS
  SELECT *
  FROM mockify.users;

CREATE OR REPLACE VIEW api.user_project AS
  SELECT *
  FROM mockify.user_project;
