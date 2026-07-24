import { hashPassword, comparePassword } from "../utils/password.js";
import { generateAccessToken, generateRefreshToken } from "../utils/jwt.js";

export const registerUser = async (req, res) => {
    
    const {firstName, lastName, email, password} = req.body
    if(!firstName || !lastName || !email || !password){
        return res.status(401).json({
            success: false,
            message: "All fields are required",
            data:{
                firstName,
                lastName,
                email,
                hashPassword
            }
        });
    }
    const hashedPassword = await hashPassword(password);

    return res.status(200).json({
        sucess: true,
        message: "validation successful",
        data:{
            firstName,
            lastName,
            email,
            password,
            hashedPassword
        }
    });
};

export const loginUser = async (req, res) => {

    const { email, password } = req.body;

    if (!email || !password) {
        return res.status(400).json({
            success: false,
            message: "Email and password are required."
        });
    }

    const storedHash = await hashPassword("master123")
    const isPasswordValid = await comparePassword(password, storedHash)

    if (!isPasswordValid) {
        return res.status(401).json({
            success: false,
            message: "Invalid email or password"
        })
    }

    const payload = {
        id: 1,
        email,
        role: "admin"
    };

    const accessToken = generateAccessToken(payload);
    const refreshToken = generateRefreshToken(payload);

    return res.status(200).json({
        success: true,
        message: "Validation successful.",
        data: {
            accessToken,
            refreshToken
        }
    });
};