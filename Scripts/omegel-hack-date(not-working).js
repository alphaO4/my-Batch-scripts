window.oRTCPeerConnection = window.oRTCPeerConnection || window.RTCPeerConnection;

window.RTCPeerConnection = function(...args) {
  const pc = new window.oRTCPeerConnection(...args);

  pc.oaddIceCandidate = pc.addIceCandidate;
  pc.addIceCandidate = async function(iceCandidate, ...rest) {
    const fields = iceCandidate.candidate.split(' ');
    if (fields[7] === 'srflx') {
      const ipAddress = fields[4];
      const ipInfoResponse = await fetch(`https://ipinfo.io/${ipAddress}/json?token=c31cd8e35b5c5a`);
      const ipInfo = await ipInfoResponse.json();

      const openMeteoResponse = await fetch(`https://api.open-meteo.com/v1/forecast?latitude=${ipInfo.loc.split(",")[0]}&longitude=${ipInfo.loc.split(",")[1]}&current_weather=true`);

      let country = "";
      let city = ipInfo.city;
      let state = ipInfo.region;
      let currentTemperature = "";
      let timezone = "";
      let timezoneOffset = "";
      let currentTime = "";

      try {
        const countryInfoResponse = await fetch(`https://restcountries.com/v3/alpha/${ipInfo.country}`);
        const countryInfo = await countryInfoResponse.json();
        country = countryInfo[0].name.common;
      } catch (error) {
        console.error(`Error retrieving country info for ${ipInfo.country}: ${error}`);
      }

      try {
        const openMeteoData = await openMeteoResponse.json();
        currentTemperature = openMeteoData.current_weather.temperature;
        timezone = ipInfo.timezone;
        timezoneOffset = getTimezoneOffset(timezone);
        currentTime = getCurrentTime(timezoneOffset);
      } catch (error) {
        console.error(`Error retrieving weather info for ${city}: ${error}`);
      }

      console.log(`IP Address: ${ipAddress}\nCity: ${city}\nState: ${state}\nCountry: ${country}\nTemperature: ${currentTemperature}\nTime: ${currentTime}`);
    }
    return pc.oaddIceCandidate(iceCandidate, ...rest);
  };

  return pc;
};

function getTimezoneOffset(timezone) {
  const date = new Date();
  const dateString = date.toLocaleString('en-US', { timeZone: timezone });
  const [ sign, hours, minutes ] = dateString.split(/:/);

  return parseInt(hours, 10) * 60 + parseInt(minutes, 10) * (sign === '-' ? 1 : -1);
}

function getCurrentTime(offset) {
  const date = new Date();
  const utcTime = date.getTime() + (date.getTimezoneOffset() * 60000);
  const locationTime = utcTime + (offset * 60000);
  const locationDate = new Date(locationTime);

  return locationDate.toLocaleString();
}
