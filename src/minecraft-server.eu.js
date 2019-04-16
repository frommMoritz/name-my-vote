function onError(error) {
  console.warn(error);
}

function onGot(settings) {
  document.getElementById("playername").value = settings.username;
}

var getting = browser.storage.sync.get("username");
getting.then(onGot, onError);
