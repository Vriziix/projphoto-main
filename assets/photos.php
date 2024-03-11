<?php
require 'php/dbconfig.php';
require 'php/db.php';
require 'php/Type.php';
require 'php/Article.php';

$database = new Database();
$db = $database->connect();

$type = new Type($db);
$types = $type->getAllTypes();

$article = new Article($db);
$articles = null;

if (!empty($_GET['type'])) {
    $selectedType = $_GET['type'];
    $articles = $article->getArticlesByType($selectedType);
}
?>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/output.css" rel="stylesheet">
    <title>Reflets Limousins - Accueil</title>
</head>
<body class="bg-gray-900 text-gray-200">
    <header class="flex flex-wrap sm:justify-start sm:flex-nowrap z-50 w-full border-b border-gray-700 py-3 sm:py-0">
  <nav class="relative max-w-[85rem] w-full mx-auto px-4 flex items-center justify-center sm:px-6 lg:px-8" aria-label="Global">
    <div class="flex items-center justify-between w-full">
      <a class="flex-none text-xl font-semibold dark:text-white" href="#" aria-label="Brand">Reflets Limousins</a>
      <div class="sm:hidden">
        <button type="button" class="hs-collapse-toggle w-9 h-9 flex justify-center items-center text-sm font-semibold rounded-lg border border-gray-200 text-gray-800 hover:bg-gray-100 disabled:opacity-50 disabled:pointer-events-none dark:text-white dark:border-gray-700 dark:hover:bg-gray-700 dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600" data-hs-collapse="#navbar-collapse-with-animation" aria-controls="navbar-collapse-with-animation" aria-label="Toggle navigation">
          <svg class="hs-collapse-open:hidden flex-shrink-0 w-4 h-4" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="3" x2="21" y1="6" y2="6"/><line x1="3" x2="21" y1="12" y2="12"/><line x1="3" x2="21" y1="18" y2="18"/></svg>
          <svg class="hs-collapse-open:block hidden flex-shrink-0 w-4 h-4" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M18 6 6 18"/><path d="m6 6 12 12"/></svg>
        </button>
      </div>
    </div>
    <div id="navbar-collapse-with-animation" class="hs-collapse hidden overflow-hidden transition-all duration-300 basis-full grow sm:block">
      <div class="flex flex-col sm:flex-row sm:items-center gap-y-4 sm:gap-x-7 mt-5 sm:mt-0 justify-center">
        <a class="font-medium text-blue-600 sm:py-6 dark:text-blue-500" href="index.php" aria-current="page">Accueil</a>
        <a class="font-medium text-gray-500 hover:text-gray-400 sm:py-6 dark:text-gray-400 dark:hover:text-gray-500" href="photos.php">Photos</a>
        <a class="font-medium text-gray-500 hover:text-gray-400 sm:py-6 dark:text-gray-400 dark:hover:text-gray-500" href="articles.php">Articles</a>
        <a class="font-medium text-gray-500 hover:text-gray-400 sm:py-6 dark:text-gray-400 dark:hover:text-gray-500" href="contact.php">Contact</a>
      </div>
    </div>
  </nav>
</header>

<section class="mt-8 mx-4">
    <form action="photos.php" method="get" class="flex flex-col sm:flex-row items-center justify-center gap-4">
        <div class="flex flex-col sm:flex-row items-center">
            <label for="type" class="block text-gray-200 text-sm font-medium mb-1 sm:mb-0 sm:mr-2">Choisissez un type d'article:</label>
            <select name="type" id="type" class="block w-full px-3 py-2 bg-gray-700 border border-gray-600 rounded-md shadow-sm focus:outline-none focus:ring focus:ring-blue-500 focus:border-blue-500 text-white">
                <?php foreach ($types as $type): ?>
                    <option value="<?php echo $type['idtype']; ?>" <?php if (!empty($_GET['type']) && $_GET['type'] == $type['idtype']) echo 'selected'; ?>>
                        <?php echo $type['nomtype']; ?>
                    </option>
                <?php endforeach; ?>
            </select>
        </div>
        <input type="submit" value="Afficher les articles" class="inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md text-white bg-blue-600 hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500">
    </form>
</section>


<footer class="rounded-lg shadow m-4">
        <div class="w-full max-w-screen-xl mx-auto p-4 md:py-8">
            <div class="sm:flex sm:items-center sm:justify-between">
                <a href="" class="flex items-center mb-4 sm:mb-0 space-x-3 rtl:space-x-reverse">
                    <img src="https://flowbite.com/docs/images/logo.svg" class="h-8" alt="" />
                    <span class="self-center text-2xl font-semibold whitespace-nowrap">Reflets Limousins</span>
                </a>
                <ul class="flex flex-wrap items-center mb-6 text-sm font-medium sm:mb-0">
                    <li>
                        <a href="#" class="hover:underline me-4 md:me-6">About</a>
                    </li>
                    <li>
                        <a href="#" class="hover:underline me-4 md:me-6">Privacy Policy</a>
                    </li>
                    <li>
                        <a href="#" class="hover:underline me-4 md:me-6">Licensing</a>
                    </li>
                    <li>
                        <a href="#" class="hover:underline">Contact</a>
                    </li>
                </ul>
            </div>
            <hr class="my-6 border-gray-700 lg:my-8" />
            <span class="block text-sm sm:text-center">© 2023 Reflets Limousins™. All Rights Reserved.</span>
        </div>
    </footer>