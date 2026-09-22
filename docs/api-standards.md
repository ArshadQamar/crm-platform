# CRM Platform - API Standards

**Version:** 1.0  
**Status:** Draft  
**Last Updated:** June 2026

---

# Table of Contents

1. Purpose
2. API Design Principles
3. API Versioning
4. URI Naming Conventions
5. HTTP Methods
6. Request Standards
7. Response Standards
8. Error Handling
9. Authentication & Authorization
10. Pagination
11. Filtering
12. Sorting
13. Field Selection
14. Idempotency
15. Rate Limiting
16. HTTP Status Codes
17. API Documentation
18. Naming Conventions
19. Best Practices

---

# 1. Purpose

This document defines the API standards that every microservice in the CRM Platform must follow.

## Goals

- Consistent APIs
- Predictable behavior
- Easy frontend integration
- Maintainability
- Versioned contracts

---

# 2. API Design Principles

- RESTful APIs
- Stateless requests
- Resource-oriented URLs
- JSON payloads
- Secure by default
- Versioned endpoints
- Consistent responses

---

# 3. API Versioning

All APIs must include a version.

```text
/api/v1/{resource}
```

Example:

```http
GET    /api/v1/leads
POST   /api/v1/leads
GET    /api/v1/leads/{id}
PUT    /api/v1/leads/{id}
PATCH  /api/v1/leads/{id}
DELETE /api/v1/leads/{id}
```

---

# 4. URI Naming Conventions

Use plural nouns.

✅ Good

```text
/leads
/accounts
/contacts
/opportunities
```

❌ Bad

```text
/createLead
/getLead
```

Nested resources:

```text
/accounts/{accountId}/contacts
/leads/{leadId}/activities
```

---

# 5. HTTP Methods

| Method | Purpose | Idempotent |
|---------|---------|------------|
| GET | Read | Yes |
| POST | Create | No |
| PUT | Replace | Yes |
| PATCH | Partial Update | No |
| DELETE | Delete | Yes |

---

# 6. Request Standards

Headers:

```http
Authorization: Bearer <JWT>
Content-Type: application/json
Accept: application/json
X-Correlation-ID: <UUID>
```

Body Example:

```json
{
  "firstName": "John",
  "lastName": "Doe",
  "email": "john@example.com"
}
```

---

# 7. Response Standards

Success:

```json
{
  "success": true,
  "message": "Lead created successfully.",
  "data": {}
}
```

Collection:

```json
{
  "success": true,
  "data": [],
  "pagination": {
    "page": 1,
    "pageSize": 25,
    "totalItems": 100,
    "totalPages": 4
  }
}
```

---

# 8. Error Handling

```json
{
  "success": false,
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Email already exists.",
    "details": [
      {
        "field": "email",
        "message": "Duplicate email."
      }
    ]
  }
}
```

Common codes:

- VALIDATION_ERROR
- UNAUTHORIZED
- FORBIDDEN
- RESOURCE_NOT_FOUND
- CONFLICT
- RATE_LIMIT_EXCEEDED
- INTERNAL_SERVER_ERROR

---

# 9. Authentication & Authorization

- JWT Access Token
- Refresh Token
- RBAC

Header:

```http
Authorization: Bearer <access_token>
```

---

# 10. Pagination

```http
GET /api/v1/leads?page=1&pageSize=25
```

---

# 11. Filtering

```http
GET /api/v1/leads?status=qualified
GET /api/v1/leads?owner=user123
```

---

# 12. Sorting

```http
GET /api/v1/leads?sort=createdAt
GET /api/v1/leads?sort=-createdAt
```

---

# 13. Field Selection

```http
GET /api/v1/leads?fields=id,firstName,email
```

---

# 14. Idempotency

```http
Idempotency-Key: <UUID>
```

---

# 15. Rate Limiting

```http
X-RateLimit-Limit: 100
X-RateLimit-Remaining: 45
Retry-After: 60
```

---

# 16. HTTP Status Codes

| Code | Meaning |
|------|---------|
|200|OK|
|201|Created|
|204|No Content|
|400|Bad Request|
|401|Unauthorized|
|403|Forbidden|
|404|Not Found|
|409|Conflict|
|422|Validation Error|
|429|Too Many Requests|
|500|Internal Server Error|
|503|Service Unavailable|

---

# 17. API Documentation

Every service must expose:

```text
/api/docs
/api/openapi.json
```

---

# 18. Naming Conventions

- JSON: camelCase
- Resources: plural nouns
- IDs: UUID
- Path parameters: `{leadId}`, `{accountId}`

---

# 19. Best Practices

- Validate all input
- Never expose internal implementation
- Use UUIDs externally
- Keep APIs backward compatible
- Document every endpoint
- Use correlation IDs
