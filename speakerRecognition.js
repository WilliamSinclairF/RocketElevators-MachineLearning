    /* To run this sample, install:
    npm install microsoft-cognitiveservices-speech-sdk
    */
require('dotenv').config();

const { Console } = require("console");
const { ConnectionEstablishErrorEvent } = require("microsoft-cognitiveservices-speech-sdk/distrib/lib/src/common/Exports");

var subscription_key = process.env.SPEECH_SUBSCRIPTION_KEY;
var region = process.env.SPEECH_REGION;



"use strict";
var sdk = require("microsoft-cognitiveservices-speech-sdk");
var fs = require("fs");

// Note: Change the locale if desired.
const profile_locale = "en-us";

// Note: passphrase_files and verify_file should contain paths to audio files that contain \"My voice is my passport, verify me.
const passphrase_files = ["sounds/myVoiceIsMyPassportVerifyMe01.wav", "sounds/myVoiceIsMyPassportVerifyMe02.wav", "sounds/myVoiceIsMyPassportVerifyMe03.wav"];
const verify_file = "sounds/myVoiceIsMyPassportVerifyMe01.wav";
const id_names = [" |Joey|"," |Trevor|"," |William|"," |Loic|"," |Fabien|"]
// Identify with independent text around 50 seconds audio
const identify_file = "sounds/aboutSpeechSdk.wav";


const ticks_per_second = 10000000;

/* From: https://github.com/Azure-Samples/cognitive-services-speech-sdk/blob/fa6428a0837779cbeae172688e0286625e340942/quickstart/javascript/node/speaker-recognition/verification/dependent-verification.js#L8
*/
function GetAudioConfigFromFile (file)
{
    let pushStream = sdk.AudioInputStream.createPushStream();
    fs.createReadStream(file).on("data", function(arrayBuffer) {
        pushStream.write(arrayBuffer.buffer);
    }).on("end", function() {
        pushStream.close();
    });
    return sdk.AudioConfig.fromStreamInput(pushStream);
}

async function TextIndependentVerification(client, speech_config)
{
    console.log ("Powered by:");
    console.log ("_____________________");
    console.log ("|R.E.S.R. Technology|");
    console.log ("|___________________|\n");
    console.log ("Text Independent Verification:\n");

    var profile = null;
    try {
        // Create the profile.
        profile = await new Promise ((resolve, reject) => {
            client.createProfileAsync (sdk.VoiceProfileType.TextIndependentVerification, profile_locale, result => { resolve(result); }, error => { reject(error); });
        });
        console.log ("Created profile ID: " + profile.profileId + id_names[0]);
        await AddEnrollmentsToTextIndependentProfile(client, profile, [identify_file]);
        const audio_config = GetAudioConfigFromFile(passphrase_files[0]);
        const recognizer = new sdk.SpeakerRecognizer(speech_config, audio_config);
        await SpeakerVerify(profile, recognizer);
    }
    catch (error) {
        console.log ("Error:\n" + error);
    }
    finally {
        if (profile !== null) {
            console.log ("Deleting profile ID: " + profile.profileId);
            await new Promise ((resolve, reject) => {
                client.deleteProfileAsync (profile, result => { resolve(result); }, error => { reject(error); });
            });
        }
    }
}

async function AddEnrollmentsToTextIndependentProfile(client, profile, audio_files)
{
    for (var i = 0; i < audio_files.length; i++) {
        console.log ("Adding enrollment to text independent profile...");
        const audio_config = GetAudioConfigFromFile (audio_files[i]);
        const result = await new Promise ((resolve, reject) => {
            client.enrollProfileAsync (profile, audio_config, result => { resolve(result); }, error => { reject(error); });
        });
        if (result.reason === sdk.ResultReason.Canceled) {
            throw(JSON.stringify(sdk.VoiceProfileEnrollmentCancellationDetails.fromResult(result)));
        }
        else {
            console.log ("Remaining audio time needed: " + (result.privDetails["remainingEnrollmentsSpeechLength"] / ticks_per_second) + " seconds.");
        }
    }
    console.log ("Enrollment completed.\n");
}

