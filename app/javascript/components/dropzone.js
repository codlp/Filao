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
  const togglerButtons = document.querySelectorAll('#messages-toggler');
  togglerButtons.forEach((button) => {
    button.addEventListener('click', (e) => {
      const targetedMessage = document.querySelector(`#tasks_list_${e.currentTarget.dataset.target}`);
      targetedMessage.classList.toggle('hide-task');
    });
  });
}

export { initDropzone, toggleTaskMessages };

