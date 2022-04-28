export default function menu() {
    const menuItems = document.querySelectorAll('.menu a');
    const url_path = window.location.href;
    const origin = window.location.origin;
    // console.log(window.location, 'window.location');
    // console.log(url_path, 'url_path');
    menuItems.forEach(item => {
        const item_href = item.getAttribute('href');
        item.setAttribute('href', `${origin}${item_href}`);
    });
    menuItems.forEach(item => {
        if (item.getAttribute('href') === url_path) {
            item.classList.add('active');
        }
    });
}
