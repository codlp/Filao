const initDropzone = () => {

  if (document.getElementById("dropzone")) {
  const myDropzone = new Dropzone("div#dropzone", {
    uploadMultiple: false,
    acceptedFiles:'.jpg,.png,.jpeg,.gif',
    parallelUploads: 6
  });
  }
}

export default initDropzone