async function SpeakerVerify(profile, recognizer)
{
    const model = sdk.SpeakerVerificationModel.fromProfile(profile);
    const result = await new Promise ((resolve, reject) => {
        recognizer.recognizeOnceAsync (model, result => { resolve(result); }, error => { reject(error); });
    });
    console.log ("Verified voice profile for speaker: " + result.profileId + ". Score is: " + result.score + ".\n");
}

async function TextIndependentIdentification(client, speech_config)
{
    console.log ("Text Independent Identification:\n");
    var profile = null;
    try {
        // Create the profile.
        profile = await new Promise ((resolve, reject) => {
            client.createProfileAsync (sdk.VoiceProfileType.TextIndependentIdentification, profile_locale, result => { resolve(result); }, error => { reject(error); });
        });
        console.log ("Created profile ID: " + profile.profileId);
        await AddEnrollmentsToTextIndependentProfile(client, profile, [identify_file]);
        const audio_config = GetAudioConfigFromFile(passphrase_files[0]);
        const recognizer = new sdk.SpeakerRecognizer(speech_config, audio_config);
        await SpeakerIdentify(profile, recognizer);
    }
    catch (error) {
        console.log ("Error:\n" + error);
    }
    finally {
        if (profile !== null) {
            console.log ("Deleting profile ID: " + profile.profileId);
            await new Promise ((resolve, reject) => {
                client.deleteProfileAsync (profile, result => { resolve(result); }, error => { reject(error); });
            });
        }
    }
}

async function SpeakerIdentify(profile, recognizer)
{
    const model = sdk.SpeakerIdentificationModel.fromProfiles([profile]);
    const result = await new Promise ((resolve, reject) => {
        recognizer.recognizeOnceAsync (model, result => { resolve(result); }, error => { reject(error); });
    });
    console.log ("The most similar voice profile is: " + result.profileId + " with similarity score: " + result.score + ".\n");
}




// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT license.

function speachtotext() {
    // <code>
    "use strict";
    
    // pull in the required packages.
    var sdk = require("microsoft-cognitiveservices-speech-sdk");
    var fs = require("fs");
    
    // replace with your own subscription key,
    // service region (e.g., "westus"), and
    // the name of the file you want to run
    // through the speech recognizer.

    // var filename = "sounds/aboutSpeechSdk.wav"; // 16000 Hz, Mono
    var filename = "sounds/vampIntroTrevor.wav"; // 16000 Hz, Mono
    
    // create the push stream we need for the speech sdk.
var pushStream = sdk.AudioInputStream.createPushStream();

// open the file and push it to the push stream.
fs.createReadStream(filename).on('data', function(arrayBuffer) {
    pushStream.write(arrayBuffer.slice());
}).on('end', function() {
    pushStream.close();
});

// we are done with the setup
console.log("Now recognizing from: " + filename);

// now create the audio-config pointing to our stream and
// the speech config specifying the language.
var audioConfig = sdk.AudioConfig.fromStreamInput(pushStream);
var speechConfig = sdk.SpeechConfig.fromSubscription(subscription_key, region);

// setting the recognition language to English.
speechConfig.speechRecognitionLanguage = "en-US";

// create the speech recognizer.
var recognizer = new sdk.SpeechRecognizer(speechConfig, audioConfig);

// start the recognizer and wait for a result.
recognizer.recognizeOnceAsync(
    function (result) {
        console.log(result);

        recognizer.close();
        recognizer = undefined;
    },
    function (err) {
        console.trace("err - " + err);
        
        recognizer.close();
        recognizer = undefined;
    });
// </code>

};
    
async function main() {
    const speech_config = sdk.SpeechConfig.fromSubscription(subscription_key, region);
    const client = new sdk.VoiceProfileClient(speech_config);

   
    await TextIndependentVerification(client, speech_config);
    await TextIndependentIdentification(client, speech_config);
    console.log ("End of recognition.");
    console.log ("Rocket Elevator Speaker Recognition");
    speachtotext()
}
main();