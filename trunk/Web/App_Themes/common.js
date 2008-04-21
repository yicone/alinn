function chkNum(oIpt){
    var v = oIpt.value;
    var reNum = /[^0-9\.]/;
    if (reNum.test(v)) {
        av = v.split('');
        for (var i = 0; i < av.length; i++) {
            if (reNum.test(av[i])) {
                av[i] = '';
            }
        }
        oIpt.value = av.join('');
    }
    return true;
}