<?php
class Article {
    private $pdo;

    public function __construct($pdo) {
        $this->pdo = $pdo;
    }

    public function getArticlesByType($typeId) {
        $stmt = $this->pdo->prepare("SELECT photo, text FROM articles WHERE idtype = ?");
        $stmt->execute([$typeId]);
        return $stmt->fetchAll();
    }
}
?>
