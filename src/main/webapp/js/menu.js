(function () {

    //设置下拉菜单
    let tab_lists = document.querySelectorAll('.tab_list');
    let tabs = document.querySelectorAll('.tab');

    for (let i = 0; i < tab_lists.length; i++) {
        tabs[i].style.display = 'none';
        tab_lists[i].setAttribute('index' + i.toString(), 'false');
        tab_lists[i].onclick = function () {
            if (tab_lists[i].getAttribute('index' + i.toString()) === 'false') {
                tabs[i].style.display = 'block';
                tab_lists[i].setAttribute('index' + i.toString(), 'true');
            } else {
                tabs[i].style.display = 'none';
                tab_lists[i].setAttribute('index' + i.toString(), 'false');
            }
        }
    }
})();