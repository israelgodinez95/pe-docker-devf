// app.js

// Function to generate multiplication table for a number
function generateMultiplicationTable(number) {
    for (let i = 1; i <= 10; i++) {
        console.log(`${number} x ${i} = ${number * i}`);
    }
}

// Example usage
generateMultiplicationTable(5);
