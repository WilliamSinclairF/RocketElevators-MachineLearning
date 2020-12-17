const createProfile = async () => {
  const response = await fetch('/create_profile_id', {
    headers: {
      Accept: 'application/json',
    },
  });
  const parsed = await response.json();
  const newProfileId = parsed.profileId;
  await uploadAudioFile('uploadAudioSignatureFile');
  const fileName = document.getElementById('uploadAudioSignatureFile').files[0]
    .name;
  await fetch(
    `/enroll_profile?file_name=${fileName}&profile_id=${newProfileId}`
  );
};

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

const uploadAudioFile = async element => {
  let audioFile = document.getElementById(`${element}`).files[0];
  if (getExtension(audioFile.name) === 'wav') {
    let formData = new FormData();
    formData.append('file', audioFile);
    const response = await fetch('/upload_audio', {
      method: 'POST',
      body: formData,
    });
    if (response.ok) {
      console.log('uploaded');
    } else {
      document.getElementById(
        'resultText'
      ).textContent = `Unable to upload file`;
    }
  } else {
    console.log('only wav files are accepted');
  }
};

const getExtension = filename => {
  const parts = filename.split('.');
  return parts[parts.length - 1];
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
      const audioFileName = document.getElementById('fileSelect').value;
      const profileId = document.getElementById('profileSelect').value;
      const response = await verifyAudio(audioFileName, profileId);
      showTestResult(response.recognitionResult, response.score);
    });

  document
    .getElementById('uploadNewFileButton')
    .addEventListener('click', async () => {
      await uploadAudioFile('uploadNewFile');
      console.log('ok');
    });

  document
    .getElementById('enrollProfileButton')
    .addEventListener('click', async () => {
      await createProfile();
      location.reload();
      console.log('ok');
    });
});
