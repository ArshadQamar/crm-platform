import app from "./app.js";

const PORT = 3001;
app.listen(PORT, ()=>{
    console.log(`Identity Service is running on port ${PORT}`);
});

