const initDropzone = () => {
  if (document.getElementById("dropzone")) {
    const myDropzone = new Dropzone("div#dropzone", {
      uploadMultiple: false,
      acceptedFiles:'.jpg,.png,.jpeg,.gif',
      parallelUploads: 6
    });
  }
}

function toggleTaskMessages() {
  const togglerButton = document.getElementById('messages-toggler');
  togglerButton.addEventListener('click', (e) => {
    const taskMessagesContainer = document.getElementById('tasks_list');
    taskMessagesContainer.classList.toggle('active-task');
  });
}

export { initDropzone, toggleTaskMessages };

