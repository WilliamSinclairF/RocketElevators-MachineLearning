const verifyAudio = async (audioFileName, profileId) => {
  document.getElementById('resultText').textContent = 'Loading, please wait';
  try {
    const response = await fetch(
      `/verify_audio?file_name=${audioFileName}&profile_id=${profileId}`
    );
    if (response.ok) {
      return response.json();
    } else {
      resultPlaceHolderText.textContent = `There was an error, please try again later`;
    }
  } catch (e) {
    console.log(e);
  }
};

const showTestResult = (result, score) => {
  document.getElementById(
    'resultText'
  ).textContent = `Test result: ${result} - Score: ${score}`;
};

window.addEventListener('DOMContentLoaded', async () => {
  document
    .getElementById('checkAudioButton')
    .addEventListener('click', async () => {
      const audioFileName = document.querySelector(
        'input[name="fileSelection"]:checked'
      ).value;
      const profileId = document.getElementById('profileSelect').value;
      const response = await verifyAudio(audioFileName, profileId);
      showTestResult(response.recognitionResult, response.score);
    });
});
