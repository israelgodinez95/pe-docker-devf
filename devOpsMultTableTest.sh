#!/bin/bash

# Create directory
mkdir DevOps_Project

# Change directory
cd DevOps_Project

# Create app.js file with basic functions
cat <<EOF > app.js
// app.js

// Function to generate multiplication table for a number
function generateMultiplicationTable(number) {
    for (let i = 1; i <= 10; i++) {
        console.log(\`\${number} x \${i} = \${number * i}\`);
    }
}

// Example usage
generateMultiplicationTable(5);
EOF

# Create index.html file
cat <<EOF > index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DevOps Project</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <h1>Multiplication Table</h1>
    <script src="app.js"></script>
</body>
</html>
EOF

# Create styles.css file
cat <<EOF > styles.css
/* styles.css */

/* Add your styles here */
EOF

echo "DevOps_Project directory and files created successfully."