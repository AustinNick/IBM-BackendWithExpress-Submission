import Review from "../models/review.js";

export async function addReview(req, res) {
    try {
        // data to be stored
        const { user_id } = req.user;
        const userId = user_id;
        const bookId = parseInt(req.params.id);
        const { review_text } = req.body;
        // console.log(userId, bookId, review_text);

        const foundReview = await Review.findOne({ where: { userId, bookId } })

        if (foundReview) {
            const newReview = await Review.update({ review_text }, { where: { userId, bookId } });
            return res.json({ message: `Review added/updated successfully!` });
        }

        await Review.create({ UserId: userId, BookId: bookId, review_text });
        res.json({ message: `Review added/updated successfully!` });
    } catch (error) {

        res.status(500).json({ message: "Internal Server Error!!" });

    }
}

export async function getReview(req, res) {
    try {
        const { id } = req.params;
        const bookReview = await Review.findAll({ attributes: ["review_text"], where: { BookId: id } })

        if (!bookReview.length) {
            return res.json({ message: "No review found for this book!" });
        }

        res.json({ message: "review found for this book", bookReview });

    } catch (error) {

        res.status(500).json({ message: "Internal Server Error!!" });

    }
}

export async function deleteReview(req, res) {
    try {

        const { user_id } = req.user;
        const userId = user_id;
        const bookId = req.params.id;

        const deletedReview = await Review.destroy({ where: { userId, bookId } });
        // console.log(deletedReview);

        if (!deletedReview) {
            return res.json({ message: "No review found for that user to delete!" });
        }

        res.json({ message: "review deleted for that user successfully!" });

    } catch (error) {

        res.status(500).json({ message: "Internal Server Error!!" });

    }
}