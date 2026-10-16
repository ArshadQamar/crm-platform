CREATE TABLE identity.user_roles(
    user_id UUID NOT NULL REFERENCES identity.users(id)
    role_id UUID NOT NULL REFERENCES identity.roles(id)

    assigned_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    assigned_by UUID,

    PRIMARY KEY (user_id, role_id)
)