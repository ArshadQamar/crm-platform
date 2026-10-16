CREATE TABLE identity.refresh_tokens (
    id UUID PRIMARY KEY,
    user_id UUID NOT NULL REFERENCES identity.users(id),
    token_hash TEXT NOT NULL UNIQUE,

    expires_at TIMESTAMP NOT NULL,
    revoked_at TIMESTAMP,

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    created_by UUID
);