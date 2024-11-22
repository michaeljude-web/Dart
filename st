<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
            color: #333;
        }

        .sidebar {
            width: 220px;
            height: 100%;
            background-color: #ffffff;
            border-right: 1px solid #ddd;
            position: fixed;
            left: 0;
            top: 0;
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
            padding-top: 20px;
            overflow-y: auto; /* Enable scrolling if content overflows */
            z-index: 1000;
            box-shadow: 2px 0px 8px rgba(0, 0, 0, 0.1);
        }

        .sidebar h2 {
            text-align: center;
            color: #007bff;
            font-size: 26px;
            margin-bottom: 20px;
        }

        .sidebar h2 span {
            color: #dc3545;
        }

        .sidebar a {
            padding: 15px;
            font-size: 18px;
            text-decoration: none;
            color: #333;
            display: flex;
            align-items: center;
            gap: 10px;
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        .sidebar a:hover {
            background-color: #f0f8ff;
            color: #007bff;
        }

        .sidebar .logout {
            margin-top: auto;
            padding: 20px;
            font-size: 18px;
            text-align: center;
            color: #333;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        .sidebar .logout:hover {
            background-color: #ffe6e6;
            color: #dc3545;
        }

        .navbar {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            background-color: #ffffff;
            border-bottom: 1px solid #ddd;
            padding: 10px;
            text-align: center;
            z-index: 1000;
        }

        .navbar a {
            color: #333;
            padding: 10px;
            font-size: 19px;
            text-decoration: none;
            display: inline-block;
            text-align: center;
            transition: color 0.3s ease;
        }

        .navbar a:hover {
            color: #007bff;
        }

        .content {
            margin-left: 220px;
            padding: 20px;
            background-color: #f9f9f9;
            min-height: 100vh;
        }

        .header h1 {
            font-size: 2.5rem;
            color: #007bff;
        }

        .header p {
            font-size: 1.2rem;
            color: #555;
        }

        .hamburger {
            display: none;
            font-size: 24px;
            color: #333;
            position: absolute;
            top: 15px;
            left: 15px;
            cursor: pointer;
            z-index: 1001;
        }

        /* Dropdown */
        .dropdown {
            position: relative;
            display: inline-block;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
            z-index: 1;
        }

        .dropdown-content a {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }

        .dropdown-content a:hover {
            background-color: #ddd;
        }

        .dropdown.active .dropdown-content {
            display: block;
        }

        @media (max-width: 768px) {
            .sidebar {
                transform: translateX(-100%);
            }
            .navbar {
                display: flex;
                justify-content: space-around;
                gap: 20px;
            }
            .navbar a {
                font-size: 14px;
            }
            .content {
                margin-left: 0;
                padding-top: 63px;
            }
        }

        @media (max-width: 596px) {
            .hamburger {
                display: block;
            }
            .sidebar {
                transform: translateX(-100%);
            }
            .sidebar.active {
                transform: translateX(0);
            }
            .navbar {
                display: none;
            }
            .content {
                margin-left: 0;
                padding-top: 50px;
            }
        }
    </style>
</head>
<body>

    <div class="hamburger" id="hamburger">
        <i class="fas fa-bars"></i>
    </div>

    <div class="sidebar" id="sidebar">
        <h2>Game<span>Admin</span></h2>
        <a href="#"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
        <a href="#"><i class="fas fa-code-branch"></i> Branches</a>
        <a href="#"><i class="fas fa-users"></i> Staff</a>

        <!-- Dropdown for Parcels -->
        <div class="dropdown" id="dropdown">
            <a href="#"><i class="fas fa-box"></i> Parcels</a>
            <div class="dropdown-content">
                <a href="#">Add Parcel</a>
                <a href="#">Accepted by Courier</a>
                <a href="#">Shipped</a>
                <a href="#">In Transit</a>
                <a href="#">Arrived At Destination</a>
                <a href="#">Out for Delivery</a>
                <a href="#">Ready to Pickup</a>
                <a href="#">Delivered</a>
                <a href="#">Delivery Failed</a>
            </div>
        </div>

        <a href="#"><i class="fas fa-location"></i> Track Parcel</a>
        <a href="#"><i class="fas fa-file-alt"></i> Activity Log</a>
        <div class="logout" onclick="confirmLogout()"><i class="fas fa-sign-out-alt"></i> Logout</div>
    </div>

    <div class="navbar">
        <a href="#"><i class="fas fa-tachometer-alt"></i><br> Dashboard</a>
        <a href="#"><i class="fas fa-code-branch"></i><br> Branches</a>
        <a href="#"><i class="fas fa-users"></i><br> Staff</a>

        <!-- Dropdown for Parcels -->
        <div class="dropdown" id="navbar-dropdown">
            <a href="#"><i class="fas fa-box"></i><br> Parcels</a>
            <div class="dropdown-content">
                <a href="#">Add Parcel</a>
                <a href="#">Accepted by Courier</a>
                <a href="#">Shipped</a>
                <a href="#">In Transit</a>
                <a href="#">Arrived At Destination</a>
                <a href="#">Out for Delivery</a>
                <a href="#">Ready to Pickup</a>
                <a href="#">Delivered</a>
                <a href="#">Delivery Failed</a>
            </div>
        </div>

        <a href="#"><i class="fas fa-location"></i><br> Track Parcel</a>
        <a href="#"><i class="fas fa-file-alt"></i><br> Activity Log</a>
        <a href="#" class="logout"><i class="fas fa-sign-out-alt"></i><br> Logout</a>
    </div>

    <div class="content">
        <div class="header">
            <h1>Admin Dashboard</h1>
            <p>Welcome to the GameAdmin system. Manage and monitor with ease.</p>
        </div>
    </div>

    <script>
        const hamburger = document.getElementById("hamburger");
        const sidebar = document.getElementById("sidebar");
        const dropdown = document.getElementById("dropdown");
        const navbarDropdown = document.getElementById("navbar-dropdown");

        // Toggle sidebar on hamburger click
        hamburger.addEventListener("click", () => {
            sidebar.classList.toggle("active");
        });

        // Toggle dropdown in sidebar
        dropdown.addEventListener("click", () => {
            dropdown.classList.toggle("active");
        });

        // Toggle dropdown in navbar
        navbarDropdown.addEventListener("click", () => {
            navbarDropdown.classList.toggle("active");
        });

        // Function to confirm logout
        function confirmLogout() {
            if (confirm("Are you sure you want to log out?")) {
                // Redirect to logout URL or perform any action on logout
                alert("Logged out successfully!");
                // You can add logout logic here, like redirecting to a login page or clearing session data.
            }
        }
    </script>

</body>
</html>
