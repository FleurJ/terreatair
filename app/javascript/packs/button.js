
let functionBtnDraft = () => {
const saveAsDraft = document.querySelector("#save_draft");
if(saveAsDraft){
saveAsDraft.addEventListener("click", event => {
  console.log("Element clicked");
  let content_status = document.getElementById("status");
  content_status.value = 'draft';
});

}

const saveAndPublish = document.querySelector("#save_published");
if(saveAndPublish){
saveAndPublish.addEventListener("click", event => {
  console.log("Element publish clicked");
  let content_status = document.getElementById("status");
  content_status.value = 'published';
});
}
}


export {functionBtnDraft};
