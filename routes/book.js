import { Router } from "express";
import * as bookControllers from "../controllers/book.js";

const router = Router();

router.get("/books", bookControllers.getAllBooks);
router.get("/books/byISBN/:isbn", bookControllers.getBooksByISBN);
router.get("/books/byTitle/:title", bookControllers.getBooksByTitle);
router.get("/books/byAuthor/:author", bookControllers.getBooksByAuthor);

export default router;