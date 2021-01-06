function departmentChange(e) {
    var head = ["B1", "1F", "2F", "3F", "4F", "5F", "6F", "7F", "8F", "9F", "10F", "11F", "12F", "13F", "14F"];
    var jamsil = ["B1", "1F", "2F", "3F", "4F", "5F", "6F", "7F", "8F", "9F", "10F", "11F", "12F"];
    var mia = ["B2","B1", "1F", "2F", "3F", "4F", "5F", "6F", "7F", "8F", "9F"];
    var yeongdeungpo = ["B1", "1F", "2F", "3F", "4F", "5F", "6F", "7F", "8F", "9F", "10F", "11F"];
    var cheongnyangni = ["B2","B1", "1F", "2F", "3F", "4F", "5F", "6F", "7F", "8F", "9F"];
    var gangnam = ["B1", "1F", "2F", "3F", "4F", "5F", "6F", "7F", "8F"];
    var nowon = ["B1", "1F", "2F", "3F", "4F", "5F", "6F", "7F", "8F", "9F","10F"];
    var gwanak = ["B2","B1", "1F", "2F", "3F", "4F", "5F", "6F", "7F"];
    var cattle = ["B1", "1F", "2F", "3F", "4F", "5F", "6F", "7F", "8F", "9F", "10F", "11F", "12F"];
    var starcity = ["B1", "1F", "2F", "3F", "4F", "5F", "6F", "7F", "8F", "9F", "10F"];
    var gimpo = ["B2","B1", "1F", "2F", "3F", "4F", "5F", "6F"];


    var target = document.getElementById("floor");

    if(e.value == '롯데백화점_본점') var d = head;
    else if(e.value == '롯데백화점_잠실점') var d = jamsil;
    else if(e.value == '롯데백화점_미아점') var d = mia;




    target.options.length = 0;

    for (x in d) {
        var opt = document.createElement("option");
        opt.value = d[x];
        opt.innerHTML = d[x];
        target.appendChild(opt);
    }   
}