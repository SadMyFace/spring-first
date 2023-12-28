console.log("board modify js~!!");


async function removeFileImageFromServer(uuid){
    try {
        const url = "/board/removeImage/"+uuid;
        const config={
            method:'delete'
        }
        const resp = await fetch(url, config);
        const result = await resp.text();
        return result;
    } catch (error) {
        console.log(error);
    }
}

document.addEventListener('click', (e)=>{
    console.log(e.target);

    if(e.target.classList.contains('file-x')){
        let fileUuid = e.target.dataset.uuid;
        console.log(fileUuid);
        
        removeFileImageFromServer(fileUuid).then(result =>{
            if(result === "1"){
                console.log("이미지 삭제 성공");
                e.target.closest('li').remove();
                location.reload();
            }else{
                alert("파일 삭제 실패!!");
            }
        })
    }
})