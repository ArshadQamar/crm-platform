import Router from 'express';
import { getProfile } from '../controllers/user.controller.js';
import { authenticateUser } from '../middleware/auth.middleware.js';

const router = Router()
router.get(
    "/profile",
    authenticateUser,
    getProfile
);

export default router;
