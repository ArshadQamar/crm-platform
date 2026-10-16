CREATE TABLE identity.role_permissions (
    role_id UUID NOT NULL REFERENCES identity.roles(id),
    permission_id UUID NOT NULL REFERENCES identity.permissions(id),

    assigned_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    assigned_by UUID,

    PRIMARY KEY (role_id, permission_id)
);