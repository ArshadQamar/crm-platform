import jwt from 'jsonwebtoken'
import { verifyAccessToken } from '../utils/jwt.js';

export const authenticateUser = (req, res, next)=>{
    const authHeader =  req.headers.authorization;
    if(!authHeader){
        return res.status(401).json({
            success: false,
            message: "authorization header is missing"
        });
    }

    const token = authHeader.split(" ")[1];

    if(!token){
        return res.status(401).json({
            success: false,
            message: "Access token missing"
        })
    }

    try{
        const decoded = verifyAccessToken(token)
        req.user = decoded;
        next();
    }catch(error){
        return res.status(401).json({
            success: false,
            message: "invalid or expired access token"
        });
    }

};