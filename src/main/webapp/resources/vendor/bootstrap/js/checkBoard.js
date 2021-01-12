
	var e = document.getElementsByName("changeDepartment");
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

    if(e[0].id == '본점') var d = head;
    else if(e[0].id == '잠실점') var d = jamsil;
    else if(e[0].id == '미아점') var d = mia;
    else if(e[0].id == '영등포점') var d = yeongdeungpo;
    else if(e[0].id == '청량리점') var d = cheongnyangni;
    else if(e[0].id == '강남점') var d = gangnam;
    else if(e[0].id == '노원점') var d = nowon;
    else if(e[0].id == '관악점') var d = gwanak;
    else if(e[0].id == '캐슬플라자') var d = cattle;
    else if(e[0].id == '건대스타시티점') var d = starcity;
    else if(e[0].id == '김포공항점') var d = gimpo;




    target.options.length = 0;

    for (x in d) {
        var opt = document.createElement("option");
        opt.value = d[x];
        opt.innerHTML = d[x];
        target.appendChild(opt);
    }   
