<?php
class Type {
    private $pdo;

    public function __construct($pdo) {
        $this->pdo = $pdo;
    }

    public function getAllTypes() {
        $stmt = $this->pdo->prepare("SELECT idtype, nomtype FROM type");
        $stmt->execute();
        return $stmt->fetchAll();
    }
}
?>
