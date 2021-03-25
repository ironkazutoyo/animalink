window.addEventListener('load', function(){
  const noticeOffBtn = document.querySelectorAll(".notice-end")
  const noticeYotei = document.querySelectorAll(".top-yotei")
  const noticeKiroku = document.querySelectorAll(".top-kiroku")

  noticeOffBtn.forEach(function(target){
    target.addEventListener('click', function(){
        const result = confirm('この通知を終了しますか？')
        if(result){
          const taskId = target.id.replace(/[^0-9^\.]/g,"")
          const XHR = new XMLHttpRequest();
          XHR.open("GET", `/tasks/${taskId}`, true);
          XHR.responseType = "json";
          XHR.send();
          XHR.onload = () => {
            if (XHR.status != 200) {
              alert(`Error ${XHR.status}: ${XHR.statusText}`);
              return null;          
            }
            const task = XHR.response.task
            if(task.notice_id === 2){
              window.location.reload()
            }
          }
        }
    })
  })
})