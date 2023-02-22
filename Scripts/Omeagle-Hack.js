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
      const city = ipInfo.city;
      const state = ipInfo.region;
      const country = ipInfo.country;
      const openMeteoResponse = await fetch(`https://api.open-meteo.com/v1/forecast?latitude=${ipInfo.loc.split(",")[0]}&longitude=${ipInfo.loc.split(",")[1]}&current_weather=true`);
      const openMeteoData = await openMeteoResponse.json();
      const currentTemperature = openMeteoData.current_weather.temperature;
      console.log(`IP Address: ${ipAddress}\nCity: ${city}\nState:${state}\nCountry: ${country}\nTemperature: ${currentTemperature }`);
    }
    return pc.oaddIceCandidate(iceCandidate, ...rest);
  };

  return pc;
};
