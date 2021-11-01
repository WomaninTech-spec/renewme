/////////TRIX////////////
const initTrix = () => {
  const cloudName = "df9n6rd5h";
  const unsignedUploadPreset = 'y7vthcmn';
  const HOST = `https://api.cloudinary.com/v1_1/${cloudName}/upload`;

  addEventListener("trix-attachment-add", function(event) {
    if (event.attachment.file) {
      uploadFileAttachment(event.attachment)
    }
  })

  function uploadFileAttachment(attachment) {
    uploadFile(attachment.file, setProgress, setAttributes)

    function setProgress(progress) {
      attachment.setUploadProgress(progress)
    }

    function setAttributes(attributes) {
      attachment.setAttributes(attributes)
    }
  }

  function uploadFile(file, progressCallback, successCallback) {
    var formData = createFormData(file)
    var xhr = new XMLHttpRequest()

    xhr.open("POST", HOST, true)

    xhr.upload.addEventListener("progress", function(event) {
      var progress = event.loaded / event.total * 100
      progressCallback(progress)
    })

    xhr.onreadystatechange = function(e) {
      if (xhr.readyState == 4 && xhr.status == 200) {
        var response = JSON.parse(xhr.responseText);
        var url = response.secure_url;
        var attributes = {
            url: url ,
            filename: "",
            filesize: "",
            href: url
        }
        successCallback(attributes)
      }
    };
    xhr.send(formData)

  }

  function createFormData(file) {
    var data = new FormData()
    data.append('upload_preset', unsignedUploadPreset);
    data.append("Content-Type", file.type)
    data.append("Access-Control-Allow-Origins", "*")
    data.append("file", file)
    return data
  }
}

export { initTrix }
