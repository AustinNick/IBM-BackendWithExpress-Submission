import { DataTypes } from "sequelize";
import { sequelize } from "../config/connection.js"

// models
import User from "./user.js"
import Book from "./book.js"

const Review = sequelize.define('Review', {
    review_text: {
        type: DataTypes.STRING,
        allowNull: false
    }
});

User.belongsToMany(Book, { through: Review });
Book.belongsToMany(User, { through: Review });

export default Review;