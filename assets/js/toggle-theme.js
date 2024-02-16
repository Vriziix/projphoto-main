document.addEventListener('DOMContentLoaded', (event) => {
    const themeToggleBtn = document.getElementById('theme-toggle');
    const htmlClasses = document.documentElement.classList;

    themeToggleBtn.addEventListener('click', () => {
        if(htmlClasses.contains('dark')){
            htmlClasses.remove('dark');
            themeToggleBtn.innerText = "Switch to Dark Mode";
        } else {
            htmlClasses.add('dark');
            themeToggleBtn.innerText = "Switch to Light Mode";
        }
    });
});
