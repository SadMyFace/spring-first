console.log("boardComment.js in");
console.log(">>> bno {} " + bnoVal);

document.getElementById("cmtAddBtn").addEventListener('click', ()=>{
    const cmtText = document.getElementById('cmtText').value;
    const cmtWriter = document.getElementById('cmtWriter').innerText;
    if(cmtText == "" || cmtText == null){
        alert("댓글을 입력해주세요~!!");
        document.getElementById('cmtText').focus(); // 커서 옮기기
        return false;
    }else{
        let cmtData={
            bno: bnoVal,
            wirter: cmtWriter,
            content: cmtText
        };
        console.log(cmtData);
    }
})